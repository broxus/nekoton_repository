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
