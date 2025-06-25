// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NftTransfer {
  String get id;
  Address get collection;
  Address get oldOwner;
  Address get newOwner;

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftTransferCopyWith<NftTransfer> get copyWith =>
      _$NftTransferCopyWithImpl<NftTransfer>(this as NftTransfer, _$identity);

  /// Serializes this NftTransfer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NftTransfer &&
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

  @override
  String toString() {
    return 'NftTransfer(id: $id, collection: $collection, oldOwner: $oldOwner, newOwner: $newOwner)';
  }
}

/// @nodoc
abstract mixin class $NftTransferCopyWith<$Res> {
  factory $NftTransferCopyWith(
          NftTransfer value, $Res Function(NftTransfer) _then) =
      _$NftTransferCopyWithImpl;
  @useResult
  $Res call(
      {String id, Address collection, Address oldOwner, Address newOwner});

  $AddressCopyWith<$Res> get collection;
  $AddressCopyWith<$Res> get oldOwner;
  $AddressCopyWith<$Res> get newOwner;
}

/// @nodoc
class _$NftTransferCopyWithImpl<$Res> implements $NftTransferCopyWith<$Res> {
  _$NftTransferCopyWithImpl(this._self, this._then);

  final NftTransfer _self;
  final $Res Function(NftTransfer) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      oldOwner: null == oldOwner
          ? _self.oldOwner
          : oldOwner // ignore: cast_nullable_to_non_nullable
              as Address,
      newOwner: null == newOwner
          ? _self.newOwner
          : newOwner // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_self.collection, (value) {
      return _then(_self.copyWith(collection: value));
    });
  }

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get oldOwner {
    return $AddressCopyWith<$Res>(_self.oldOwner, (value) {
      return _then(_self.copyWith(oldOwner: value));
    });
  }

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get newOwner {
    return $AddressCopyWith<$Res>(_self.newOwner, (value) {
      return _then(_self.copyWith(newOwner: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _NftTransfer implements NftTransfer {
  const _NftTransfer(
      {required this.id,
      required this.collection,
      required this.oldOwner,
      required this.newOwner});
  factory _NftTransfer.fromJson(Map<String, dynamic> json) =>
      _$NftTransferFromJson(json);

  @override
  final String id;
  @override
  final Address collection;
  @override
  final Address oldOwner;
  @override
  final Address newOwner;

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NftTransferCopyWith<_NftTransfer> get copyWith =>
      __$NftTransferCopyWithImpl<_NftTransfer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NftTransferToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NftTransfer &&
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

  @override
  String toString() {
    return 'NftTransfer(id: $id, collection: $collection, oldOwner: $oldOwner, newOwner: $newOwner)';
  }
}

/// @nodoc
abstract mixin class _$NftTransferCopyWith<$Res>
    implements $NftTransferCopyWith<$Res> {
  factory _$NftTransferCopyWith(
          _NftTransfer value, $Res Function(_NftTransfer) _then) =
      __$NftTransferCopyWithImpl;
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
class __$NftTransferCopyWithImpl<$Res> implements _$NftTransferCopyWith<$Res> {
  __$NftTransferCopyWithImpl(this._self, this._then);

  final _NftTransfer _self;
  final $Res Function(_NftTransfer) _then;

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? collection = null,
    Object? oldOwner = null,
    Object? newOwner = null,
  }) {
    return _then(_NftTransfer(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      oldOwner: null == oldOwner
          ? _self.oldOwner
          : oldOwner // ignore: cast_nullable_to_non_nullable
              as Address,
      newOwner: null == newOwner
          ? _self.newOwner
          : newOwner // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_self.collection, (value) {
      return _then(_self.copyWith(collection: value));
    });
  }

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get oldOwner {
    return $AddressCopyWith<$Res>(_self.oldOwner, (value) {
      return _then(_self.copyWith(oldOwner: value));
    });
  }

  /// Create a copy of NftTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get newOwner {
    return $AddressCopyWith<$Res>(_self.newOwner, (value) {
      return _then(_self.copyWith(newOwner: value));
    });
  }
}

// dart format on
