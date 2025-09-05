// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_token_transfer_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NftTokenTransferInput _$NftTokenTransferInputFromJson(
        Map<String, dynamic> json) =>
    _NftTokenTransferInput(
      count: BigInt.parse(json['count'] as String),
      deployTokenWalletValue:
          BigInt.parse(json['deployTokenWalletValue'] as String),
      recipient: Address.fromJson(json['recipient'] as String),
      remainingGasTo: Address.fromJson(json['remainingGasTo'] as String),
      payload: json['payload'] as String,
      notify: json['notify'] as bool,
    );

Map<String, dynamic> _$NftTokenTransferInputToJson(
        _NftTokenTransferInput instance) =>
    <String, dynamic>{
      'count': instance.count.toString(),
      'deployTokenWalletValue': instance.deployTokenWalletValue.toString(),
      'recipient': instance.recipient.toJson(),
      'remainingGasTo': instance.remainingGasTo.toJson(),
      'payload': instance.payload,
      'notify': instance.notify,
    };
