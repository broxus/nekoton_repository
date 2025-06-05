import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft_json_data.freezed.dart';
part 'nft_json_data.g.dart';

@freezed
class NftJsonData with _$NftJsonData {
  const factory NftJsonData({
    String? name,
    String? description,
    FileMetadata? preview,
    List<FileMetadata>? files,
    @JsonKey(name: 'external_url') String? externalUrl,
  }) = _NftJsonData;

  factory NftJsonData.empty() => const NftJsonData();

  const NftJsonData._();

  factory NftJsonData.fromJson(Map<String, dynamic> json) =>
      _$NftJsonDataFromJson(json);

  String? get previewUrl =>
      (_isImage(preview?.mimetype) ? preview?.source : null) ?? imageUrl;

  String? get imageUrl =>
      files?.firstWhereOrNull((file) => _isImage(file.mimetype))?.source;
}

bool _isImage(String? mimetype) =>
    mimetype != null && mimetype.toLowerCase().startsWith('image/');
