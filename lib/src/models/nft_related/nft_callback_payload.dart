import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft_callback_payload.freezed.dart';
part 'nft_callback_payload.g.dart';

@freezed
abstract class NftCallbackPayload with _$NftCallbackPayload {
  const factory NftCallbackPayload({
    @amountJsonConverter required BigInt value,
    required String payload,
  }) = _NftCallbackPayload;

  factory NftCallbackPayload.fromJson(Map<String, dynamic> json) =>
      _$NftCallbackPayloadFromJson(json);
}
