import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:quiver/iterables.dart';
import 'package:rxdart/rxdart.dart';

/// Polling interval for token wallet refresh
const tokenWalletRefreshInterval = Duration(seconds: 15);

mixin TokenWalletRepositoryImpl implements TokenWalletRepository {
  final _logger = Logger('TokenWalletRepositoryImpl');

  TokenWalletTransactionsStorage get tokenWalletStorage;

  TransportStrategy get currentTransport;

  /// Subject that allows listening for wallets subscribing/unsubscribing
  /// Key - pair where first item is owner address, second is rootTokenContract
  final _tokenWalletsSubject =
      BehaviorSubject<Map<(Address, Address), TokenWallet>>.seeded({});

  /// How many tokens can be subscribed at time for one cycle in
  /// [TokenWalletRepositoryImpl._updateTokenSubscriptionsPairs].
  /// This variable can be changed if you need expand/reduce amount of subscribed
  /// token for one cycle. This means, that if you often calls methods to update
  /// subscriptions such as [TokenWalletRepositoryImpl.updateTokenSubscriptions]
  /// or [TokenWalletRepositoryImpl.updateTokenTransportSubscriptions] it may
  /// takes more time while the cycle will be completed.
  int tokenSubscribeAtTimeAmount = 8;

  /// Last assets that were used for subscription.
  /// This value is used during [updateTokenTransportSubscriptions] to create
  /// new subscriptions after transport was changed.
  /// During pure subscription in [updateTokenSubscriptions], already existed
  /// subscriptions is used, to simplify changes detection, because
  /// [updateTokenSubscriptions] could be called before old call completed and
  /// old assets could be reused.
  @protected
  @visibleForTesting
  List<AssetsList>? lastUpdatedTokenAssets;

  /// [Transport.group] that was used last time when subscriptions were created.
  /// This value is set with [lastUpdatedTokenAssets] and should not be set
  /// manually.
  @protected
  @visibleForTesting
  String? lastUpdatedNetworkGroup;

  /// Subscriptions for wallets, that allows automatically update transactions
  /// and states in storage.
  /// This subscriptions uses [TokenWalletTransactionsStorage] to update data.
  ///
  /// This subscriptions has same lifetime as [tokenWalletsMap].
  /// So if wallet adds, subscription creates, wallet destroys - subscription
  /// destroys too.
  @protected
  @visibleForTesting
  final tokenWalletSubscriptions =
      <(Address, Address), TokenWalletSubscription>{};

  /// Listen for wallets subscribing/unsubscribing
  Stream<List<TokenWallet>> get tokenWalletsStream =>
      _tokenWalletsSubject.stream.map((e) => e.values.toList());

  /// Get current available subscriptions for wallets
  List<TokenWallet> get tokenWallets =>
      _tokenWalletsSubject.value.values.toList();

  /// Get current available subscriptions for wallets as map
  Map<(Address, Address), TokenWallet> get tokenWalletsMap =>
      _tokenWalletsSubject.value;

  /// Queues for polling active wallets.
  /// In common cases, only one wallet should be here because only one wallet
  /// is active in app at time.
  /// But other subscriptions could be added here.
  @protected
  @visibleForTesting
  final tokenPollingQueues = <(Address, Address), RefreshPollingQueue>{};

  @override
  Future<TokenWallet> subscribeToken({
    required Address owner,
    required Address rootTokenContract,
  }) async {
    final transport = currentTransport.transport;

    final wallet = await TokenWallet.subscribe(
      transport: transport,
      owner: owner,
      rootTokenContract: rootTokenContract,
    );

    return addTokenWalletInst(wallet);
  }

  @override
  void startPollingToken(
    Address owner,
    Address rootTokenContract, {
    Duration refreshInterval = tokenWalletRefreshInterval,
    bool stopPrevious = true,
  }) {
    final pair = (owner, rootTokenContract);

    // If wallet has polling but was stopped, so rerun
    if (tokenPollingQueues[pair] != null) {
      tokenPollingQueues[pair]!.startPolling();

      return;
    }

    if (stopPrevious) {
      stopPollingToken();
    }

    final wallet = getTokenWallet(owner, rootTokenContract);
    tokenPollingQueues[pair] = RefreshPollingQueue(
      refreshInterval: refreshInterval,
      refresher: wallet,
    )..startPolling();
  }

  @override
  void stopPollingToken() {
    for (final polling in tokenPollingQueues.values) {
      polling.stopPolling();
    }
    tokenPollingQueues.clear();
  }

  @override
  void unsubscribeToken(Address owner, Address rootTokenContract) {
    final wallet = removeTokenWalletInst(owner, rootTokenContract);
    tokenPollingQueues.remove((owner, rootTokenContract))?.stopPolling();
    wallet?.dispose();
  }

  @override
  void closeAllTokenSubscriptions() {
    stopPollingToken();

    for (final wallet in tokenWallets) {
      wallet.dispose();
    }

    _tokenWalletsSubject.add({});
  }

  @override
  Future<void> updateTokenSubscriptions(List<AssetsList> accounts) async {
    final networkGroup = currentTransport.transport.group;
    final tokenWallets = accounts
        .map(
          (e) => e.additionalAssets[networkGroup]?.tokenWallets
              .map((el) => (e.tonWallet.address, el.rootTokenContract)),
        )
        .whereNotNull()
        .expand((e) => e)
        .toList();

    lastUpdatedTokenAssets = accounts;
    lastUpdatedNetworkGroup = networkGroup;

    return _updateTokenSubscriptionsPairs(tokenWallets);
  }

  /// Last call of [updateTokenSubscriptions] that will be stopped if needed.
  ///
  /// This allows interrupt updating if there was new request.
  CancelableOperationAwaited<void>? _lastOperation;

  /// Update subscriptions for wallets for current transport.
  /// [tokenWallets] - wallets that should be used in scope of current transport
  ///
  /// All old tokens, that is not related to new owner/contract will be
  /// unsubscribed.
  Future<void> _updateTokenSubscriptionsPairs(
    List<(Address, Address)> newWallets,
  ) async {
    final toSubscribe = <(Address, Address)>[];
    final toUnsubscribe = <TokenWallet>[];

    // Stop last created operation if possible
    final oldOperation = _lastOperation;

    if (oldOperation != null) {
      await oldOperation.cancel();
    }

    toUnsubscribe.addAll(
      // pick all elements from old list, which is not contains in a new list
      tokenWallets.where(
        (w) => !newWallets
            .any((a) => a.$1 == w.owner && a.$2 == w.rootTokenContract),
      ),
    );
    toSubscribe.addAll(
      // pick all elements from new list, which is not contains in old list
      newWallets.where(
        (a) => !tokenWallets
            .any((w) => w.owner == a.$1 && w.rootTokenContract == a.$2),
      ),
    );

    for (final asset in toUnsubscribe) {
      unsubscribeToken(asset.owner, asset.rootTokenContract);
    }

    late CancelableOperationAwaited<void> operation;
    operation = CancelableOperationAwaited.fromFuture(() async {
      // Split all tokens to sublists to allow loading multiple tokens
      // simultaneously.
      final parts = partition(toSubscribe, tokenSubscribeAtTimeAmount);

      for (final part in parts) {
        await Future.wait(
          part.map((wallet) async {
            try {
              await subscribeToken(
                owner: wallet.$1,
                rootTokenContract: wallet.$2,
              );
            } catch (e, t) {
              _logger.severe('_updateTokenSubscriptionsPairs', e, t);
            }
          }),
        );

        // Make this pseudo event to allow other operations in event loop
        // to be executed
        await Future<void>.delayed(Duration.zero);

        // If operation was stopped by changing transport/active accounts, then
        // stop subscribing.
        if (operation.isCanceled) return;
      }
    }());
    _lastOperation = operation;

    await operation.valueOrCancellation();
  }

  @override
  Future<void> updateTokenTransportSubscriptions() async {
    // Stop last created operation if possible
    final oldOperation = _lastOperation;

    if (oldOperation != null) {
      await oldOperation.cancel();
    }
    closeAllTokenSubscriptions();

    final last = lastUpdatedTokenAssets;
    final lastGroup = lastUpdatedNetworkGroup;
    if (last == null || lastGroup == null) return;

    // update only last network group, because accounts are same
    lastUpdatedNetworkGroup = currentTransport.transport.group;

    // assets in scope of new group, but from old list
    final networkGroup = lastUpdatedNetworkGroup!;
    final newWallets = last
        .map(
          (e) => e.additionalAssets[networkGroup]?.tokenWallets
              .map((el) => (e.tonWallet.address, el.rootTokenContract)),
        )
        .whereNotNull()
        .expand((e) => e)
        .toList();

    return _updateTokenSubscriptionsPairs(newWallets);
  }

  @override
  Future<InternalMessage> prepareTokenTransfer({
    required Address owner,
    required Address rootTokenContract,
    required Address destination,
    required BigInt amount,
    required bool notifyReceiver,
    BigInt? attachedAmount,
    String? payload,
  }) async {
    final tokenWallet = getTokenWallet(owner, rootTokenContract);

    return tokenWallet.prepareTransfer(
      destination: destination,
      amount: amount,
      notifyReceiver: notifyReceiver,
      payload: payload,
      attachedAmount: attachedAmount,
    );
  }

  @override
  Future<void> preloadTokenTransactions({
    required Address owner,
    required Address rootTokenContract,
    required String fromLt,
  }) {
    final tokenWallet = getTokenWallet(owner, rootTokenContract);

    return tokenWallet.preloadTransactions(fromLt: fromLt);
  }

  @override
  TokenWallet getTokenWallet(Address owner, Address rootTokenContract) {
    final wallet = tokenWalletsMap[(owner, rootTokenContract)];
    if (wallet == null) {
      throw Exception(
        'TokenWallet ($owner, $rootTokenContract) not found',
      );
    }

    return wallet;
  }

  /// This is internal method to add wallet to cache.
  /// You must not call this method directly form app, use [subscribeToken].
  @protected
  @visibleForTesting
  TokenWallet addTokenWalletInst(TokenWallet wallet) {
    final wallets = tokenWalletsMap;
    final pair = (wallet.owner, wallet.rootTokenContract);
    wallets[pair] = wallet;
    tokenWalletSubscriptions[pair] = _createWalletSubscription(wallet);
    _tokenWalletsSubject.add(wallets);

    return wallet;
  }

  /// This is internal method to remove wallet from cache.
  /// You must not call this method directly form app, use [unsubscribeToken].
  @protected
  @visibleForTesting
  TokenWallet? removeTokenWalletInst(Address owner, Address rootTokenContract) {
    final wallets = tokenWalletsMap;
    final pair = (owner, rootTokenContract);
    final wallet = wallets.remove(pair);
    tokenWalletSubscriptions.remove(pair)?.close();
    _tokenWalletsSubject.add(wallets);

    return wallet;
  }

  TokenWalletSubscription _createWalletSubscription(TokenWallet wallet) {
    return TokenWalletSubscription(
      tokenWallet: wallet,
      onBalanceChanged: (event) => tokenWalletStorage.updateTokenWalletDetails(
        owner: wallet.owner,
        rootTokenContract: wallet.rootTokenContract,
        group: wallet.transport.group,
        networkId: wallet.transport.networkId,
        symbol: wallet.symbol,
        version: wallet.version,
        balance: wallet.balance,
        contractState: wallet.contractState,
      ),
      onTransactionsFound: (event) => tokenWalletStorage.addFoundTransactions(
        owner: wallet.owner,
        rootTokenContract: wallet.rootTokenContract,
        group: wallet.transport.group,
        networkId: wallet.transport.networkId,
        transaction: event.$1,
      ),
    );
  }

  @override
// ignore: long-method
  List<TokenWalletOrdinaryTransaction> mapOrdinaryTokenTransactions({
    required Address rootTokenContract,
    required List<TransactionWithData<TokenWalletTransaction?>> transactions,
  }) =>
      transactions.where((e) => e.data != null).map(
        (e) {
          final lt = e.transaction.id.lt;

          final prevTransactionLt = e.transaction.prevTransactionId?.lt;

          final sender = e.data!.maybeWhen(
                incomingTransfer: (tokenIncomingTransfer) =>
                    tokenIncomingTransfer.senderAddress,
                orElse: () => null,
              ) ??
              e.transaction.inMessage.src;

          final recipient = e.data!.maybeWhen(
                outgoingTransfer: (tokenOutgoingTransfer) =>
                    tokenOutgoingTransfer.to.data,
                orElse: () => null,
              ) ??
              e.transaction.outMessages.firstOrNull?.dst;

          final value = e.data!.when(
            incomingTransfer: (tokenIncomingTransfer) =>
                tokenIncomingTransfer.tokens,
            outgoingTransfer: (tokenOutgoingTransfer) =>
                tokenOutgoingTransfer.tokens,
            swapBack: (tokenSwapBack) => tokenSwapBack.tokens,
            accept: (data) => data,
            transferBounced: (data) => data,
            swapBackBounced: (data) => data,
          );

          final isOutgoing = e.data!.when(
            incomingTransfer: (tokenIncomingTransfer) => false,
            outgoingTransfer: (tokenOutgoingTransfer) => true,
            swapBack: (tokenSwapBack) => true,
            accept: (data) => false,
            transferBounced: (data) => false,
            swapBackBounced: (data) => false,
          );

          final address =
              (isOutgoing ? recipient : sender) ?? rootTokenContract;

          final date = e.transaction.createdAt;

          final fees = e.transaction.totalFees;

          final hash = e.transaction.id.hash;

          TokenIncomingTransfer? incomingTransfer;

          TokenOutgoingTransfer? outgoingTransfer;

          TokenSwapBack? swapBack;

          BigInt? accept;

          BigInt? transferBounced;

          BigInt? swapBackBounced;

          e.data!.when(
            incomingTransfer: (tokenIncomingTransfer) =>
                incomingTransfer = tokenIncomingTransfer,
            outgoingTransfer: (tokenOutgoingTransfer) =>
                outgoingTransfer = tokenOutgoingTransfer,
            swapBack: (tokenSwapBack) => swapBack = tokenSwapBack,
            accept: (data) => accept = data,
            transferBounced: (data) => transferBounced = data,
            swapBackBounced: (data) => swapBackBounced = data,
          );

          return TokenWalletOrdinaryTransaction(
            lt: lt,
            prevTransactionLt: prevTransactionLt,
            isOutgoing: isOutgoing,
            value: value,
            address: address,
            date: date,
            fees: fees,
            hash: hash,
            incomingTransfer: incomingTransfer,
            outgoingTransfer: outgoingTransfer,
            swapBack: swapBack,
            accept: accept,
            transferBounced: transferBounced,
            swapBackBounced: swapBackBounced,
          );
        },
      ).toList();
}
