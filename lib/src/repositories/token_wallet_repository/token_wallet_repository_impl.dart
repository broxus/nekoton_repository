import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:rxdart/rxdart.dart';

/// Polling interval for token wallet refresh
const tokenWalletRefreshInterval = Duration(seconds: 15);

mixin TokenWalletRepositoryImpl implements TokenWalletRepository {
  KeyStore get keyStore;

  TokenWalletTransactionsStorage get tokenWalletStorage;

  TransportStrategy get currentTransport;

  /// Subject that allows listening for wallets subscribing/unsubscribing
  /// Key - pair where first item is owner address, second is rootTokenContract
  final _tokenWalletsSubject =
      BehaviorSubject<Map<(Address, Address), TokenWallet>>.seeded({});

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
    closeAllTokenSubscriptions();

    final networkGroup = currentTransport.transport.group;

    final tokenWallets = accounts
        .map(
          (e) => e.additionalAssets[networkGroup]?.tokenWallets
              .map((el) => (e.tonWallet.address, el.rootTokenContract)),
        )
        .whereNotNull()
        .expand((e) => e);

    for (final wallet in tokenWallets) {
      await subscribeToken(owner: wallet.$1, rootTokenContract: wallet.$2);

      // Make this pseudo event to allow other operations in event loop
      // to be executed
      await Future<void>.delayed(Duration.zero);
    }
  }

  @override
  Future<InternalMessage> prepareTokenTransfer({
    required Address owner,
    required Address rootTokenContract,
    required Address destination,
    required Fixed amount,
    required bool notifyReceiver,
    Fixed? attachedAmount,
    String? payload,
  }) async {
    final tokenWallet = getTokenWallet(owner, rootTokenContract);

    final internalMessage = await tokenWallet.prepareTransfer(
      destination: destination,
      amount: amount,
      notifyReceiver: notifyReceiver,
      payload: payload,
      attachedAmount: attachedAmount,
    );

    return internalMessage;
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
    final pair = (wallet.owner, wallet.address);
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
        rootTokenContract: wallet.address,
        group: wallet.transport.group,
        networkId: wallet.transport.networkId,
        symbol: wallet.symbol,
        version: wallet.version,
        balance: wallet.balance,
        contractState: wallet.contractState,
      ),
      onTransactionsFound: (event) => tokenWalletStorage.addFoundTransactions(
        owner: wallet.owner,
        rootTokenContract: wallet.address,
        group: wallet.transport.group,
        networkId: wallet.transport.networkId,
        transaction: event.$1,
      ),
    );
  }
}
