// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_transfer_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NftTransferInputImpl _$$NftTransferInputImplFromJson(
        Map<String, dynamic> json) =>
    _$NftTransferInputImpl(
      to: Address.fromJson(json['to'] as String),
      sendGasTo: Address.fromJson(json['sendGasTo'] as String),
      callbacks: (json['callbacks'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, NftCallbackPayload.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$NftTransferInputImplToJson(
        _$NftTransferInputImpl instance) =>
    <String, dynamic>{
      'to': instance.to.toJson(),
      'sendGasTo': instance.sendGasTo.toJson(),
      'callbacks': instance.callbacks.map((k, e) => MapEntry(k, e.toJson())),
    };
