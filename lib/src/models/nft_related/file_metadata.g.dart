// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileMetadata _$FileMetadataFromJson(Map<String, dynamic> json) =>
    _FileMetadata(
      source: json['source'] as String?,
      mimetype: _readValue(json, 'mimetype') as String?,
    );

Map<String, dynamic> _$FileMetadataToJson(_FileMetadata instance) =>
    <String, dynamic>{
      'source': instance.source,
      'mimetype': instance.mimetype,
    };
