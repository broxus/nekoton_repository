import 'package:nekoton_repository/nekoton_repository.dart';

/// This is a repository that lets you subscribe for TonWallet and call its
/// methods for communication with blockchain.
/// You can also refresh its state by polling or pause it.
///
/// Repository will store all instances of wallet, so you do not need to
/// unsubscribe from it directly, it will be better to call [unsubscribe] method
/// form wallet.
abstract class TonWalletRepository {
  /// Subscribe to TonWallet by its asset and return its instance.
  /// This calls [TonWallet.subscribe].
  ///
  /// If address of asset contains in [tonWalletZeroStateAddresses], then
  /// [subscribeByAddress] will be used.
  ///
  /// !!! You do not need to refresh wallet directly after subscribing, because
  /// it will load its state during creation.
  Future<TonWallet> subscribe(TonWalletAsset asset);

  /// Subscribe to TonWallet by its address and return its instance.
  /// This calls [TonWallet.subscribeByAddress].
  ///
  /// !!! You do not need to refresh wallet directly after subscribing, because
  /// it will load its state during creation.
  Future<TonWallet> subscribeByAddress(Address address);

  /// Subscribe to TonWallet by its info and return its instance.
  /// This calls [TonWallet.subscribeByExistingWallet].
  ///
  /// !!! You do not need to refresh wallet directly after subscribing, because
  /// it will load its state during creation.
  Future<TonWallet> subscribeByExistingWallet(
    ExistingWalletInfo existingWallet,
  );

  /// Start polling for wallet state updates by its address.
  ///
  /// Only one wallet should be polled at the same time, this is necessary to
  /// avoid blocking rust worker pool.
  ///
  /// If you really need update wallet's state, you can call [TonWallet.refresh]
  /// directly, but for real polling, you must use this method.
  ///
  /// [refreshInterval] - time to poll requests, default
  ///   [tonWalletRefreshInterval].
  /// [stopPrevious] - if previously created pollers should be stopped,
  ///   default true.
  void startPolling(
    Address address, {
    Duration refreshInterval,
    bool stopPrevious,
  });

  /// Stops any existed polls for wallet state updates.
  /// This method can be called when user leaves screen with wallet or
  /// when user closes app.
  /// If user just changed from one wallet to another, you must call
  /// [startPolling].
  void stopPolling();

  /// Dispose existing wallet instance and remove it from repository.
  void unsubscribe(Address address);

  /// Dispose all existing wallet instances and remove them from repository.
  ///
  /// This method automatically calls
  /// [TokenWalletRepository.closeAllTokenSubscriptions].
  void closeAllSubscriptions();

  /// This is a method to update all subscriptions for wallets if list of
  /// current active accounts was changed.
  /// To update subscriptions after transport changed,
  /// use [updateTransportSubscriptions].
  ///
  /// This is a heavy operation that interacts with network, so this method
  /// should not be called often.
  ///
  /// !!! This method must be called from app side because repository does not
  /// track current active accounts.
  Future<void> updateSubscriptions(List<TonWalletAsset> assets);

  /// Update subscriptions when transport changed.
  /// To get new transport, [TransportRepository.currentTransport] should be
  /// used.
  /// If subscriptions was not created before this method, then nothing will
  /// happen.
  /// To create new subscriptions for accounts, use [updateSubscriptions].
  ///
  /// This method automatically calls [closeAllSubscriptions] and then
  /// recreates subscriptions.
  Future<void> updateTransportSubscriptions();

  /// Prepare wallet with [address] to be deployed.
  /// [expiration] is a timeout after which action will be failed.
  Future<UnsignedMessage> prepareDeploy(
    Address address,
    Expiration expiration,
  );

  /// Prepare wallet with [address] to deploy multisig wallet.
  /// [custodians] list of public keys that will be custodians of wallet.
  /// [reqConfirms] is a number of custodians that must confirm any action.
  /// [expiration] is a timeout after which action will be failed.
  Future<UnsignedMessage> prepareDeployWithMultipleOwners({
    required Address address,
    required List<PublicKey> custodians,
    required int reqConfirms,
    required Expiration expiration,
  });

  /// Prepare transfer of any token from wallet with [address] to [destination]
  /// and [amount] of tokens.
  ///
  /// To transfer token wallets, it must be calculated via
  /// [TokenWalletRepository.prepareTokenTransfer] and recalculated amount of
  /// original tokens.
  Future<UnsignedMessage> prepareTransfer({
    required Address address,
    required Address destination,
    required BigInt amount,
    required bool bounce,
    required Expiration expiration,
    PublicKey? publicKey,
    String? body,
  });

  /// Create message to confirm transaction to transfer tokens from wallet with
  /// [address] and [transactionId] of transaction.
  /// [expiration] is a timeout after which action will be failed.
  Future<UnsignedMessage> prepareConfirmTransaction({
    required Address address,
    required PublicKey publicKey,
    required String transactionId,
    required Expiration expiration,
  });

  /// Estimate fees of transaction with [message] and wallet with [address].
  Future<BigInt> estimateFees({
    required Address address,
    required UnsignedMessage message,
  });

  /// Send message to blockchain and listen for its completion.
  /// [address] - is wallet from which funds will be sent.
  /// [signedMessage] - message to blockchain that user had signed
  /// [destination] - address of wallet to which funds will be sent
  /// [amount] - amount of funds to sent.
  ///
  /// !!! This method will trigger adding new pending transaction.
  Future<Transaction> send({
    required Address address,
    required SignedMessage signedMessage,
    required Address destination,
    required BigInt amount,
  });

  /// Preload transaction for wallet
  Future<void> preloadTransactions({
    required Address address,
    required String fromLt,
  });

  /// Get list of custodians for wallet with [address] that contains in
  /// users [SeedList].
  /// If you need put current key at 1-st place, you can sort it manually.
  List<PublicKey>? localCustodians(Address address);

  /// Get instance of wallet that was added by [subscribe], [subscribeByAddress]
  /// or [subscribeByExistingWallet].
  /// This method will throw error if there is no wallet that had been added
  /// before.
  TonWallet getWallet(Address address);

  /// Map list of transactions for TonWallet to list of completed transactions.
  ///
  /// [transactions] - list of transactions from
  ///   [TonWalletTransactionsStorage.addFoundTransactions].
  List<TonWalletOrdinaryTransaction> mapOrdinaryTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
  });

  /// Map list of transactions for TonWallet to list of pending transactions.
  ///
  /// [pendingTransactions] - list of transactions from
  ///   [TonWalletTransactionsStorage.addPendingTransaction].
  List<TonWalletPendingTransaction> mapPendingTransactions({
    required Address walletAddress,
    required List<PendingTransactionWithData> pendingTransactions,
  });

  /// Map list of transactions for TonWallet to list of expired transactions.
  ///
  /// [expiredTransactions] - list of transactions from
  ///   [TonWalletTransactionsStorage.addExpiredTransaction].
  List<TonWalletExpiredTransaction> mapExpiredTransactions({
    required Address walletAddress,
    required List<PendingTransactionWithData> expiredTransactions,
  });

  /// Map list of transactions for TonWallet to list multisig ordinary
  /// transactions.
  ///
  /// [transactions] - list of transactions from
  ///   [TonWalletTransactionsStorage.addFoundTransactions].
  /// [multisigPendingTransactions] - list of transactions from
  ///   [TonWallet.getUnconfirmedTransactions]
  List<TonWalletMultisigOrdinaryTransaction> mapMultisigOrdinaryTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  });

  /// Map list of transactions for TonWallet to list multisig pending
  /// transactions.
  ///
  /// [transactions] - list of transactions from
  ///   [TonWalletTransactionsStorage.addFoundTransactions].
  /// [multisigPendingTransactions] - list of transactions from
  ///   [TonWallet.getUnconfirmedTransactions]
  List<TonWalletMultisigPendingTransaction> mapMultisigPendingTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  });

  /// Map list of transactions for TonWallet to list multisig expired
  /// transactions.
  ///
  /// [transactions] - list of transactions from
  ///   [TonWalletTransactionsStorage.addFoundTransactions].
  /// [multisigPendingTransactions] - list of transactions from
  ///   [TonWallet.getUnconfirmedTransactions]
  List<TonWalletMultisigExpiredTransaction> mapMultisigExpiredTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  });
}
