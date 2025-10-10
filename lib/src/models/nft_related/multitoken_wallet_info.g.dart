// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multitoken_wallet_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MultitokenWalletInfo _$MultitokenWalletInfoFromJson(
  Map<String, dynamic> json,
) => _MultitokenWalletInfo(
  id: json['id'] as String,
  owner: Address.fromJson(json['owner'] as String),
  collection: Address.fromJson(json['collection'] as String),
);

Map<String, dynamic> _$MultitokenWalletInfoToJson(
  _MultitokenWalletInfo instance,
) => <String, dynamic>{
  'id': instance.id,
  'owner': instance.owner.toJson(),
  'collection': instance.collection.toJson(),
};
