// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ton_wallet_expired_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TonWalletExpiredTransaction {
// address of wallet for which this transaction found
  Address get address => throw _privateConstructorUsedError; // creation date
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get expireAt =>
      throw _privateConstructorUsedError; // address for which tokens was sent
  Address get destination => throw _privateConstructorUsedError;
  @amountJsonConverter
  BigInt get amount => throw _privateConstructorUsedError;
  String get messageHash =>
      throw _privateConstructorUsedError; // flag if this transaction was sent to this wallet
  bool get isIncoming => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TonWalletExpiredTransactionCopyWith<TonWalletExpiredTransaction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TonWalletExpiredTransactionCopyWith<$Res> {
  factory $TonWalletExpiredTransactionCopyWith(
          TonWalletExpiredTransaction value,
          $Res Function(TonWalletExpiredTransaction) then) =
      _$TonWalletExpiredTransactionCopyWithImpl<$Res,
          TonWalletExpiredTransaction>;
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
class _$TonWalletExpiredTransactionCopyWithImpl<$Res,
        $Val extends TonWalletExpiredTransaction>
    implements $TonWalletExpiredTransactionCopyWith<$Res> {
  _$TonWalletExpiredTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expireAt: null == expireAt
          ? _value.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      messageHash: null == messageHash
          ? _value.messageHash
          : messageHash // ignore: cast_nullable_to_non_nullable
              as String,
      isIncoming: null == isIncoming
          ? _value.isIncoming
          : isIncoming // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get destination {
    return $AddressCopyWith<$Res>(_value.destination, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TonWalletExpiredTransactionCopyWith<$Res>
    implements $TonWalletExpiredTransactionCopyWith<$Res> {
  factory _$$_TonWalletExpiredTransactionCopyWith(
          _$_TonWalletExpiredTransaction value,
          $Res Function(_$_TonWalletExpiredTransaction) then) =
      __$$_TonWalletExpiredTransactionCopyWithImpl<$Res>;
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
class __$$_TonWalletExpiredTransactionCopyWithImpl<$Res>
    extends _$TonWalletExpiredTransactionCopyWithImpl<$Res,
        _$_TonWalletExpiredTransaction>
    implements _$$_TonWalletExpiredTransactionCopyWith<$Res> {
  __$$_TonWalletExpiredTransactionCopyWithImpl(
      _$_TonWalletExpiredTransaction _value,
      $Res Function(_$_TonWalletExpiredTransaction) _then)
      : super(_value, _then);

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
    return _then(_$_TonWalletExpiredTransaction(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expireAt: null == expireAt
          ? _value.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      messageHash: null == messageHash
          ? _value.messageHash
          : messageHash // ignore: cast_nullable_to_non_nullable
              as String,
      isIncoming: null == isIncoming
          ? _value.isIncoming
          : isIncoming // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TonWalletExpiredTransaction implements _TonWalletExpiredTransaction {
  const _$_TonWalletExpiredTransaction(
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

  @override
  String toString() {
    return 'TonWalletExpiredTransaction(address: $address, date: $date, expireAt: $expireAt, destination: $destination, amount: $amount, messageHash: $messageHash, isIncoming: $isIncoming)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TonWalletExpiredTransaction &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TonWalletExpiredTransactionCopyWith<_$_TonWalletExpiredTransaction>
      get copyWith => __$$_TonWalletExpiredTransactionCopyWithImpl<
          _$_TonWalletExpiredTransaction>(this, _$identity);
}

abstract class _TonWalletExpiredTransaction
    implements TonWalletExpiredTransaction {
  const factory _TonWalletExpiredTransaction(
      {required final Address address,
      required final DateTime date,
      required final DateTime expireAt,
      required final Address destination,
      @amountJsonConverter required final BigInt amount,
      required final String messageHash,
      required final bool isIncoming}) = _$_TonWalletExpiredTransaction;

  @override // address of wallet for which this transaction found
  Address get address;
  @override // creation date
  DateTime get date;
  @override
  DateTime get expireAt;
  @override // address for which tokens was sent
  Address get destination;
  @override
  @amountJsonConverter
  BigInt get amount;
  @override
  String get messageHash;
  @override // flag if this transaction was sent to this wallet
  bool get isIncoming;
  @override
  @JsonKey(ignore: true)
  _$$_TonWalletExpiredTransactionCopyWith<_$_TonWalletExpiredTransaction>
      get copyWith => throw _privateConstructorUsedError;
}
