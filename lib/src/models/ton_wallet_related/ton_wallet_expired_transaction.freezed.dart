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
  Address get address => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get expireAt => throw _privateConstructorUsedError;

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
  $Res call({Address address, DateTime date, DateTime expireAt});
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
    Object? address = freezed,
    Object? date = null,
    Object? expireAt = null,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
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
  $Res call({Address address, DateTime date, DateTime expireAt});
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
    Object? address = freezed,
    Object? date = null,
    Object? expireAt = null,
  }) {
    return _then(_$_TonWalletExpiredTransaction(
      address: freezed == address
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

class _$_TonWalletExpiredTransaction implements _TonWalletExpiredTransaction {
  const _$_TonWalletExpiredTransaction(
      {required this.address, required this.date, required this.expireAt});

  @override
  final Address address;
  @override
  final DateTime date;
  @override
  final DateTime expireAt;

  @override
  String toString() {
    return 'TonWalletExpiredTransaction(address: $address, date: $date, expireAt: $expireAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TonWalletExpiredTransaction &&
            const DeepCollectionEquality().equals(other.address, address) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.expireAt, expireAt) ||
                other.expireAt == expireAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(address), date, expireAt);

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
      required final DateTime expireAt}) = _$_TonWalletExpiredTransaction;

  @override
  Address get address;
  @override
  DateTime get date;
  @override
  DateTime get expireAt;
  @override
  @JsonKey(ignore: true)
  _$$_TonWalletExpiredTransactionCopyWith<_$_TonWalletExpiredTransaction>
      get copyWith => throw _privateConstructorUsedError;
}
