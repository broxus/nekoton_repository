// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Nft {
  Address get address => throw _privateConstructorUsedError;
  NftInfo get info => throw _privateConstructorUsedError;
  NftJsonData get json => throw _privateConstructorUsedError;
  BigInt? get supply => throw _privateConstructorUsedError;

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftCopyWith<Nft> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftCopyWith<$Res> {
  factory $NftCopyWith(Nft value, $Res Function(Nft) then) =
      _$NftCopyWithImpl<$Res, Nft>;
  @useResult
  $Res call({Address address, NftInfo info, NftJsonData json, BigInt? supply});

  $AddressCopyWith<$Res> get address;
  $NftInfoCopyWith<$Res> get info;
  $NftJsonDataCopyWith<$Res> get json;
}

/// @nodoc
class _$NftCopyWithImpl<$Res, $Val extends Nft> implements $NftCopyWith<$Res> {
  _$NftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? info = null,
    Object? json = null,
    Object? supply = freezed,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as NftInfo,
      json: null == json
          ? _value.json
          : json // ignore: cast_nullable_to_non_nullable
              as NftJsonData,
      supply: freezed == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as BigInt?,
    ) as $Val);
  }

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NftInfoCopyWith<$Res> get info {
    return $NftInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NftJsonDataCopyWith<$Res> get json {
    return $NftJsonDataCopyWith<$Res>(_value.json, (value) {
      return _then(_value.copyWith(json: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NftImplCopyWith<$Res> implements $NftCopyWith<$Res> {
  factory _$$NftImplCopyWith(_$NftImpl value, $Res Function(_$NftImpl) then) =
      __$$NftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Address address, NftInfo info, NftJsonData json, BigInt? supply});

  @override
  $AddressCopyWith<$Res> get address;
  @override
  $NftInfoCopyWith<$Res> get info;
  @override
  $NftJsonDataCopyWith<$Res> get json;
}

/// @nodoc
class __$$NftImplCopyWithImpl<$Res> extends _$NftCopyWithImpl<$Res, _$NftImpl>
    implements _$$NftImplCopyWith<$Res> {
  __$$NftImplCopyWithImpl(_$NftImpl _value, $Res Function(_$NftImpl) _then)
      : super(_value, _then);

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? info = null,
    Object? json = null,
    Object? supply = freezed,
  }) {
    return _then(_$NftImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as NftInfo,
      json: null == json
          ? _value.json
          : json // ignore: cast_nullable_to_non_nullable
              as NftJsonData,
      supply: freezed == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as BigInt?,
    ));
  }
}

/// @nodoc

class _$NftImpl extends _Nft {
  const _$NftImpl(
      {required this.address,
      required this.info,
      required this.json,
      this.supply})
      : super._();

  @override
  final Address address;
  @override
  final NftInfo info;
  @override
  final NftJsonData json;
  @override
  final BigInt? supply;

  @override
  String toString() {
    return 'Nft(address: $address, info: $info, json: $json, supply: $supply)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.json, json) || other.json == json) &&
            (identical(other.supply, supply) || other.supply == supply));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, info, json, supply);

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftImplCopyWith<_$NftImpl> get copyWith =>
      __$$NftImplCopyWithImpl<_$NftImpl>(this, _$identity);
}

abstract class _Nft extends Nft {
  const factory _Nft(
      {required final Address address,
      required final NftInfo info,
      required final NftJsonData json,
      final BigInt? supply}) = _$NftImpl;
  const _Nft._() : super._();

  @override
  Address get address;
  @override
  NftInfo get info;
  @override
  NftJsonData get json;
  @override
  BigInt? get supply;

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftImplCopyWith<_$NftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
