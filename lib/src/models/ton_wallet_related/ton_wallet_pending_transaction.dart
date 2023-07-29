import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'ton_wallet_pending_transaction.freezed.dart';

/// Transaction for TonWallet that is created by
/// [TonWalletRepository.mapPendingTransactions].
@freezed
class TonWalletPendingTransaction with _$TonWalletPendingTransaction {
  const factory TonWalletPendingTransaction({
    // address of wallet for which this transaction found
    required Address address,
    // creation date
    required DateTime date,
    required DateTime expireAt,
    // address for which tokens was sent
    required final Address destination,
    @amountJsonConverter required final BigInt amount,
    required String messageHash,
    // flag if this transaction was sent to this wallet
    required bool isIncoming,
  }) = _TonWalletPendingTransaction;
}
