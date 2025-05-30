// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_token_transfer_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NftTokenTransferPayload _$NftTokenTransferPayloadFromJson(
    Map<String, dynamic> json) {
  return _NftTokenTransferPayload.fromJson(json);
}

/// @nodoc
mixin _$NftTokenTransferPayload {
  String get id => throw _privateConstructorUsedError;
  Address get collection => throw _privateConstructorUsedError;

  /// Serializes this NftTokenTransferPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NftTokenTransferPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftTokenTransferPayloadCopyWith<NftTokenTransferPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftTokenTransferPayloadCopyWith<$Res> {
  factory $NftTokenTransferPayloadCopyWith(NftTokenTransferPayload value,
          $Res Function(NftTokenTransferPayload) then) =
      _$NftTokenTransferPayloadCopyWithImpl<$Res, NftTokenTransferPayload>;
  @useResult
  $Res call({String id, Address collection});

  $AddressCopyWith<$Res> get collection;
}

/// @nodoc
class _$NftTokenTransferPayloadCopyWithImpl<$Res,
        $Val extends NftTokenTransferPayload>
    implements $NftTokenTransferPayloadCopyWith<$Res> {
  _$NftTokenTransferPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NftTokenTransferPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collection = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
    ) as $Val);
  }

  /// Create a copy of NftTokenTransferPayload
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
abstract class _$$NftTokenTransferPayloadImplCopyWith<$Res>
    implements $NftTokenTransferPayloadCopyWith<$Res> {
  factory _$$NftTokenTransferPayloadImplCopyWith(
          _$NftTokenTransferPayloadImpl value,
          $Res Function(_$NftTokenTransferPayloadImpl) then) =
      __$$NftTokenTransferPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Address collection});

  @override
  $AddressCopyWith<$Res> get collection;
}

/// @nodoc
class __$$NftTokenTransferPayloadImplCopyWithImpl<$Res>
    extends _$NftTokenTransferPayloadCopyWithImpl<$Res,
        _$NftTokenTransferPayloadImpl>
    implements _$$NftTokenTransferPayloadImplCopyWith<$Res> {
  __$$NftTokenTransferPayloadImplCopyWithImpl(
      _$NftTokenTransferPayloadImpl _value,
      $Res Function(_$NftTokenTransferPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of NftTokenTransferPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collection = null,
  }) {
    return _then(_$NftTokenTransferPayloadImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NftTokenTransferPayloadImpl implements _NftTokenTransferPayload {
  const _$NftTokenTransferPayloadImpl(
      {required this.id, required this.collection});

  factory _$NftTokenTransferPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$NftTokenTransferPayloadImplFromJson(json);

  @override
  final String id;
  @override
  final Address collection;

  @override
  String toString() {
    return 'NftTokenTransferPayload(id: $id, collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftTokenTransferPayloadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, collection);

  /// Create a copy of NftTokenTransferPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftTokenTransferPayloadImplCopyWith<_$NftTokenTransferPayloadImpl>
      get copyWith => __$$NftTokenTransferPayloadImplCopyWithImpl<
          _$NftTokenTransferPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NftTokenTransferPayloadImplToJson(
      this,
    );
  }
}

abstract class _NftTokenTransferPayload implements NftTokenTransferPayload {
  const factory _NftTokenTransferPayload(
      {required final String id,
      required final Address collection}) = _$NftTokenTransferPayloadImpl;

  factory _NftTokenTransferPayload.fromJson(Map<String, dynamic> json) =
      _$NftTokenTransferPayloadImpl.fromJson;

  @override
  String get id;
  @override
  Address get collection;

  /// Create a copy of NftTokenTransferPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftTokenTransferPayloadImplCopyWith<_$NftTokenTransferPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
