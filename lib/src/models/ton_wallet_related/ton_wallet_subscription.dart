import 'dart:async';

import 'package:nekoton_repository/nekoton_repository.dart';

/// Callbacks that allows handle events from [TonWallet]
typedef TonWalletOnMessageSent =
    void Function((PendingTransaction, Transaction?) event);
typedef TonWalletOnStateChanged = void Function(ContractState event);
typedef TonWalletOnTransactionsFound =
    void Function(
      (
        List<TransactionWithData<TransactionAdditionalInfo?>>,
        TransactionsBatchInfo,
      )
      event,
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
  }) : _onMessageSentSubscription = tonWallet.onMessageSentStream.listen(
         onMessageSent,
       ),
       _onStateChangedSubscription = tonWallet.onStateChangedStream.listen(
         onStateChanged,
       ),
       _onMessageExpiredSubscription = tonWallet.onMessageExpiredStream.listen(
         onMessageExpired,
       ),
       _onTransactionsFoundSubscription = tonWallet.onTransactionsFoundStream
           .listen(onTransactionsFound);

  /// Number of stream listeners created internally by this subscription.
  ///
  /// Used by lazy polling observers to ignore internal listeners when deciding
  /// whether to start or stop polling.
  static const int internalListenersCount = 4;

  final StreamSubscription<(PendingTransaction, Transaction?)>
  _onMessageSentSubscription;
  final StreamSubscription<ContractState> _onStateChangedSubscription;
  final StreamSubscription<PendingTransaction> _onMessageExpiredSubscription;
  final StreamSubscription<
    (
      List<TransactionWithData<TransactionAdditionalInfo?>>,
      TransactionsBatchInfo,
    )
  >
  _onTransactionsFoundSubscription;

  void close() {
    _onMessageSentSubscription.cancel();
    _onStateChangedSubscription.cancel();
    _onMessageExpiredSubscription.cancel();
    _onTransactionsFoundSubscription.cancel();
  }
}
