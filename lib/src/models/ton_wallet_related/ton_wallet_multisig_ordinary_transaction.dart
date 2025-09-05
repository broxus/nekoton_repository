import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nekoton_repository/nekoton_repository.dart';

part 'ton_wallet_multisig_ordinary_transaction.freezed.dart';

/// Transaction for TonWallet that is created by
/// [TonWalletRepository.mapMultisigOrdinaryTransactions].
@freezed
abstract class TonWalletMultisigOrdinaryTransaction
    with _$TonWalletMultisigOrdinaryTransaction {
  const factory TonWalletMultisigOrdinaryTransaction({
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
    String? comment,
    String? prevTransactionLt,
    DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,
    DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,
    TokenWalletDeployedNotification? tokenWalletDeployedNotification,
    WalletInteractionInfo? walletInteractionInfo,
  }) = _TonWalletMultisigOrdinaryTransaction;
}
