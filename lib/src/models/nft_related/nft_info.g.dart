// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NftInfo _$NftInfoFromJson(Map<String, dynamic> json) => _NftInfo(
  id: json['id'] as String,
  owner: Address.fromJson(json['owner'] as String),
  manager: Address.fromJson(json['manager'] as String),
  collection: Address.fromJson(json['collection'] as String),
);

Map<String, dynamic> _$NftInfoToJson(_NftInfo instance) => <String, dynamic>{
  'id': instance.id,
  'owner': instance.owner.toJson(),
  'manager': instance.manager.toJson(),
  'collection': instance.collection.toJson(),
};
