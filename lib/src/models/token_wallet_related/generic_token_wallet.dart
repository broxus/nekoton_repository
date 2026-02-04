import 'package:flutter_nekoton_bridge/flutter_nekoton_bridge.dart';
import 'package:money2/money2.dart';
import 'package:nekoton_repository/src/utils/utils.dart';

part 'jetton_token_wallet.dart';
part 'tip3_token_wallet.dart';

sealed class GenericTokenWallet {
  RefreshingInterface get inner;
  Transport get transport;
  BigInt get balance;
  Money get moneyBalance;
  Currency get currency;
  Address get rootTokenContract;
  Address get tokenAddress;
  Address get owner;
  Symbol get symbol;
  ContractState get contractState;
  bool get isTransactionsPreloaded;
  Stream<void> get fieldUpdatesStream;
  Stream<BigInt> get onBalanceChangedStream;
  Stream<Money> get onMoneyBalanceChangedStream;
  Stream<
    (List<TransactionWithData<TokenWalletTransaction?>>, TransactionsBatchInfo)
  >
  get onTransactionsFoundStream;

  /// Attaches an observer that tracks total stream listeners count.
  ///
  /// The observer is notified whenever any wallet stream gains or loses
  /// listeners, enabling lazy polling and resource management.
  void attachStreamListenersObserver(StreamListenersObserver observer);
  Future<ContractState> getContractState();
  Future<void> preloadTransactions([String? fromLt]);
  void onBalanceChanged(String balance);
  void onTransactionsFound(String payload);
  void dispose();
}
