import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'ton_wallet_multisig_expired_transaction.freezed.dart';

/// Transaction for TonWallet that is created by
/// [TonWalletRepository.mapMultisigExpiredTransactions].
@freezed
abstract class TonWalletMultisigExpiredTransaction
    with _$TonWalletMultisigExpiredTransaction {
  const factory TonWalletMultisigExpiredTransaction({
    required String lt,
    // initiator of transactions
    required PublicKey creator,
    // custodians who accepted this transaction
    required List<PublicKey> confirmations,
    // list of possible custodians
    required List<PublicKey> custodians,
    // if this transaction was sent from this wallet
    required bool isOutgoing,
    required BigInt value,
    // address of destination or source depends on isOutgoing
    required Address address,
    @dateSecondsSinceEpochJsonConverter required DateTime date,
    required BigInt fees,
    required String hash,
    String? prevTransactionLt,
    String? comment,
    DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,
    DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,
    TokenWalletDeployedNotification? tokenWalletDeployedNotification,
    WalletInteractionInfo? walletInteractionInfo,
  }) = _TonWalletMultisigExpiredTransaction;
}
