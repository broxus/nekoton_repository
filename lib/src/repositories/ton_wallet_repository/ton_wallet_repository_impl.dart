import 'dart:async';

import 'package:async/async.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/repositories/ton_wallet_repository/ton_wallet_gql_block_poller.dart';
import 'package:rxdart/rxdart.dart';

/// Polling interval for ton wallet refresh
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

  /// Last assets that were used for subscription.
  /// This value is used during [updateSubscriptions] to detect which wallets
  /// should be unsubscribed and which of them could be used.
  @protected
  @visibleForTesting
  List<TonWalletAsset>? lastUpdatedAssets;

  /// Subject that allows listening for wallets subscribing/unsubscribing
  final _walletsSubject = BehaviorSubject<Map<Address, TonWallet>>.seeded({});

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
  Stream<List<TonWallet>> get walletsStream =>
      _walletsSubject.stream.map((e) => e.values.toList());

  /// Get current available subscriptions for wallets
  List<TonWallet> get wallets => _walletsSubject.value.values.toList();

  /// Get current available subscriptions for wallets as map
  Map<Address, TonWallet> get walletsMap => _walletsSubject.value;

  /// Queues for polling active wallets.
  /// In common cases, only one wallet should be here because only one wallet
  /// is active in app at time.
  /// But other subscriptions could be added here.
  @protected
  @visibleForTesting
  final pollingQueues = <Address, RefreshPollingQueue>{};

  // TODO(alex-a4): add closing subscriptions when transport or key changed

  @override
  Future<TonWallet> subscribe(TonWalletAsset asset) async {
    if (tonWalletZeroStateAddresses.contains(asset.address)) {
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
  Future<TonWallet> subscribeByAddress(Address address) async {
    final transport = currentTransport.transport;

    final wallet = await TonWallet.subscribeByAddress(
      transport: transport,
      address: address,
    );

    return addWalletInst(wallet);
  }

  @override
  Future<TonWallet> subscribeByExistingWallet(
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
  void startPolling(
    Address address, {
    Duration refreshInterval = tonWalletRefreshInterval,
    bool stopPrevious = true,
  }) {
    // If wallet has polling but was stopped, so rerun
    if (pollingQueues[address] != null) {
      pollingQueues[address]!.startPolling();

      return;
    }

    if (stopPrevious) {
      stopPolling();
    }

    final wallet = getWallet(address);
    pollingQueues[address] = RefreshPollingQueue(
      refreshInterval: refreshInterval,
      refresher: wallet,
    )..startPolling();
  }

  @override
  void stopPolling() {
    for (final polling in pollingQueues.values) {
      polling.stopPolling();
    }
    pollingQueues.clear();
  }

  @override
  void unsubscribe(Address address) {
    final wallet = removeWalletInst(address);
    pollingQueues.remove(address)?.stopPolling();
    wallet?.dispose();
  }

  @override
  void closeAllSubscriptions() {
    stopPolling();

    for (final wallet in wallets) {
      wallet.dispose();
    }
    _walletsSubject.add({});

    GetIt.instance<TokenWalletRepository>().closeAllTokenSubscriptions();
  }

  /// Last call of [updateSubscriptions] that will be stopped if needed.
  ///
  /// This allows interrupt updating if there was new request.
  CancelableOperation<void>? _lastOperation;

  @override
  Future<void> updateSubscriptions(List<TonWalletAsset> assets) async {
    final last = lastUpdatedAssets;
    final toSubscribe = <TonWalletAsset>[];
    final toUnsubscribe = <TonWalletAsset>[];

    // Stop last created operation if possible
    final oldOperation = _lastOperation;

    if (oldOperation != null) {
      await oldOperation.cancel();
    }

    if (last != null) {
      toUnsubscribe.addAll(
        // pick all elements from old list, which is not contains in a new list
        last.where((l) => !assets.any((a) => a.address == l.address)),
      );
      toSubscribe.addAll(
        // pick all elements from new list, which is not contains in old list
        assets.where((a) => !last.any((l) => l.address == a.address)),
      );
    } else {
      toSubscribe.addAll(assets);
    }

    for (final asset in toUnsubscribe) {
      unsubscribe(asset.address);
    }

    lastUpdatedAssets = assets;

    late CancelableOperation<void> operation;

    operation = CancelableOperation.fromFuture(() async {
      for (final asset in toSubscribe) {
        try {
          await subscribe(asset);
        } catch (e, t) {
          _logger.severe('updateSubscriptions', e, t);
        }

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
    final wallet = getWallet(address);

    return wallet.prepareDeploy(expiration: expiration);
  }

  @override
  Future<UnsignedMessage> prepareDeployWithMultipleOwners({
    required Address address,
    required List<PublicKey> custodians,
    required int reqConfirms,
    required Expiration expiration,
  }) async {
    final wallet = getWallet(address);

    return wallet.prepareDeployWithMultipleOwners(
      expiration: expiration,
      custodians: custodians,
      reqConfirms: reqConfirms,
    );
  }

  @override
  Future<UnsignedMessage> prepareTransfer({
    required Address address,
    required Address destination,
    required BigInt amount,
    required bool bounce,
    required Expiration expiration,
    PublicKey? publicKey,
    String? body,
  }) async {
    final tonWallet = getWallet(address);

    final contractState = await tonWallet.transport.getContractState(address);

    return tonWallet.prepareTransfer(
      contractState: contractState,
      publicKey: publicKey ?? tonWallet.publicKey,
      destination: destination,
      amount: amount,
      bounce: bounce,
      body: body,
      expiration: expiration,
    );
  }

  @override
  Future<UnsignedMessage> prepareConfirmTransaction({
    required Address address,
    required PublicKey publicKey,
    required String transactionId,
    required Expiration expiration,
  }) async {
    final tonWallet = getWallet(address);

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
    final tonWallet = getWallet(address);

    await message.refreshTimeout();
    final signedMessage = await message.sign(signature: fakeSignature());

    return tonWallet.estimateFees(signedMessage: signedMessage);
  }

  @override
  // ignore: long-method
  Future<Transaction> send({
    required Address address,
    required SignedMessage signedMessage,
    required Address destination,
    required BigInt amount,
  }) async {
    final tonWallet = getWallet(address);

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
        createdAt: DateTime.now(),
      ),
    );

    final completer = Completer<Transaction>();

    // stop polling existed poller for this wallet to avoid multiple duplicate
    // calls, it will be rerun in the end of this method.
    final existedPoller = pollingQueues[address];
    final oldIsPolling = existedPoller?.isPolling ?? false;
    if (oldIsPolling) {
      existedPoller?.stopPolling();
    }

    // This is a poller, that lets subscribe for next pending transaction
    // in code below.
    late RefreshPollingQueue poller;

    // Stop this poller and start old poller if it was enabled before sending
    void completePolling() {
      poller.stopPolling();
      if (oldIsPolling) {
        existedPoller?.startPolling();
      }
    }

    void createPoller(RefreshingInterface refresher) {
      poller = RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: intensivePollingInterval,
        refreshCompleteCallback: ([(Object, StackTrace)? err]) {
          if (err != null) {
            _logger.severe(
              '${transport.runtimeType} Reliable polling error',
              err.$1,
              err.$2,
            );
            completePolling();
            if (!completer.isCompleted) completer.completeError(err.$1, err.$2);
          }
          if (tonWallet.pollingMethod != PollingMethod.Reliable) {
            // Being here means, that onMessageSentStream got data
            completePolling();
          }
        },
        // refresh immediately to start polling without delay
      )..startPolling(refreshImmediately: true);
    }

    if (transport is GqlTransport) {
      createPoller(
        TonWalletGqlBlockPoller(tonWallet: tonWallet, transport: transport),
      );
    } else if (transport is JrpcTransport) {
      createPoller(tonWallet);
    } else {
      completer.completeError(Exception('Invalid transport'));

      // avoid starting listening if transport is wrong, typically impossible
      return completer.future;
    }

    unawaited(
      // ignore: prefer-async-await
      tonWallet.onMessageSentStream
          .firstWhere(
            (e) => e.item1 == pendingTransaction && e.item2 != null,
            orElse: () => throw Exception(
              'onMessageSent is empty during TonWalletRepository.send',
            ),
          )
          .timeout(pendingTransaction.expireAt.toTimeout())
          .then((v) {
        if (!completer.isCompleted) completer.complete(v.item2);
        completePolling();
      }).onError<Object>((err, st) {
        _logger.severe(
          'Ton wallet send transaction ${transport.runtimeType}',
          err,
          st,
        );
        if (!completer.isCompleted) completer.completeError(err, st);
        completePolling();
      }),
    );

    return completer.future;
  }

  @override
  Future<void> preloadTransactions({
    required Address address,
    required String fromLt,
  }) {
    final wallet = getWallet(address);

    return wallet.preloadTransactions(fromLt: fromLt);
  }

  @override
  List<PublicKey>? localCustodians(Address address) {
    final custodians = walletsMap[address]?.custodians;
    if (custodians == null) return null;

    return keyStore.keys
        .map((key) => key.publicKey)
        .where(custodians.contains)
        .toList();
  }

  @override
  TonWallet getWallet(Address address) {
    final wallet = walletsMap[address];
    if (wallet == null) {
      throw Exception('TonWallet $address not found');
    }

    return wallet;
  }

  @override
  List<PublicKey>? getLocalCustodians(Address address) {
    final wallet = getWallet(address);
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
  TonWallet addWalletInst(TonWallet wallet) {
    final wallets = walletsMap;
    wallets[wallet.address] = wallet;
    walletSubscriptions[wallet.address] = _createWalletSubscription(wallet);
    _walletsSubject.add(wallets);

    return wallet;
  }

  /// This is internal method to remove wallet from cache.
  /// You must not call this method directly form app, use [unsubscribe].
  @protected
  @visibleForTesting
  TonWallet? removeWalletInst(Address address) {
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
  List<TonWalletMultisigOrdinaryTransaction> mapMultisigOrdinaryTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  }) =>
      transactions
          .where(
        (e) => e.isOrdinaryTransaction(
          details: getWallet(walletAddress).details,
          transactions: transactions,
          pendingTransactions: multisigPendingTransactions,
        ),
      )
          .map(
        (e) {
          final wallet = getWallet(walletAddress);
          final lt = e.transaction.id.lt;

          final prevTransactionLt = e.transaction.prevTransactionId?.lt;

          final multisigSubmitTransaction = e.multisigSubmitTransaction;

          final creator = multisigSubmitTransaction.custodian;

          final transactionId = multisigSubmitTransaction.transId;

          final confirmations = transactions
              .where((e) => e.isSubmitOrConfirmTransaction(transactionId))
              .map((e) => e.custodian)
              .whereNotNull()
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
            dePoolOnRoundCompleteNotification:
                dePoolOnRoundCompleteNotification,
            dePoolReceiveAnswerNotification: dePoolReceiveAnswerNotification,
            tokenWalletDeployedNotification: tokenWalletDeployedNotification,
            walletInteractionInfo: walletInteractionInfo,
          );
        },
      ).toList();

  @override
  // ignore: long-method
  List<TonWalletMultisigPendingTransaction> mapMultisigPendingTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  }) =>
      transactions
          .where((e) => e.isPendingTransaction(multisigPendingTransactions))
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

          final tonWallet = getWallet(walletAddress);

          final localCustodians = keyStore.keys
              .where(
                (e) => tonWallet.custodians!.any((el) => el == e.publicKey),
              )
              .toList();

          final initiatorKey = localCustodians
              .firstWhereOrNull((e) => e.publicKey == tonWallet.publicKey);

          final listOfKeys = [
            if (initiatorKey != null) initiatorKey,
            ...localCustodians
                .where((e) => e.publicKey != initiatorKey?.publicKey),
          ];

          final nonConfirmedLocalCustodians = listOfKeys
              .where((e) => confirmations.every((el) => el != e.publicKey));

          final publicKeys =
              nonConfirmedLocalCustodians.map((e) => e.publicKey).toList();

          final canConfirm = publicKeys.isNotEmpty;

          final timeForConfirmation =
              Duration(seconds: tonWallet.details.expirationTime);

          final expireAt = date.add(timeForConfirmation);

          return TonWalletMultisigPendingTransaction(
            lt: lt,
            prevTransactionLt: prevTransactionLt,
            creator: creator,
            confirmations: confirmations,
            custodians: tonWallet.custodians!,
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
            signsReceived: signsReceived,
            signsRequired: signsRequired,
            transactionId: transactionId,
            publicKeys: publicKeys,
            canConfirm: canConfirm,
            expireAt: expireAt,
          );
        },
      ).toList();

  @override
  // ignore: long-method
  List<TonWalletMultisigExpiredTransaction> mapMultisigExpiredTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  }) =>
      transactions
          .where(
        (e) => e.isExpiredTransaction(
          details: getWallet(walletAddress).details,
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
              .whereNotNull()
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

          final tonWallet = getWallet(walletAddress);

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
            custodians: tonWallet.custodians!,
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
    required List<MultisigPendingTransaction> pendingTransactions,
  }) =>
      data != null &&
      data!.maybeWhen(
        walletInteraction: (data) => data.method.maybeWhen(
          multisig: (data) => data.maybeWhen(
            submit: (data) =>
                pendingTransactions.every((e) => e.id != data.transId) &&
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
        .isBefore(DateTime.now());
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
