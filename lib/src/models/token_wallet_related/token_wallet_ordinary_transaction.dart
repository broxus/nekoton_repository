import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'token_wallet_ordinary_transaction.freezed.dart';

/// Transaction for TokenWallet that is created by
/// [TokenWalletRepository.mapOrdinaryTokenTransactions].
@freezed
class TokenWalletOrdinaryTransaction with _$TokenWalletOrdinaryTransaction {
  const factory TokenWalletOrdinaryTransaction({
    required String lt,
    required bool isOutgoing,
    @amountJsonConverter required Fixed value,
    required Address address,
    @dateSecondsSinceEpochJsonConverter required DateTime date,
    @amountJsonConverter required Fixed fees,
    required String hash,
    String? prevTransactionLt,
    TokenIncomingTransfer? incomingTransfer,
    TokenOutgoingTransfer? outgoingTransfer,
    TokenSwapBack? swapBack,
    @amountJsonConverter Fixed? accept,
    @amountJsonConverter Fixed? transferBounced,
    @amountJsonConverter Fixed? swapBackBounced,
  }) = _TokenWalletOrdinaryTransaction;
}
