extension NumExtension on num {
  BigInt toNativeToken([int decimals = 9]) {
    final factor = BigInt.from(10).pow(decimals);
    return BigInt.from(this * factor.toDouble());
  }
}
