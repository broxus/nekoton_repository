// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NftInfoImpl _$$NftInfoImplFromJson(Map<String, dynamic> json) =>
    _$NftInfoImpl(
      id: json['id'] as String,
      owner: Address.fromJson(json['owner'] as String),
      manager: Address.fromJson(json['manager'] as String),
      collection: Address.fromJson(json['collection'] as String),
    );

Map<String, dynamic> _$$NftInfoImplToJson(_$NftInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner.toJson(),
      'manager': instance.manager.toJson(),
      'collection': instance.collection.toJson(),
    };
