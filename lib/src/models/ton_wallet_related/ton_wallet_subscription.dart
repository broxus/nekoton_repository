import 'dart:async';

import 'package:nekoton_repository/nekoton_repository.dart';

/// Callbacks that allows handle events from [TonWallet]
typedef TonWalletOnMessageSent = void Function(
  (PendingTransaction, Transaction?) event,
);
typedef TonWalletOnStateChanged = void Function(ContractState event);
typedef TonWalletOnTransactionsFound = void Function(
  (
    List<TransactionWithData<TransactionAdditionalInfo?>>,
    TransactionsBatchInfo
  ) event,
);
typedef TonWalletOnMessageExpired = void Function(PendingTransaction event);

/// Helper class that allows to listen for events from [TonWallet] and
/// automatically dispose all subscriptions.
class TonWalletSubscription {
  TonWalletSubscription({
    required TonWallet tonWallet,
    TonWalletOnMessageSent? onMessageSent,
    TonWalletOnStateChanged? onStateChanged,
    TonWalletOnTransactionsFound? onTransactionsFound,
    TonWalletOnMessageExpired? onMessageExpired,
  })  : _onMessageSentSubscription = tonWallet.onMessageSentStream.listen(
          onMessageSent,
        ),
        _onStateChangedSubscription =
            tonWallet.onStateChangedStream.listen(onStateChanged),
        _onMessageExpiredSubscription =
            tonWallet.onMessageExpiredStream.listen(onMessageExpired),
        _onTransactionsFoundSubscription =
            tonWallet.onTransactionsFoundStream.listen(onTransactionsFound);

  /// Dynamic is used here to avoid importing Tuple lib, anyway we do not need
  /// this type in subscription.
  final StreamSubscription<dynamic> _onMessageSentSubscription;
  final StreamSubscription<dynamic> _onStateChangedSubscription;
  final StreamSubscription<dynamic> _onMessageExpiredSubscription;
  final StreamSubscription<dynamic> _onTransactionsFoundSubscription;

  void close() {
    _onMessageSentSubscription.cancel();
    _onStateChangedSubscription.cancel();
    _onMessageExpiredSubscription.cancel();
    _onTransactionsFoundSubscription.cancel();
  }
}
