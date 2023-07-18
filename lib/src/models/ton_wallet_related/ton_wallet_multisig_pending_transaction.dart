import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'ton_wallet_multisig_pending_transaction.freezed.dart';

/// Transaction for TonWallet that is created by
/// [TonWalletRepository.mapMultisigPendingTransactions].
@freezed
class TonWalletMultisigPendingTransaction
    with _$TonWalletMultisigPendingTransaction {
  const factory TonWalletMultisigPendingTransaction({
    required String lt,
    required PublicKey creator,
    required List<PublicKey> confirmations,
    required List<PublicKey> custodians,
    required bool isOutgoing,
    @amountJsonConverter required Fixed value,
    required Address address,
    required Address walletAddress,
    required DateTime date,
    @amountJsonConverter required Fixed fees,
    required String hash,
    required int signsReceived,
    required int signsRequired,
    required String transactionId,
    required List<PublicKey> publicKeys,
    required bool canConfirm,
    required DateTime expireAt,
    String? comment,
    String? prevTransactionLt,
    DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,
    DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,
    TokenWalletDeployedNotification? tokenWalletDeployedNotification,
    WalletInteractionInfo? walletInteractionInfo,
  }) = _TonWalletMultisigPendingTransaction;
}
