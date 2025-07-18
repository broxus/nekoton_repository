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
  /// If address of [asset] is zerostate address, then
  /// [subscribeByAddress] will be used.
  ///
  /// !!! You do not need to refresh wallet directly after subscribing, because
  /// it will load its state during creation.
  ///
  /// !!! If you call this method manually, be sure that transport is valid
  /// checking it via [Transport.disposed].
  Future<TonWalletState> subscribe(TonWalletAsset asset);

  /// Subscribe to TonWallet by its address and return its instance.
  /// This calls [TonWallet.subscribeByAddress].
  ///
  /// !!! You do not need to refresh wallet directly after subscribing, because
  /// it will load its state during creation.
  ///
  /// !!! If you call this method manually, be sure that transport is valid
  /// checking it via [Transport.disposed].
  Future<TonWalletState> subscribeByAddress(Address address);

  /// Subscribe to TonWallet by its info and return its instance.
  /// This calls [TonWallet.subscribeByExistingWallet].
  ///
  /// !!! You do not need to refresh wallet directly after subscribing, because
  /// it will load its state during creation.
  ///
  /// !!! If you call this method manually, be sure that transport is valid
  /// checking it via [Transport.disposed].
  Future<TonWalletState> subscribeByExistingWallet(
    ExistingWalletInfo existingWallet,
  );

  /// If creating of subscription was failed and [TonWalletState] contains
  /// error, then you can call this method to try to update this subscription.
  ///
  /// If subscription creates successfully, then it will update cache & stream.
  ///
  /// If the asset with [address] won't be found, then method provides
  /// error state to stream.
  Future<void> retrySubscriptions(Address address);

  /// Start polling for wallet state updates by its address.
  ///
  /// Only one wallet should be polled at the same time, this is necessary to
  /// avoid blocking rust worker pool.
  ///
  /// If you really need update wallet's state, you can call [TonWallet.refresh]
  /// directly, but for real polling, you must use this method.
  ///
  /// If [TonWalletState.wallet] was null (wallet was not created), polling
  /// will be ignored.
  ///
  /// [refreshInterval] - time to poll requests
  /// [stopPrevious] - if previously created pollers should be stopped,
  ///   default true.
  Future<void> startPolling(
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

  void pausePolling();

  void resumePolling();

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
  /// The second value is [KeyAccount.isExternal] that allows to identify if
  /// we should use [subscribe] or [subscribeByAddress].
  ///
  /// This is a heavy operation that interacts with network, so this method
  /// should not be called often.
  ///
  /// !!! This method must be called from app side because repository does not
  /// track current active accounts.
  Future<void> updateSubscriptions(List<(TonWalletAsset, bool)> assets);

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
  /// [expirationTime] is a time in seconds after which transaction will expire.
  Future<UnsignedMessage> prepareDeployWithMultipleOwners({
    required Address address,
    required List<PublicKey> custodians,
    required int reqConfirms,
    required Expiration expiration,
    required int? expirationTime,
  });

  /// Prepare transfer of any token from wallet with [address] using [params].
  ///
  /// To transfer token wallets, it must be calculated via
  /// [TokenWalletRepository.prepareTokenTransfer] and recalculated amount of
  /// original tokens.
  Future<UnsignedMessage> prepareTransfer({
    required Address address,
    required Expiration expiration,
    required List<TonWalletTransferParams> params,
    PublicKey? publicKey,
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

  /// Estimate fees of deployment with [message] and wallet with [address].
  Future<BigInt> estimateDeploymentFees({
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

  /// Send message to blockchain but do not listen for completion.
  /// [address] - is wallet from which funds will be sent.
  /// [signedMessage] - message to blockchain that user had signed
  /// [destination] - address of wallet to which funds will be sent
  /// [amount] - amount of funds to sent.
  ///
  /// !!! This method will trigger adding new pending transaction.
  Future<PendingTransaction> sendUnawaited({
    required Address address,
    required SignedMessage signedMessage,
    required Address destination,
    required BigInt amount,
  });

  /// Wait sending transaction after calling [sendUnawaited], this can be
  /// helpful when you need to wait transaction completion and call callbacks
  /// from InpageProvider.
  Future<Transaction> waitSending({
    required PendingTransaction pending,
    required Address address,
  });

  /// Preload transaction for wallet
  Future<void> preloadTransactions({
    required Address address,
    required String fromLt,
  });

  /// Get instance of wallet that was added by [subscribe], [subscribeByAddress]
  /// or [subscribeByExistingWallet].
  Future<TonWalletState> getWallet(Address address);

  /// Get list of custodians for TonWallet with [address] that were added
  /// to application before.
  /// This method will try to take subscribed wallet by [getWallet], to load
  /// local custodians without subscription, use [getLocalCustodiansAsync].
  ///
  /// Returns list of custodians that were added to keystore. For not-multisig
  /// wallets returns single-item list (if exists), for multisig returns as much
  /// as found.
  /// If local custodians were not found, returns null for any wallet.
  Future<List<PublicKey>?> getLocalCustodians(Address address);

  /// Get list of custodians for TonWallet with [address] that were added
  /// to application before.
  /// This method will call [TonWallet.getWalletCustodians] with current active
  /// transport, so this is network-dependent operation, to use local version,
  /// use [getLocalCustodians].
  ///
  /// Returns list of custodians that were added to keystore. For not-multisig
  /// wallets returns single-item list (if exists), for multisig returns as much
  /// as found.
  /// If local custodians were not found, returns null for any wallet.
  Future<List<PublicKey>?> getLocalCustodiansAsync(Address address);

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
  Future<List<TonWalletMultisigOrdinaryTransaction>>
      mapMultisigOrdinaryTransactions({
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
  Future<List<TonWalletMultisigPendingTransaction>>
      mapMultisigPendingTransactions({
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
  Future<List<TonWalletMultisigExpiredTransaction>>
      mapMultisigExpiredTransactions({
    required Address walletAddress,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> multisigPendingTransactions,
  });

  Future<List<TxTreeSimulationErrorItem>> simulateTransactionTree({
    required Address address,
    required UnsignedMessage message,
    List<IgnoreTransactionTreeSimulationError>? ignoredComputePhaseCodes,
    List<IgnoreTransactionTreeSimulationError>? ignoredActionPhaseCodes,
  });
}
