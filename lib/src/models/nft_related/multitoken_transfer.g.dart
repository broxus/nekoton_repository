// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multitoken_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MultitokenTransfer _$MultitokenTransferFromJson(Map<String, dynamic> json) =>
    _MultitokenTransfer(
      tokenId: json['tokenId'] as String,
      collection: Address.fromJson(json['collection'] as String),
      sender: Address.fromJson(json['sender'] as String),
      count: BigInt.parse(json['count'] as String),
    );

Map<String, dynamic> _$MultitokenTransferToJson(_MultitokenTransfer instance) =>
    <String, dynamic>{
      'tokenId': instance.tokenId,
      'collection': instance.collection.toJson(),
      'sender': instance.sender.toJson(),
      'count': instance.count.toString(),
    };
