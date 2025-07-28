// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NftCollection {
  Address get address;
  NftJsonData get json;
  List<ContractInterface> get interfaces;

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftCollectionCopyWith<NftCollection> get copyWith =>
      _$NftCollectionCopyWithImpl<NftCollection>(
          this as NftCollection, _$identity);

  /// Serializes this NftCollection to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NftCollection &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.json, json) || other.json == json) &&
            const DeepCollectionEquality()
                .equals(other.interfaces, interfaces));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address, json,
      const DeepCollectionEquality().hash(interfaces));

  @override
  String toString() {
    return 'NftCollection(address: $address, json: $json, interfaces: $interfaces)';
  }
}

/// @nodoc
abstract mixin class $NftCollectionCopyWith<$Res> {
  factory $NftCollectionCopyWith(
          NftCollection value, $Res Function(NftCollection) _then) =
      _$NftCollectionCopyWithImpl;
  @useResult
  $Res call(
      {Address address, NftJsonData json, List<ContractInterface> interfaces});

  $AddressCopyWith<$Res> get address;
  $NftJsonDataCopyWith<$Res> get json;
}

/// @nodoc
class _$NftCollectionCopyWithImpl<$Res>
    implements $NftCollectionCopyWith<$Res> {
  _$NftCollectionCopyWithImpl(this._self, this._then);

  final NftCollection _self;
  final $Res Function(NftCollection) _then;

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? json = null,
    Object? interfaces = null,
  }) {
    return _then(_self.copyWith(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      json: null == json
          ? _self.json
          : json // ignore: cast_nullable_to_non_nullable
              as NftJsonData,
      interfaces: null == interfaces
          ? _self.interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<ContractInterface>,
    ));
  }

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NftJsonDataCopyWith<$Res> get json {
    return $NftJsonDataCopyWith<$Res>(_self.json, (value) {
      return _then(_self.copyWith(json: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _NftCollection extends NftCollection {
  const _NftCollection(
      {required this.address,
      required this.json,
      required final List<ContractInterface> interfaces})
      : _interfaces = interfaces,
        super._();
  factory _NftCollection.fromJson(Map<String, dynamic> json) =>
      _$NftCollectionFromJson(json);

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

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NftCollectionCopyWith<_NftCollection> get copyWith =>
      __$NftCollectionCopyWithImpl<_NftCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NftCollectionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NftCollection &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.json, json) || other.json == json) &&
            const DeepCollectionEquality()
                .equals(other._interfaces, _interfaces));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address, json,
      const DeepCollectionEquality().hash(_interfaces));

  @override
  String toString() {
    return 'NftCollection(address: $address, json: $json, interfaces: $interfaces)';
  }
}

/// @nodoc
abstract mixin class _$NftCollectionCopyWith<$Res>
    implements $NftCollectionCopyWith<$Res> {
  factory _$NftCollectionCopyWith(
          _NftCollection value, $Res Function(_NftCollection) _then) =
      __$NftCollectionCopyWithImpl;
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
class __$NftCollectionCopyWithImpl<$Res>
    implements _$NftCollectionCopyWith<$Res> {
  __$NftCollectionCopyWithImpl(this._self, this._then);

  final _NftCollection _self;
  final $Res Function(_NftCollection) _then;

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = null,
    Object? json = null,
    Object? interfaces = null,
  }) {
    return _then(_NftCollection(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      json: null == json
          ? _self.json
          : json // ignore: cast_nullable_to_non_nullable
              as NftJsonData,
      interfaces: null == interfaces
          ? _self._interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<ContractInterface>,
    ));
  }

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of NftCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NftJsonDataCopyWith<$Res> get json {
    return $NftJsonDataCopyWith<$Res>(_self.json, (value) {
      return _then(_self.copyWith(json: value));
    });
  }
}

// dart format on
