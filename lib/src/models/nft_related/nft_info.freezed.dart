// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NftInfo _$NftInfoFromJson(Map<String, dynamic> json) {
  return _NftInfo.fromJson(json);
}

/// @nodoc
mixin _$NftInfo {
  String get id => throw _privateConstructorUsedError;
  Address get owner => throw _privateConstructorUsedError;
  Address get manager => throw _privateConstructorUsedError;
  Address get collection => throw _privateConstructorUsedError;

  /// Serializes this NftInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftInfoCopyWith<NftInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftInfoCopyWith<$Res> {
  factory $NftInfoCopyWith(NftInfo value, $Res Function(NftInfo) then) =
      _$NftInfoCopyWithImpl<$Res, NftInfo>;
  @useResult
  $Res call({String id, Address owner, Address manager, Address collection});

  $AddressCopyWith<$Res> get owner;
  $AddressCopyWith<$Res> get manager;
  $AddressCopyWith<$Res> get collection;
}

/// @nodoc
class _$NftInfoCopyWithImpl<$Res, $Val extends NftInfo>
    implements $NftInfoCopyWith<$Res> {
  _$NftInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owner = null,
    Object? manager = null,
    Object? collection = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Address,
      manager: null == manager
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as Address,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
    ) as $Val);
  }

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get owner {
    return $AddressCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get manager {
    return $AddressCopyWith<$Res>(_value.manager, (value) {
      return _then(_value.copyWith(manager: value) as $Val);
    });
  }

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_value.collection, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NftInfoImplCopyWith<$Res> implements $NftInfoCopyWith<$Res> {
  factory _$$NftInfoImplCopyWith(
          _$NftInfoImpl value, $Res Function(_$NftInfoImpl) then) =
      __$$NftInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Address owner, Address manager, Address collection});

  @override
  $AddressCopyWith<$Res> get owner;
  @override
  $AddressCopyWith<$Res> get manager;
  @override
  $AddressCopyWith<$Res> get collection;
}

/// @nodoc
class __$$NftInfoImplCopyWithImpl<$Res>
    extends _$NftInfoCopyWithImpl<$Res, _$NftInfoImpl>
    implements _$$NftInfoImplCopyWith<$Res> {
  __$$NftInfoImplCopyWithImpl(
      _$NftInfoImpl _value, $Res Function(_$NftInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owner = null,
    Object? manager = null,
    Object? collection = null,
  }) {
    return _then(_$NftInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Address,
      manager: null == manager
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as Address,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NftInfoImpl implements _NftInfo {
  const _$NftInfoImpl(
      {required this.id,
      required this.owner,
      required this.manager,
      required this.collection});

  factory _$NftInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NftInfoImplFromJson(json);

  @override
  final String id;
  @override
  final Address owner;
  @override
  final Address manager;
  @override
  final Address collection;

  @override
  String toString() {
    return 'NftInfo(id: $id, owner: $owner, manager: $manager, collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.manager, manager) || other.manager == manager) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, owner, manager, collection);

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftInfoImplCopyWith<_$NftInfoImpl> get copyWith =>
      __$$NftInfoImplCopyWithImpl<_$NftInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NftInfoImplToJson(
      this,
    );
  }
}

abstract class _NftInfo implements NftInfo {
  const factory _NftInfo(
      {required final String id,
      required final Address owner,
      required final Address manager,
      required final Address collection}) = _$NftInfoImpl;

  factory _NftInfo.fromJson(Map<String, dynamic> json) = _$NftInfoImpl.fromJson;

  @override
  String get id;
  @override
  Address get owner;
  @override
  Address get manager;
  @override
  Address get collection;

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftInfoImplCopyWith<_$NftInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
