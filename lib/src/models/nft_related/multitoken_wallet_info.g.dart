// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multitoken_wallet_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MultitokenWalletInfoImpl _$$MultitokenWalletInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$MultitokenWalletInfoImpl(
      id: json['id'] as String,
      owner: Address.fromJson(json['owner'] as String),
      collection: Address.fromJson(json['collection'] as String),
    );

Map<String, dynamic> _$$MultitokenWalletInfoImplToJson(
        _$MultitokenWalletInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner.toJson(),
      'collection': instance.collection.toJson(),
    };
