// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ton_wallet_expired_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TonWalletExpiredTransaction {
// address of wallet for which this transaction found
  Address get address; // creation date
  DateTime get date;
  DateTime get expireAt; // address for which tokens was sent
  Address get destination;
  @amountJsonConverter
  BigInt get amount;
  String get messageHash; // flag if this transaction was sent to this wallet
  bool get isIncoming;

  /// Create a copy of TonWalletExpiredTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TonWalletExpiredTransactionCopyWith<TonWalletExpiredTransaction>
      get copyWith => _$TonWalletExpiredTransactionCopyWithImpl<
              TonWalletExpiredTransaction>(
          this as TonWalletExpiredTransaction, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TonWalletExpiredTransaction &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.expireAt, expireAt) ||
                other.expireAt == expireAt) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.messageHash, messageHash) ||
                other.messageHash == messageHash) &&
            (identical(other.isIncoming, isIncoming) ||
                other.isIncoming == isIncoming));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, date, expireAt,
      destination, amount, messageHash, isIncoming);

  @override
  String toString() {
    return 'TonWalletExpiredTransaction(address: $address, date: $date, expireAt: $expireAt, destination: $destination, amount: $amount, messageHash: $messageHash, isIncoming: $isIncoming)';
  }
}

/// @nodoc
abstract mixin class $TonWalletExpiredTransactionCopyWith<$Res> {
  factory $TonWalletExpiredTransactionCopyWith(
          TonWalletExpiredTransaction value,
          $Res Function(TonWalletExpiredTransaction) _then) =
      _$TonWalletExpiredTransactionCopyWithImpl;
  @useResult
  $Res call(
      {Address address,
      DateTime date,
      DateTime expireAt,
      Address destination,
      @amountJsonConverter BigInt amount,
      String messageHash,
      bool isIncoming});

  $AddressCopyWith<$Res> get address;
  $AddressCopyWith<$Res> get destination;
}

/// @nodoc
class _$TonWalletExpiredTransactionCopyWithImpl<$Res>
    implements $TonWalletExpiredTransactionCopyWith<$Res> {
  _$TonWalletExpiredTransactionCopyWithImpl(this._self, this._then);

  final TonWalletExpiredTransaction _self;
  final $Res Function(TonWalletExpiredTransaction) _then;

  /// Create a copy of TonWalletExpiredTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? date = null,
    Object? expireAt = null,
    Object? destination = null,
    Object? amount = null,
    Object? messageHash = null,
    Object? isIncoming = null,
  }) {
    return _then(_self.copyWith(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expireAt: null == expireAt
          ? _self.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      destination: null == destination
          ? _self.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      messageHash: null == messageHash
          ? _self.messageHash
          : messageHash // ignore: cast_nullable_to_non_nullable
              as String,
      isIncoming: null == isIncoming
          ? _self.isIncoming
          : isIncoming // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of TonWalletExpiredTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of TonWalletExpiredTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get destination {
    return $AddressCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// @nodoc

class _TonWalletExpiredTransaction implements TonWalletExpiredTransaction {
  const _TonWalletExpiredTransaction(
      {required this.address,
      required this.date,
      required this.expireAt,
      required this.destination,
      @amountJsonConverter required this.amount,
      required this.messageHash,
      required this.isIncoming});

// address of wallet for which this transaction found
  @override
  final Address address;
// creation date
  @override
  final DateTime date;
  @override
  final DateTime expireAt;
// address for which tokens was sent
  @override
  final Address destination;
  @override
  @amountJsonConverter
  final BigInt amount;
  @override
  final String messageHash;
// flag if this transaction was sent to this wallet
  @override
  final bool isIncoming;

  /// Create a copy of TonWalletExpiredTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TonWalletExpiredTransactionCopyWith<_TonWalletExpiredTransaction>
      get copyWith => __$TonWalletExpiredTransactionCopyWithImpl<
          _TonWalletExpiredTransaction>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TonWalletExpiredTransaction &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.expireAt, expireAt) ||
                other.expireAt == expireAt) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.messageHash, messageHash) ||
                other.messageHash == messageHash) &&
            (identical(other.isIncoming, isIncoming) ||
                other.isIncoming == isIncoming));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, date, expireAt,
      destination, amount, messageHash, isIncoming);

  @override
  String toString() {
    return 'TonWalletExpiredTransaction(address: $address, date: $date, expireAt: $expireAt, destination: $destination, amount: $amount, messageHash: $messageHash, isIncoming: $isIncoming)';
  }
}

/// @nodoc
abstract mixin class _$TonWalletExpiredTransactionCopyWith<$Res>
    implements $TonWalletExpiredTransactionCopyWith<$Res> {
  factory _$TonWalletExpiredTransactionCopyWith(
          _TonWalletExpiredTransaction value,
          $Res Function(_TonWalletExpiredTransaction) _then) =
      __$TonWalletExpiredTransactionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Address address,
      DateTime date,
      DateTime expireAt,
      Address destination,
      @amountJsonConverter BigInt amount,
      String messageHash,
      bool isIncoming});

  @override
  $AddressCopyWith<$Res> get address;
  @override
  $AddressCopyWith<$Res> get destination;
}

/// @nodoc
class __$TonWalletExpiredTransactionCopyWithImpl<$Res>
    implements _$TonWalletExpiredTransactionCopyWith<$Res> {
  __$TonWalletExpiredTransactionCopyWithImpl(this._self, this._then);

  final _TonWalletExpiredTransaction _self;
  final $Res Function(_TonWalletExpiredTransaction) _then;

  /// Create a copy of TonWalletExpiredTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = null,
    Object? date = null,
    Object? expireAt = null,
    Object? destination = null,
    Object? amount = null,
    Object? messageHash = null,
    Object? isIncoming = null,
  }) {
    return _then(_TonWalletExpiredTransaction(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expireAt: null == expireAt
          ? _self.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      destination: null == destination
          ? _self.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      messageHash: null == messageHash
          ? _self.messageHash
          : messageHash // ignore: cast_nullable_to_non_nullable
              as String,
      isIncoming: null == isIncoming
          ? _self.isIncoming
          : isIncoming // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of TonWalletExpiredTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of TonWalletExpiredTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get destination {
    return $AddressCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

// dart format on
