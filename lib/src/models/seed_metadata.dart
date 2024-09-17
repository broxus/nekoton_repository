import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/src/models/models.dart';

part 'seed_metadata.freezed.dart';
part 'seed_metadata.g.dart';

/// Object to store seed metadata (name, created at, etc.)
@freezed
class SeedMetadata with _$SeedMetadata {
  const factory SeedMetadata({
    String? name,
    int? addedAt,
    SeedAddType? addType,
  }) = _SeedMetadata;

  factory SeedMetadata.fromJson(Map<String, dynamic> json) =>
      _$SeedMetadataFromJson(json);
}
