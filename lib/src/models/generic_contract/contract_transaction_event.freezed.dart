// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_transaction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContractFoundTransactionEvent _$ContractFoundTransactionEventFromJson(
    Map<String, dynamic> json) {
  return _ContractFoundTransactionEvent.fromJson(json);
}

/// @nodoc
mixin _$ContractFoundTransactionEvent {
  Address get address => throw _privateConstructorUsedError;
  List<Transaction> get transactions => throw _privateConstructorUsedError;
  TransactionsBatchInfo get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractFoundTransactionEventCopyWith<ContractFoundTransactionEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractFoundTransactionEventCopyWith<$Res> {
  factory $ContractFoundTransactionEventCopyWith(
          ContractFoundTransactionEvent value,
          $Res Function(ContractFoundTransactionEvent) then) =
      _$ContractFoundTransactionEventCopyWithImpl<$Res,
          ContractFoundTransactionEvent>;
  @useResult
  $Res call(
      {Address address,
      List<Transaction> transactions,
      TransactionsBatchInfo info});

  $AddressCopyWith<$Res> get address;
  $TransactionsBatchInfoCopyWith<$Res> get info;
}

/// @nodoc
class _$ContractFoundTransactionEventCopyWithImpl<$Res,
        $Val extends ContractFoundTransactionEvent>
    implements $ContractFoundTransactionEventCopyWith<$Res> {
  _$ContractFoundTransactionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? transactions = null,
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as TransactionsBatchInfo,
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
  $TransactionsBatchInfoCopyWith<$Res> get info {
    return $TransactionsBatchInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContractFoundTransactionEventImplCopyWith<$Res>
    implements $ContractFoundTransactionEventCopyWith<$Res> {
  factory _$$ContractFoundTransactionEventImplCopyWith(
          _$ContractFoundTransactionEventImpl value,
          $Res Function(_$ContractFoundTransactionEventImpl) then) =
      __$$ContractFoundTransactionEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Address address,
      List<Transaction> transactions,
      TransactionsBatchInfo info});

  @override
  $AddressCopyWith<$Res> get address;
  @override
  $TransactionsBatchInfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$ContractFoundTransactionEventImplCopyWithImpl<$Res>
    extends _$ContractFoundTransactionEventCopyWithImpl<$Res,
        _$ContractFoundTransactionEventImpl>
    implements _$$ContractFoundTransactionEventImplCopyWith<$Res> {
  __$$ContractFoundTransactionEventImplCopyWithImpl(
      _$ContractFoundTransactionEventImpl _value,
      $Res Function(_$ContractFoundTransactionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? transactions = null,
    Object? info = null,
  }) {
    return _then(_$ContractFoundTransactionEventImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as TransactionsBatchInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContractFoundTransactionEventImpl
    implements _ContractFoundTransactionEvent {
  const _$ContractFoundTransactionEventImpl(
      {required this.address,
      required final List<Transaction> transactions,
      required this.info})
      : _transactions = transactions;

  factory _$ContractFoundTransactionEventImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ContractFoundTransactionEventImplFromJson(json);

  @override
  final Address address;
  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final TransactionsBatchInfo info;

  @override
  String toString() {
    return 'ContractFoundTransactionEvent(address: $address, transactions: $transactions, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractFoundTransactionEventImpl &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address,
      const DeepCollectionEquality().hash(_transactions), info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractFoundTransactionEventImplCopyWith<
          _$ContractFoundTransactionEventImpl>
      get copyWith => __$$ContractFoundTransactionEventImplCopyWithImpl<
          _$ContractFoundTransactionEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractFoundTransactionEventImplToJson(
      this,
    );
  }
}

abstract class _ContractFoundTransactionEvent
    implements ContractFoundTransactionEvent {
  const factory _ContractFoundTransactionEvent(
          {required final Address address,
          required final List<Transaction> transactions,
          required final TransactionsBatchInfo info}) =
      _$ContractFoundTransactionEventImpl;

  factory _ContractFoundTransactionEvent.fromJson(Map<String, dynamic> json) =
      _$ContractFoundTransactionEventImpl.fromJson;

  @override
  Address get address;
  @override
  List<Transaction> get transactions;
  @override
  TransactionsBatchInfo get info;
  @override
  @JsonKey(ignore: true)
  _$$ContractFoundTransactionEventImplCopyWith<
          _$ContractFoundTransactionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
