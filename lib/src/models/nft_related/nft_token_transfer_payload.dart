import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft_token_transfer_payload.freezed.dart';
part 'nft_token_transfer_payload.g.dart';

@freezed
abstract class NftTokenTransferPayload with _$NftTokenTransferPayload {
  const factory NftTokenTransferPayload({
    required String id,
    required Address collection,
  }) = _NftTokenTransferPayload;

  factory NftTokenTransferPayload.fromJson(Map<String, dynamic> json) =>
      _$NftTokenTransferPayloadFromJson(json);
}
