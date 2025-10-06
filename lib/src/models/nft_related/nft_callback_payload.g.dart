// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_callback_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NftCallbackPayload _$NftCallbackPayloadFromJson(Map<String, dynamic> json) =>
    _NftCallbackPayload(
      value: BigInt.parse(json['value'] as String),
      payload: json['payload'] as String,
    );

Map<String, dynamic> _$NftCallbackPayloadToJson(_NftCallbackPayload instance) =>
    <String, dynamic>{
      'value': instance.value.toString(),
      'payload': instance.payload,
    };
