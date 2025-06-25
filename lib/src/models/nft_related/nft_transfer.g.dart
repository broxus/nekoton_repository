// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NftTransfer _$NftTransferFromJson(Map<String, dynamic> json) => _NftTransfer(
      id: json['id'] as String,
      collection: Address.fromJson(json['collection'] as String),
      oldOwner: Address.fromJson(json['oldOwner'] as String),
      newOwner: Address.fromJson(json['newOwner'] as String),
    );

Map<String, dynamic> _$NftTransferToJson(_NftTransfer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collection': instance.collection.toJson(),
      'oldOwner': instance.oldOwner.toJson(),
      'newOwner': instance.newOwner.toJson(),
    };
