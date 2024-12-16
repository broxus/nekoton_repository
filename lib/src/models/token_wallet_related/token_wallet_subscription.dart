import 'dart:async';

import 'package:nekoton_repository/nekoton_repository.dart';

/// Callbacks that allows handle events from [TokenWallet]
typedef TokenWalletOnBalanceChanged = void Function(BigInt event);
typedef TokenWalletOnTransactionsFound = void Function(
  (
    List<TransactionWithData<TokenWalletTransaction?>>,
    TransactionsBatchInfo,
  ) event,
);

/// Helper class that allows to listen for events from [TokenWallet] and
/// automatically dispose all subscriptions.
class TokenWalletSubscription {
  TokenWalletSubscription({
    required TokenWallet tokenWallet,
    required TokenWalletOnBalanceChanged onBalanceChanged,
    required TokenWalletOnTransactionsFound onTransactionsFound,
  })  : _onBalanceChangedSubscription =
            tokenWallet.onBalanceChangedStream.listen(onBalanceChanged),
        _onTransactionsFoundSubscription =
            tokenWallet.onTransactionsFoundStream.listen(onTransactionsFound);

  /// Dynamic is used here to avoid importing Tuple lib, anyway we do not need
  /// this type in subscription.
  final StreamSubscription<dynamic> _onBalanceChangedSubscription;
  final StreamSubscription<dynamic> _onTransactionsFoundSubscription;

  void close() {
    _onBalanceChangedSubscription.cancel();
    _onTransactionsFoundSubscription.cancel();
  }
}
