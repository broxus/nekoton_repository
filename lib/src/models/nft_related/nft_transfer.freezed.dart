// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NftTransfer _$NftTransferFromJson(Map<String, dynamic> json) {
  return _NftTransfer.fromJson(json);
}

/// @nodoc
mixin _$NftTransfer {
  String get id => throw _privateConstructorUsedError;
  Address get collection => throw _privateConstructorUsedError;
  Address get oldOwner => throw _privateConstructorUsedError;
  Address get newOwner => throw _privateConstructorUsedError;

  /// Serializes this NftTransfer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftTransferCopyWith<NftTransfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftTransferCopyWith<$Res> {
  factory $NftTransferCopyWith(
          NftTransfer value, $Res Function(NftTransfer) then) =
      _$NftTransferCopyWithImpl<$Res, NftTransfer>;
  @useResult
  $Res call(
      {String id, Address collection, Address oldOwner, Address newOwner});

  $AddressCopyWith<$Res> get collection;
  $AddressCopyWith<$Res> get oldOwner;
  $AddressCopyWith<$Res> get newOwner;
}

/// @nodoc
class _$NftTransferCopyWithImpl<$Res, $Val extends NftTransfer>
    implements $NftTransferCopyWith<$Res> {
  _$NftTransferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collection = null,
    Object? oldOwner = null,
    Object? newOwner = null,
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
      oldOwner: null == oldOwner
          ? _value.oldOwner
          : oldOwner // ignore: cast_nullable_to_non_nullable
              as Address,
      newOwner: null == newOwner
          ? _value.newOwner
          : newOwner // ignore: cast_nullable_to_non_nullable
              as Address,
    ) as $Val);
  }

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_value.collection, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get oldOwner {
    return $AddressCopyWith<$Res>(_value.oldOwner, (value) {
      return _then(_value.copyWith(oldOwner: value) as $Val);
    });
  }

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get newOwner {
    return $AddressCopyWith<$Res>(_value.newOwner, (value) {
      return _then(_value.copyWith(newOwner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NftTransferImplCopyWith<$Res>
    implements $NftTransferCopyWith<$Res> {
  factory _$$NftTransferImplCopyWith(
          _$NftTransferImpl value, $Res Function(_$NftTransferImpl) then) =
      __$$NftTransferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, Address collection, Address oldOwner, Address newOwner});

  @override
  $AddressCopyWith<$Res> get collection;
  @override
  $AddressCopyWith<$Res> get oldOwner;
  @override
  $AddressCopyWith<$Res> get newOwner;
}

/// @nodoc
class __$$NftTransferImplCopyWithImpl<$Res>
    extends _$NftTransferCopyWithImpl<$Res, _$NftTransferImpl>
    implements _$$NftTransferImplCopyWith<$Res> {
  __$$NftTransferImplCopyWithImpl(
      _$NftTransferImpl _value, $Res Function(_$NftTransferImpl) _then)
      : super(_value, _then);

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collection = null,
    Object? oldOwner = null,
    Object? newOwner = null,
  }) {
    return _then(_$NftTransferImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      oldOwner: null == oldOwner
          ? _value.oldOwner
          : oldOwner // ignore: cast_nullable_to_non_nullable
              as Address,
      newOwner: null == newOwner
          ? _value.newOwner
          : newOwner // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NftTransferImpl implements _NftTransfer {
  const _$NftTransferImpl(
      {required this.id,
      required this.collection,
      required this.oldOwner,
      required this.newOwner});

  factory _$NftTransferImpl.fromJson(Map<String, dynamic> json) =>
      _$$NftTransferImplFromJson(json);

  @override
  final String id;
  @override
  final Address collection;
  @override
  final Address oldOwner;
  @override
  final Address newOwner;

  @override
  String toString() {
    return 'NftTransfer(id: $id, collection: $collection, oldOwner: $oldOwner, newOwner: $newOwner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftTransferImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.oldOwner, oldOwner) ||
                other.oldOwner == oldOwner) &&
            (identical(other.newOwner, newOwner) ||
                other.newOwner == newOwner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, collection, oldOwner, newOwner);

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftTransferImplCopyWith<_$NftTransferImpl> get copyWith =>
      __$$NftTransferImplCopyWithImpl<_$NftTransferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NftTransferImplToJson(
      this,
    );
  }
}

abstract class _NftTransfer implements NftTransfer {
  const factory _NftTransfer(
      {required final String id,
      required final Address collection,
      required final Address oldOwner,
      required final Address newOwner}) = _$NftTransferImpl;

  factory _NftTransfer.fromJson(Map<String, dynamic> json) =
      _$NftTransferImpl.fromJson;

  @override
  String get id;
  @override
  Address get collection;
  @override
  Address get oldOwner;
  @override
  Address get newOwner;

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftTransferImplCopyWith<_$NftTransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
