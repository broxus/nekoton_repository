// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_transaction_with_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
PendingTransactionWithData _$PendingTransactionWithDataFromJson(
    Map<String, dynamic> json) {
  return _PendingTransactionWithAdditionalInfo.fromJson(json);
}

/// @nodoc
mixin _$PendingTransactionWithData {
  PendingTransaction get transaction;
  Address get destination;
  BigInt get amount;
  DateTime get createdAt;

  /// Create a copy of PendingTransactionWithData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PendingTransactionWithDataCopyWith<PendingTransactionWithData>
      get copyWith =>
          _$PendingTransactionWithDataCopyWithImpl<PendingTransactionWithData>(
              this as PendingTransactionWithData, _$identity);

  /// Serializes this PendingTransactionWithData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PendingTransactionWithData &&
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

  @override
  String toString() {
    return 'PendingTransactionWithData(transaction: $transaction, destination: $destination, amount: $amount, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $PendingTransactionWithDataCopyWith<$Res> {
  factory $PendingTransactionWithDataCopyWith(PendingTransactionWithData value,
          $Res Function(PendingTransactionWithData) _then) =
      _$PendingTransactionWithDataCopyWithImpl;
  @useResult
  $Res call(
      {PendingTransaction transaction,
      Address destination,
      BigInt amount,
      DateTime createdAt});

  $PendingTransactionCopyWith<$Res> get transaction;
  $AddressCopyWith<$Res> get destination;
}

/// @nodoc
class _$PendingTransactionWithDataCopyWithImpl<$Res>
    implements $PendingTransactionWithDataCopyWith<$Res> {
  _$PendingTransactionWithDataCopyWithImpl(this._self, this._then);

  final PendingTransactionWithData _self;
  final $Res Function(PendingTransactionWithData) _then;

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
    return _then(_self.copyWith(
      transaction: null == transaction
          ? _self.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as PendingTransaction,
      destination: null == destination
          ? _self.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of PendingTransactionWithData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PendingTransactionCopyWith<$Res> get transaction {
    return $PendingTransactionCopyWith<$Res>(_self.transaction, (value) {
      return _then(_self.copyWith(transaction: value));
    });
  }

  /// Create a copy of PendingTransactionWithData
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
@JsonSerializable()
class _PendingTransactionWithAdditionalInfo extends PendingTransactionWithData {
  const _PendingTransactionWithAdditionalInfo(
      {required this.transaction,
      required this.destination,
      required this.amount,
      required this.createdAt})
      : super._();
  factory _PendingTransactionWithAdditionalInfo.fromJson(
          Map<String, dynamic> json) =>
      _$PendingTransactionWithAdditionalInfoFromJson(json);

  @override
  final PendingTransaction transaction;
  @override
  final Address destination;
  @override
  final BigInt amount;
  @override
  final DateTime createdAt;

  /// Create a copy of PendingTransactionWithData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PendingTransactionWithAdditionalInfoCopyWith<
          _PendingTransactionWithAdditionalInfo>
      get copyWith => __$PendingTransactionWithAdditionalInfoCopyWithImpl<
          _PendingTransactionWithAdditionalInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PendingTransactionWithAdditionalInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PendingTransactionWithAdditionalInfo &&
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

  @override
  String toString() {
    return 'PendingTransactionWithData(transaction: $transaction, destination: $destination, amount: $amount, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$PendingTransactionWithAdditionalInfoCopyWith<$Res>
    implements $PendingTransactionWithDataCopyWith<$Res> {
  factory _$PendingTransactionWithAdditionalInfoCopyWith(
          _PendingTransactionWithAdditionalInfo value,
          $Res Function(_PendingTransactionWithAdditionalInfo) _then) =
      __$PendingTransactionWithAdditionalInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PendingTransaction transaction,
      Address destination,
      BigInt amount,
      DateTime createdAt});

  @override
  $PendingTransactionCopyWith<$Res> get transaction;
  @override
  $AddressCopyWith<$Res> get destination;
}

/// @nodoc
class __$PendingTransactionWithAdditionalInfoCopyWithImpl<$Res>
    implements _$PendingTransactionWithAdditionalInfoCopyWith<$Res> {
  __$PendingTransactionWithAdditionalInfoCopyWithImpl(this._self, this._then);

  final _PendingTransactionWithAdditionalInfo _self;
  final $Res Function(_PendingTransactionWithAdditionalInfo) _then;

  /// Create a copy of PendingTransactionWithData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? transaction = null,
    Object? destination = null,
    Object? amount = null,
    Object? createdAt = null,
  }) {
    return _then(_PendingTransactionWithAdditionalInfo(
      transaction: null == transaction
          ? _self.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as PendingTransaction,
      destination: null == destination
          ? _self.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of PendingTransactionWithData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PendingTransactionCopyWith<$Res> get transaction {
    return $PendingTransactionCopyWith<$Res>(_self.transaction, (value) {
      return _then(_self.copyWith(transaction: value));
    });
  }

  /// Create a copy of PendingTransactionWithData
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
