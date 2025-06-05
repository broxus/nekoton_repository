// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multitoken_wallet_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MultitokenWalletInfo _$MultitokenWalletInfoFromJson(Map<String, dynamic> json) {
  return _MultitokenWalletInfo.fromJson(json);
}

/// @nodoc
mixin _$MultitokenWalletInfo {
  String get id => throw _privateConstructorUsedError;
  Address get owner => throw _privateConstructorUsedError;
  Address get collection => throw _privateConstructorUsedError;

  /// Serializes this MultitokenWalletInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MultitokenWalletInfoCopyWith<MultitokenWalletInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultitokenWalletInfoCopyWith<$Res> {
  factory $MultitokenWalletInfoCopyWith(MultitokenWalletInfo value,
          $Res Function(MultitokenWalletInfo) then) =
      _$MultitokenWalletInfoCopyWithImpl<$Res, MultitokenWalletInfo>;
  @useResult
  $Res call({String id, Address owner, Address collection});

  $AddressCopyWith<$Res> get owner;
  $AddressCopyWith<$Res> get collection;
}

/// @nodoc
class _$MultitokenWalletInfoCopyWithImpl<$Res,
        $Val extends MultitokenWalletInfo>
    implements $MultitokenWalletInfoCopyWith<$Res> {
  _$MultitokenWalletInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owner = null,
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
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
    ) as $Val);
  }

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get owner {
    return $AddressCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }

  /// Create a copy of MultitokenWalletInfo
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
abstract class _$$MultitokenWalletInfoImplCopyWith<$Res>
    implements $MultitokenWalletInfoCopyWith<$Res> {
  factory _$$MultitokenWalletInfoImplCopyWith(_$MultitokenWalletInfoImpl value,
          $Res Function(_$MultitokenWalletInfoImpl) then) =
      __$$MultitokenWalletInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Address owner, Address collection});

  @override
  $AddressCopyWith<$Res> get owner;
  @override
  $AddressCopyWith<$Res> get collection;
}

/// @nodoc
class __$$MultitokenWalletInfoImplCopyWithImpl<$Res>
    extends _$MultitokenWalletInfoCopyWithImpl<$Res, _$MultitokenWalletInfoImpl>
    implements _$$MultitokenWalletInfoImplCopyWith<$Res> {
  __$$MultitokenWalletInfoImplCopyWithImpl(_$MultitokenWalletInfoImpl _value,
      $Res Function(_$MultitokenWalletInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owner = null,
    Object? collection = null,
  }) {
    return _then(_$MultitokenWalletInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
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
class _$MultitokenWalletInfoImpl implements _MultitokenWalletInfo {
  const _$MultitokenWalletInfoImpl(
      {required this.id, required this.owner, required this.collection});

  factory _$MultitokenWalletInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MultitokenWalletInfoImplFromJson(json);

  @override
  final String id;
  @override
  final Address owner;
  @override
  final Address collection;

  @override
  String toString() {
    return 'MultitokenWalletInfo(id: $id, owner: $owner, collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultitokenWalletInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, owner, collection);

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MultitokenWalletInfoImplCopyWith<_$MultitokenWalletInfoImpl>
      get copyWith =>
          __$$MultitokenWalletInfoImplCopyWithImpl<_$MultitokenWalletInfoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MultitokenWalletInfoImplToJson(
      this,
    );
  }
}

abstract class _MultitokenWalletInfo implements MultitokenWalletInfo {
  const factory _MultitokenWalletInfo(
      {required final String id,
      required final Address owner,
      required final Address collection}) = _$MultitokenWalletInfoImpl;

  factory _MultitokenWalletInfo.fromJson(Map<String, dynamic> json) =
      _$MultitokenWalletInfoImpl.fromJson;

  @override
  String get id;
  @override
  Address get owner;
  @override
  Address get collection;

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MultitokenWalletInfoImplCopyWith<_$MultitokenWalletInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
