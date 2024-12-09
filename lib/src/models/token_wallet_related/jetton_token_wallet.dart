part of 'generic_token_wallet.dart';

class JettonTokenWallet extends GenericTokenWallet {
  JettonTokenWallet(this._wallet, this._symbol)
      : _currency = _getCurrency(_symbol);

  static Future<JettonTokenWallet> subscribe({
    required Transport transport,
    required Address owner,
    required Address rootTokenContract,
    required Symbol symbol,
  }) async =>
      JettonTokenWallet(
        await JettonWallet.subscribe(
          transport: transport,
          owner: owner,
          rootTokenContract: rootTokenContract,
        ),
        symbol,
      );

  final JettonWallet _wallet;
  final Symbol _symbol;
  final Currency _currency;

  @override
  Currency get currency => _currency;

  @override
  JettonWallet get inner => _wallet;

  @override
  Transport get transport => _wallet.transport;

  @override
  BigInt get balance => _wallet.balance;

  @override
  Money get moneyBalance => Money.fromBigIntWithCurrency(balance, currency);

  @override
  Address get rootTokenContract => _wallet.rootTokenContract;

  @override
  Address get tokenAddress => _wallet.tokenAddress;

  @override
  Address get owner => _wallet.owner;

  @override
  Symbol get symbol => _symbol;

  @override
  ContractState get contractState => _wallet.contractState;

  @override
  Stream<void> get fieldUpdatesStream => _wallet.fieldUpdatesStream;

  @override
  Stream<BigInt> get onBalanceChangedStream => _wallet.onBalanceChangedStream;

  @override
  Stream<Money> get onMoneyBalanceChangedStream => onBalanceChangedStream.map(
        (balance) => Money.fromBigIntWithCurrency(balance, currency),
      );

  @override
  Stream<
      (
        List<TransactionWithData<TokenWalletTransaction?>>,
        TransactionsBatchInfo
      )> get onTransactionsFoundStream => _wallet.onTransactionsFoundStream;

  @override
  Future<ContractState> getContractState() => _wallet.getContractState();

  @override
  Future<void> preloadTransactions({required String fromLt}) =>
      _wallet.preloadTransactions(fromLt: fromLt);

  @override
  void onBalanceChanged(String balance) => _wallet.onBalanceChanged(balance);

  @override
  void onTransactionsFound(String payload) =>
      _wallet.onTransactionsFound(payload);

  @override
  void dispose() => _wallet.dispose();
}

Currency _getCurrency(Symbol symbol) {
  final patternDigits =
      symbol.decimals > 0 ? '0.${'#' * symbol.decimals}' : '0';
  final currency = Currency.create(
    symbol.name,
    symbol.decimals,
    symbol: symbol.name,
    pattern: patternDigits,
  );
  Currencies().register(currency);

  return currency;
}
