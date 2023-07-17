import 'dart:async';

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

  @override
  Future<void> updateSubscriptions(List<TonWalletAsset> assets) async {
    final last = lastUpdatedAssets;
    final toSubscribe = <TonWalletAsset>[];
    final toUnsubscribe = <TonWalletAsset>[];

    if (last != null) {
      toUnsubscribe.addAll(
        // pick all elements from old list, which is not contains in a new list
        last.where((asset) => !assets.any((a) => a.address == asset.address)),
      );
      toSubscribe.addAll(
        // pick all elements from new list, which is not contains in old list
        assets.where((a) => !last.any((asset) => asset.address == a.address)),
      );
    } else {
      toSubscribe.addAll(assets);
    }

    for (final asset in toUnsubscribe) {
      unsubscribe(asset.address);
    }

    lastUpdatedAssets = assets;

    for (final asset in toSubscribe) {
      await subscribe(asset);

      // Make this pseudo event to allow other operations in event loop
      // to be executed
      await Future<void>.delayed(Duration.zero);
    }
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
    required Fixed amount,
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
  Future<Fixed> estimateFees({
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
    required Fixed amount,
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
        await tonWalletStorage.addExpiredTransaction(
          address: wallet.address,
          group: wallet.transport.group,
          networkId: wallet.transport.networkId,
          transaction: expired,
        );
      },
    );
  }
}
