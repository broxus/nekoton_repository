import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_metadata.freezed.dart';
part 'file_metadata.g.dart';

@freezed
class FileMetadata with _$FileMetadata {
  const factory FileMetadata({
    String? source,
    String? mimetype,
  }) = _FileMetadata;

  factory FileMetadata.fromJson(Map<String, dynamic> json) =>
      _$FileMetadataFromJson(json);
}
