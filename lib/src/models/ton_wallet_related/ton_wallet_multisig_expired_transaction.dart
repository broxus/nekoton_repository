import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'ton_wallet_multisig_expired_transaction.freezed.dart';

/// Transaction for TonWallet that is created by
/// [TonWalletRepository.mapMultisigExpiredTransactions].
@freezed
class TonWalletMultisigExpiredTransaction
    with _$TonWalletMultisigExpiredTransaction {
  const factory TonWalletMultisigExpiredTransaction({
    required String lt,
    required PublicKey creator,
    required List<PublicKey> confirmations,
    required List<PublicKey> custodians,
    required bool isOutgoing,
    @amountJsonConverter required BigInt value,
    required Address address,
    @dateSecondsSinceEpochJsonConverter required DateTime date,
    @amountJsonConverter required BigInt fees,
    required String hash,
    String? prevTransactionLt,
    String? comment,
    DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,
    DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,
    TokenWalletDeployedNotification? tokenWalletDeployedNotification,
    WalletInteractionInfo? walletInteractionInfo,
  }) = _TonWalletMultisigExpiredTransaction;
}
