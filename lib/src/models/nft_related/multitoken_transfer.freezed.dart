// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multitoken_transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MultitokenTransfer {
  String get tokenId;
  Address get collection;
  Address get sender;
  BigInt get count;

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MultitokenTransferCopyWith<MultitokenTransfer> get copyWith =>
      _$MultitokenTransferCopyWithImpl<MultitokenTransfer>(
          this as MultitokenTransfer, _$identity);

  /// Serializes this MultitokenTransfer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MultitokenTransfer &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tokenId, collection, sender, count);

  @override
  String toString() {
    return 'MultitokenTransfer(tokenId: $tokenId, collection: $collection, sender: $sender, count: $count)';
  }
}

/// @nodoc
abstract mixin class $MultitokenTransferCopyWith<$Res> {
  factory $MultitokenTransferCopyWith(
          MultitokenTransfer value, $Res Function(MultitokenTransfer) _then) =
      _$MultitokenTransferCopyWithImpl;
  @useResult
  $Res call({String tokenId, Address collection, Address sender, BigInt count});

  $AddressCopyWith<$Res> get collection;
  $AddressCopyWith<$Res> get sender;
}

/// @nodoc
class _$MultitokenTransferCopyWithImpl<$Res>
    implements $MultitokenTransferCopyWith<$Res> {
  _$MultitokenTransferCopyWithImpl(this._self, this._then);

  final MultitokenTransfer _self;
  final $Res Function(MultitokenTransfer) _then;

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenId = null,
    Object? collection = null,
    Object? sender = null,
    Object? count = null,
  }) {
    return _then(_self.copyWith(
      tokenId: null == tokenId
          ? _self.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      sender: null == sender
          ? _self.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Address,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_self.collection, (value) {
      return _then(_self.copyWith(collection: value));
    });
  }

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get sender {
    return $AddressCopyWith<$Res>(_self.sender, (value) {
      return _then(_self.copyWith(sender: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _MultitokenTransfer implements MultitokenTransfer {
  const _MultitokenTransfer(
      {required this.tokenId,
      required this.collection,
      required this.sender,
      required this.count});
  factory _MultitokenTransfer.fromJson(Map<String, dynamic> json) =>
      _$MultitokenTransferFromJson(json);

  @override
  final String tokenId;
  @override
  final Address collection;
  @override
  final Address sender;
  @override
  final BigInt count;

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MultitokenTransferCopyWith<_MultitokenTransfer> get copyWith =>
      __$MultitokenTransferCopyWithImpl<_MultitokenTransfer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MultitokenTransferToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MultitokenTransfer &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tokenId, collection, sender, count);

  @override
  String toString() {
    return 'MultitokenTransfer(tokenId: $tokenId, collection: $collection, sender: $sender, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$MultitokenTransferCopyWith<$Res>
    implements $MultitokenTransferCopyWith<$Res> {
  factory _$MultitokenTransferCopyWith(
          _MultitokenTransfer value, $Res Function(_MultitokenTransfer) _then) =
      __$MultitokenTransferCopyWithImpl;
  @override
  @useResult
  $Res call({String tokenId, Address collection, Address sender, BigInt count});

  @override
  $AddressCopyWith<$Res> get collection;
  @override
  $AddressCopyWith<$Res> get sender;
}

/// @nodoc
class __$MultitokenTransferCopyWithImpl<$Res>
    implements _$MultitokenTransferCopyWith<$Res> {
  __$MultitokenTransferCopyWithImpl(this._self, this._then);

  final _MultitokenTransfer _self;
  final $Res Function(_MultitokenTransfer) _then;

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tokenId = null,
    Object? collection = null,
    Object? sender = null,
    Object? count = null,
  }) {
    return _then(_MultitokenTransfer(
      tokenId: null == tokenId
          ? _self.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      sender: null == sender
          ? _self.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Address,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_self.collection, (value) {
      return _then(_self.copyWith(collection: value));
    });
  }

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get sender {
    return $AddressCopyWith<$Res>(_self.sender, (value) {
      return _then(_self.copyWith(sender: value));
    });
  }
}

// dart format on
