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
    // initiator of transactions
    required PublicKey creator,
    // custodians who accepted this transaction
    required List<PublicKey> confirmations,
    // list of possible custodians
    required List<PublicKey> custodians,
    // if this transaction was sent from this wallet
    required bool isOutgoing,
    @amountJsonConverter required BigInt value,
    // address of destination or source depends on isOutgoing
    required Address address,
    required DateTime date,
    @amountJsonConverter required BigInt fees,
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
