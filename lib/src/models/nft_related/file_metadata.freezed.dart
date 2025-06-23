// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileMetadata {
  String? get source;
  @JsonKey(readValue: _readValue)
  String? get mimetype;

  /// Create a copy of FileMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FileMetadataCopyWith<FileMetadata> get copyWith =>
      _$FileMetadataCopyWithImpl<FileMetadata>(
          this as FileMetadata, _$identity);

  /// Serializes this FileMetadata to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FileMetadata &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.mimetype, mimetype) ||
                other.mimetype == mimetype));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source, mimetype);

  @override
  String toString() {
    return 'FileMetadata(source: $source, mimetype: $mimetype)';
  }
}

/// @nodoc
abstract mixin class $FileMetadataCopyWith<$Res> {
  factory $FileMetadataCopyWith(
          FileMetadata value, $Res Function(FileMetadata) _then) =
      _$FileMetadataCopyWithImpl;
  @useResult
  $Res call({String? source, @JsonKey(readValue: _readValue) String? mimetype});
}

/// @nodoc
class _$FileMetadataCopyWithImpl<$Res> implements $FileMetadataCopyWith<$Res> {
  _$FileMetadataCopyWithImpl(this._self, this._then);

  final FileMetadata _self;
  final $Res Function(FileMetadata) _then;

  /// Create a copy of FileMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
    Object? mimetype = freezed,
  }) {
    return _then(_self.copyWith(
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      mimetype: freezed == mimetype
          ? _self.mimetype
          : mimetype // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FileMetadata implements FileMetadata {
  const _FileMetadata(
      {this.source, @JsonKey(readValue: _readValue) this.mimetype});
  factory _FileMetadata.fromJson(Map<String, dynamic> json) =>
      _$FileMetadataFromJson(json);

  @override
  final String? source;
  @override
  @JsonKey(readValue: _readValue)
  final String? mimetype;

  /// Create a copy of FileMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FileMetadataCopyWith<_FileMetadata> get copyWith =>
      __$FileMetadataCopyWithImpl<_FileMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FileMetadataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FileMetadata &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.mimetype, mimetype) ||
                other.mimetype == mimetype));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source, mimetype);

  @override
  String toString() {
    return 'FileMetadata(source: $source, mimetype: $mimetype)';
  }
}

/// @nodoc
abstract mixin class _$FileMetadataCopyWith<$Res>
    implements $FileMetadataCopyWith<$Res> {
  factory _$FileMetadataCopyWith(
          _FileMetadata value, $Res Function(_FileMetadata) _then) =
      __$FileMetadataCopyWithImpl;
  @override
  @useResult
  $Res call({String? source, @JsonKey(readValue: _readValue) String? mimetype});
}

/// @nodoc
class __$FileMetadataCopyWithImpl<$Res>
    implements _$FileMetadataCopyWith<$Res> {
  __$FileMetadataCopyWithImpl(this._self, this._then);

  final _FileMetadata _self;
  final $Res Function(_FileMetadata) _then;

  /// Create a copy of FileMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? source = freezed,
    Object? mimetype = freezed,
  }) {
    return _then(_FileMetadata(
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      mimetype: freezed == mimetype
          ? _self.mimetype
          : mimetype // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
