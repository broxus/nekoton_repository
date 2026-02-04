import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:mutex/mutex.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/repositories/ton_wallet_repository/ton_wallet_gql_block_poller.dart';
import 'package:nekoton_repository/src/utils/utils.dart';
import 'package:quiver/iterables.dart';
import 'package:rxdart/rxdart.dart';

const _resumeTimeout = Duration(seconds: 5);
const _ignoredComputePhaseCodes = [0, 1, 60, 100];
const _ignoredActionPhaseCodes = [0, 1];

mixin TonWalletRepositoryImpl implements TonWalletRepository {
  final _logger = Logger('TonWalletRepositoryImpl');

  final _mutexes = <Address, ReadWriteMutex>{};

  KeyStore get keyStore;

  TonWalletTransactionsStorage get tonWalletStorage;

  /// Current transport of application
  TransportStrategy get currentTransport;

  /// Polling manager provided by [NekotonRepository].
  RefreshPollingManager get refreshPollingManager;

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
  List<TonWalletAsset>? lastUpdatedAssets;

  /// Subject that allows listening for wallets subscribing/unsubscribing
  final _walletsSubject = BehaviorSubject<Map<Address, TonWalletState>>.seeded(
    {},
  );

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

  @protected
  @visibleForTesting
  final walletStreamObservers = <Address, RefreshPollingStreamObserver>{};

  /// Listen for wallets subscribing/unsubscribing
  Stream<List<TonWalletState>> get walletsStream =>
      _walletsSubject.stream.map((e) => e.values.toList());

  Stream<Map<Address, TonWalletState>> get walletsMapStream =>
      _walletsSubject.stream;

  /// Get current available subscriptions for wallets
  List<TonWalletState> get wallets => _walletsSubject.value.values.toList();

  /// Get current available subscriptions for wallets as map
  Map<Address, TonWalletState> get walletsMap => _walletsSubject.value;

  @override
  Future<TonWalletState> subscribe(TonWalletAsset asset) async {
    if (asset.address.isZeroState || asset.address.workchain == -1) {
      return subscribeByAddress(asset.address);
    }

    final transport = currentTransport.transport;
    final mutex = _mutexes.putIfAbsent(
      computeTonWalletAddress(
        publicKey: asset.publicKey,
        walletType: asset.contract,
        workchain: asset.workchain,
      ),
      ReadWriteMutex.new,
    );

    await mutex.acquireWrite();

    try {
      final wallet = await TonWallet.subscribe(
        transport: transport,
        workchainId: asset.workchain,
        publicKey: asset.publicKey,
        walletType: asset.contract,
      );
      final state = addWalletInst(wallet);

      return state;
    } finally {
      mutex.release();
      if (!mutex.isLocked) {
        _mutexes.remove(asset.address);
      }
    }
  }

  @override
  Future<TonWalletState> subscribeByAddress(Address address) async {
    final transport = currentTransport.transport;
    final mutex = _mutexes.putIfAbsent(address, ReadWriteMutex.new);

    await mutex.acquireWrite();

    try {
      final wallet = await TonWallet.subscribeByAddress(
        transport: transport,
        address: address,
      );
      final state = addWalletInst(wallet);

      return state;
    } finally {
      mutex.release();
      if (!mutex.isLocked) {
        _mutexes.remove(address);
      }
    }
  }

  @override
  Future<TonWalletState> subscribeByExistingWallet(
    ExistingWalletInfo existingWallet,
  ) async {
    final transport = currentTransport.transport;
    final mutex = _mutexes.putIfAbsent(
      existingWallet.address,
      ReadWriteMutex.new,
    );

    await mutex.acquireWrite();

    try {
      final state = walletsMap[existingWallet.address];
      if (state != null) return state;

      final wallet = await TonWallet.subscribeByExistingWallet(
        transport: transport,
        existingWallet: existingWallet,
      );

      return addWalletInst(wallet);
    } finally {
      mutex.release();
      if (!mutex.isLocked) {
        _mutexes.remove(existingWallet.address);
      }
    }
  }

  @override
  Future<void> retrySubscriptions(Address address) async {
    final asset = lastUpdatedAssets?.firstWhereOrNull(
      (e) => e.address == address,
    );

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
  Future<void> unsubscribe(Address address) async {
    final mutex = _mutexes[address];
    await mutex?.acquireWrite();

    try {
      final wallet = removeWalletInst(address);
      wallet?.wallet?.dispose();
    } finally {
      mutex?.release();
      if (mutex?.isLocked == false) {
        _mutexes.remove(address);
      }
    }
  }

  /// Last call of [updateSubscriptions] that will be stopped if needed.
  ///
  /// This allows interrupt updating if there was new request.
  CancelableOperationAwaited<void>? _lastOperation;

  @override
  Future<void> updateSubscriptions(List<TonWalletAsset> assets) async {
    final toSubscribe = <TonWalletAsset>[];
    final toUnsubscribe = <TonWalletState>[];

    // Stop last created operation if possible
    final oldOperation = _lastOperation;

    if (oldOperation != null) {
      await oldOperation.cancel();
    }

    toUnsubscribe.addAll(
      // pick all elements from old list, which is not contains in a new list
      wallets.where((w) => !assets.any((a) => a.address == w.address)),
    );
    toSubscribe.addAll(
      // pick all elements from new list, which is not contains in old list
      assets.where((a) => !wallets.any((w) => w.address == a.address)),
    );

    await Future.wait(toUnsubscribe.map((e) => unsubscribe(e.address)));

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

    await updateSubscriptions(last);
  }

  @override
  Future<UnsignedMessage> prepareDeploy(
    Address address,
    Expiration expiration,
  ) async {
    final walletState = await getWalletByAddress(address);
    final wallet = walletState.wallet;

    if (wallet == null) {
      throw TonWalletStateNotInitializedException(
        address: address,
        subscriptionError: walletState.error,
      );
    }

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
    final walletState = await getWalletByAddress(address);
    final wallet = walletState.wallet;

    if (wallet == null) {
      throw TonWalletStateNotInitializedException(
        address: address,
        subscriptionError: walletState.error,
      );
    }

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
    final walletState = await getWalletByAddress(address);
    final wallet = walletState.wallet;

    if (wallet == null) {
      throw TonWalletStateNotInitializedException(
        address: address,
        subscriptionError: walletState.error,
      );
    }

    final contractState = await wallet.transport.getContractState(address);

    if (!contractState.isExists()) throw ContractNotExistsException(address);

    return wallet.prepareTransfer(
      contractState: contractState,
      publicKey: publicKey ?? wallet.publicKey,
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
    final walletState = await getWalletByAddress(address);
    final wallet = walletState.wallet;

    if (wallet == null) {
      throw TonWalletStateNotInitializedException(
        address: address,
        subscriptionError: walletState.error,
      );
    }

    final contractState = await wallet.transport.getContractState(address);

    return wallet.prepareConfirmTransaction(
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
    final walletState = await getWalletByAddress(address);
    final wallet = walletState.wallet;

    if (wallet == null) {
      throw TonWalletStateNotInitializedException(
        address: address,
        subscriptionError: walletState.error,
      );
    }

    await message.refreshTimeout();
    final signedMessage = await message.sign(signature: fakeSignature());

    return wallet.estimateFees(signedMessage: signedMessage);
  }

  @override
  Future<BigInt> estimateDeploymentFees({
    required Address address,
    required UnsignedMessage message,
  }) async {
    final walletState = await getWalletByAddress(address);
    final wallet = walletState.wallet;

    if (wallet == null) {
      throw TonWalletStateNotInitializedException(
        address: address,
        subscriptionError: walletState.error,
      );
    }

    await message.refreshTimeout();

    return wallet.estimateFees(
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
    final walletState = await getWalletByAddress(address);
    final wallet = walletState.wallet;

    if (wallet == null) {
      throw TonWalletStateNotInitializedException(
        address: address,
        subscriptionError: walletState.error,
      );
    }

    final transport = wallet.transport;
    final pendingTransaction = await wallet.send(signedMessage: signedMessage);

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
    final walletState = await getWalletByAddress(address);
    final wallet = walletState.wallet;

    if (wallet == null) {
      throw TonWalletStateNotInitializedException(
        address: address,
        subscriptionError: walletState.error,
      );
    }

    final transport = wallet.transport;
    final completer = Completer<Transaction>();

    // Switch to intensive mode while waiting for transaction completion.
    refreshPollingManager.setPollingMode(address, RefreshPollingMode.intensive);

    // Restore normal polling mode when completed.
    void completePolling() {
      refreshPollingManager.setPollingMode(address, RefreshPollingMode.normal);
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

    final sentTransactionFuture = wallet.onMessageSentStream.firstWhere(
      (e) => e.$1 == pending && e.$2 != null,
      orElse: () => throw const OperationCanceledException(),
    );

    unawaited(
      sentTransactionFuture
          .timeout(pending.expireAt.toTimeout())
          .onError<TimeoutException>(
            (e, _) => refreshPollingManager.isPausedStream
                .firstWhere((e) => !e) // wait for polling to be resumed
                // .then((_) => poller.currentRefresh()) // TODO: check this commented
                .then((_) async {
                  try {
                    return await sentTransactionFuture.timeout(_resumeTimeout);
                  } on TimeoutException catch (_) {
                    throw e;
                  }
                }),
            // handle case when polling is paused
            test: (_) => refreshPollingManager.isPaused,
          )
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

    return waitSending(pending: pendingTransaction, address: address);
  }

  @override
  Future<void> preloadTransactions({
    required Address address,
    required String fromLt,
  }) async {
    final walletState = await getWalletByAddress(address);
    final wallet = walletState.wallet;

    if (wallet == null) {
      throw TonWalletStateNotInitializedException(
        address: address,
        subscriptionError: walletState.error,
      );
    }

    return wallet.preloadTransactions(fromLt: fromLt);
  }

  @override
  Future<TonWalletState> getWalletByAddress(Address address) async {
    return (await _tryGetWallet(address)) ?? subscribeByAddress(address);
  }

  @override
  Future<TonWalletState> getWallet(TonWalletAsset asset) async {
    return (await _tryGetWallet(asset.address)) ?? subscribe(asset);
  }

  @override
  Future<TonWalletState> getWalletByExistingWallet(
    ExistingWalletInfo existingWallet,
  ) async {
    return (await _tryGetWallet(existingWallet.address)) ??
        subscribeByExistingWallet(existingWallet);
  }

  @override
  Future<List<PublicKey>?> getLocalCustodians(Address address) async {
    final walletState = await getWalletByAddress(address);
    final wallet = walletState.wallet;

    if (wallet == null) {
      throw TonWalletStateNotInitializedException(
        address: address,
        subscriptionError: walletState.error,
      );
    }

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

    refreshPollingManager.registerTarget(
      RefreshPollingTarget(
        address: wallet.address,
        refresher: _createRefresher(wallet),
        defaultInterval:
            currentTransport.pollingConfig.tonWalletRefreshInterval,
        intensiveInterval:
            currentTransport.pollingConfig.intensivePollingInterval,
        debugLabel: 'TonWallet(${wallet.address})',
      ),
    );

    final observer = _createStreamObserver(wallet);
    walletStreamObservers[wallet.address] = observer;
    wallet.attachStreamListenersObserver(observer);

    return res;
  }

  /// This is internal method to remove wallet from cache.
  /// You must not call this method directly form app, use [unsubscribe].
  @protected
  @visibleForTesting
  TonWalletState? removeWalletInst(Address address) {
    final wallets = walletsMap;
    final wallet = wallets.remove(address);
    walletStreamObservers.remove(address)?.dispose();
    walletSubscriptions.remove(address)?.close();
    _walletsSubject.add(wallets);
    refreshPollingManager.unregisterTarget(address);

    return wallet;
  }

  @override
  // ignore: long-method
  List<TonWalletOrdinaryTransaction> mapOrdinaryTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
  }) => transactions.where((e) => !e.isMultisigTransaction).map((e) {
    final lt = e.transaction.id.lt;
    final prevTransactionLt = e.transaction.prevTransactionId?.lt;
    final msgSender = e.transaction.inMessage.src;
    final sender = e.dataSender ?? msgSender;
    final msgRecipient = e.transaction.outMessages.firstOrNull?.dst;
    final recipient = e.dataRecipient ?? msgRecipient;
    final isOutgoing = recipient != null;

    final msgValue = isOutgoing
        ? e.transaction.outMessages.fold(
            -e.transaction.inMessage.value,
            (acc, msg) => acc + msg.value,
          )
        : e.transaction.inMessage.value;

    final value = e.dataValue ?? msgValue;
    final address = (isOutgoing ? recipient : sender) ?? walletAddress;
    final date = e.transaction.createdAt;
    final fees = e.transaction.totalFees;
    final hash = e.transaction.id.hash;

    return TonWalletOrdinaryTransaction(
      lt: lt,
      prevTransactionLt: prevTransactionLt,
      isOutgoing: isOutgoing,
      value: value,
      address: address,
      date: date,
      fees: fees,
      hash: hash,
      comment: e.comment,
      dePoolOnRoundCompleteNotification: e.dePoolOnRoundCompleteNotification,
      dePoolReceiveAnswerNotification: e.dePoolReceiveAnswerNotification,
      tokenWalletDeployedNotification: e.tokenWalletDeployedNotification,
      walletInteractionInfo: e.walletInteractionInfo,
    );
  }).toList();

  @override
  List<TonWalletPendingTransaction> mapPendingTransactions({
    required Address walletAddress,
    required List<PendingTransactionWithData> pendingTransactions,
  }) => pendingTransactions.map((e) {
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
  }).toList();

  @override
  List<TonWalletExpiredTransaction> mapExpiredTransactions({
    required Address walletAddress,
    required List<PendingTransactionWithData> expiredTransactions,
  }) => expiredTransactions.map((e) {
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
  }).toList();

  @override
  // ignore: long-method
  Future<List<TonWalletMultisigOrdinaryTransaction>>
  mapMultisigOrdinaryTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  }) async {
    final wallet = (await getWalletByAddress(walletAddress)).wallet;
    if (wallet == null) return [];

    return transactions
        .where(
          (e) => e.isOrdinaryTransaction(
            details: wallet.details,
            transactions: transactions,
            pendingTransactions: multisigPendingTransactions,
          ),
        )
        .map((e) {
          final lt = e.transaction.id.lt;
          final prevTransactionLt = e.transaction.prevTransactionId?.lt;
          final multisigSubmitTransaction = e.multisigSubmitTransaction!;
          final creator = multisigSubmitTransaction.custodian;
          final transactionId = multisigSubmitTransaction.transId;
          final confirmations = transactions
              .where((e) => e.isSubmitOrConfirmTransaction(transactionId))
              .map((e) => e.custodian)
              .nonNulls
              .toList();
          final msgSender = e.transaction.inMessage.src;
          final sender = e.dataSender ?? msgSender;
          final msgRecipient = e.transaction.outMessages.firstOrNull?.dst;
          final recipient = e.dataRecipient ?? msgRecipient;
          final isOutgoing = recipient != null;

          final msgValue = isOutgoing
              ? e.transaction.outMessages.fold(
                  -e.transaction.inMessage.value,
                  (acc, msg) => acc + msg.value,
                )
              : e.transaction.inMessage.value;

          final value = e.dataValue ?? msgValue;
          final address = (isOutgoing ? recipient : sender) ?? wallet.address;
          final date = e.transaction.createdAt;
          final fees = e.transaction.totalFees;
          final hash = e.transaction.id.hash;

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
            comment: e.comment,
            dePoolOnRoundCompleteNotification:
                e.dePoolOnRoundCompleteNotification,
            dePoolReceiveAnswerNotification: e.dePoolReceiveAnswerNotification,
            tokenWalletDeployedNotification: e.tokenWalletDeployedNotification,
            walletInteractionInfo: e.walletInteractionInfo,
          );
        })
        .toList();
  }

  @override
  // ignore: long-method
  Future<List<TonWalletMultisigPendingTransaction>>
  mapMultisigPendingTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  }) async {
    final wallet = (await getWalletByAddress(walletAddress)).wallet;
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
        .map((e) {
          final lt = e.transaction.id.lt;
          final prevTransactionLt = e.transaction.prevTransactionId?.lt;
          final multisigPendingTransaction = multisigPendingTransactions
              .firstWhere(
                (el) => el.id == e.multisigSubmitTransaction!.transId,
              );
          final creator = multisigPendingTransaction.creator;
          final msgSender = e.transaction.inMessage.src;
          final sender = e.dataSender ?? msgSender;
          final msgRecipient = e.transaction.outMessages.firstOrNull?.dst;
          final recipient = e.dataRecipient ?? msgRecipient;
          final isOutgoing = recipient != null;

          final msgValue = isOutgoing
              ? e.transaction.outMessages.fold(
                  -e.transaction.inMessage.value,
                  (acc, msg) => acc + msg.value,
                )
              : e.transaction.inMessage.value;

          final value = e.dataValue ?? msgValue;
          final address = (isOutgoing ? recipient : sender) ?? walletAddress;
          final date = e.transaction.createdAt;
          final fees = e.transaction.totalFees;
          final hash = e.transaction.id.hash;
          final signsReceived = multisigPendingTransaction.signsReceived;
          final signsRequired = multisigPendingTransaction.signsRequired;
          final confirmations = multisigPendingTransaction.confirmations;
          final transactionId = multisigPendingTransaction.id;

          final localCustodians = keyStore.keys
              .where((e) => wallet.custodians!.any((el) => el == e.publicKey))
              .toList();

          final initiatorKey = localCustodians.firstWhereOrNull(
            (e) => e.publicKey == wallet.publicKey,
          );

          final listOfKeys = [
            if (initiatorKey != null) initiatorKey,
            ...localCustodians.where(
              (e) => e.publicKey != initiatorKey?.publicKey,
            ),
          ];

          final nonConfirmedLocalCustodians = listOfKeys.where(
            (e) => confirmations.every((el) => el != e.publicKey),
          );

          final nonConfirmedLocalCustodiansKeys = nonConfirmedLocalCustodians
              .map((e) => e.publicKey)
              .toList();

          final canConfirm = nonConfirmedLocalCustodiansKeys.isNotEmpty;

          final timeForConfirmation = Duration(
            seconds: wallet.details.expirationTime,
          );

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
            comment: e.comment,
            dePoolOnRoundCompleteNotification:
                e.dePoolOnRoundCompleteNotification,
            dePoolReceiveAnswerNotification: e.dePoolReceiveAnswerNotification,
            tokenWalletDeployedNotification: e.tokenWalletDeployedNotification,
            walletInteractionInfo: e.walletInteractionInfo,
            signsReceived: signsReceived,
            signsRequired: signsRequired,
            transactionId: transactionId,
            nonConfirmedLocalCustodians: nonConfirmedLocalCustodiansKeys,
            canConfirm: canConfirm,
            expireAt: expireAt,
          );
        })
        .toList();
  }

  @override
  // ignore: long-method
  Future<List<TonWalletMultisigExpiredTransaction>>
  mapMultisigExpiredTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  }) async {
    final wallet = (await getWalletByAddress(walletAddress)).wallet;
    if (wallet == null) return [];

    return transactions
        .where(
          (e) => e.isExpiredTransaction(
            details: wallet.details,
            transactions: transactions,
          ),
        )
        .map((e) {
          final lt = e.transaction.id.lt;
          final prevTransactionLt = e.transaction.prevTransactionId?.lt;
          final multisigSubmitTransaction = e.multisigSubmitTransaction!;
          final creator = multisigSubmitTransaction.custodian;
          final transactionId = multisigSubmitTransaction.transId;
          final confirmations = transactions
              .where((e) => e.isSubmitOrConfirmTransaction(transactionId))
              .map((e) => e.custodian)
              .nonNulls
              .toList();
          final msgSender = e.transaction.inMessage.src;
          final sender = e.dataSender ?? msgSender;
          final msgRecipient = e.transaction.outMessages.firstOrNull?.dst;
          final recipient = e.dataRecipient ?? msgRecipient;
          final isOutgoing = recipient != null;

          final msgValue = isOutgoing
              ? e.transaction.outMessages.fold(
                  -e.transaction.inMessage.value,
                  (acc, msg) => acc + msg.value,
                )
              : e.transaction.inMessage.value;

          final value = e.dataValue ?? msgValue;
          final address = (isOutgoing ? recipient : sender) ?? walletAddress;
          final date = e.transaction.createdAt;
          final fees = e.transaction.totalFees;
          final hash = e.transaction.id.hash;

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
            comment: e.comment,
            dePoolOnRoundCompleteNotification:
                e.dePoolOnRoundCompleteNotification,
            dePoolReceiveAnswerNotification: e.dePoolReceiveAnswerNotification,
            tokenWalletDeployedNotification: e.tokenWalletDeployedNotification,
            walletInteractionInfo: e.walletInteractionInfo,
          );
        })
        .toList();
  }

  @override
  Future<List<TxTreeSimulationErrorItem>> simulateTransactionTree({
    required Address address,
    required UnsignedMessage message,
    List<IgnoreTransactionTreeSimulationError>? ignoredComputePhaseCodes,
    List<IgnoreTransactionTreeSimulationError>? ignoredActionPhaseCodes,
  }) async {
    final walletState = await getWalletByAddress(address);
    final wallet = walletState.wallet;

    if (wallet == null) {
      throw TonWalletStateNotInitializedException(
        address: address,
        subscriptionError: walletState.error,
      );
    }

    await message.refreshTimeout();

    final icpc = ignoredComputePhaseCodes
        ?.where((e) => e.address == null)
        .map((e) => e.code);
    final iapc = ignoredActionPhaseCodes
        ?.where((e) => e.address == null)
        .map((e) => e.code);

    try {
      final signedMessage = await message.signFake();
      Iterable<TxTreeSimulationErrorItem> errors = await wallet.transport
          .simulateTransactionTree(
            signedMessage: signedMessage,
            ignoredComputePhaseCodes: Int32List.fromList([
              ..._ignoredComputePhaseCodes,
              if (icpc != null) ...icpc,
            ]),
            ignoredActionPhaseCodes: Int32List.fromList([
              ..._ignoredActionPhaseCodes,
              if (iapc != null) ...iapc,
            ]),
          );

      // filter out ignoredComputePhaseCodes by address
      if (ignoredComputePhaseCodes != null &&
          ignoredComputePhaseCodes.isNotEmpty) {
        errors = errors.whereNot(
          (e) =>
              e.error.type == TxTreeSimulationErrorType.computePhase &&
              ignoredComputePhaseCodes.any((el) => el.shouldIgnore(e)),
        );
      }

      // filter out ignoredActionPhaseCodes by address
      if (ignoredActionPhaseCodes != null &&
          ignoredActionPhaseCodes.isNotEmpty) {
        errors = errors.whereNot(
          (e) =>
              e.error.type == TxTreeSimulationErrorType.actionPhase &&
              ignoredActionPhaseCodes.any((el) => el.shouldIgnore(e)),
        );
      }

      // remove duplicate errors
      return errors.toSet().toList();
    } catch (e, st) {
      _logger.severe('TonWallet simulateTransactionTree error', e, st);
      return [];
    }
  }

  @protected
  @visibleForTesting
  void closeAllSubscriptions() {
    for (final wallet in wallets) {
      final address = wallet.address;

      walletStreamObservers.remove(address)?.dispose();
      refreshPollingManager.unregisterTarget(address);
      walletSubscriptions.remove(address)?.close();
      wallet.wallet?.dispose();
    }

    walletStreamObservers.clear();
    walletSubscriptions.clear();
    _walletsSubject.add({});
    _mutexes.clear();
  }

  Future<void> _subscribeAsset(TonWalletAsset asset) async {
    if (currentTransport.transport.disposed) return;

    try {
      await subscribe(asset);
    } catch (e, t) {
      _logger.severe('_subscribeAsset', e, t);

      // Save error state of wallet
      final address = asset.address;
      final res = TonWalletState.error(err: e, address: address);
      walletsMap[address] = res;
      _walletsSubject.add(walletsMap);
    }
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

  Future<TonWalletState?> _tryGetWallet(Address address) async {
    final mutex = _mutexes[address];
    await mutex?.acquireRead();

    try {
      return walletsMap[address];
    } finally {
      mutex?.release();
      if (mutex?.isLocked == false) {
        _mutexes.remove(address);
      }
    }
  }

  RefreshPollingStreamObserver _createStreamObserver(TonWallet wallet) {
    return RefreshPollingStreamObserver(
      address: wallet.address,
      refreshPollingManager: refreshPollingManager,
      internalListenersCount: TonWalletSubscription.internalListenersCount,
    );
  }

  RefreshingInterface _createRefresher(TonWallet wallet) {
    final transport = currentTransport.transport;
    if (transport is GqlTransport) {
      return TonWalletGqlBlockPoller(tonWallet: wallet, transport: transport);
    }

    return wallet;
  }
}
