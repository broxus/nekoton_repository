// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SeedMetadata _$SeedMetadataFromJson(Map<String, dynamic> json) {
  return _SeedMetadata.fromJson(json);
}

/// @nodoc
mixin _$SeedMetadata {
  String? get name => throw _privateConstructorUsedError;
  int? get addedAt => throw _privateConstructorUsedError;
  SeedAddType? get addType => throw _privateConstructorUsedError;

  /// Serializes this SeedMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeedMetadataCopyWith<SeedMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeedMetadataCopyWith<$Res> {
  factory $SeedMetadataCopyWith(
          SeedMetadata value, $Res Function(SeedMetadata) then) =
      _$SeedMetadataCopyWithImpl<$Res, SeedMetadata>;
  @useResult
  $Res call({String? name, int? addedAt, SeedAddType? addType});
}

/// @nodoc
class _$SeedMetadataCopyWithImpl<$Res, $Val extends SeedMetadata>
    implements $SeedMetadataCopyWith<$Res> {
  _$SeedMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? addedAt = freezed,
    Object? addType = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      addType: freezed == addType
          ? _value.addType
          : addType // ignore: cast_nullable_to_non_nullable
              as SeedAddType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeedMetadataImplCopyWith<$Res>
    implements $SeedMetadataCopyWith<$Res> {
  factory _$$SeedMetadataImplCopyWith(
          _$SeedMetadataImpl value, $Res Function(_$SeedMetadataImpl) then) =
      __$$SeedMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, int? addedAt, SeedAddType? addType});
}

/// @nodoc
class __$$SeedMetadataImplCopyWithImpl<$Res>
    extends _$SeedMetadataCopyWithImpl<$Res, _$SeedMetadataImpl>
    implements _$$SeedMetadataImplCopyWith<$Res> {
  __$$SeedMetadataImplCopyWithImpl(
      _$SeedMetadataImpl _value, $Res Function(_$SeedMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? addedAt = freezed,
    Object? addType = freezed,
  }) {
    return _then(_$SeedMetadataImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      addType: freezed == addType
          ? _value.addType
          : addType // ignore: cast_nullable_to_non_nullable
              as SeedAddType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeedMetadataImpl implements _SeedMetadata {
  const _$SeedMetadataImpl({this.name, this.addedAt, this.addType});

  factory _$SeedMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeedMetadataImplFromJson(json);

  @override
  final String? name;
  @override
  final int? addedAt;
  @override
  final SeedAddType? addType;

  @override
  String toString() {
    return 'SeedMetadata(name: $name, addedAt: $addedAt, addType: $addType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeedMetadataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.addType, addType) || other.addType == addType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, addedAt, addType);

  /// Create a copy of SeedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeedMetadataImplCopyWith<_$SeedMetadataImpl> get copyWith =>
      __$$SeedMetadataImplCopyWithImpl<_$SeedMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeedMetadataImplToJson(
      this,
    );
  }
}

abstract class _SeedMetadata implements SeedMetadata {
  const factory _SeedMetadata(
      {final String? name,
      final int? addedAt,
      final SeedAddType? addType}) = _$SeedMetadataImpl;

  factory _SeedMetadata.fromJson(Map<String, dynamic> json) =
      _$SeedMetadataImpl.fromJson;

  @override
  String? get name;
  @override
  int? get addedAt;
  @override
  SeedAddType? get addType;

  /// Create a copy of SeedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeedMetadataImplCopyWith<_$SeedMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
