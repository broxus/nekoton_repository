import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nekoton_repository/nekoton_repository.dart';

part 'ton_wallet_multisig_ordinary_transaction.freezed.dart';

/// Transaction for TonWallet that is created by
/// [TonWalletRepository.mapMultisigOrdinaryTransactions].
@freezed
class TonWalletMultisigOrdinaryTransaction
    with _$TonWalletMultisigOrdinaryTransaction {
  const factory TonWalletMultisigOrdinaryTransaction({
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
    String? comment,
    String? prevTransactionLt,
    DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,
    DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,
    TokenWalletDeployedNotification? tokenWalletDeployedNotification,
    WalletInteractionInfo? walletInteractionInfo,
  }) = _TonWalletMultisigOrdinaryTransaction;
}
