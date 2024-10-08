// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_transaction_with_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PendingTransactionWithData _$PendingTransactionWithDataFromJson(
    Map<String, dynamic> json) {
  return _PendingTransactionWithAdditionalInfo.fromJson(json);
}

/// @nodoc
mixin _$PendingTransactionWithData {
  PendingTransaction get transaction => throw _privateConstructorUsedError;
  Address get destination => throw _privateConstructorUsedError;
  @amountJsonConverter
  BigInt get amount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PendingTransactionWithData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingTransactionWithData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingTransactionWithDataCopyWith<PendingTransactionWithData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingTransactionWithDataCopyWith<$Res> {
  factory $PendingTransactionWithDataCopyWith(PendingTransactionWithData value,
          $Res Function(PendingTransactionWithData) then) =
      _$PendingTransactionWithDataCopyWithImpl<$Res,
          PendingTransactionWithData>;
  @useResult
  $Res call(
      {PendingTransaction transaction,
      Address destination,
      @amountJsonConverter BigInt amount,
      DateTime createdAt});

  $PendingTransactionCopyWith<$Res> get transaction;
  $AddressCopyWith<$Res> get destination;
}

/// @nodoc
class _$PendingTransactionWithDataCopyWithImpl<$Res,
        $Val extends PendingTransactionWithData>
    implements $PendingTransactionWithDataCopyWith<$Res> {
  _$PendingTransactionWithDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingTransactionWithData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? destination = null,
    Object? amount = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as PendingTransaction,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of PendingTransactionWithData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PendingTransactionCopyWith<$Res> get transaction {
    return $PendingTransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }

  /// Create a copy of PendingTransactionWithData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get destination {
    return $AddressCopyWith<$Res>(_value.destination, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PendingTransactionWithAdditionalInfoImplCopyWith<$Res>
    implements $PendingTransactionWithDataCopyWith<$Res> {
  factory _$$PendingTransactionWithAdditionalInfoImplCopyWith(
          _$PendingTransactionWithAdditionalInfoImpl value,
          $Res Function(_$PendingTransactionWithAdditionalInfoImpl) then) =
      __$$PendingTransactionWithAdditionalInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PendingTransaction transaction,
      Address destination,
      @amountJsonConverter BigInt amount,
      DateTime createdAt});

  @override
  $PendingTransactionCopyWith<$Res> get transaction;
  @override
  $AddressCopyWith<$Res> get destination;
}

/// @nodoc
class __$$PendingTransactionWithAdditionalInfoImplCopyWithImpl<$Res>
    extends _$PendingTransactionWithDataCopyWithImpl<$Res,
        _$PendingTransactionWithAdditionalInfoImpl>
    implements _$$PendingTransactionWithAdditionalInfoImplCopyWith<$Res> {
  __$$PendingTransactionWithAdditionalInfoImplCopyWithImpl(
      _$PendingTransactionWithAdditionalInfoImpl _value,
      $Res Function(_$PendingTransactionWithAdditionalInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PendingTransactionWithData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? destination = null,
    Object? amount = null,
    Object? createdAt = null,
  }) {
    return _then(_$PendingTransactionWithAdditionalInfoImpl(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as PendingTransaction,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingTransactionWithAdditionalInfoImpl
    extends _PendingTransactionWithAdditionalInfo {
  const _$PendingTransactionWithAdditionalInfoImpl(
      {required this.transaction,
      required this.destination,
      @amountJsonConverter required this.amount,
      required this.createdAt})
      : super._();

  factory _$PendingTransactionWithAdditionalInfoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PendingTransactionWithAdditionalInfoImplFromJson(json);

  @override
  final PendingTransaction transaction;
  @override
  final Address destination;
  @override
  @amountJsonConverter
  final BigInt amount;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'PendingTransactionWithData(transaction: $transaction, destination: $destination, amount: $amount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingTransactionWithAdditionalInfoImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, transaction, destination, amount, createdAt);

  /// Create a copy of PendingTransactionWithData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingTransactionWithAdditionalInfoImplCopyWith<
          _$PendingTransactionWithAdditionalInfoImpl>
      get copyWith => __$$PendingTransactionWithAdditionalInfoImplCopyWithImpl<
          _$PendingTransactionWithAdditionalInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingTransactionWithAdditionalInfoImplToJson(
      this,
    );
  }
}

abstract class _PendingTransactionWithAdditionalInfo
    extends PendingTransactionWithData {
  const factory _PendingTransactionWithAdditionalInfo(
          {required final PendingTransaction transaction,
          required final Address destination,
          @amountJsonConverter required final BigInt amount,
          required final DateTime createdAt}) =
      _$PendingTransactionWithAdditionalInfoImpl;
  const _PendingTransactionWithAdditionalInfo._() : super._();

  factory _PendingTransactionWithAdditionalInfo.fromJson(
          Map<String, dynamic> json) =
      _$PendingTransactionWithAdditionalInfoImpl.fromJson;

  @override
  PendingTransaction get transaction;
  @override
  Address get destination;
  @override
  @amountJsonConverter
  BigInt get amount;
  @override
  DateTime get createdAt;

  /// Create a copy of PendingTransactionWithData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingTransactionWithAdditionalInfoImplCopyWith<
          _$PendingTransactionWithAdditionalInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
