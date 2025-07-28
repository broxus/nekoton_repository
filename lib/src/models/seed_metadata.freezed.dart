// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeedMetadata {
  String? get name;
  int? get addedAt;
  SeedAddType? get addType;

  /// Create a copy of SeedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SeedMetadataCopyWith<SeedMetadata> get copyWith =>
      _$SeedMetadataCopyWithImpl<SeedMetadata>(
          this as SeedMetadata, _$identity);

  /// Serializes this SeedMetadata to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeedMetadata &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.addType, addType) || other.addType == addType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, addedAt, addType);

  @override
  String toString() {
    return 'SeedMetadata(name: $name, addedAt: $addedAt, addType: $addType)';
  }
}

/// @nodoc
abstract mixin class $SeedMetadataCopyWith<$Res> {
  factory $SeedMetadataCopyWith(
          SeedMetadata value, $Res Function(SeedMetadata) _then) =
      _$SeedMetadataCopyWithImpl;
  @useResult
  $Res call({String? name, int? addedAt, SeedAddType? addType});
}

/// @nodoc
class _$SeedMetadataCopyWithImpl<$Res> implements $SeedMetadataCopyWith<$Res> {
  _$SeedMetadataCopyWithImpl(this._self, this._then);

  final SeedMetadata _self;
  final $Res Function(SeedMetadata) _then;

  /// Create a copy of SeedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? addedAt = freezed,
    Object? addType = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      addedAt: freezed == addedAt
          ? _self.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      addType: freezed == addType
          ? _self.addType
          : addType // ignore: cast_nullable_to_non_nullable
              as SeedAddType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SeedMetadata implements SeedMetadata {
  const _SeedMetadata({this.name, this.addedAt, this.addType});
  factory _SeedMetadata.fromJson(Map<String, dynamic> json) =>
      _$SeedMetadataFromJson(json);

  @override
  final String? name;
  @override
  final int? addedAt;
  @override
  final SeedAddType? addType;

  /// Create a copy of SeedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SeedMetadataCopyWith<_SeedMetadata> get copyWith =>
      __$SeedMetadataCopyWithImpl<_SeedMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SeedMetadataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SeedMetadata &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.addType, addType) || other.addType == addType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, addedAt, addType);

  @override
  String toString() {
    return 'SeedMetadata(name: $name, addedAt: $addedAt, addType: $addType)';
  }
}

/// @nodoc
abstract mixin class _$SeedMetadataCopyWith<$Res>
    implements $SeedMetadataCopyWith<$Res> {
  factory _$SeedMetadataCopyWith(
          _SeedMetadata value, $Res Function(_SeedMetadata) _then) =
      __$SeedMetadataCopyWithImpl;
  @override
  @useResult
  $Res call({String? name, int? addedAt, SeedAddType? addType});
}

/// @nodoc
class __$SeedMetadataCopyWithImpl<$Res>
    implements _$SeedMetadataCopyWith<$Res> {
  __$SeedMetadataCopyWithImpl(this._self, this._then);

  final _SeedMetadata _self;
  final $Res Function(_SeedMetadata) _then;

  /// Create a copy of SeedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? addedAt = freezed,
    Object? addType = freezed,
  }) {
    return _then(_SeedMetadata(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      addedAt: freezed == addedAt
          ? _self.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      addType: freezed == addType
          ? _self.addType
          : addType // ignore: cast_nullable_to_non_nullable
              as SeedAddType?,
    ));
  }
}

// dart format on
