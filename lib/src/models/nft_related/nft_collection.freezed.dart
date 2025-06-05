// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NftCollection _$NftCollectionFromJson(Map<String, dynamic> json) {
  return _NftCollection.fromJson(json);
}

/// @nodoc
mixin _$NftCollection {
  Address get address => throw _privateConstructorUsedError;
  NftJsonData get json => throw _privateConstructorUsedError;
  List<ContractInterface> get interfaces => throw _privateConstructorUsedError;

  /// Serializes this NftCollection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftCollectionCopyWith<NftCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftCollectionCopyWith<$Res> {
  factory $NftCollectionCopyWith(
          NftCollection value, $Res Function(NftCollection) then) =
      _$NftCollectionCopyWithImpl<$Res, NftCollection>;
  @useResult
  $Res call(
      {Address address, NftJsonData json, List<ContractInterface> interfaces});

  $AddressCopyWith<$Res> get address;
  $NftJsonDataCopyWith<$Res> get json;
}

/// @nodoc
class _$NftCollectionCopyWithImpl<$Res, $Val extends NftCollection>
    implements $NftCollectionCopyWith<$Res> {
  _$NftCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? json = null,
    Object? interfaces = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      json: null == json
          ? _value.json
          : json // ignore: cast_nullable_to_non_nullable
              as NftJsonData,
      interfaces: null == interfaces
          ? _value.interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<ContractInterface>,
    ) as $Val);
  }

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of NftCollection
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
abstract class _$$NftCollectionImplCopyWith<$Res>
    implements $NftCollectionCopyWith<$Res> {
  factory _$$NftCollectionImplCopyWith(
          _$NftCollectionImpl value, $Res Function(_$NftCollectionImpl) then) =
      __$$NftCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Address address, NftJsonData json, List<ContractInterface> interfaces});

  @override
  $AddressCopyWith<$Res> get address;
  @override
  $NftJsonDataCopyWith<$Res> get json;
}

/// @nodoc
class __$$NftCollectionImplCopyWithImpl<$Res>
    extends _$NftCollectionCopyWithImpl<$Res, _$NftCollectionImpl>
    implements _$$NftCollectionImplCopyWith<$Res> {
  __$$NftCollectionImplCopyWithImpl(
      _$NftCollectionImpl _value, $Res Function(_$NftCollectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? json = null,
    Object? interfaces = null,
  }) {
    return _then(_$NftCollectionImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      json: null == json
          ? _value.json
          : json // ignore: cast_nullable_to_non_nullable
              as NftJsonData,
      interfaces: null == interfaces
          ? _value._interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<ContractInterface>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NftCollectionImpl extends _NftCollection {
  const _$NftCollectionImpl(
      {required this.address,
      required this.json,
      required final List<ContractInterface> interfaces})
      : _interfaces = interfaces,
        super._();

  factory _$NftCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NftCollectionImplFromJson(json);

  @override
  final Address address;
  @override
  final NftJsonData json;
  final List<ContractInterface> _interfaces;
  @override
  List<ContractInterface> get interfaces {
    if (_interfaces is EqualUnmodifiableListView) return _interfaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interfaces);
  }

  @override
  String toString() {
    return 'NftCollection(address: $address, json: $json, interfaces: $interfaces)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftCollectionImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.json, json) || other.json == json) &&
            const DeepCollectionEquality()
                .equals(other._interfaces, _interfaces));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address, json,
      const DeepCollectionEquality().hash(_interfaces));

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftCollectionImplCopyWith<_$NftCollectionImpl> get copyWith =>
      __$$NftCollectionImplCopyWithImpl<_$NftCollectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NftCollectionImplToJson(
      this,
    );
  }
}

abstract class _NftCollection extends NftCollection {
  const factory _NftCollection(
      {required final Address address,
      required final NftJsonData json,
      required final List<ContractInterface> interfaces}) = _$NftCollectionImpl;
  const _NftCollection._() : super._();

  factory _NftCollection.fromJson(Map<String, dynamic> json) =
      _$NftCollectionImpl.fromJson;

  @override
  Address get address;
  @override
  NftJsonData get json;
  @override
  List<ContractInterface> get interfaces;

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftCollectionImplCopyWith<_$NftCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
