import 'package:nekoton_repository/nekoton_repository.dart';

/// This is a repository that lets you subscribe for TokenWallet and call its
/// methods for communication with blockchain.
///
/// Repository will store all instances of wallet, so you do not need to
/// unsubscribe from it directly, it will be better to call [unsubscribeToken]
/// method form wallet.
abstract class TokenWalletRepository {
  /// Subscribe to TokenWallet by address of owner wallet and address of
  /// contract and return its instance.
  /// This calls [TokenWallet.subscribe].
  ///
  /// !!! You do not need to refresh wallet directly after subscribing, because
  /// it will load its state during creation.
  Future<TokenWallet> subscribeToken({
    required Address owner,
    required Address rootTokenContract,
  });

  /// Start polling for wallet state updates by its address.
  ///
  /// Only one wallet should be polled at the same time, this is necessary to
  /// avoid blocking rust worker pool.
  ///
  /// If you really need update wallet's state, you can call
  /// [TokenWallet.refresh].
  /// directly, but for real polling, you must use this method.
  ///
  /// [refreshInterval] - time to poll requests, default
  ///   [tonWalletRefreshInterval].
  /// [stopPrevious] - if previously created pollers should be stopped,
  ///   default true.
  void startPollingToken(
    Address owner,
    Address rootTokenContract, {
    Duration refreshInterval,
    bool stopPrevious,
  });

  /// Stops any existed polls for wallet state updates.
  /// This method can be called when user leaves screen with wallet or
  /// when user closes app.
  /// If user just changed from one wallet to another, you must call
  /// [startPollingToken].
  void stopPollingToken();

  /// Dispose existing wallet instance and remove it from repository.
  void unsubscribeToken(Address owner, Address rootTokenContract);

  /// Dispose all existing wallet instances and remove them from repository.
  ///
  /// This method calls automatically when
  /// [TonWalletRepository.closeAllSubscriptions] was called.
  void closeAllTokenSubscriptions();

  /// This is a method to update all subscriptions for wallets if transport
  /// or list of current active accounts was changed.
  ///
  /// This is a heavy operation that interacts with network, so this method
  /// should not be called often.
  ///
  /// Methods subscribes for [AssetsList.additionalAssets] that matches with
  /// current [Transport.group].
  ///
  /// !!! This method must be called from app side because repository does not
  /// track current active accounts.
  Future<void> updateTokenSubscriptions(List<AssetsList> accounts);

  /// Update subscriptions when transport changed.
  /// To get new transport, [TransportRepository.currentTransport] should be
  /// used.
  /// If subscriptions was not created before this method, then nothing will
  /// happen.
  /// To create new subscriptions for accounts, use [updateTokenSubscriptions].
  ///
  /// This method automatically calls [closeAllTokenSubscriptions] and then
  /// recreates subscriptions in scope of new transport group.
  Future<void> updateTokenTransportSubscriptions();

  /// Prepare transfer of any token from wallet with [owner] and token contract
  /// with [rootTokenContract] to [destination] and [amount] of tokens.
  ///
  /// [attachedAmount] - additional amount of tokens, that should be attached
  /// to transaction. To see default value, see [TokenWallet.prepareTransfer].
  Future<InternalMessage> prepareTokenTransfer({
    required Address owner,
    required Address rootTokenContract,
    required Address destination,
    required Fixed amount,
    required bool notifyReceiver,
    Fixed? attachedAmount,
    String? payload,
  });

  /// Preload transaction for wallet
  Future<void> preloadTokenTransactions({
    required Address owner,
    required Address rootTokenContract,
    required String fromLt,
  });

  /// Get instance of wallet that was added by [subscribeToken].
  /// This method will throw error if there is no wallet that had been added
  /// before.
  TokenWallet getTokenWallet(Address owner, Address rootTokenContract);

  /// Map list of transactions for TokenWallet to list of
  /// [TokenWalletOrdinaryTransaction].
  List<TokenWalletOrdinaryTransaction> mapOrdinaryTokenTransactions({
    required Address rootTokenContract,
    required List<TransactionWithData<TokenWalletTransaction?>> transactions,
  });
}
