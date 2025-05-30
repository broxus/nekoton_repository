import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'multitoken_wallet_info.freezed.dart';
part 'multitoken_wallet_info.g.dart';

@freezed
class MultitokenWalletInfo with _$MultitokenWalletInfo {
  const factory MultitokenWalletInfo({
    required String id,
    required Address owner,
    required Address collection,
  }) = _MultitokenWalletInfo;

  factory MultitokenWalletInfo.fromJson(Map<String, dynamic> json) =>
      _$MultitokenWalletInfoFromJson(json);
}
