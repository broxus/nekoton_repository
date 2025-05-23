// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_json_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NftJsonData _$NftJsonDataFromJson(Map<String, dynamic> json) {
  return _NftJsonData.fromJson(json);
}

/// @nodoc
mixin _$NftJsonData {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  FileMetadata? get preview => throw _privateConstructorUsedError;
  List<FileMetadata>? get files => throw _privateConstructorUsedError;
  @JsonKey(name: 'external_url')
  String? get externalUrl => throw _privateConstructorUsedError;

  /// Serializes this NftJsonData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NftJsonData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftJsonDataCopyWith<NftJsonData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftJsonDataCopyWith<$Res> {
  factory $NftJsonDataCopyWith(
          NftJsonData value, $Res Function(NftJsonData) then) =
      _$NftJsonDataCopyWithImpl<$Res, NftJsonData>;
  @useResult
  $Res call(
      {String? name,
      String? description,
      FileMetadata? preview,
      List<FileMetadata>? files,
      @JsonKey(name: 'external_url') String? externalUrl});

  $FileMetadataCopyWith<$Res>? get preview;
}

/// @nodoc
class _$NftJsonDataCopyWithImpl<$Res, $Val extends NftJsonData>
    implements $NftJsonDataCopyWith<$Res> {
  _$NftJsonDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NftJsonData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? preview = freezed,
    Object? files = freezed,
    Object? externalUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      preview: freezed == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as FileMetadata?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileMetadata>?,
      externalUrl: freezed == externalUrl
          ? _value.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of NftJsonData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileMetadataCopyWith<$Res>? get preview {
    if (_value.preview == null) {
      return null;
    }

    return $FileMetadataCopyWith<$Res>(_value.preview!, (value) {
      return _then(_value.copyWith(preview: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NftJsonDataImplCopyWith<$Res>
    implements $NftJsonDataCopyWith<$Res> {
  factory _$$NftJsonDataImplCopyWith(
          _$NftJsonDataImpl value, $Res Function(_$NftJsonDataImpl) then) =
      __$$NftJsonDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? description,
      FileMetadata? preview,
      List<FileMetadata>? files,
      @JsonKey(name: 'external_url') String? externalUrl});

  @override
  $FileMetadataCopyWith<$Res>? get preview;
}

/// @nodoc
class __$$NftJsonDataImplCopyWithImpl<$Res>
    extends _$NftJsonDataCopyWithImpl<$Res, _$NftJsonDataImpl>
    implements _$$NftJsonDataImplCopyWith<$Res> {
  __$$NftJsonDataImplCopyWithImpl(
      _$NftJsonDataImpl _value, $Res Function(_$NftJsonDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of NftJsonData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? preview = freezed,
    Object? files = freezed,
    Object? externalUrl = freezed,
  }) {
    return _then(_$NftJsonDataImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      preview: freezed == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as FileMetadata?,
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileMetadata>?,
      externalUrl: freezed == externalUrl
          ? _value.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NftJsonDataImpl extends _NftJsonData {
  const _$NftJsonDataImpl(
      {this.name,
      this.description,
      this.preview,
      final List<FileMetadata>? files,
      @JsonKey(name: 'external_url') this.externalUrl})
      : _files = files,
        super._();

  factory _$NftJsonDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NftJsonDataImplFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  final FileMetadata? preview;
  final List<FileMetadata>? _files;
  @override
  List<FileMetadata>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'external_url')
  final String? externalUrl;

  @override
  String toString() {
    return 'NftJsonData(name: $name, description: $description, preview: $preview, files: $files, externalUrl: $externalUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftJsonDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.externalUrl, externalUrl) ||
                other.externalUrl == externalUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, preview,
      const DeepCollectionEquality().hash(_files), externalUrl);

  /// Create a copy of NftJsonData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftJsonDataImplCopyWith<_$NftJsonDataImpl> get copyWith =>
      __$$NftJsonDataImplCopyWithImpl<_$NftJsonDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NftJsonDataImplToJson(
      this,
    );
  }
}

abstract class _NftJsonData extends NftJsonData {
  const factory _NftJsonData(
          {final String? name,
          final String? description,
          final FileMetadata? preview,
          final List<FileMetadata>? files,
          @JsonKey(name: 'external_url') final String? externalUrl}) =
      _$NftJsonDataImpl;
  const _NftJsonData._() : super._();

  factory _NftJsonData.fromJson(Map<String, dynamic> json) =
      _$NftJsonDataImpl.fromJson;

  @override
  String? get name;
  @override
  String? get description;
  @override
  FileMetadata? get preview;
  @override
  List<FileMetadata>? get files;
  @override
  @JsonKey(name: 'external_url')
  String? get externalUrl;

  /// Create a copy of NftJsonData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftJsonDataImplCopyWith<_$NftJsonDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
