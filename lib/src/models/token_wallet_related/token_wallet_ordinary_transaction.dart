import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'token_wallet_ordinary_transaction.freezed.dart';

/// Transaction for TokenWallet that is created by
/// [TokenWalletRepository.mapOrdinaryTokenTransactions].
@freezed
abstract class TokenWalletOrdinaryTransaction
    with _$TokenWalletOrdinaryTransaction {
  const factory TokenWalletOrdinaryTransaction({
    required String lt,
    required bool isOutgoing,
    required BigInt value,
    required Address address,
    @dateSecondsSinceEpochJsonConverter required DateTime date,
    required BigInt fees,
    required String hash,
    String? prevTransactionLt,
    TokenIncomingTransfer? incomingTransfer,
    TokenOutgoingTransfer? outgoingTransfer,
    TokenSwapBack? swapBack,
    BigInt? accept,
    BigInt? transferBounced,
    BigInt? swapBackBounced,
    JettonIncomingTransfer? jettonIncomingTransfer,
    JettonOutgoingTransfer? jettonOutgoingTransfer,
  }) = _TokenWalletOrdinaryTransaction;
}
