// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_callback_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NftCallbackPayloadImpl _$$NftCallbackPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$NftCallbackPayloadImpl(
      value: amountJsonConverter.fromJson(json['value'] as String),
      payload: json['payload'] as String,
    );

Map<String, dynamic> _$$NftCallbackPayloadImplToJson(
        _$NftCallbackPayloadImpl instance) =>
    <String, dynamic>{
      'value': amountJsonConverter.toJson(instance.value),
      'payload': instance.payload,
    };
