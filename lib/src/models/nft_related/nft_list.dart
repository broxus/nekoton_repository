import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft_list.freezed.dart';

@freezed
abstract class NftList with _$NftList {
  const factory NftList({
    required List<NftItem> items,
    String? continuation,
  }) = _NftList;
}
