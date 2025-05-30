// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NftCollectionImpl _$$NftCollectionImplFromJson(Map<String, dynamic> json) =>
    _$NftCollectionImpl(
      address: Address.fromJson(json['address'] as String),
      json: NftJsonData.fromJson(json['json'] as Map<String, dynamic>),
      interfaces: (json['interfaces'] as List<dynamic>)
          .map((e) => $enumDecode(_$ContractInterfaceEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$NftCollectionImplToJson(_$NftCollectionImpl instance) =>
    <String, dynamic>{
      'address': instance.address.toJson(),
      'json': instance.json.toJson(),
      'interfaces': instance.interfaces
          .map((e) => _$ContractInterfaceEnumMap[e]!)
          .toList(),
    };

const _$ContractInterfaceEnumMap = {
  ContractInterface.tip41Collection: 'tip41Collection',
  ContractInterface.tip41Nft: 'tip41Nft',
  ContractInterface.tip422Collection: 'tip422Collection',
  ContractInterface.tip422Nft: 'tip422Nft',
  ContractInterface.vep1155Collection: 'vep1155Collection',
  ContractInterface.vep1155Nft: 'vep1155Nft',
};
