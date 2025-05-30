// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_transfer_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NftTransferEvent {
  TransferDirection get direction => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Address get collection => throw _privateConstructorUsedError;
  Address get sender => throw _privateConstructorUsedError;
  Address get recipient => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TransferDirection direction, String id,
            Address collection, Address sender, Address recipient)
        ownership,
    required TResult Function(
            TransferDirection direction,
            String id,
            Address collection,
            Address sender,
            Address recipient,
            @amountJsonConverter BigInt count)
        token,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransferDirection direction, String id,
            Address collection, Address sender, Address recipient)?
        ownership,
    TResult? Function(
            TransferDirection direction,
            String id,
            Address collection,
            Address sender,
            Address recipient,
            @amountJsonConverter BigInt count)?
        token,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransferDirection direction, String id, Address collection,
            Address sender, Address recipient)?
        ownership,
    TResult Function(
            TransferDirection direction,
            String id,
            Address collection,
            Address sender,
            Address recipient,
            @amountJsonConverter BigInt count)?
        token,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NftOwnershipTransferEvent value) ownership,
    required TResult Function(NftTokenTransferEvent value) token,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NftOwnershipTransferEvent value)? ownership,
    TResult? Function(NftTokenTransferEvent value)? token,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftOwnershipTransferEvent value)? ownership,
    TResult Function(NftTokenTransferEvent value)? token,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftTransferEventCopyWith<NftTransferEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftTransferEventCopyWith<$Res> {
  factory $NftTransferEventCopyWith(
          NftTransferEvent value, $Res Function(NftTransferEvent) then) =
      _$NftTransferEventCopyWithImpl<$Res, NftTransferEvent>;
  @useResult
  $Res call(
      {TransferDirection direction,
      String id,
      Address collection,
      Address sender,
      Address recipient});

  $AddressCopyWith<$Res> get collection;
  $AddressCopyWith<$Res> get sender;
  $AddressCopyWith<$Res> get recipient;
}

/// @nodoc
class _$NftTransferEventCopyWithImpl<$Res, $Val extends NftTransferEvent>
    implements $NftTransferEventCopyWith<$Res> {
  _$NftTransferEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
    Object? id = null,
    Object? collection = null,
    Object? sender = null,
    Object? recipient = null,
  }) {
    return _then(_value.copyWith(
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as TransferDirection,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Address,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as Address,
    ) as $Val);
  }

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_value.collection, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get sender {
    return $AddressCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get recipient {
    return $AddressCopyWith<$Res>(_value.recipient, (value) {
      return _then(_value.copyWith(recipient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NftOwnershipTransferEventImplCopyWith<$Res>
    implements $NftTransferEventCopyWith<$Res> {
  factory _$$NftOwnershipTransferEventImplCopyWith(
          _$NftOwnershipTransferEventImpl value,
          $Res Function(_$NftOwnershipTransferEventImpl) then) =
      __$$NftOwnershipTransferEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransferDirection direction,
      String id,
      Address collection,
      Address sender,
      Address recipient});

  @override
  $AddressCopyWith<$Res> get collection;
  @override
  $AddressCopyWith<$Res> get sender;
  @override
  $AddressCopyWith<$Res> get recipient;
}

/// @nodoc
class __$$NftOwnershipTransferEventImplCopyWithImpl<$Res>
    extends _$NftTransferEventCopyWithImpl<$Res,
        _$NftOwnershipTransferEventImpl>
    implements _$$NftOwnershipTransferEventImplCopyWith<$Res> {
  __$$NftOwnershipTransferEventImplCopyWithImpl(
      _$NftOwnershipTransferEventImpl _value,
      $Res Function(_$NftOwnershipTransferEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
    Object? id = null,
    Object? collection = null,
    Object? sender = null,
    Object? recipient = null,
  }) {
    return _then(_$NftOwnershipTransferEventImpl(
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as TransferDirection,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Address,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }
}

/// @nodoc

class _$NftOwnershipTransferEventImpl implements NftOwnershipTransferEvent {
  const _$NftOwnershipTransferEventImpl(
      {required this.direction,
      required this.id,
      required this.collection,
      required this.sender,
      required this.recipient});

  @override
  final TransferDirection direction;
  @override
  final String id;
  @override
  final Address collection;
  @override
  final Address sender;
  @override
  final Address recipient;

  @override
  String toString() {
    return 'NftTransferEvent.ownership(direction: $direction, id: $id, collection: $collection, sender: $sender, recipient: $recipient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftOwnershipTransferEventImpl &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, direction, id, collection, sender, recipient);

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftOwnershipTransferEventImplCopyWith<_$NftOwnershipTransferEventImpl>
      get copyWith => __$$NftOwnershipTransferEventImplCopyWithImpl<
          _$NftOwnershipTransferEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TransferDirection direction, String id,
            Address collection, Address sender, Address recipient)
        ownership,
    required TResult Function(
            TransferDirection direction,
            String id,
            Address collection,
            Address sender,
            Address recipient,
            @amountJsonConverter BigInt count)
        token,
  }) {
    return ownership(direction, id, collection, sender, recipient);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransferDirection direction, String id,
            Address collection, Address sender, Address recipient)?
        ownership,
    TResult? Function(
            TransferDirection direction,
            String id,
            Address collection,
            Address sender,
            Address recipient,
            @amountJsonConverter BigInt count)?
        token,
  }) {
    return ownership?.call(direction, id, collection, sender, recipient);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransferDirection direction, String id, Address collection,
            Address sender, Address recipient)?
        ownership,
    TResult Function(
            TransferDirection direction,
            String id,
            Address collection,
            Address sender,
            Address recipient,
            @amountJsonConverter BigInt count)?
        token,
    required TResult orElse(),
  }) {
    if (ownership != null) {
      return ownership(direction, id, collection, sender, recipient);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NftOwnershipTransferEvent value) ownership,
    required TResult Function(NftTokenTransferEvent value) token,
  }) {
    return ownership(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NftOwnershipTransferEvent value)? ownership,
    TResult? Function(NftTokenTransferEvent value)? token,
  }) {
    return ownership?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftOwnershipTransferEvent value)? ownership,
    TResult Function(NftTokenTransferEvent value)? token,
    required TResult orElse(),
  }) {
    if (ownership != null) {
      return ownership(this);
    }
    return orElse();
  }
}

abstract class NftOwnershipTransferEvent implements NftTransferEvent {
  const factory NftOwnershipTransferEvent(
      {required final TransferDirection direction,
      required final String id,
      required final Address collection,
      required final Address sender,
      required final Address recipient}) = _$NftOwnershipTransferEventImpl;

  @override
  TransferDirection get direction;
  @override
  String get id;
  @override
  Address get collection;
  @override
  Address get sender;
  @override
  Address get recipient;

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftOwnershipTransferEventImplCopyWith<_$NftOwnershipTransferEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NftTokenTransferEventImplCopyWith<$Res>
    implements $NftTransferEventCopyWith<$Res> {
  factory _$$NftTokenTransferEventImplCopyWith(
          _$NftTokenTransferEventImpl value,
          $Res Function(_$NftTokenTransferEventImpl) then) =
      __$$NftTokenTransferEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransferDirection direction,
      String id,
      Address collection,
      Address sender,
      Address recipient,
      @amountJsonConverter BigInt count});

  @override
  $AddressCopyWith<$Res> get collection;
  @override
  $AddressCopyWith<$Res> get sender;
  @override
  $AddressCopyWith<$Res> get recipient;
}

/// @nodoc
class __$$NftTokenTransferEventImplCopyWithImpl<$Res>
    extends _$NftTransferEventCopyWithImpl<$Res, _$NftTokenTransferEventImpl>
    implements _$$NftTokenTransferEventImplCopyWith<$Res> {
  __$$NftTokenTransferEventImplCopyWithImpl(_$NftTokenTransferEventImpl _value,
      $Res Function(_$NftTokenTransferEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
    Object? id = null,
    Object? collection = null,
    Object? sender = null,
    Object? recipient = null,
    Object? count = null,
  }) {
    return _then(_$NftTokenTransferEventImpl(
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as TransferDirection,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Address,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as Address,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$NftTokenTransferEventImpl implements NftTokenTransferEvent {
  const _$NftTokenTransferEventImpl(
      {required this.direction,
      required this.id,
      required this.collection,
      required this.sender,
      required this.recipient,
      @amountJsonConverter required this.count});

  @override
  final TransferDirection direction;
  @override
  final String id;
  @override
  final Address collection;
  @override
  final Address sender;
  @override
  final Address recipient;
  @override
  @amountJsonConverter
  final BigInt count;

  @override
  String toString() {
    return 'NftTransferEvent.token(direction: $direction, id: $id, collection: $collection, sender: $sender, recipient: $recipient, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftTokenTransferEventImpl &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, direction, id, collection, sender, recipient, count);

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftTokenTransferEventImplCopyWith<_$NftTokenTransferEventImpl>
      get copyWith => __$$NftTokenTransferEventImplCopyWithImpl<
          _$NftTokenTransferEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TransferDirection direction, String id,
            Address collection, Address sender, Address recipient)
        ownership,
    required TResult Function(
            TransferDirection direction,
            String id,
            Address collection,
            Address sender,
            Address recipient,
            @amountJsonConverter BigInt count)
        token,
  }) {
    return token(direction, id, collection, sender, recipient, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransferDirection direction, String id,
            Address collection, Address sender, Address recipient)?
        ownership,
    TResult? Function(
            TransferDirection direction,
            String id,
            Address collection,
            Address sender,
            Address recipient,
            @amountJsonConverter BigInt count)?
        token,
  }) {
    return token?.call(direction, id, collection, sender, recipient, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransferDirection direction, String id, Address collection,
            Address sender, Address recipient)?
        ownership,
    TResult Function(
            TransferDirection direction,
            String id,
            Address collection,
            Address sender,
            Address recipient,
            @amountJsonConverter BigInt count)?
        token,
    required TResult orElse(),
  }) {
    if (token != null) {
      return token(direction, id, collection, sender, recipient, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NftOwnershipTransferEvent value) ownership,
    required TResult Function(NftTokenTransferEvent value) token,
  }) {
    return token(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NftOwnershipTransferEvent value)? ownership,
    TResult? Function(NftTokenTransferEvent value)? token,
  }) {
    return token?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftOwnershipTransferEvent value)? ownership,
    TResult Function(NftTokenTransferEvent value)? token,
    required TResult orElse(),
  }) {
    if (token != null) {
      return token(this);
    }
    return orElse();
  }
}

abstract class NftTokenTransferEvent implements NftTransferEvent {
  const factory NftTokenTransferEvent(
          {required final TransferDirection direction,
          required final String id,
          required final Address collection,
          required final Address sender,
          required final Address recipient,
          @amountJsonConverter required final BigInt count}) =
      _$NftTokenTransferEventImpl;

  @override
  TransferDirection get direction;
  @override
  String get id;
  @override
  Address get collection;
  @override
  Address get sender;
  @override
  Address get recipient;
  @amountJsonConverter
  BigInt get count;

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftTokenTransferEventImplCopyWith<_$NftTokenTransferEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
