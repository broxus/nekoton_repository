// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_token_transfer_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NftTokenTransferPayload {
  String get id;
  Address get collection;

  /// Create a copy of NftTokenTransferPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftTokenTransferPayloadCopyWith<NftTokenTransferPayload> get copyWith =>
      _$NftTokenTransferPayloadCopyWithImpl<NftTokenTransferPayload>(
          this as NftTokenTransferPayload, _$identity);

  /// Serializes this NftTokenTransferPayload to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NftTokenTransferPayload &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, collection);

  @override
  String toString() {
    return 'NftTokenTransferPayload(id: $id, collection: $collection)';
  }
}

/// @nodoc
abstract mixin class $NftTokenTransferPayloadCopyWith<$Res> {
  factory $NftTokenTransferPayloadCopyWith(NftTokenTransferPayload value,
          $Res Function(NftTokenTransferPayload) _then) =
      _$NftTokenTransferPayloadCopyWithImpl;
  @useResult
  $Res call({String id, Address collection});

  $AddressCopyWith<$Res> get collection;
}

/// @nodoc
class _$NftTokenTransferPayloadCopyWithImpl<$Res>
    implements $NftTokenTransferPayloadCopyWith<$Res> {
  _$NftTokenTransferPayloadCopyWithImpl(this._self, this._then);

  final NftTokenTransferPayload _self;
  final $Res Function(NftTokenTransferPayload) _then;

  /// Create a copy of NftTokenTransferPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collection = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }

  /// Create a copy of NftTokenTransferPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_self.collection, (value) {
      return _then(_self.copyWith(collection: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _NftTokenTransferPayload implements NftTokenTransferPayload {
  const _NftTokenTransferPayload({required this.id, required this.collection});
  factory _NftTokenTransferPayload.fromJson(Map<String, dynamic> json) =>
      _$NftTokenTransferPayloadFromJson(json);

  @override
  final String id;
  @override
  final Address collection;

  /// Create a copy of NftTokenTransferPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NftTokenTransferPayloadCopyWith<_NftTokenTransferPayload> get copyWith =>
      __$NftTokenTransferPayloadCopyWithImpl<_NftTokenTransferPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NftTokenTransferPayloadToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NftTokenTransferPayload &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, collection);

  @override
  String toString() {
    return 'NftTokenTransferPayload(id: $id, collection: $collection)';
  }
}

/// @nodoc
abstract mixin class _$NftTokenTransferPayloadCopyWith<$Res>
    implements $NftTokenTransferPayloadCopyWith<$Res> {
  factory _$NftTokenTransferPayloadCopyWith(_NftTokenTransferPayload value,
          $Res Function(_NftTokenTransferPayload) _then) =
      __$NftTokenTransferPayloadCopyWithImpl;
  @override
  @useResult
  $Res call({String id, Address collection});

  @override
  $AddressCopyWith<$Res> get collection;
}

/// @nodoc
class __$NftTokenTransferPayloadCopyWithImpl<$Res>
    implements _$NftTokenTransferPayloadCopyWith<$Res> {
  __$NftTokenTransferPayloadCopyWithImpl(this._self, this._then);

  final _NftTokenTransferPayload _self;
  final $Res Function(_NftTokenTransferPayload) _then;

  /// Create a copy of NftTokenTransferPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? collection = null,
  }) {
    return _then(_NftTokenTransferPayload(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }

  /// Create a copy of NftTokenTransferPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_self.collection, (value) {
      return _then(_self.copyWith(collection: value));
    });
  }
}

// dart format on
