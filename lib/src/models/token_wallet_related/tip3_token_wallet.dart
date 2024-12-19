part of 'generic_token_wallet.dart';

class Tip3TokenWallet extends GenericTokenWallet {
  Tip3TokenWallet(this._wallet);

  static Future<Tip3TokenWallet> subscribe({
    required Transport transport,
    required Address owner,
    required Address rootTokenContract,
  }) async =>
      Tip3TokenWallet(
        await TokenWallet.subscribe(
          transport: transport,
          owner: owner,
          rootTokenContract: rootTokenContract,
        ),
      );

  final TokenWallet _wallet;

  @override
  TokenWallet get inner => _wallet;

  @override
  Transport get transport => _wallet.transport;

  @override
  BigInt get balance => _wallet.balance;

  @override
  Money get moneyBalance => _wallet.moneyBalance;

  @override
  Currency get currency => _wallet.currency;

  @override
  Address get rootTokenContract => _wallet.rootTokenContract;

  @override
  Address get tokenAddress => _wallet.tokenAddress;

  @override
  Address get owner => _wallet.owner;

  @override
  Symbol get symbol => _wallet.symbol;

  @override
  ContractState get contractState => _wallet.contractState;

  @override
  Stream<void> get fieldUpdatesStream => _wallet.fieldUpdatesStream;

  @override
  Stream<BigInt> get onBalanceChangedStream => _wallet.onBalanceChangedStream;

  @override
  Stream<Money> get onMoneyBalanceChangedStream =>
      _wallet.onMoneyBalanceChangedStream;

  @override
  Stream<
      (
        List<TransactionWithData<TokenWalletTransaction?>>,
        TransactionsBatchInfo
      )> get onTransactionsFoundStream => _wallet.onTransactionsFoundStream;

  @override
  Future<ContractState> getContractState() => _wallet.getContractState();

  @override
  Future<void> preloadTransactions([String? fromLt]) =>
      _wallet.preloadTransactions(fromLt);

  @override
  void onBalanceChanged(String balance) => _wallet.onBalanceChanged(balance);

  @override
  void onTransactionsFound(String payload) =>
      _wallet.onTransactionsFound(payload);

  @override
  void dispose() => _wallet.dispose();
}
