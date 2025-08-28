// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_transfer_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NftTransferEvent {
  TransferDirection get direction;
  String get id;
  Address get collection;
  Address get sender;
  Address get recipient;

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftTransferEventCopyWith<NftTransferEvent> get copyWith =>
      _$NftTransferEventCopyWithImpl<NftTransferEvent>(
          this as NftTransferEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NftTransferEvent &&
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

  @override
  String toString() {
    return 'NftTransferEvent(direction: $direction, id: $id, collection: $collection, sender: $sender, recipient: $recipient)';
  }
}

/// @nodoc
abstract mixin class $NftTransferEventCopyWith<$Res> {
  factory $NftTransferEventCopyWith(
          NftTransferEvent value, $Res Function(NftTransferEvent) _then) =
      _$NftTransferEventCopyWithImpl;
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
class _$NftTransferEventCopyWithImpl<$Res>
    implements $NftTransferEventCopyWith<$Res> {
  _$NftTransferEventCopyWithImpl(this._self, this._then);

  final NftTransferEvent _self;
  final $Res Function(NftTransferEvent) _then;

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
    return _then(_self.copyWith(
      direction: null == direction
          ? _self.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as TransferDirection,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      sender: null == sender
          ? _self.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Address,
      recipient: null == recipient
          ? _self.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_self.collection, (value) {
      return _then(_self.copyWith(collection: value));
    });
  }

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get sender {
    return $AddressCopyWith<$Res>(_self.sender, (value) {
      return _then(_self.copyWith(sender: value));
    });
  }

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get recipient {
    return $AddressCopyWith<$Res>(_self.recipient, (value) {
      return _then(_self.copyWith(recipient: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NftTransferEvent].
extension NftTransferEventPatterns on NftTransferEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftOwnershipTransferEvent value)? ownership,
    TResult Function(NftTokenTransferEvent value)? token,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NftOwnershipTransferEvent() when ownership != null:
        return ownership(_that);
      case NftTokenTransferEvent() when token != null:
        return token(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NftOwnershipTransferEvent value) ownership,
    required TResult Function(NftTokenTransferEvent value) token,
  }) {
    final _that = this;
    switch (_that) {
      case NftOwnershipTransferEvent():
        return ownership(_that);
      case NftTokenTransferEvent():
        return token(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NftOwnershipTransferEvent value)? ownership,
    TResult? Function(NftTokenTransferEvent value)? token,
  }) {
    final _that = this;
    switch (_that) {
      case NftOwnershipTransferEvent() when ownership != null:
        return ownership(_that);
      case NftTokenTransferEvent() when token != null:
        return token(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case NftOwnershipTransferEvent() when ownership != null:
        return ownership(_that.direction, _that.id, _that.collection,
            _that.sender, _that.recipient);
      case NftTokenTransferEvent() when token != null:
        return token(_that.direction, _that.id, _that.collection, _that.sender,
            _that.recipient, _that.count);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case NftOwnershipTransferEvent():
        return ownership(_that.direction, _that.id, _that.collection,
            _that.sender, _that.recipient);
      case NftTokenTransferEvent():
        return token(_that.direction, _that.id, _that.collection, _that.sender,
            _that.recipient, _that.count);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case NftOwnershipTransferEvent() when ownership != null:
        return ownership(_that.direction, _that.id, _that.collection,
            _that.sender, _that.recipient);
      case NftTokenTransferEvent() when token != null:
        return token(_that.direction, _that.id, _that.collection, _that.sender,
            _that.recipient, _that.count);
      case _:
        return null;
    }
  }
}

/// @nodoc

class NftOwnershipTransferEvent implements NftTransferEvent {
  const NftOwnershipTransferEvent(
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

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftOwnershipTransferEventCopyWith<NftOwnershipTransferEvent> get copyWith =>
      _$NftOwnershipTransferEventCopyWithImpl<NftOwnershipTransferEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NftOwnershipTransferEvent &&
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

  @override
  String toString() {
    return 'NftTransferEvent.ownership(direction: $direction, id: $id, collection: $collection, sender: $sender, recipient: $recipient)';
  }
}

/// @nodoc
abstract mixin class $NftOwnershipTransferEventCopyWith<$Res>
    implements $NftTransferEventCopyWith<$Res> {
  factory $NftOwnershipTransferEventCopyWith(NftOwnershipTransferEvent value,
          $Res Function(NftOwnershipTransferEvent) _then) =
      _$NftOwnershipTransferEventCopyWithImpl;
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
class _$NftOwnershipTransferEventCopyWithImpl<$Res>
    implements $NftOwnershipTransferEventCopyWith<$Res> {
  _$NftOwnershipTransferEventCopyWithImpl(this._self, this._then);

  final NftOwnershipTransferEvent _self;
  final $Res Function(NftOwnershipTransferEvent) _then;

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? direction = null,
    Object? id = null,
    Object? collection = null,
    Object? sender = null,
    Object? recipient = null,
  }) {
    return _then(NftOwnershipTransferEvent(
      direction: null == direction
          ? _self.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as TransferDirection,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      sender: null == sender
          ? _self.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Address,
      recipient: null == recipient
          ? _self.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_self.collection, (value) {
      return _then(_self.copyWith(collection: value));
    });
  }

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get sender {
    return $AddressCopyWith<$Res>(_self.sender, (value) {
      return _then(_self.copyWith(sender: value));
    });
  }

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get recipient {
    return $AddressCopyWith<$Res>(_self.recipient, (value) {
      return _then(_self.copyWith(recipient: value));
    });
  }
}

/// @nodoc

class NftTokenTransferEvent implements NftTransferEvent {
  const NftTokenTransferEvent(
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
  @amountJsonConverter
  final BigInt count;

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftTokenTransferEventCopyWith<NftTokenTransferEvent> get copyWith =>
      _$NftTokenTransferEventCopyWithImpl<NftTokenTransferEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NftTokenTransferEvent &&
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

  @override
  String toString() {
    return 'NftTransferEvent.token(direction: $direction, id: $id, collection: $collection, sender: $sender, recipient: $recipient, count: $count)';
  }
}

/// @nodoc
abstract mixin class $NftTokenTransferEventCopyWith<$Res>
    implements $NftTransferEventCopyWith<$Res> {
  factory $NftTokenTransferEventCopyWith(NftTokenTransferEvent value,
          $Res Function(NftTokenTransferEvent) _then) =
      _$NftTokenTransferEventCopyWithImpl;
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
class _$NftTokenTransferEventCopyWithImpl<$Res>
    implements $NftTokenTransferEventCopyWith<$Res> {
  _$NftTokenTransferEventCopyWithImpl(this._self, this._then);

  final NftTokenTransferEvent _self;
  final $Res Function(NftTokenTransferEvent) _then;

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? direction = null,
    Object? id = null,
    Object? collection = null,
    Object? sender = null,
    Object? recipient = null,
    Object? count = null,
  }) {
    return _then(NftTokenTransferEvent(
      direction: null == direction
          ? _self.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as TransferDirection,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
      sender: null == sender
          ? _self.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Address,
      recipient: null == recipient
          ? _self.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as Address,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_self.collection, (value) {
      return _then(_self.copyWith(collection: value));
    });
  }

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get sender {
    return $AddressCopyWith<$Res>(_self.sender, (value) {
      return _then(_self.copyWith(sender: value));
    });
  }

  /// Create a copy of NftTransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get recipient {
    return $AddressCopyWith<$Res>(_self.recipient, (value) {
      return _then(_self.copyWith(recipient: value));
    });
  }
}

// dart format on
