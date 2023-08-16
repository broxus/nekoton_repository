import 'package:nekoton_repository/nekoton_repository.dart';

/// Interface that lets [TokenWalletRepository] handles transactions during
/// wallet lifetime.
/// This interface is used to store transactions or wallet info in cash storage.
abstract class TokenWalletTransactionsStorage {
  /// Put information about ton wallet to cash storage.
  /// This callback calls, when [TokenWallet.onBalanceChanged] triggered some
  /// action.
  /// To identify wallet, use [networkId], [group], [owner] and
  /// [rootTokenContract].
  ///
  /// [symbol], [version], [balance] and [contractState] - are fields that could
  /// be updated.
  Future<void> updateTokenWalletDetails({
    required int networkId,
    required String group,
    required Address owner,
    required Address rootTokenContract,
    required Symbol symbol,
    required TokenWalletVersion version,
    required BigInt balance,
    required ContractState contractState,
  });

  /// Add list of found transactions to list of transactions.
  /// This method calls when [TonWallet.onTransactionsFoundStream] emits new
  /// data.
  ///
  /// To identify wallet, use [networkId], [group], [owner] and
  /// [rootTokenContract].
  Future<void> addFoundTransactions({
    required int networkId,
    required String group,
    required Address owner,
    required Address rootTokenContract,
    required List<TransactionWithData<TokenWalletTransaction?>> transaction,
  });
}
