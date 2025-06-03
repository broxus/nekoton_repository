import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_metadata.freezed.dart';
part 'file_metadata.g.dart';

@freezed
class FileMetadata with _$FileMetadata {
  const factory FileMetadata({
    String? source,
    @JsonKey(readValue: _readValue) String? mimetype,
  }) = _FileMetadata;

  factory FileMetadata.fromJson(Map<String, dynamic> json) =>
      _$FileMetadataFromJson(json);
}

// Invalid json format workaround to handle both 'mime_type' and 'mimetype' keys
String? _readValue(Map<dynamic, dynamic> json, String key) =>
    (json['mime_type'] as String?) ?? (json[key] as String?);
