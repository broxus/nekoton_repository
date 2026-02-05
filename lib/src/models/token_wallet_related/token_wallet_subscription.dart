import 'dart:async';

import 'package:nekoton_repository/nekoton_repository.dart';

/// Callbacks that allows handle events from [GenericTokenWallet]
typedef TokenWalletOnBalanceChanged = void Function(BigInt event);
typedef TokenWalletOnTransactionsFound =
    void Function(
      (
        List<TransactionWithData<TokenWalletTransaction?>>,
        TransactionsBatchInfo,
      )
      event,
    );

/// Helper class that allows to listen for events from [GenericTokenWallet] and
/// automatically dispose all subscriptions.
class TokenWalletSubscription {
  TokenWalletSubscription({
    required GenericTokenWallet wallet,
    required TokenWalletOnBalanceChanged onBalanceChanged,
    required TokenWalletOnTransactionsFound onTransactionsFound,
  }) : _onBalanceChangedSubscription = wallet.onBalanceChangedStream.listen(
         onBalanceChanged,
       ),
       _onTransactionsFoundSubscription = wallet.onTransactionsFoundStream
           .listen(onTransactionsFound);

  /// Number of stream listeners created internally by this subscription.
  ///
  /// Used by lazy polling observers to ignore internal listeners when deciding
  /// whether to start or stop polling.
  static const int internalListenersCount = 2;

  final StreamSubscription<BigInt> _onBalanceChangedSubscription;
  final StreamSubscription<
    (List<TransactionWithData<TokenWalletTransaction?>>, TransactionsBatchInfo)
  >
  _onTransactionsFoundSubscription;

  void close() {
    _onBalanceChangedSubscription.cancel();
    _onTransactionsFoundSubscription.cancel();
  }
}
