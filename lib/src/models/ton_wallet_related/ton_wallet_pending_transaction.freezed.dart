// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ton_wallet_pending_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TonWalletPendingTransaction {
  Address get address => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get expireAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TonWalletPendingTransactionCopyWith<TonWalletPendingTransaction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TonWalletPendingTransactionCopyWith<$Res> {
  factory $TonWalletPendingTransactionCopyWith(
          TonWalletPendingTransaction value,
          $Res Function(TonWalletPendingTransaction) then) =
      _$TonWalletPendingTransactionCopyWithImpl<$Res,
          TonWalletPendingTransaction>;
  @useResult
  $Res call({Address address, DateTime date, DateTime expireAt});

  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class _$TonWalletPendingTransactionCopyWithImpl<$Res,
        $Val extends TonWalletPendingTransaction>
    implements $TonWalletPendingTransactionCopyWith<$Res> {
  _$TonWalletPendingTransactionCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TonWalletPendingTransactionCopyWith<$Res>
    implements $TonWalletPendingTransactionCopyWith<$Res> {
  factory _$$_TonWalletPendingTransactionCopyWith(
          _$_TonWalletPendingTransaction value,
          $Res Function(_$_TonWalletPendingTransaction) then) =
      __$$_TonWalletPendingTransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Address address, DateTime date, DateTime expireAt});

  @override
  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class __$$_TonWalletPendingTransactionCopyWithImpl<$Res>
    extends _$TonWalletPendingTransactionCopyWithImpl<$Res,
        _$_TonWalletPendingTransaction>
    implements _$$_TonWalletPendingTransactionCopyWith<$Res> {
  __$$_TonWalletPendingTransactionCopyWithImpl(
      _$_TonWalletPendingTransaction _value,
      $Res Function(_$_TonWalletPendingTransaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? date = null,
    Object? expireAt = null,
  }) {
    return _then(_$_TonWalletPendingTransaction(
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
    ));
  }
}

/// @nodoc

class _$_TonWalletPendingTransaction implements _TonWalletPendingTransaction {
  const _$_TonWalletPendingTransaction(
      {required this.address, required this.date, required this.expireAt});

  @override
  final Address address;
  @override
  final DateTime date;
  @override
  final DateTime expireAt;

  @override
  String toString() {
    return 'TonWalletPendingTransaction(address: $address, date: $date, expireAt: $expireAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TonWalletPendingTransaction &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.expireAt, expireAt) ||
                other.expireAt == expireAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, date, expireAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TonWalletPendingTransactionCopyWith<_$_TonWalletPendingTransaction>
      get copyWith => __$$_TonWalletPendingTransactionCopyWithImpl<
          _$_TonWalletPendingTransaction>(this, _$identity);
}

abstract class _TonWalletPendingTransaction
    implements TonWalletPendingTransaction {
  const factory _TonWalletPendingTransaction(
      {required final Address address,
      required final DateTime date,
      required final DateTime expireAt}) = _$_TonWalletPendingTransaction;

  @override
  Address get address;
  @override
  DateTime get date;
  @override
  DateTime get expireAt;
  @override
  @JsonKey(ignore: true)
  _$$_TonWalletPendingTransactionCopyWith<_$_TonWalletPendingTransaction>
      get copyWith => throw _privateConstructorUsedError;
}
