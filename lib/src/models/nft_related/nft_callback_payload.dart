import 'package:freezed_annotation/freezed_annotation.dart';

part 'nft_callback_payload.freezed.dart';
part 'nft_callback_payload.g.dart';

@freezed
abstract class NftCallbackPayload with _$NftCallbackPayload {
  const factory NftCallbackPayload({
    required BigInt value,
    required String payload,
  }) = _NftCallbackPayload;

  factory NftCallbackPayload.fromJson(Map<String, dynamic> json) =>
      _$NftCallbackPayloadFromJson(json);
}
