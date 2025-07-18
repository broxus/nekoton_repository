import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:mutex/mutex.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:quiver/iterables.dart';
import 'package:rxdart/rxdart.dart';

mixin TokenWalletRepositoryImpl implements TokenWalletRepository {
  final _logger = Logger('TokenWalletRepositoryImpl');

  TokenWalletTransactionsStorage get tokenWalletStorage;

  TransportStrategy get currentTransport;

  /// Subject that allows listening for wallets subscribing/unsubscribing
  /// Key - pair where first item is owner address, second is rootTokenContract
  final _tokenWalletsSubject =
      BehaviorSubject<Map<(Address, Address), TokenWalletState>>.seeded({});
  final _mutexes = <(Address, Address), ReadWriteMutex>{};

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
  Stream<List<TokenWalletState>> get tokenWalletsStream =>
      _tokenWalletsSubject.stream.map((e) => e.values.toList());

  /// Get current available subscriptions for wallets
  List<TokenWalletState> get tokenWallets =>
      _tokenWalletsSubject.value.values.toList();

  /// Get current available subscriptions for wallets as map
  Map<(Address, Address), TokenWalletState> get tokenWalletsMap =>
      _tokenWalletsSubject.value;

  /// Queues for polling active wallets.
  /// In common cases, only one wallet should be here because only one wallet
  /// is active in app at time.
  /// But other subscriptions could be added here.
  @protected
  @visibleForTesting
  final tokenPollingQueues = <(Address, Address), RefreshPollingQueue>{};

  @override
  Future<TokenWalletState> subscribeToken({
    required Address owner,
    required Address rootTokenContract,
  }) async {
    final mutex = _mutexes.putIfAbsent(
      (owner, rootTokenContract),
      ReadWriteMutex.new,
    );

    await mutex.acquireWrite();

    try {
      final wallet = await currentTransport.subscribeToken(
        owner: owner,
        rootTokenContract: rootTokenContract,
      );

      return addTokenWalletInst(wallet);
    } finally {
      mutex.release();
      if (mutex.isLocked == false) {
        _mutexes.remove((owner, rootTokenContract));
      }
    }
  }

  @override
  Future<void> retryTokenSubscription(
    Address owner,
    Address rootTokenContract,
  ) async {
    final asset = lastUpdatedTokenAssets
        ?.map(
          (e) => e.additionalAssets[lastUpdatedNetworkGroup]?.tokenWallets
              .map((el) => (e.tonWallet.address, el.rootTokenContract)),
        )
        .nonNulls
        .expand((e) => e)
        .firstWhereOrNull((e) => e.$1 == owner && e.$2 == rootTokenContract);

    if (asset == null) {
      tokenWalletsMap[(owner, rootTokenContract)] = TokenWalletState.error(
        err: TokenWalletRetrySubscriptionMissedAsset(),
        owner: owner,
        rootTokenContract: rootTokenContract,
      );
      _tokenWalletsSubject.add(tokenWalletsMap);

      return;
    }

    return _subscribeTokenAsset(asset);
  }

  @override
  Future<void> startPollingToken(
    Address owner,
    Address rootTokenContract, {
    Duration? refreshInterval,
    bool stopPrevious = true,
  }) async {
    final pair = (owner, rootTokenContract);

    // If wallet has polling but was stopped, so rerun
    if (tokenPollingQueues[pair] != null) {
      tokenPollingQueues[pair]!.start();

      return;
    }

    if (stopPrevious) {
      stopPollingToken();
    }

    final wallet = (await getTokenWallet(owner, rootTokenContract)).wallet;
    if (wallet == null) return;

    tokenPollingQueues[pair] = RefreshPollingQueue(
      refreshInterval: refreshInterval ??
          currentTransport.pollingConfig.tokenWalletRefreshInterval,
      refresher: wallet.inner,
    )..start();
  }

  @override
  void stopPollingToken() {
    for (final polling in tokenPollingQueues.values) {
      polling.stop();
    }
    tokenPollingQueues.clear();
  }

  @override
  void pausePollingToken() {
    for (final polling in tokenPollingQueues.values) {
      polling.pause();
    }
  }

  @override
  void resumePollingToken() {
    for (final polling in tokenPollingQueues.values) {
      polling.resume();
    }
  }

  @override
  Future<void> unsubscribeToken(
    Address owner,
    Address rootTokenContract,
  ) async {
    final mutex = _mutexes[(owner, rootTokenContract)];
    await mutex?.acquireWrite();

    try {
      final wallet = removeTokenWalletInst(owner, rootTokenContract);
      tokenPollingQueues.remove((owner, rootTokenContract))?.stop();
      wallet?.wallet?.dispose();
    } finally {
      mutex?.release();
      if (mutex?.isLocked == false) {
        _mutexes.remove((owner, rootTokenContract));
      }
    }
  }

  @override
  void closeAllTokenSubscriptions() {
    stopPollingToken();

    for (final wallet in tokenWallets) {
      wallet.wallet?.dispose();
    }

    _tokenWalletsSubject.add({});
    _mutexes.clear();
  }

  @override
  Future<void> updateTokenSubscriptions(List<AssetsList> accounts) async {
    final networkGroup = currentTransport.transport.group;
    final tokenWallets = accounts
        .map(
          (e) => e.additionalAssets[networkGroup]?.tokenWallets
              .map((el) => (e.tonWallet.address, el.rootTokenContract)),
        )
        .nonNulls
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
    final toUnsubscribe = <TokenWalletState>[];

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

    await Future.wait(
      toUnsubscribe.map((e) => unsubscribeToken(e.owner, e.rootTokenContract)),
    );

    late CancelableOperationAwaited<void> operation;
    operation = CancelableOperationAwaited.fromFuture(() async {
      // Split all tokens to sublists to allow loading multiple tokens
      // simultaneously.
      final parts = partition(toSubscribe, tokenSubscribeAtTimeAmount);

      for (final part in parts) {
        await Future.wait(part.map(_subscribeTokenAsset));

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

  Future<void> _subscribeTokenAsset((Address, Address) wallet) async {
    if (currentTransport.transport.disposed) return;

    try {
      await subscribeToken(
        owner: wallet.$1,
        rootTokenContract: wallet.$2,
      );
    } catch (e, t) {
      _logger.severe('_subscribeTokenAsset', e, t);

      // Save error state of wallet
      final res = TokenWalletState.error(
        err: e,
        owner: wallet.$1,
        rootTokenContract: wallet.$2,
      );
      tokenWalletsMap[wallet] = res;
      _tokenWalletsSubject.add(tokenWalletsMap);
    }
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
        .nonNulls
        .expand((e) => e)
        .toList();

    await _updateTokenSubscriptionsPairs(newWallets);

    // restart polling after transport changed
    for (final (owner, rootTokenContract) in newWallets) {
      await startPollingToken(owner, rootTokenContract);
    }
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
    final tokenWallet = (await getTokenWallet(owner, rootTokenContract)).wallet;

    if (tokenWallet == null) throw TokenWalletStateNotInitializedException();

    try {
      attachedAmount ??= await switch (tokenWallet) {
        Tip3TokenWallet() => tokenWallet.inner.estimateMinAttachedAmount(
            destination: destination,
            amount: amount,
            notifyReceiver: notifyReceiver,
            payload: payload,
          ),
        JettonTokenWallet() => tokenWallet.inner.estimateMinAttachedAmount(
            destination: destination,
          ),
      };
    } catch (_) {}

    return switch (tokenWallet) {
      Tip3TokenWallet() => tokenWallet.inner.prepareTransfer(
          destination: destination,
          amount: amount,
          payload: payload,
          notifyReceiver: notifyReceiver,
          attachedAmount: attachedAmount,
        ),
      JettonTokenWallet() => tokenWallet.inner.prepareTransfer(
          destination: destination,
          amount: amount,
          remainingGasTo: tokenWallet.owner,
          callbackValue: BigInt.one,
          callbackPayload: payload,
          attachedAmount: attachedAmount,
        ),
    };
  }

  @override
  Future<void> preloadTokenTransactions({
    required Address owner,
    required Address rootTokenContract,
    String? fromLt,
  }) async {
    final tokenWallet = (await getTokenWallet(owner, rootTokenContract)).wallet;

    if (tokenWallet == null) throw TokenWalletStateNotInitializedException();

    return tokenWallet.preloadTransactions(fromLt);
  }

  @override
  Future<TokenWalletState> getTokenWallet(
    Address owner,
    Address rootTokenContract,
  ) async {
    final mutex = _mutexes[(owner, rootTokenContract)];
    await mutex?.acquireRead();

    try {
      final wallet = tokenWalletsMap[(owner, rootTokenContract)];
      if (wallet != null) return wallet;
    } finally {
      mutex?.release();
      if (mutex?.isLocked == false) {
        _mutexes.remove((owner, rootTokenContract));
      }
    }

    return subscribeToken(owner: owner, rootTokenContract: rootTokenContract);
  }

  /// This is internal method to add wallet to cache.
  /// You must not call this method directly form app, use [subscribeToken].
  @protected
  @visibleForTesting
  TokenWalletState addTokenWalletInst(GenericTokenWallet wallet) {
    final wallets = tokenWalletsMap;
    final pair = (wallet.owner, wallet.rootTokenContract);
    final res = TokenWalletState.wallet(wallet);
    wallets[pair] = res;
    tokenWalletSubscriptions[pair] = _createWalletSubscription(wallet);
    _tokenWalletsSubject.add(wallets);

    return res;
  }

  /// This is internal method to remove wallet from cache.
  /// You must not call this method directly form app, use [unsubscribeToken].
  @protected
  @visibleForTesting
  TokenWalletState? removeTokenWalletInst(
    Address owner,
    Address rootTokenContract,
  ) {
    final wallets = tokenWalletsMap;
    final pair = (owner, rootTokenContract);
    final wallet = wallets.remove(pair);
    tokenWalletSubscriptions.remove(pair)?.close();
    _tokenWalletsSubject.add(wallets);

    return wallet;
  }

  TokenWalletSubscription _createWalletSubscription(
    GenericTokenWallet wallet,
  ) =>
      TokenWalletSubscription(
        wallet: wallet,
        onBalanceChanged: (event) =>
            tokenWalletStorage.updateTokenWalletDetails(
          owner: wallet.owner,
          rootTokenContract: wallet.rootTokenContract,
          group: wallet.transport.group,
          networkId: wallet.transport.networkId,
          symbol: wallet.symbol,
          version: switch (wallet) {
            Tip3TokenWallet() => wallet.inner.version,
            _ => null,
          },
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

  @override
// ignore: long-method
  List<TokenWalletOrdinaryTransaction> mapOrdinaryTokenTransactions({
    required Address rootTokenContract,
    required List<TransactionWithData<TokenWalletTransaction?>> transactions,
  }) {
    return transactions.where((e) => e.data != null).map(
      (e) {
        final data = e.data!;
        final lt = e.transaction.id.lt;
        final prevTransactionLt = e.transaction.prevTransactionId?.lt;

        final sender = switch (data) {
          TokenWalletTransactionIncomingTransfer(:final data) =>
            data.senderAddress,
          _ => e.transaction.inMessage.src,
        };

        final recipient = switch (data) {
          TokenWalletTransactionOutgoingTransfer(:final data) => data.to.data,
          _ => e.transaction.outMessages.firstOrNull?.dst,
        };

        final value = switch (data) {
          TokenWalletTransactionIncomingTransfer(:final data) => data.tokens,
          TokenWalletTransactionOutgoingTransfer(:final data) => data.tokens,
          TokenWalletTransactionSwapBack(:final data) => data.tokens,
          TokenWalletTransactionAccept(:final data) => data,
          TokenWalletTransactionTransferBounced(:final data) => data,
          TokenWalletTransactionSwapBackBounced(:final data) => data,
          TokenWalletTransactionTransfer(:final data) => data.tokens,
          TokenWalletTransactionInternalTransfer(:final data) => data.tokens,
        };

        final isOutgoing = switch (data) {
          TokenWalletTransactionIncomingTransfer() => false,
          TokenWalletTransactionOutgoingTransfer() => true,
          TokenWalletTransactionSwapBack() => true,
          TokenWalletTransactionAccept() => false,
          TokenWalletTransactionTransferBounced() => false,
          TokenWalletTransactionSwapBackBounced() => false,
          TokenWalletTransactionTransfer() => true,
          TokenWalletTransactionInternalTransfer() => false,
        };

        final address = (isOutgoing ? recipient : sender) ?? rootTokenContract;
        final date = e.transaction.createdAt;
        final fees = e.transaction.totalFees;
        final hash = e.transaction.id.hash;

        TokenIncomingTransfer? incomingTransfer;
        TokenOutgoingTransfer? outgoingTransfer;
        TokenSwapBack? swapBack;
        BigInt? accept;
        BigInt? transferBounced;
        BigInt? swapBackBounced;
        JettonIncomingTransfer? jettonIncomingTransfer;
        JettonOutgoingTransfer? jettonOutgoingTransfer;

        if (data is TokenWalletTransactionIncomingTransfer) {
          incomingTransfer = data.data;
        } else if (data is TokenWalletTransactionOutgoingTransfer) {
          outgoingTransfer = data.data;
        } else if (data is TokenWalletTransactionSwapBack) {
          swapBack = data.data;
        } else if (data is TokenWalletTransactionAccept) {
          accept = data.data;
        } else if (data is TokenWalletTransactionTransferBounced) {
          transferBounced = data.data;
        } else if (data is TokenWalletTransactionSwapBackBounced) {
          swapBackBounced = data.data;
        } else if (data is TokenWalletTransactionTransfer) {
          jettonOutgoingTransfer = data.data;
        } else if (data is TokenWalletTransactionInternalTransfer) {
          jettonIncomingTransfer = data.data;
        }

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
          jettonIncomingTransfer: jettonIncomingTransfer,
          jettonOutgoingTransfer: jettonOutgoingTransfer,
        );
      },
    ).toList();
  }
}
