import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'multitoken_wallet.freezed.dart';

@freezed
abstract class MultitokenWallet with _$MultitokenWallet {
  const factory MultitokenWallet({
    required Address address,
    required BigInt balance,
    required MultitokenWalletInfo info,
  }) = _MultitokenWallet;
}
