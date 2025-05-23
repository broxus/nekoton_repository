// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multitoken_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MultitokenTransferImpl _$$MultitokenTransferImplFromJson(
        Map<String, dynamic> json) =>
    _$MultitokenTransferImpl(
      tokenId: json['tokenId'] as String,
      collection: Address.fromJson(json['collection'] as String),
      sender: Address.fromJson(json['sender'] as String),
      count: amountJsonConverter.fromJson(json['count'] as String),
    );

Map<String, dynamic> _$$MultitokenTransferImplToJson(
        _$MultitokenTransferImpl instance) =>
    <String, dynamic>{
      'tokenId': instance.tokenId,
      'collection': instance.collection.toJson(),
      'sender': instance.sender.toJson(),
      'count': amountJsonConverter.toJson(instance.count),
    };
