// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_token_transfer_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NftTokenTransferPayloadImpl _$$NftTokenTransferPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$NftTokenTransferPayloadImpl(
      id: json['id'] as String,
      collection: Address.fromJson(json['collection'] as String),
    );

Map<String, dynamic> _$$NftTokenTransferPayloadImplToJson(
        _$NftTokenTransferPayloadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collection': instance.collection.toJson(),
    };
