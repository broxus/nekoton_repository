import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/repositories/ton_wallet_repository/ton_wallet_gql_block_poller.dart';
import 'package:nekoton_repository/src/utils/utils.dart';
import 'package:quiver/iterables.dart';
import 'package:rxdart/rxdart.dart';

/// Polling interval for [TonWallet.refresh]
const tonWalletRefreshInterval = Duration(seconds: 10);

/// This is an interval for active polling to check wallet state during send
/// method.
const intensivePollingInterval = Duration(seconds: 2);

mixin TonWalletRepositoryImpl implements TonWalletRepository {
  final _logger = Logger('TonWalletRepositoryImpl');

  KeyStore get keyStore;

  TonWalletTransactionsStorage get tonWalletStorage;

  /// Current transport of application
  TransportStrategy get currentTransport;

  /// How many tokens can be subscribed at time for one cycle in
  /// [TonWalletRepositoryImpl.updateSubscriptions].
  /// This variable can be changed if you need expand/reduce amount of subscribed
  /// token for one cycle. This means, that if you often calls methods to update
  /// subscriptions such as [TonWalletRepositoryImpl.updateSubscriptions]
  /// or [TonWalletRepositoryImpl.updateTransportSubscriptions] it may
  /// takes more time while the cycle will be completed.
  int tonSubscribeAtTimeAmount = 5;

  /// Last assets that were used for subscription.
  /// This value is used during [updateTransportSubscriptions] to create
  /// new subscriptions after transport was changed.
  /// During pure subscription in [updateSubscriptions], already existed
  /// subscriptions is used, to simplify changes detection, because
  /// [updateSubscriptions] could be called before old call completed and old
  /// assets could be reused.
  @protected
  @visibleForTesting
  List<(TonWalletAsset, bool)>? lastUpdatedAssets;

  /// Subject that allows listening for wallets subscribing/unsubscribing
  final _walletsSubject =
      BehaviorSubject<Map<Address, TonWalletState>>.seeded({});

  /// Subscriptions for wallets, that allows automatically update transactions
  /// and states in storage.
  /// This subscriptions uses [TonWalletTransactionsStorage] to update data.
  ///
  /// This subscriptions has same lifetime as [walletsMap].
  /// So if wallet adds, subscription creates, wallet destroys - subscription
  /// destroys too.
  @protected
  @visibleForTesting
  final walletSubscriptions = <Address, TonWalletSubscription>{};

  /// Listen for wallets subscribing/unsubscribing
  Stream<List<TonWalletState>> get walletsStream =>
      _walletsSubject.stream.map((e) => e.values.toList());

  /// Get current available subscriptions for wallets
  List<TonWalletState> get wallets => _walletsSubject.value.values.toList();

  /// Get current available subscriptions for wallets as map
  Map<Address, TonWalletState> get walletsMap => _walletsSubject.value;

  /// Queues for polling active wallets.
  /// In common cases, only one wallet should be here because only one wallet
  /// is active in app at time.
  /// But other subscriptions could be added here.
  @protected
  @visibleForTesting
  final pollingQueues = <Address, RefreshPollingQueue>{};

  @override
  Future<TonWalletState> subscribe(TonWalletAsset asset) async {
    if (asset.address.isZeroState) {
      return subscribeByAddress(asset.address);
    }

    final transport = currentTransport.transport;

    final wallet = await TonWallet.subscribe(
      transport: transport,
      workchainId: asset.workchain,
      publicKey: asset.publicKey,
      walletType: asset.contract,
    );

    return addWalletInst(wallet);
  }

  @override
  Future<TonWalletState> subscribeByAddress(Address address) async {
    final transport = currentTransport.transport;

    final wallet = await TonWallet.subscribeByAddress(
      transport: transport,
      address: address,
    );

    return addWalletInst(wallet);
  }

  @override
  Future<TonWalletState> subscribeByExistingWallet(
    ExistingWalletInfo existingWallet,
  ) async {
    final transport = currentTransport.transport;

    final wallet = await TonWallet.subscribeByExistingWallet(
      transport: transport,
      existingWallet: existingWallet,
    );

    return addWalletInst(wallet);
  }

  @override
  Future<void> retrySubscriptions(Address address) async {
    final asset =
        lastUpdatedAssets?.firstWhereOrNull((e) => e.$1.address == address);

    if (asset == null) {
      walletsMap[address] = TonWalletState.error(
        err: TonWalletRetrySubscriptionMissedAsset(),
        address: address,
      );
      _walletsSubject.add(walletsMap);

      return;
    }

    return _subscribeAsset(asset);
  }

  @override
  Future<void> startPolling(
    Address address, {
    Duration refreshInterval = tonWalletRefreshInterval,
    bool stopPrevious = true,
  }) async {
    // If wallet has polling but was stopped, so rerun
    if (pollingQueues[address] != null) {
      pollingQueues[address]!.start();

      return;
    }

    if (stopPrevious) {
      stopPolling();
    }

    final wallet = (await getWallet(address)).wallet;
    if (wallet == null) return;

    pollingQueues[address] = RefreshPollingQueue(
      refreshInterval: refreshInterval,
      refresher: wallet,
    )..start();
  }

  @override
  void stopPolling() {
    for (final polling in pollingQueues.values) {
      polling.stop();
    }
    pollingQueues.clear();
  }

  @override
  void unsubscribe(Address address) {
    final wallet = removeWalletInst(address);
    pollingQueues.remove(address)?.stop();
    wallet?.wallet?.dispose();
  }

  @override
  void closeAllSubscriptions() {
    stopPolling();

    for (final wallet in wallets) {
      wallet.wallet?.dispose();
    }
    _walletsSubject.add({});

    GetIt.instance<TokenWalletRepository>().closeAllTokenSubscriptions();
  }

  /// Last call of [updateSubscriptions] that will be stopped if needed.
  ///
  /// This allows interrupt updating if there was new request.
  CancelableOperationAwaited<void>? _lastOperation;

  @override
  Future<void> updateSubscriptions(List<(TonWalletAsset, bool)> assets) async {
    final toSubscribe = <(TonWalletAsset, bool)>[];
    final toUnsubscribe = <TonWalletState>[];

    // Stop last created operation if possible
    final oldOperation = _lastOperation;

    if (oldOperation != null) {
      await oldOperation.cancel();
    }

    toUnsubscribe.addAll(
      // pick all elements from old list, which is not contains in a new list
      wallets.where((w) => !assets.any((a) => a.$1.address == w.address)),
    );
    toSubscribe.addAll(
      // pick all elements from new list, which is not contains in old list
      assets.where((a) => !wallets.any((w) => w.address == a.$1.address)),
    );

    for (final asset in toUnsubscribe) {
      unsubscribe(asset.address);
    }

    lastUpdatedAssets = assets;

    late CancelableOperationAwaited<void> operation;

    operation = CancelableOperationAwaited.fromFuture(() async {
      // Split all tokens to sublists to allow loading multiple tokens
      // simultaneously.
      final parts = partition(toSubscribe, tonSubscribeAtTimeAmount);

      for (final part in parts) {
        await Future.wait(part.map(_subscribeAsset));

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

  Future<void> _subscribeAsset((TonWalletAsset, bool) asset) async {
    if (currentTransport.transport.disposed) return;

    try {
      asset.$2
          ? await subscribeByAddress(asset.$1.address)
          : await subscribe(asset.$1);
    } catch (e, t) {
      _logger.severe('_subscribeAsset', e, t);

      // Save error state of wallet
      final address = asset.$1.address;
      final res = TonWalletState.error(err: e, address: address);
      walletsMap[address] = res;
      _walletsSubject.add(walletsMap);
    }
  }

  @override
  Future<void> updateTransportSubscriptions() async {
    // Stop last created operation if possible
    final oldOperation = _lastOperation;

    if (oldOperation != null) {
      await oldOperation.cancel();
    }
    _lastOperation = null;

    closeAllSubscriptions();

    final last = lastUpdatedAssets;
    if (last == null) return;

    // make null to avoid comparing for subscriptions
    lastUpdatedAssets = null;

    return updateSubscriptions(last);
  }

  @override
  Future<UnsignedMessage> prepareDeploy(
    Address address,
    Expiration expiration,
  ) async {
    final wallet = (await getWallet(address)).wallet;

    if (wallet == null) throw TonWalletStateNotInitializedException();

    return wallet.prepareDeploy(expiration: expiration);
  }

  @override
  Future<UnsignedMessage> prepareDeployWithMultipleOwners({
    required Address address,
    required List<PublicKey> custodians,
    required int reqConfirms,
    required Expiration expiration,
    required int? expirationTime,
  }) async {
    final wallet = (await getWallet(address)).wallet;

    if (wallet == null) throw TonWalletStateNotInitializedException();

    return wallet.prepareDeployWithMultipleOwners(
      expiration: expiration,
      custodians: custodians,
      reqConfirms: reqConfirms,
      expirationTime: expirationTime,
    );
  }

  @override
  Future<UnsignedMessage> prepareTransfer({
    required Address address,
    required Expiration expiration,
    required List<TonWalletTransferParams> params,
    PublicKey? publicKey,
  }) async {
    final tonWallet = (await getWallet(address)).wallet;

    if (tonWallet == null) throw TonWalletStateNotInitializedException();

    final contractState = await tonWallet.transport.getContractState(address);

    return tonWallet.prepareTransfer(
      contractState: contractState,
      publicKey: publicKey ?? tonWallet.publicKey,
      expiration: expiration,
      params: params,
    );
  }

  @override
  Future<UnsignedMessage> prepareConfirmTransaction({
    required Address address,
    required PublicKey publicKey,
    required String transactionId,
    required Expiration expiration,
  }) async {
    final tonWallet = (await getWallet(address)).wallet;

    if (tonWallet == null) throw TonWalletStateNotInitializedException();

    final contractState = await tonWallet.transport.getContractState(address);

    return tonWallet.prepareConfirmTransaction(
      contractState: contractState,
      publicKey: publicKey,
      transactionId: transactionId,
      expiration: expiration,
    );
  }

  @override
  Future<BigInt> estimateFees({
    required Address address,
    required UnsignedMessage message,
  }) async {
    final tonWallet = (await getWallet(address)).wallet;

    if (tonWallet == null) throw TonWalletStateNotInitializedException();

    await message.refreshTimeout();
    final signedMessage = await message.sign(signature: fakeSignature());

    return tonWallet.estimateFees(signedMessage: signedMessage);
  }

  @override
  Future<BigInt> estimateDeploymentFees({
    required Address address,
    required UnsignedMessage message,
  }) async {
    final tonWallet = (await getWallet(address)).wallet;

    if (tonWallet == null) throw TonWalletStateNotInitializedException();

    await message.refreshTimeout();

    return tonWallet.estimateFees(
      signedMessage: await message.signFake(),
      executionOptions: TransactionExecutionOptions(
        disableSignatureCheck: true,
        overrideBalance: 100.toNativeToken(
          currentTransport.defaultNativeCurrencyDecimal,
        ), // 100 EVER
      ),
    );
  }

  @override
  Future<PendingTransaction> sendUnawaited({
    required Address address,
    required SignedMessage signedMessage,
    required Address destination,
    required BigInt amount,
  }) async {
    final tonWallet = (await getWallet(address)).wallet;

    if (tonWallet == null) throw TonWalletStateNotInitializedException();

    final transport = tonWallet.transport;
    final pendingTransaction =
        await tonWallet.send(signedMessage: signedMessage);

    await tonWalletStorage.addPendingTransaction(
      networkId: transport.networkId,
      group: transport.group,
      address: address,
      transaction: PendingTransactionWithData(
        transaction: pendingTransaction,
        amount: amount,
        destination: destination,
        createdAt: NtpTime.now(),
      ),
    );

    return pendingTransaction;
  }

  @override
  // ignore: long-method
  Future<Transaction> waitSending({
    required PendingTransaction pending,
    required Address address,
  }) async {
    final tonWallet = (await getWallet(address)).wallet;

    if (tonWallet == null) throw TonWalletStateNotInitializedException();

    final transport = tonWallet.transport;
    final completer = Completer<Transaction>();

    // stop polling existed poller for this wallet to avoid multiple duplicate
    // calls, it will be rerun in the end of this method.
    final existedPoller = pollingQueues[address];
    existedPoller?.pause();

    // This is a poller, that lets subscribe for next pending transaction
    // in code below.
    late RefreshPollingQueue poller;

    // Stop this poller and start old poller if it was enabled before sending
    void completePolling() {
      poller.stop();
      existedPoller?.resume();
    }

    void createPoller(RefreshingInterface refresher) {
      poller = RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: intensivePollingInterval,
        refreshCompleteCallback: ([(Object, StackTrace)? err]) {
          if (err != null) {
            _logger.severe(
              '${transport.runtimeType} TonWallet Reliable polling error',
              err.$1,
              err.$2,
            );
            completePolling();
            if (!completer.isCompleted) completer.completeError(err.$1, err.$2);
          }
          if (tonWallet.pollingMethod != PollingMethod.reliable) {
            // Being here means, that onMessageSentStream got data
            completePolling();
          }
        },
        // refresh immediately to start polling without delay
      )..start(refreshImmediately: true);
    }

    if (transport is GqlTransport) {
      createPoller(
        TonWalletGqlBlockPoller(tonWallet: tonWallet, transport: transport),
      );
    } else if (transport is ProtoTransport || transport is JrpcTransport) {
      createPoller(tonWallet);
    } else {
      completer.completeError(Exception('Invalid transport'));

      // avoid starting listening if transport is wrong, typically impossible
      return completer.future;
    }

    void onStreamCompletedError(OperationCanceledException err, StackTrace st) {
      if (!completer.isCompleted) completer.completeError(err, st);
      completePolling();
    }

    void onError(Object err, StackTrace st) {
      _logger.severe(
        'TonWallet send transaction ${transport.runtimeType}',
        err,
        st,
      );
      if (!completer.isCompleted) completer.completeError(err, st);
      completePolling();
    }

    void onSent((PendingTransaction, Transaction?) v) {
      if (!completer.isCompleted) completer.complete(v.$2);
      completePolling();
    }

    unawaited(
      tonWallet.onMessageSentStream
          .firstWhere(
            (e) => e.$1 == pending && e.$2 != null,
            orElse: () => throw OperationCanceledException(),
          )
          .timeout(pending.expireAt.toTimeout())
          .then(onSent)
          .onError<OperationCanceledException>(onStreamCompletedError)
          .onError<Object>(onError),
    );

    return completer.future;
  }

  @override
  Future<Transaction> send({
    required Address address,
    required SignedMessage signedMessage,
    required Address destination,
    required BigInt amount,
  }) async {
    final pendingTransaction = await sendUnawaited(
      address: address,
      signedMessage: signedMessage,
      destination: destination,
      amount: amount,
    );

    return waitSending(
      pending: pendingTransaction,
      address: address,
    );
  }

  @override
  Future<void> preloadTransactions({
    required Address address,
    required String fromLt,
  }) async {
    final wallet = (await getWallet(address)).wallet;

    if (wallet == null) throw TonWalletStateNotInitializedException();

    return wallet.preloadTransactions(fromLt: fromLt);
  }

  @override
  Future<TonWalletState> getWallet(Address address) async {
    final wallet = walletsMap[address] ?? await subscribeByAddress(address);
    return wallet;
  }

  @override
  Future<List<PublicKey>?> getLocalCustodians(Address address) async {
    final wallet = (await getWallet(address)).wallet;
    if (wallet == null) throw TonWalletStateNotInitializedException();

    final custodians = wallet.custodians;

    if (custodians == null) return null;

    final found = keyStore.keys
        .map((e) => e.publicKey)
        .where(custodians.contains)
        .toList();

    if (found.isEmpty) return null;

    return found;
  }

  @override
  Future<List<PublicKey>?> getLocalCustodiansAsync(Address address) async {
    if (currentTransport.transport.disposed) return null;

    final custodians = await TonWallet.getWalletCustodians(
      transport: currentTransport.transport,
      address: address,
    );

    final found = keyStore.keys
        .map((e) => e.publicKey)
        .where(custodians.contains)
        .toList();

    if (found.isEmpty) return null;

    return found;
  }

  /// This is internal method to add wallet to cache.
  /// You must not call this method directly form app, use [subscribe],
  /// [subscribeByAddress] or [subscribeByExistingWallet].
  @protected
  @visibleForTesting
  TonWalletState addWalletInst(TonWallet wallet) {
    final wallets = walletsMap;
    final res = TonWalletState.wallet(wallet);
    wallets[wallet.address] = res;
    walletSubscriptions[wallet.address] = _createWalletSubscription(wallet);
    _walletsSubject.add(wallets);

    return res;
  }

  /// This is internal method to remove wallet from cache.
  /// You must not call this method directly form app, use [unsubscribe].
  @protected
  @visibleForTesting
  TonWalletState? removeWalletInst(Address address) {
    final wallets = walletsMap;
    final wallet = wallets.remove(address);
    walletSubscriptions.remove(address)?.close();
    _walletsSubject.add(wallets);

    return wallet;
  }

  TonWalletSubscription _createWalletSubscription(TonWallet wallet) {
    return TonWalletSubscription(
      tonWallet: wallet,
      onMessageSent: (event) => tonWalletStorage.deletePendingTransaction(
        address: wallet.address,
        group: wallet.transport.group,
        networkId: wallet.transport.networkId,
        messageHash: event.$1.messageHash,
      ),
      onStateChanged: (state) => tonWalletStorage.updateTonWalletDetails(
        address: wallet.address,
        group: wallet.transport.group,
        networkId: wallet.transport.networkId,
        contractState: state,
        details: wallet.details,
        custodians: wallet.custodians,
      ),
      onTransactionsFound: (event) => tonWalletStorage.addFoundTransactions(
        address: wallet.address,
        group: wallet.transport.group,
        networkId: wallet.transport.networkId,
        transaction: event.$1,
      ),
      onMessageExpired: (trans) async {
        final expired = await tonWalletStorage.deletePendingTransaction(
          address: wallet.address,
          group: wallet.transport.group,
          networkId: wallet.transport.networkId,
          messageHash: trans.messageHash,
        );
        if (expired != null) {
          await tonWalletStorage.addExpiredTransaction(
            address: wallet.address,
            group: wallet.transport.group,
            networkId: wallet.transport.networkId,
            transaction: expired,
          );
        }
      },
    );
  }

  @override
  // ignore: long-method
  List<TonWalletOrdinaryTransaction> mapOrdinaryTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
  }) =>
      transactions.where((e) => !e.isMultisigTransaction).map(
        (e) {
          final lt = e.transaction.id.lt;

          final prevTransactionLt = e.transaction.prevTransactionId?.lt;

          final msgSender = e.transaction.inMessage.src;

          final dataSender = e.data?.maybeWhen(
            walletInteraction: (data) => data.knownPayload?.maybeWhen(
              tokenSwapBack: (data) => data.callbackAddress,
              orElse: () => null,
            ),
            orElse: () => null,
          );

          final sender = dataSender ?? msgSender;

          final msgRecipient = e.transaction.outMessages.firstOrNull?.dst;

          final dataRecipient = e.data?.maybeWhen(
            walletInteraction: (data) =>
                data.knownPayload?.maybeWhen(
                  tokenOutgoingTransfer: (data) => data.to.data,
                  orElse: () => null,
                ) ??
                data.method.maybeWhen(
                  multisig: (data) => data.maybeWhen(
                    send: (data) => data.dest,
                    submit: (data) => data.dest,
                    orElse: () => null,
                  ),
                  orElse: () => null,
                ) ??
                data.recipient,
            orElse: () => null,
          );

          final recipient = dataRecipient ?? msgRecipient;

          final isOutgoing = recipient != null;

          final msgValue = (isOutgoing
                  ? e.transaction.outMessages.firstOrNull?.value
                  : e.transaction.inMessage.value) ??
              e.transaction.inMessage.value;

          final dataValue = e.data?.maybeWhen(
            dePoolOnRoundComplete: (data) => data.reward,
            walletInteraction: (data) => data.method.maybeWhen(
              multisig: (data) => data.maybeWhen(
                send: (data) => data.value,
                submit: (data) => data.value,
                orElse: () => null,
              ),
              orElse: () => null,
            ),
            orElse: () => null,
          );

          final value = dataValue ?? msgValue;

          final address = (isOutgoing ? recipient : sender) ?? walletAddress;

          final date = e.transaction.createdAt;

          final fees = e.transaction.totalFees;

          final hash = e.transaction.id.hash;

          final comment = e.data?.maybeWhen(
            comment: (data) => data,
            orElse: () => null,
          );

          final dePoolOnRoundCompleteNotification = e.data?.maybeWhen(
            dePoolOnRoundComplete: (data) => data,
            orElse: () => null,
          );

          final dePoolReceiveAnswerNotification = e.data?.maybeWhen(
            dePoolReceiveAnswer: (data) => data,
            orElse: () => null,
          );

          final tokenWalletDeployedNotification = e.data?.maybeWhen(
            tokenWalletDeployed: (data) => data,
            orElse: () => null,
          );

          final walletInteractionInfo = e.data?.maybeWhen(
            walletInteraction: (data) => data,
            orElse: () => null,
          );

          return TonWalletOrdinaryTransaction(
            lt: lt,
            prevTransactionLt: prevTransactionLt,
            isOutgoing: isOutgoing,
            value: value,
            address: address,
            date: date,
            fees: fees,
            hash: hash,
            comment: comment,
            dePoolOnRoundCompleteNotification:
                dePoolOnRoundCompleteNotification,
            dePoolReceiveAnswerNotification: dePoolReceiveAnswerNotification,
            tokenWalletDeployedNotification: tokenWalletDeployedNotification,
            walletInteractionInfo: walletInteractionInfo,
          );
        },
      ).toList();

  @override
  List<TonWalletPendingTransaction> mapPendingTransactions({
    required Address walletAddress,
    required List<PendingTransactionWithData> pendingTransactions,
  }) =>
      pendingTransactions.map(
        (e) {
          final expireAt = e.transaction.expireAt;

          final date = e.createdAt;

          return TonWalletPendingTransaction(
            expireAt: expireAt,
            address: walletAddress,
            isIncoming: walletAddress == e.destination,
            amount: e.amount,
            destination: e.destination,
            messageHash: e.transaction.messageHash,
            date: date,
          );
        },
      ).toList();

  @override
  List<TonWalletExpiredTransaction> mapExpiredTransactions({
    required Address walletAddress,
    required List<PendingTransactionWithData> expiredTransactions,
  }) =>
      expiredTransactions.map(
        (e) {
          final expireAt = e.transaction.expireAt;

          final address = e.transaction.src ?? walletAddress;

          final date = e.createdAt;

          return TonWalletExpiredTransaction(
            expireAt: expireAt,
            address: address,
            isIncoming: walletAddress == e.destination,
            amount: e.amount,
            destination: e.destination,
            messageHash: e.transaction.messageHash,
            date: date,
          );
        },
      ).toList();

  @override
  // ignore: long-method
  Future<List<TonWalletMultisigOrdinaryTransaction>>
      mapMultisigOrdinaryTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  }) async {
    final wallet = (await getWallet(walletAddress)).wallet;
    if (wallet == null) return [];

    return transactions
        .where(
      (e) => e.isOrdinaryTransaction(
        details: wallet.details,
        transactions: transactions,
        pendingTransactions: multisigPendingTransactions,
      ),
    )
        .map(
      (e) {
        final lt = e.transaction.id.lt;

        final prevTransactionLt = e.transaction.prevTransactionId?.lt;

        final multisigSubmitTransaction = e.multisigSubmitTransaction;

        final creator = multisigSubmitTransaction.custodian;

        final transactionId = multisigSubmitTransaction.transId;

        final confirmations = transactions
            .where((e) => e.isSubmitOrConfirmTransaction(transactionId))
            .map((e) => e.custodian)
            .nonNulls
            .toList();

        final msgSender = e.transaction.inMessage.src;

        final dataSender = e.data?.maybeWhen(
          walletInteraction: (data) => data.knownPayload?.maybeWhen(
            tokenSwapBack: (data) => data.callbackAddress,
            orElse: () => null,
          ),
          orElse: () => null,
        );

        final sender = dataSender ?? msgSender;

        final msgRecipient = e.transaction.outMessages.firstOrNull?.dst;

        final dataRecipient = e.data?.maybeWhen(
          walletInteraction: (data) =>
              data.knownPayload?.maybeWhen(
                tokenOutgoingTransfer: (data) => data.to.data,
                orElse: () => null,
              ) ??
              data.method.maybeWhen(
                multisig: (data) => data.maybeWhen(
                  send: (data) => data.dest,
                  submit: (data) => data.dest,
                  orElse: () => null,
                ),
                orElse: () => null,
              ) ??
              data.recipient,
          orElse: () => null,
        );

        final recipient = dataRecipient ?? msgRecipient;

        final isOutgoing = recipient != null;

        final msgValue = (isOutgoing
                ? e.transaction.outMessages.firstOrNull?.value
                : e.transaction.inMessage.value) ??
            e.transaction.inMessage.value;

        final dataValue = e.data?.maybeWhen(
          dePoolOnRoundComplete: (data) => data.reward,
          walletInteraction: (data) => data.method.maybeWhen(
            multisig: (data) => data.maybeWhen(
              send: (data) => data.value,
              submit: (data) => data.value,
              orElse: () => null,
            ),
            orElse: () => null,
          ),
          orElse: () => null,
        );

        final value = dataValue ?? msgValue;

        final address = (isOutgoing ? recipient : sender) ?? wallet.address;

        final date = e.transaction.createdAt;

        final fees = e.transaction.totalFees;

        final hash = e.transaction.id.hash;

        final comment = e.data?.maybeWhen(
          comment: (data) => data,
          orElse: () => null,
        );

        final dePoolOnRoundCompleteNotification = e.data?.maybeWhen(
          dePoolOnRoundComplete: (data) => data,
          orElse: () => null,
        );

        final dePoolReceiveAnswerNotification = e.data?.maybeWhen(
          dePoolReceiveAnswer: (data) => data,
          orElse: () => null,
        );

        final tokenWalletDeployedNotification = e.data?.maybeWhen(
          tokenWalletDeployed: (data) => data,
          orElse: () => null,
        );

        final walletInteractionInfo = e.data?.maybeWhen(
          walletInteraction: (data) => data,
          orElse: () => null,
        );

        return TonWalletMultisigOrdinaryTransaction(
          lt: lt,
          prevTransactionLt: prevTransactionLt,
          creator: creator,
          confirmations: confirmations,
          custodians: wallet.custodians!,
          isOutgoing: isOutgoing,
          value: value,
          address: address,
          date: date,
          fees: fees,
          hash: hash,
          comment: comment,
          dePoolOnRoundCompleteNotification: dePoolOnRoundCompleteNotification,
          dePoolReceiveAnswerNotification: dePoolReceiveAnswerNotification,
          tokenWalletDeployedNotification: tokenWalletDeployedNotification,
          walletInteractionInfo: walletInteractionInfo,
        );
      },
    ).toList();
  }

  @override
  // ignore: long-method
  Future<List<TonWalletMultisigPendingTransaction>>
      mapMultisigPendingTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  }) async {
    final wallet = (await getWallet(walletAddress)).wallet;
    if (wallet == null) return [];

    return transactions
        .where(
      (e) =>
          e.isPendingTransaction(multisigPendingTransactions) &&
          !e.isExpiredTransaction(
            details: wallet.details,
            transactions: transactions,
          ),
    )
        .map(
      (e) {
        final lt = e.transaction.id.lt;

        final prevTransactionLt = e.transaction.prevTransactionId?.lt;

        final multisigPendingTransaction = multisigPendingTransactions
            .firstWhere((el) => el.id == e.multisigSubmitTransaction.transId);

        final creator = multisigPendingTransaction.creator;

        final msgSender = e.transaction.inMessage.src;

        final dataSender = e.data?.maybeWhen(
          walletInteraction: (data) => data.knownPayload?.maybeWhen(
            tokenSwapBack: (data) => data.callbackAddress,
            orElse: () => null,
          ),
          orElse: () => null,
        );

        final sender = dataSender ?? msgSender;

        final msgRecipient = e.transaction.outMessages.firstOrNull?.dst;

        final dataRecipient = e.data?.maybeWhen(
          walletInteraction: (data) =>
              data.knownPayload?.maybeWhen(
                tokenOutgoingTransfer: (data) => data.to.data,
                orElse: () => null,
              ) ??
              data.method.maybeWhen(
                multisig: (data) => data.maybeWhen(
                  send: (data) => data.dest,
                  submit: (data) => data.dest,
                  orElse: () => null,
                ),
                orElse: () => null,
              ) ??
              data.recipient,
          orElse: () => null,
        );

        final recipient = dataRecipient ?? msgRecipient;

        final isOutgoing = recipient != null;

        final msgValue = (isOutgoing
                ? e.transaction.outMessages.firstOrNull?.value
                : e.transaction.inMessage.value) ??
            e.transaction.inMessage.value;

        final dataValue = e.data?.maybeWhen(
          dePoolOnRoundComplete: (data) => data.reward,
          walletInteraction: (data) => data.method.maybeWhen(
            multisig: (data) => data.maybeWhen(
              send: (data) => data.value,
              submit: (data) => data.value,
              orElse: () => null,
            ),
            orElse: () => null,
          ),
          orElse: () => null,
        );

        final value = dataValue ?? msgValue;

        final address = (isOutgoing ? recipient : sender) ?? walletAddress;

        final date = e.transaction.createdAt;

        final fees = e.transaction.totalFees;

        final hash = e.transaction.id.hash;

        final comment = e.data?.maybeWhen(
          comment: (data) => data,
          orElse: () => null,
        );

        final dePoolOnRoundCompleteNotification = e.data?.maybeWhen(
          dePoolOnRoundComplete: (data) => data,
          orElse: () => null,
        );

        final dePoolReceiveAnswerNotification = e.data?.maybeWhen(
          dePoolReceiveAnswer: (data) => data,
          orElse: () => null,
        );

        final tokenWalletDeployedNotification = e.data?.maybeWhen(
          tokenWalletDeployed: (data) => data,
          orElse: () => null,
        );

        final walletInteractionInfo = e.data?.maybeWhen(
          walletInteraction: (data) => data,
          orElse: () => null,
        );

        final signsReceived = multisigPendingTransaction.signsReceived;

        final signsRequired = multisigPendingTransaction.signsRequired;

        final confirmations = multisigPendingTransaction.confirmations;

        final transactionId = multisigPendingTransaction.id;

        final localCustodians = keyStore.keys
            .where(
              (e) => wallet.custodians!.any((el) => el == e.publicKey),
            )
            .toList();

        final initiatorKey = localCustodians
            .firstWhereOrNull((e) => e.publicKey == wallet.publicKey);

        final listOfKeys = [
          if (initiatorKey != null) initiatorKey,
          ...localCustodians
              .where((e) => e.publicKey != initiatorKey?.publicKey),
        ];

        final nonConfirmedLocalCustodians = listOfKeys
            .where((e) => confirmations.every((el) => el != e.publicKey));

        final nonConfirmedLocalCustodiansKeys =
            nonConfirmedLocalCustodians.map((e) => e.publicKey).toList();

        final canConfirm = nonConfirmedLocalCustodiansKeys.isNotEmpty;

        final timeForConfirmation =
            Duration(seconds: wallet.details.expirationTime);

        final expireAt = date.add(timeForConfirmation);

        return TonWalletMultisigPendingTransaction(
          lt: lt,
          prevTransactionLt: prevTransactionLt,
          creator: creator,
          confirmations: confirmations,
          custodians: wallet.custodians!,
          isOutgoing: isOutgoing,
          value: value,
          address: address,
          walletAddress: wallet.address,
          date: date,
          fees: fees,
          hash: hash,
          comment: comment,
          dePoolOnRoundCompleteNotification: dePoolOnRoundCompleteNotification,
          dePoolReceiveAnswerNotification: dePoolReceiveAnswerNotification,
          tokenWalletDeployedNotification: tokenWalletDeployedNotification,
          walletInteractionInfo: walletInteractionInfo,
          signsReceived: signsReceived,
          signsRequired: signsRequired,
          transactionId: transactionId,
          nonConfirmedLocalCustodians: nonConfirmedLocalCustodiansKeys,
          canConfirm: canConfirm,
          expireAt: expireAt,
        );
      },
    ).toList();
  }

  @override
  // ignore: long-method
  Future<List<TonWalletMultisigExpiredTransaction>>
      mapMultisigExpiredTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  }) async {
    final wallet = (await getWallet(walletAddress)).wallet;
    if (wallet == null) return [];

    return transactions
        .where(
      (e) => e.isExpiredTransaction(
        details: wallet.details,
        transactions: transactions,
      ),
    )
        .map(
      (e) {
        final lt = e.transaction.id.lt;

        final prevTransactionLt = e.transaction.prevTransactionId?.lt;

        final multisigSubmitTransaction = e.multisigSubmitTransaction;

        final creator = multisigSubmitTransaction.custodian;

        final transactionId = multisigSubmitTransaction.transId;

        final confirmations = transactions
            .where((e) => e.isSubmitOrConfirmTransaction(transactionId))
            .map((e) => e.custodian)
            .nonNulls
            .toList();

        final msgSender = e.transaction.inMessage.src;

        final dataSender = e.data?.maybeWhen(
          walletInteraction: (data) => data.knownPayload?.maybeWhen(
            tokenSwapBack: (data) => data.callbackAddress,
            orElse: () => null,
          ),
          orElse: () => null,
        );

        final sender = dataSender ?? msgSender;

        final msgRecipient = e.transaction.outMessages.firstOrNull?.dst;

        final dataRecipient = e.data?.maybeWhen(
          walletInteraction: (data) =>
              data.knownPayload?.maybeWhen(
                tokenOutgoingTransfer: (data) => data.to.data,
                orElse: () => null,
              ) ??
              data.method.maybeWhen(
                multisig: (data) => data.maybeWhen(
                  send: (data) => data.dest,
                  submit: (data) => data.dest,
                  orElse: () => null,
                ),
                orElse: () => null,
              ) ??
              data.recipient,
          orElse: () => null,
        );

        final recipient = dataRecipient ?? msgRecipient;

        final isOutgoing = recipient != null;

        final msgValue = (isOutgoing
                ? e.transaction.outMessages.firstOrNull?.value
                : e.transaction.inMessage.value) ??
            e.transaction.inMessage.value;

        final dataValue = e.data?.maybeWhen(
          dePoolOnRoundComplete: (data) => data.reward,
          walletInteraction: (data) => data.method.maybeWhen(
            multisig: (data) => data.maybeWhen(
              send: (data) => data.value,
              submit: (data) => data.value,
              orElse: () => null,
            ),
            orElse: () => null,
          ),
          orElse: () => null,
        );

        final value = dataValue ?? msgValue;

        final address = (isOutgoing ? recipient : sender) ?? walletAddress;

        final date = e.transaction.createdAt;

        final fees = e.transaction.totalFees;

        final hash = e.transaction.id.hash;

        final comment = e.data?.maybeWhen(
          comment: (data) => data,
          orElse: () => null,
        );

        final dePoolOnRoundCompleteNotification = e.data?.maybeWhen(
          dePoolOnRoundComplete: (data) => data,
          orElse: () => null,
        );

        final dePoolReceiveAnswerNotification = e.data?.maybeWhen(
          dePoolReceiveAnswer: (data) => data,
          orElse: () => null,
        );

        final tokenWalletDeployedNotification = e.data?.maybeWhen(
          tokenWalletDeployed: (data) => data,
          orElse: () => null,
        );

        final walletInteractionInfo = e.data?.maybeWhen(
          walletInteraction: (data) => data,
          orElse: () => null,
        );

        return TonWalletMultisigExpiredTransaction(
          lt: lt,
          prevTransactionLt: prevTransactionLt,
          creator: creator,
          confirmations: confirmations,
          custodians: wallet.custodians!,
          isOutgoing: isOutgoing,
          value: value,
          address: address,
          date: date,
          fees: fees,
          hash: hash,
          comment: comment,
          dePoolOnRoundCompleteNotification: dePoolOnRoundCompleteNotification,
          dePoolReceiveAnswerNotification: dePoolReceiveAnswerNotification,
          tokenWalletDeployedNotification: tokenWalletDeployedNotification,
          walletInteractionInfo: walletInteractionInfo,
        );
      },
    ).toList();
  }

  @override
  Future<List<TxTreeSimulationErrorItem>> simulateTransactionTree({
    required Address address,
    required UnsignedMessage message,
  }) async {
    final tonWallet = (await getWallet(address)).wallet;

    if (tonWallet == null) throw TonWalletStateNotInitializedException();

    await message.refreshTimeout();

    final signedMessage = await message.signFake();
    final errors = await tonWallet.transport.simulateTransactionTree(
      signedMessage: signedMessage,
      ignoredComputePhaseCodes: Int32List.fromList([0, 1, 60, 100]),
      ignoredActionPhaseCodes: Int32List.fromList([0, 1]),
    );

    // remove duplicate errors
    return errors.toSet().toList();
  }
}

extension TonWalletTransactionExtension
    on TransactionWithData<TransactionAdditionalInfo?> {
  bool get isMultisigTransaction =>
      data != null &&
      data!.maybeWhen(
        walletInteraction: (data) => data.method.maybeWhen(
          multisig: (data) => data.maybeWhen(
            submit: (data) => true,
            confirm: (data) => true,
            // TODO(alex-a4): why send not used here
            orElse: () => false,
          ),
          orElse: () => false,
        ),
        orElse: () => false,
      );

  bool isOrdinaryTransaction({
    required TonWalletDetails details,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> pendingTransactions,
  }) =>
      data != null &&
      data!.maybeWhen(
        walletInteraction: (data) => data.method.maybeWhen(
          multisig: (data) => data.maybeWhen(
            submit: (data) =>
                pendingTransactions.every((e) => e.id != data.transId) &&
                isEnoughSubscribers(data.transId, details, transactions),
            orElse: () => false,
          ),
          orElse: () => false,
        ),
        orElse: () => false,
      );

  bool isConfirmTransaction(String id) =>
      data != null &&
      data!.maybeWhen(
        walletInteraction: (data) => data.method.maybeWhen(
          multisig: (data) => data.maybeWhen(
            confirm: (data) => data.transactionId == id,
            orElse: () => false,
          ),
          orElse: () => false,
        ),
        orElse: () => false,
      );

  bool isSubmitOrConfirmTransaction(String id) =>
      data != null &&
      data!.maybeWhen(
        walletInteraction: (data) => data.method.maybeWhen(
          multisig: (data) => data.maybeWhen(
            submit: (data) => data.transId == id,
            confirm: (data) => data.transactionId == id,
            orElse: () => false,
          ),
          orElse: () => false,
        ),
        orElse: () => false,
      );

  bool isPendingTransaction(
    List<MultisigPendingTransaction> pendingTransactions,
  ) =>
      data != null &&
      data!.maybeWhen(
        walletInteraction: (data) => data.method.maybeWhen(
          multisig: (data) => data.maybeWhen(
            submit: (data) =>
                pendingTransactions.any((e) => e.id == data.transId),
            orElse: () => false,
          ),
          orElse: () => false,
        ),
        orElse: () => false,
      );

  bool isExpiredTransaction({
    required TonWalletDetails details,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
  }) =>
      data != null &&
      data!.maybeWhen(
        walletInteraction: (data) => data.method.maybeWhen(
          multisig: (data) => data.maybeWhen(
            submit: (data) =>
                !isEnoughSubscribers(data.transId, details, transactions) &&
                isExpiredByTime(details),
            orElse: () => false,
          ),
          orElse: () => false,
        ),
        orElse: () => false,
      );

  /// More or equals to required confirmations were achieved
  bool isEnoughSubscribers(
    String transId,
    TonWalletDetails details,
    List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
  ) {
    if (details.requiredConfirmations == null) return true;

    final foundConfirms =
        transactions.where((e) => e.isConfirmTransaction(transId)).length;

    // -1 because 1-st submit transaction is confirmation itself
    return foundConfirms >= details.requiredConfirmations! - 1;
  }

  bool isExpiredByTime(TonWalletDetails details) {
    return transaction.createdAt
        .add(Duration(seconds: details.expirationTime))
        .isBefore(NtpTime.now());
  }

  MultisigSubmitTransaction get multisigSubmitTransaction => data!.maybeWhen(
        walletInteraction: (data) => data.method.maybeWhen(
          multisig: (data) => data.maybeWhen(
            submit: (data) => data,
            orElse: () => null,
          ),
          orElse: () => null,
        ),
        orElse: () => null,
      )!;

  PublicKey? get custodian => data!.maybeWhen(
        walletInteraction: (data) => data.method.maybeWhen<PublicKey?>(
          multisig: (data) => data.maybeWhen(
            submit: (data) => data.custodian,
            confirm: (data) => data.custodian,
            orElse: () => null,
          ),
          orElse: () => null,
        ),
        orElse: () => null,
      )!;
}
