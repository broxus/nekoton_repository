import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'ton_wallet_pending_transaction.freezed.dart';

/// Transaction for TonWallet that is created by
/// [TonWalletRepository.mapPendingTransactions].
@freezed
class TonWalletPendingTransaction with _$TonWalletPendingTransaction {
  const factory TonWalletPendingTransaction({
    required Address address,
    required DateTime date,
    required DateTime expireAt,
  }) = _TonWalletPendingTransaction;
}
