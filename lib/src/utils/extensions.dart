import 'package:money2/money2.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

extension NumExtension on num {
  BigInt toNativeToken([int decimals = 9]) {
    final factor = BigInt.from(10).pow(decimals);
    return BigInt.from(this * factor.toDouble());
  }
}

extension ExistingWalletInfoX on ExistingWalletInfo {
  /// Check if account is deployed or has money on balance.
  bool get isActive {
    final isDeployed = contractState.isDeployed;
    final balanceIsGreaterThanZero = contractState.balance > BigInt.zero;

    return isDeployed || balanceIsGreaterThanZero;
  }
}

extension SymbolX on Symbol {
  Currency toCurrency({bool register = true}) {
    final patternDigits = decimals > 0 ? '0.${'#' * decimals}' : '0';
    final currency = Currency.create(
      name,
      decimals,
      symbol: name,
      pattern: patternDigits,
      name: fullName,
    );

    if (register) {
      Currencies().register(currency);
    }

    return currency;
  }
}
