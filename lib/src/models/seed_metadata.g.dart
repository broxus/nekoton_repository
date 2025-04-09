// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeedMetadata _$SeedMetadataFromJson(Map<String, dynamic> json) =>
    _SeedMetadata(
      name: json['name'] as String?,
      addedAt: (json['addedAt'] as num?)?.toInt(),
      addType: $enumDecodeNullable(_$SeedAddTypeEnumMap, json['addType']),
    );

Map<String, dynamic> _$SeedMetadataToJson(_SeedMetadata instance) =>
    <String, dynamic>{
      'name': instance.name,
      'addedAt': instance.addedAt,
      'addType': _$SeedAddTypeEnumMap[instance.addType],
    };

const _$SeedAddTypeEnumMap = {
  SeedAddType.import: 'import',
  SeedAddType.create: 'create',
};
