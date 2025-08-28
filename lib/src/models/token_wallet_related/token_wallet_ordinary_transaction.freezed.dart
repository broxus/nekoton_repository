// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_wallet_ordinary_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenWalletOrdinaryTransaction {
  String get lt;
  bool get isOutgoing;
  @amountJsonConverter
  BigInt get value;
  Address get address;
  @dateSecondsSinceEpochJsonConverter
  DateTime get date;
  @amountJsonConverter
  BigInt get fees;
  String get hash;
  String? get prevTransactionLt;
  TokenIncomingTransfer? get incomingTransfer;
  TokenOutgoingTransfer? get outgoingTransfer;
  TokenSwapBack? get swapBack;
  @amountJsonConverter
  BigInt? get accept;
  @amountJsonConverter
  BigInt? get transferBounced;
  @amountJsonConverter
  BigInt? get swapBackBounced;
  JettonIncomingTransfer? get jettonIncomingTransfer;
  JettonOutgoingTransfer? get jettonOutgoingTransfer;

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TokenWalletOrdinaryTransactionCopyWith<TokenWalletOrdinaryTransaction>
      get copyWith => _$TokenWalletOrdinaryTransactionCopyWithImpl<
              TokenWalletOrdinaryTransaction>(
          this as TokenWalletOrdinaryTransaction, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TokenWalletOrdinaryTransaction &&
            (identical(other.lt, lt) || other.lt == lt) &&
            (identical(other.isOutgoing, isOutgoing) ||
                other.isOutgoing == isOutgoing) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.prevTransactionLt, prevTransactionLt) ||
                other.prevTransactionLt == prevTransactionLt) &&
            (identical(other.incomingTransfer, incomingTransfer) ||
                other.incomingTransfer == incomingTransfer) &&
            (identical(other.outgoingTransfer, outgoingTransfer) ||
                other.outgoingTransfer == outgoingTransfer) &&
            (identical(other.swapBack, swapBack) ||
                other.swapBack == swapBack) &&
            (identical(other.accept, accept) || other.accept == accept) &&
            (identical(other.transferBounced, transferBounced) ||
                other.transferBounced == transferBounced) &&
            (identical(other.swapBackBounced, swapBackBounced) ||
                other.swapBackBounced == swapBackBounced) &&
            (identical(other.jettonIncomingTransfer, jettonIncomingTransfer) ||
                other.jettonIncomingTransfer == jettonIncomingTransfer) &&
            (identical(other.jettonOutgoingTransfer, jettonOutgoingTransfer) ||
                other.jettonOutgoingTransfer == jettonOutgoingTransfer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      lt,
      isOutgoing,
      value,
      address,
      date,
      fees,
      hash,
      prevTransactionLt,
      incomingTransfer,
      outgoingTransfer,
      swapBack,
      accept,
      transferBounced,
      swapBackBounced,
      jettonIncomingTransfer,
      jettonOutgoingTransfer);

  @override
  String toString() {
    return 'TokenWalletOrdinaryTransaction(lt: $lt, isOutgoing: $isOutgoing, value: $value, address: $address, date: $date, fees: $fees, hash: $hash, prevTransactionLt: $prevTransactionLt, incomingTransfer: $incomingTransfer, outgoingTransfer: $outgoingTransfer, swapBack: $swapBack, accept: $accept, transferBounced: $transferBounced, swapBackBounced: $swapBackBounced, jettonIncomingTransfer: $jettonIncomingTransfer, jettonOutgoingTransfer: $jettonOutgoingTransfer)';
  }
}

/// @nodoc
abstract mixin class $TokenWalletOrdinaryTransactionCopyWith<$Res> {
  factory $TokenWalletOrdinaryTransactionCopyWith(
          TokenWalletOrdinaryTransaction value,
          $Res Function(TokenWalletOrdinaryTransaction) _then) =
      _$TokenWalletOrdinaryTransactionCopyWithImpl;
  @useResult
  $Res call(
      {String lt,
      bool isOutgoing,
      @amountJsonConverter BigInt value,
      Address address,
      @dateSecondsSinceEpochJsonConverter DateTime date,
      @amountJsonConverter BigInt fees,
      String hash,
      String? prevTransactionLt,
      TokenIncomingTransfer? incomingTransfer,
      TokenOutgoingTransfer? outgoingTransfer,
      TokenSwapBack? swapBack,
      @amountJsonConverter BigInt? accept,
      @amountJsonConverter BigInt? transferBounced,
      @amountJsonConverter BigInt? swapBackBounced,
      JettonIncomingTransfer? jettonIncomingTransfer,
      JettonOutgoingTransfer? jettonOutgoingTransfer});

  $AddressCopyWith<$Res> get address;
  $TokenIncomingTransferCopyWith<$Res>? get incomingTransfer;
  $TokenOutgoingTransferCopyWith<$Res>? get outgoingTransfer;
  $TokenSwapBackCopyWith<$Res>? get swapBack;
  $JettonIncomingTransferCopyWith<$Res>? get jettonIncomingTransfer;
  $JettonOutgoingTransferCopyWith<$Res>? get jettonOutgoingTransfer;
}

/// @nodoc
class _$TokenWalletOrdinaryTransactionCopyWithImpl<$Res>
    implements $TokenWalletOrdinaryTransactionCopyWith<$Res> {
  _$TokenWalletOrdinaryTransactionCopyWithImpl(this._self, this._then);

  final TokenWalletOrdinaryTransaction _self;
  final $Res Function(TokenWalletOrdinaryTransaction) _then;

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lt = null,
    Object? isOutgoing = null,
    Object? value = null,
    Object? address = null,
    Object? date = null,
    Object? fees = null,
    Object? hash = null,
    Object? prevTransactionLt = freezed,
    Object? incomingTransfer = freezed,
    Object? outgoingTransfer = freezed,
    Object? swapBack = freezed,
    Object? accept = freezed,
    Object? transferBounced = freezed,
    Object? swapBackBounced = freezed,
    Object? jettonIncomingTransfer = freezed,
    Object? jettonOutgoingTransfer = freezed,
  }) {
    return _then(_self.copyWith(
      lt: null == lt
          ? _self.lt
          : lt // ignore: cast_nullable_to_non_nullable
              as String,
      isOutgoing: null == isOutgoing
          ? _self.isOutgoing
          : isOutgoing // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as BigInt,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fees: null == fees
          ? _self.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as BigInt,
      hash: null == hash
          ? _self.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      prevTransactionLt: freezed == prevTransactionLt
          ? _self.prevTransactionLt
          : prevTransactionLt // ignore: cast_nullable_to_non_nullable
              as String?,
      incomingTransfer: freezed == incomingTransfer
          ? _self.incomingTransfer
          : incomingTransfer // ignore: cast_nullable_to_non_nullable
              as TokenIncomingTransfer?,
      outgoingTransfer: freezed == outgoingTransfer
          ? _self.outgoingTransfer
          : outgoingTransfer // ignore: cast_nullable_to_non_nullable
              as TokenOutgoingTransfer?,
      swapBack: freezed == swapBack
          ? _self.swapBack
          : swapBack // ignore: cast_nullable_to_non_nullable
              as TokenSwapBack?,
      accept: freezed == accept
          ? _self.accept
          : accept // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      transferBounced: freezed == transferBounced
          ? _self.transferBounced
          : transferBounced // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      swapBackBounced: freezed == swapBackBounced
          ? _self.swapBackBounced
          : swapBackBounced // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      jettonIncomingTransfer: freezed == jettonIncomingTransfer
          ? _self.jettonIncomingTransfer
          : jettonIncomingTransfer // ignore: cast_nullable_to_non_nullable
              as JettonIncomingTransfer?,
      jettonOutgoingTransfer: freezed == jettonOutgoingTransfer
          ? _self.jettonOutgoingTransfer
          : jettonOutgoingTransfer // ignore: cast_nullable_to_non_nullable
              as JettonOutgoingTransfer?,
    ));
  }

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenIncomingTransferCopyWith<$Res>? get incomingTransfer {
    if (_self.incomingTransfer == null) {
      return null;
    }

    return $TokenIncomingTransferCopyWith<$Res>(_self.incomingTransfer!,
        (value) {
      return _then(_self.copyWith(incomingTransfer: value));
    });
  }

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenOutgoingTransferCopyWith<$Res>? get outgoingTransfer {
    if (_self.outgoingTransfer == null) {
      return null;
    }

    return $TokenOutgoingTransferCopyWith<$Res>(_self.outgoingTransfer!,
        (value) {
      return _then(_self.copyWith(outgoingTransfer: value));
    });
  }

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenSwapBackCopyWith<$Res>? get swapBack {
    if (_self.swapBack == null) {
      return null;
    }

    return $TokenSwapBackCopyWith<$Res>(_self.swapBack!, (value) {
      return _then(_self.copyWith(swapBack: value));
    });
  }

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JettonIncomingTransferCopyWith<$Res>? get jettonIncomingTransfer {
    if (_self.jettonIncomingTransfer == null) {
      return null;
    }

    return $JettonIncomingTransferCopyWith<$Res>(_self.jettonIncomingTransfer!,
        (value) {
      return _then(_self.copyWith(jettonIncomingTransfer: value));
    });
  }

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JettonOutgoingTransferCopyWith<$Res>? get jettonOutgoingTransfer {
    if (_self.jettonOutgoingTransfer == null) {
      return null;
    }

    return $JettonOutgoingTransferCopyWith<$Res>(_self.jettonOutgoingTransfer!,
        (value) {
      return _then(_self.copyWith(jettonOutgoingTransfer: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TokenWalletOrdinaryTransaction].
extension TokenWalletOrdinaryTransactionPatterns
    on TokenWalletOrdinaryTransaction {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TokenWalletOrdinaryTransaction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TokenWalletOrdinaryTransaction() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_TokenWalletOrdinaryTransaction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TokenWalletOrdinaryTransaction():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TokenWalletOrdinaryTransaction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TokenWalletOrdinaryTransaction() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String lt,
            bool isOutgoing,
            @amountJsonConverter BigInt value,
            Address address,
            @dateSecondsSinceEpochJsonConverter DateTime date,
            @amountJsonConverter BigInt fees,
            String hash,
            String? prevTransactionLt,
            TokenIncomingTransfer? incomingTransfer,
            TokenOutgoingTransfer? outgoingTransfer,
            TokenSwapBack? swapBack,
            @amountJsonConverter BigInt? accept,
            @amountJsonConverter BigInt? transferBounced,
            @amountJsonConverter BigInt? swapBackBounced,
            JettonIncomingTransfer? jettonIncomingTransfer,
            JettonOutgoingTransfer? jettonOutgoingTransfer)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TokenWalletOrdinaryTransaction() when $default != null:
        return $default(
            _that.lt,
            _that.isOutgoing,
            _that.value,
            _that.address,
            _that.date,
            _that.fees,
            _that.hash,
            _that.prevTransactionLt,
            _that.incomingTransfer,
            _that.outgoingTransfer,
            _that.swapBack,
            _that.accept,
            _that.transferBounced,
            _that.swapBackBounced,
            _that.jettonIncomingTransfer,
            _that.jettonOutgoingTransfer);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            String lt,
            bool isOutgoing,
            @amountJsonConverter BigInt value,
            Address address,
            @dateSecondsSinceEpochJsonConverter DateTime date,
            @amountJsonConverter BigInt fees,
            String hash,
            String? prevTransactionLt,
            TokenIncomingTransfer? incomingTransfer,
            TokenOutgoingTransfer? outgoingTransfer,
            TokenSwapBack? swapBack,
            @amountJsonConverter BigInt? accept,
            @amountJsonConverter BigInt? transferBounced,
            @amountJsonConverter BigInt? swapBackBounced,
            JettonIncomingTransfer? jettonIncomingTransfer,
            JettonOutgoingTransfer? jettonOutgoingTransfer)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TokenWalletOrdinaryTransaction():
        return $default(
            _that.lt,
            _that.isOutgoing,
            _that.value,
            _that.address,
            _that.date,
            _that.fees,
            _that.hash,
            _that.prevTransactionLt,
            _that.incomingTransfer,
            _that.outgoingTransfer,
            _that.swapBack,
            _that.accept,
            _that.transferBounced,
            _that.swapBackBounced,
            _that.jettonIncomingTransfer,
            _that.jettonOutgoingTransfer);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String lt,
            bool isOutgoing,
            @amountJsonConverter BigInt value,
            Address address,
            @dateSecondsSinceEpochJsonConverter DateTime date,
            @amountJsonConverter BigInt fees,
            String hash,
            String? prevTransactionLt,
            TokenIncomingTransfer? incomingTransfer,
            TokenOutgoingTransfer? outgoingTransfer,
            TokenSwapBack? swapBack,
            @amountJsonConverter BigInt? accept,
            @amountJsonConverter BigInt? transferBounced,
            @amountJsonConverter BigInt? swapBackBounced,
            JettonIncomingTransfer? jettonIncomingTransfer,
            JettonOutgoingTransfer? jettonOutgoingTransfer)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TokenWalletOrdinaryTransaction() when $default != null:
        return $default(
            _that.lt,
            _that.isOutgoing,
            _that.value,
            _that.address,
            _that.date,
            _that.fees,
            _that.hash,
            _that.prevTransactionLt,
            _that.incomingTransfer,
            _that.outgoingTransfer,
            _that.swapBack,
            _that.accept,
            _that.transferBounced,
            _that.swapBackBounced,
            _that.jettonIncomingTransfer,
            _that.jettonOutgoingTransfer);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TokenWalletOrdinaryTransaction
    implements TokenWalletOrdinaryTransaction {
  const _TokenWalletOrdinaryTransaction(
      {required this.lt,
      required this.isOutgoing,
      @amountJsonConverter required this.value,
      required this.address,
      @dateSecondsSinceEpochJsonConverter required this.date,
      @amountJsonConverter required this.fees,
      required this.hash,
      this.prevTransactionLt,
      this.incomingTransfer,
      this.outgoingTransfer,
      this.swapBack,
      @amountJsonConverter this.accept,
      @amountJsonConverter this.transferBounced,
      @amountJsonConverter this.swapBackBounced,
      this.jettonIncomingTransfer,
      this.jettonOutgoingTransfer});

  @override
  final String lt;
  @override
  final bool isOutgoing;
  @override
  @amountJsonConverter
  final BigInt value;
  @override
  final Address address;
  @override
  @dateSecondsSinceEpochJsonConverter
  final DateTime date;
  @override
  @amountJsonConverter
  final BigInt fees;
  @override
  final String hash;
  @override
  final String? prevTransactionLt;
  @override
  final TokenIncomingTransfer? incomingTransfer;
  @override
  final TokenOutgoingTransfer? outgoingTransfer;
  @override
  final TokenSwapBack? swapBack;
  @override
  @amountJsonConverter
  final BigInt? accept;
  @override
  @amountJsonConverter
  final BigInt? transferBounced;
  @override
  @amountJsonConverter
  final BigInt? swapBackBounced;
  @override
  final JettonIncomingTransfer? jettonIncomingTransfer;
  @override
  final JettonOutgoingTransfer? jettonOutgoingTransfer;

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TokenWalletOrdinaryTransactionCopyWith<_TokenWalletOrdinaryTransaction>
      get copyWith => __$TokenWalletOrdinaryTransactionCopyWithImpl<
          _TokenWalletOrdinaryTransaction>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TokenWalletOrdinaryTransaction &&
            (identical(other.lt, lt) || other.lt == lt) &&
            (identical(other.isOutgoing, isOutgoing) ||
                other.isOutgoing == isOutgoing) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.prevTransactionLt, prevTransactionLt) ||
                other.prevTransactionLt == prevTransactionLt) &&
            (identical(other.incomingTransfer, incomingTransfer) ||
                other.incomingTransfer == incomingTransfer) &&
            (identical(other.outgoingTransfer, outgoingTransfer) ||
                other.outgoingTransfer == outgoingTransfer) &&
            (identical(other.swapBack, swapBack) ||
                other.swapBack == swapBack) &&
            (identical(other.accept, accept) || other.accept == accept) &&
            (identical(other.transferBounced, transferBounced) ||
                other.transferBounced == transferBounced) &&
            (identical(other.swapBackBounced, swapBackBounced) ||
                other.swapBackBounced == swapBackBounced) &&
            (identical(other.jettonIncomingTransfer, jettonIncomingTransfer) ||
                other.jettonIncomingTransfer == jettonIncomingTransfer) &&
            (identical(other.jettonOutgoingTransfer, jettonOutgoingTransfer) ||
                other.jettonOutgoingTransfer == jettonOutgoingTransfer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      lt,
      isOutgoing,
      value,
      address,
      date,
      fees,
      hash,
      prevTransactionLt,
      incomingTransfer,
      outgoingTransfer,
      swapBack,
      accept,
      transferBounced,
      swapBackBounced,
      jettonIncomingTransfer,
      jettonOutgoingTransfer);

  @override
  String toString() {
    return 'TokenWalletOrdinaryTransaction(lt: $lt, isOutgoing: $isOutgoing, value: $value, address: $address, date: $date, fees: $fees, hash: $hash, prevTransactionLt: $prevTransactionLt, incomingTransfer: $incomingTransfer, outgoingTransfer: $outgoingTransfer, swapBack: $swapBack, accept: $accept, transferBounced: $transferBounced, swapBackBounced: $swapBackBounced, jettonIncomingTransfer: $jettonIncomingTransfer, jettonOutgoingTransfer: $jettonOutgoingTransfer)';
  }
}

/// @nodoc
abstract mixin class _$TokenWalletOrdinaryTransactionCopyWith<$Res>
    implements $TokenWalletOrdinaryTransactionCopyWith<$Res> {
  factory _$TokenWalletOrdinaryTransactionCopyWith(
          _TokenWalletOrdinaryTransaction value,
          $Res Function(_TokenWalletOrdinaryTransaction) _then) =
      __$TokenWalletOrdinaryTransactionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String lt,
      bool isOutgoing,
      @amountJsonConverter BigInt value,
      Address address,
      @dateSecondsSinceEpochJsonConverter DateTime date,
      @amountJsonConverter BigInt fees,
      String hash,
      String? prevTransactionLt,
      TokenIncomingTransfer? incomingTransfer,
      TokenOutgoingTransfer? outgoingTransfer,
      TokenSwapBack? swapBack,
      @amountJsonConverter BigInt? accept,
      @amountJsonConverter BigInt? transferBounced,
      @amountJsonConverter BigInt? swapBackBounced,
      JettonIncomingTransfer? jettonIncomingTransfer,
      JettonOutgoingTransfer? jettonOutgoingTransfer});

  @override
  $AddressCopyWith<$Res> get address;
  @override
  $TokenIncomingTransferCopyWith<$Res>? get incomingTransfer;
  @override
  $TokenOutgoingTransferCopyWith<$Res>? get outgoingTransfer;
  @override
  $TokenSwapBackCopyWith<$Res>? get swapBack;
  @override
  $JettonIncomingTransferCopyWith<$Res>? get jettonIncomingTransfer;
  @override
  $JettonOutgoingTransferCopyWith<$Res>? get jettonOutgoingTransfer;
}

/// @nodoc
class __$TokenWalletOrdinaryTransactionCopyWithImpl<$Res>
    implements _$TokenWalletOrdinaryTransactionCopyWith<$Res> {
  __$TokenWalletOrdinaryTransactionCopyWithImpl(this._self, this._then);

  final _TokenWalletOrdinaryTransaction _self;
  final $Res Function(_TokenWalletOrdinaryTransaction) _then;

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lt = null,
    Object? isOutgoing = null,
    Object? value = null,
    Object? address = null,
    Object? date = null,
    Object? fees = null,
    Object? hash = null,
    Object? prevTransactionLt = freezed,
    Object? incomingTransfer = freezed,
    Object? outgoingTransfer = freezed,
    Object? swapBack = freezed,
    Object? accept = freezed,
    Object? transferBounced = freezed,
    Object? swapBackBounced = freezed,
    Object? jettonIncomingTransfer = freezed,
    Object? jettonOutgoingTransfer = freezed,
  }) {
    return _then(_TokenWalletOrdinaryTransaction(
      lt: null == lt
          ? _self.lt
          : lt // ignore: cast_nullable_to_non_nullable
              as String,
      isOutgoing: null == isOutgoing
          ? _self.isOutgoing
          : isOutgoing // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as BigInt,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fees: null == fees
          ? _self.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as BigInt,
      hash: null == hash
          ? _self.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      prevTransactionLt: freezed == prevTransactionLt
          ? _self.prevTransactionLt
          : prevTransactionLt // ignore: cast_nullable_to_non_nullable
              as String?,
      incomingTransfer: freezed == incomingTransfer
          ? _self.incomingTransfer
          : incomingTransfer // ignore: cast_nullable_to_non_nullable
              as TokenIncomingTransfer?,
      outgoingTransfer: freezed == outgoingTransfer
          ? _self.outgoingTransfer
          : outgoingTransfer // ignore: cast_nullable_to_non_nullable
              as TokenOutgoingTransfer?,
      swapBack: freezed == swapBack
          ? _self.swapBack
          : swapBack // ignore: cast_nullable_to_non_nullable
              as TokenSwapBack?,
      accept: freezed == accept
          ? _self.accept
          : accept // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      transferBounced: freezed == transferBounced
          ? _self.transferBounced
          : transferBounced // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      swapBackBounced: freezed == swapBackBounced
          ? _self.swapBackBounced
          : swapBackBounced // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      jettonIncomingTransfer: freezed == jettonIncomingTransfer
          ? _self.jettonIncomingTransfer
          : jettonIncomingTransfer // ignore: cast_nullable_to_non_nullable
              as JettonIncomingTransfer?,
      jettonOutgoingTransfer: freezed == jettonOutgoingTransfer
          ? _self.jettonOutgoingTransfer
          : jettonOutgoingTransfer // ignore: cast_nullable_to_non_nullable
              as JettonOutgoingTransfer?,
    ));
  }

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenIncomingTransferCopyWith<$Res>? get incomingTransfer {
    if (_self.incomingTransfer == null) {
      return null;
    }

    return $TokenIncomingTransferCopyWith<$Res>(_self.incomingTransfer!,
        (value) {
      return _then(_self.copyWith(incomingTransfer: value));
    });
  }

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenOutgoingTransferCopyWith<$Res>? get outgoingTransfer {
    if (_self.outgoingTransfer == null) {
      return null;
    }

    return $TokenOutgoingTransferCopyWith<$Res>(_self.outgoingTransfer!,
        (value) {
      return _then(_self.copyWith(outgoingTransfer: value));
    });
  }

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenSwapBackCopyWith<$Res>? get swapBack {
    if (_self.swapBack == null) {
      return null;
    }

    return $TokenSwapBackCopyWith<$Res>(_self.swapBack!, (value) {
      return _then(_self.copyWith(swapBack: value));
    });
  }

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JettonIncomingTransferCopyWith<$Res>? get jettonIncomingTransfer {
    if (_self.jettonIncomingTransfer == null) {
      return null;
    }

    return $JettonIncomingTransferCopyWith<$Res>(_self.jettonIncomingTransfer!,
        (value) {
      return _then(_self.copyWith(jettonIncomingTransfer: value));
    });
  }

  /// Create a copy of TokenWalletOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JettonOutgoingTransferCopyWith<$Res>? get jettonOutgoingTransfer {
    if (_self.jettonOutgoingTransfer == null) {
      return null;
    }

    return $JettonOutgoingTransferCopyWith<$Res>(_self.jettonOutgoingTransfer!,
        (value) {
      return _then(_self.copyWith(jettonOutgoingTransfer: value));
    });
  }
}

// dart format on
