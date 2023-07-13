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
    required TonWalletOnMessageSent onMessageSent,
    required TonWalletOnStateChanged onStateChanged,
    required TonWalletOnTransactionsFound onTransactionsFound,
    required TonWalletOnMessageExpired onMessageExpired,
  })  : _onMessageSentSubscription = tonWallet.onMessageSentStream.listen(
          (e) => onMessageSent((e.item1, e.item2)),
        ),
        _onStateChangedSubscription =
            tonWallet.onStateChangedStream.listen(onStateChanged),
        _onMessageExpiredSubscription =
            tonWallet.onMessageExpiredStream.listen(onMessageExpired),
        _onTransactionsFoundSubscription =
            tonWallet.onTransactionsFoundStream.listen(
          (e) => onTransactionsFound((e.item1, e.item2)),
        );

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
