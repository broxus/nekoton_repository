// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multitoken_transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MultitokenTransfer _$MultitokenTransferFromJson(Map<String, dynamic> json) {
  return _MultitokenTransfer.fromJson(json);
}

/// @nodoc
mixin _$MultitokenTransfer {
  String get tokenId => throw _privateConstructorUsedError;
  Address get collection => throw _privateConstructorUsedError;
  Address get sender => throw _privateConstructorUsedError;
  @amountJsonConverter
  BigInt get count => throw _privateConstructorUsedError;

  /// Serializes this MultitokenTransfer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MultitokenTransferCopyWith<MultitokenTransfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultitokenTransferCopyWith<$Res> {
  factory $MultitokenTransferCopyWith(
          MultitokenTransfer value, $Res Function(MultitokenTransfer) then) =
      _$MultitokenTransferCopyWithImpl<$Res, MultitokenTransfer>;
  @useResult
  $Res call(
      {String tokenId,
      Address collection,
      Address sender,
      @amountJsonConverter BigInt count});

  $AddressCopyWith<$Res> get collection;
  $AddressCopyWith<$Res> get sender;
}

/// @nodoc
class _$MultitokenTransferCopyWithImpl<$Res, $Val extends MultitokenTransfer>
    implements $MultitokenTransferCopyWith<$Res> {
  _$MultitokenTransferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Address,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ) as $Val);
  }

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_value.collection, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get sender {
    return $AddressCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MultitokenTransferImplCopyWith<$Res>
    implements $MultitokenTransferCopyWith<$Res> {
  factory _$$MultitokenTransferImplCopyWith(_$MultitokenTransferImpl value,
          $Res Function(_$MultitokenTransferImpl) then) =
      __$$MultitokenTransferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tokenId,
      Address collection,
      Address sender,
      @amountJsonConverter BigInt count});

  @override
  $AddressCopyWith<$Res> get collection;
  @override
  $AddressCopyWith<$Res> get sender;
}

/// @nodoc
class __$$MultitokenTransferImplCopyWithImpl<$Res>
    extends _$MultitokenTransferCopyWithImpl<$Res, _$MultitokenTransferImpl>
    implements _$$MultitokenTransferImplCopyWith<$Res> {
  __$$MultitokenTransferImplCopyWithImpl(_$MultitokenTransferImpl _value,
      $Res Function(_$MultitokenTransferImpl) _then)
      : super(_value, _then);

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
    return _then(_$MultitokenTransferImpl(
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Address,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MultitokenTransferImpl implements _MultitokenTransfer {
  const _$MultitokenTransferImpl(
      {required this.tokenId,
      required this.collection,
      required this.sender,
      @amountJsonConverter required this.count});

  factory _$MultitokenTransferImpl.fromJson(Map<String, dynamic> json) =>
      _$$MultitokenTransferImplFromJson(json);

  @override
  final String tokenId;
  @override
  final Address collection;
  @override
  final Address sender;
  @override
  @amountJsonConverter
  final BigInt count;

  @override
  String toString() {
    return 'MultitokenTransfer(tokenId: $tokenId, collection: $collection, sender: $sender, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultitokenTransferImpl &&
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

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MultitokenTransferImplCopyWith<_$MultitokenTransferImpl> get copyWith =>
      __$$MultitokenTransferImplCopyWithImpl<_$MultitokenTransferImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MultitokenTransferImplToJson(
      this,
    );
  }
}

abstract class _MultitokenTransfer implements MultitokenTransfer {
  const factory _MultitokenTransfer(
          {required final String tokenId,
          required final Address collection,
          required final Address sender,
          @amountJsonConverter required final BigInt count}) =
      _$MultitokenTransferImpl;

  factory _MultitokenTransfer.fromJson(Map<String, dynamic> json) =
      _$MultitokenTransferImpl.fromJson;

  @override
  String get tokenId;
  @override
  Address get collection;
  @override
  Address get sender;
  @override
  @amountJsonConverter
  BigInt get count;

  /// Create a copy of MultitokenTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MultitokenTransferImplCopyWith<_$MultitokenTransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
