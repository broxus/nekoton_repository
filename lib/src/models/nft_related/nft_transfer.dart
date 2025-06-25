import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft_transfer.freezed.dart';
part 'nft_transfer.g.dart';

@freezed
abstract class NftTransfer with _$NftTransfer {
  const factory NftTransfer({
    required String id,
    required Address collection,
    required Address oldOwner,
    required Address newOwner,
  }) = _NftTransfer;

  factory NftTransfer.fromJson(Map<String, dynamic> json) =>
      _$NftTransferFromJson(json);
}
