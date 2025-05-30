import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft_info.freezed.dart';
part 'nft_info.g.dart';

@freezed
class NftInfo with _$NftInfo {
  const factory NftInfo({
    required String id,
    required Address owner,
    required Address manager,
    required Address collection,
  }) = _NftInfo;

  factory NftInfo.fromJson(Map<String, dynamic> json) =>
      _$NftInfoFromJson(json);
}
