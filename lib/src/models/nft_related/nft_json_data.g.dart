// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_json_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NftJsonDataImpl _$$NftJsonDataImplFromJson(Map<String, dynamic> json) =>
    _$NftJsonDataImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      preview: json['preview'] == null
          ? null
          : FileMetadata.fromJson(json['preview'] as Map<String, dynamic>),
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      externalUrl: json['external_url'] as String?,
    );

Map<String, dynamic> _$$NftJsonDataImplToJson(_$NftJsonDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'preview': instance.preview?.toJson(),
      'files': instance.files?.map((e) => e.toJson()).toList(),
      'external_url': instance.externalUrl,
    };
