// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_token_transfer_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NftTokenTransferPayload _$NftTokenTransferPayloadFromJson(
  Map<String, dynamic> json,
) => _NftTokenTransferPayload(
  id: json['id'] as String,
  collection: Address.fromJson(json['collection'] as String),
);

Map<String, dynamic> _$NftTokenTransferPayloadToJson(
  _NftTokenTransferPayload instance,
) => <String, dynamic>{
  'id': instance.id,
  'collection': instance.collection.toJson(),
};
