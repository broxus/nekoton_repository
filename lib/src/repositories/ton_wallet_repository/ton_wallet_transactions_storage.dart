import 'package:nekoton_repository/nekoton_repository.dart';

/// Interface that lets [TonWalletRepository] handles transactions during wallet
/// lifetime.
/// This interface is used to store transactions or wallet info in cash storage.
abstract class TonWalletTransactionsStorage {
  /// Put information about ton wallet to cash storage.
  /// This callback calls, when [TonWallet.onStateChangedStream] triggered some
  /// action.
  /// To identify wallet, use [networkId], [group] and [address].
  ///
  /// [contractState], [details] and [custodians] - are fields that could be
  /// updated.
  Future<void> updateTonWalletDetails({
    required int networkId,
    required String group,
    required Address address,
    required ContractState contractState,
    required TonWalletDetails details,
    required List<PublicKey>? custodians,
  });

  /// Add pending transaction to list of transactions.
  /// This method calls during [TonWallet.send] method, when transaction should
  /// be in progress for some time. In the end of this method, transaction
  /// will be deleted.
  ///
  /// To identify wallet, use [networkId], [group] and [address].
  Future<void> addPendingTransaction({
    required int networkId,
    required String group,
    required Address address,
    required PendingTransactionWithData transaction,
  });

  /// Delete pending transaction from list of transactions.
  /// If transaction was deleted, this means, that is was completed (or timed
  /// out).
  /// To identify transaction, use [messageHash] that is
  /// [PendingTransaction.messageHash].
  ///
  /// To identify wallet, use [networkId], [group] and [address].
  Future<PendingTransactionWithData> deletePendingTransaction({
    required int networkId,
    required String group,
    required Address address,
    required String messageHash,
  });

  /// Add expired transaction to list of transactions.
  /// This method calls when [TonWallet.onMessageExpiredStream] emits new data.
  /// This method calls [deletePendingTransaction] and enters deleted
  /// transaction in list of expired.
  ///
  /// Expired transaction has same type as Pending, so you can use same model.
  ///
  /// To identify wallet, use [networkId], [group] and [address].
  Future<void> addExpiredTransaction({
    required int networkId,
    required String group,
    required Address address,
    required PendingTransactionWithData transaction,
  });

  /// Add list of found transactions to list of transactions.
  /// This method calls when [TonWallet.onTransactionsFoundStream] emits new
  /// data.
  ///
  /// To identify wallet, use [networkId], [group] and [address].
  // TODO(alex-a4): check how many transactions comes here
  Future<void> addFoundTransactions({
    required int networkId,
    required String group,
    required Address address,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transaction,
  });
}
