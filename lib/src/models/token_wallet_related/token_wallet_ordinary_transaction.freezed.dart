// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_wallet_ordinary_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TokenWalletOrdinaryTransaction {
  String get lt => throw _privateConstructorUsedError;
  bool get isOutgoing => throw _privateConstructorUsedError;
  @amountJsonConverter
  Fixed get value => throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;
  @dateSecondsSinceEpochJsonConverter
  DateTime get date => throw _privateConstructorUsedError;
  @amountJsonConverter
  Fixed get fees => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  String? get prevTransactionLt => throw _privateConstructorUsedError;
  TokenIncomingTransfer? get incomingTransfer =>
      throw _privateConstructorUsedError;
  TokenOutgoingTransfer? get outgoingTransfer =>
      throw _privateConstructorUsedError;
  TokenSwapBack? get swapBack => throw _privateConstructorUsedError;
  @amountJsonConverter
  Fixed? get accept => throw _privateConstructorUsedError;
  @amountJsonConverter
  Fixed? get transferBounced => throw _privateConstructorUsedError;
  @amountJsonConverter
  Fixed? get swapBackBounced => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenWalletOrdinaryTransactionCopyWith<TokenWalletOrdinaryTransaction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenWalletOrdinaryTransactionCopyWith<$Res> {
  factory $TokenWalletOrdinaryTransactionCopyWith(
          TokenWalletOrdinaryTransaction value,
          $Res Function(TokenWalletOrdinaryTransaction) then) =
      _$TokenWalletOrdinaryTransactionCopyWithImpl<$Res,
          TokenWalletOrdinaryTransaction>;
  @useResult
  $Res call(
      {String lt,
      bool isOutgoing,
      @amountJsonConverter Fixed value,
      Address address,
      @dateSecondsSinceEpochJsonConverter DateTime date,
      @amountJsonConverter Fixed fees,
      String hash,
      String? prevTransactionLt,
      TokenIncomingTransfer? incomingTransfer,
      TokenOutgoingTransfer? outgoingTransfer,
      TokenSwapBack? swapBack,
      @amountJsonConverter Fixed? accept,
      @amountJsonConverter Fixed? transferBounced,
      @amountJsonConverter Fixed? swapBackBounced});

  $AddressCopyWith<$Res> get address;
  $TokenIncomingTransferCopyWith<$Res>? get incomingTransfer;
  $TokenOutgoingTransferCopyWith<$Res>? get outgoingTransfer;
  $TokenSwapBackCopyWith<$Res>? get swapBack;
}

/// @nodoc
class _$TokenWalletOrdinaryTransactionCopyWithImpl<$Res,
        $Val extends TokenWalletOrdinaryTransaction>
    implements $TokenWalletOrdinaryTransactionCopyWith<$Res> {
  _$TokenWalletOrdinaryTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
  }) {
    return _then(_value.copyWith(
      lt: null == lt
          ? _value.lt
          : lt // ignore: cast_nullable_to_non_nullable
              as String,
      isOutgoing: null == isOutgoing
          ? _value.isOutgoing
          : isOutgoing // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Fixed,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fees: null == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as Fixed,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      prevTransactionLt: freezed == prevTransactionLt
          ? _value.prevTransactionLt
          : prevTransactionLt // ignore: cast_nullable_to_non_nullable
              as String?,
      incomingTransfer: freezed == incomingTransfer
          ? _value.incomingTransfer
          : incomingTransfer // ignore: cast_nullable_to_non_nullable
              as TokenIncomingTransfer?,
      outgoingTransfer: freezed == outgoingTransfer
          ? _value.outgoingTransfer
          : outgoingTransfer // ignore: cast_nullable_to_non_nullable
              as TokenOutgoingTransfer?,
      swapBack: freezed == swapBack
          ? _value.swapBack
          : swapBack // ignore: cast_nullable_to_non_nullable
              as TokenSwapBack?,
      accept: freezed == accept
          ? _value.accept
          : accept // ignore: cast_nullable_to_non_nullable
              as Fixed?,
      transferBounced: freezed == transferBounced
          ? _value.transferBounced
          : transferBounced // ignore: cast_nullable_to_non_nullable
              as Fixed?,
      swapBackBounced: freezed == swapBackBounced
          ? _value.swapBackBounced
          : swapBackBounced // ignore: cast_nullable_to_non_nullable
              as Fixed?,
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
  $TokenIncomingTransferCopyWith<$Res>? get incomingTransfer {
    if (_value.incomingTransfer == null) {
      return null;
    }

    return $TokenIncomingTransferCopyWith<$Res>(_value.incomingTransfer!,
        (value) {
      return _then(_value.copyWith(incomingTransfer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenOutgoingTransferCopyWith<$Res>? get outgoingTransfer {
    if (_value.outgoingTransfer == null) {
      return null;
    }

    return $TokenOutgoingTransferCopyWith<$Res>(_value.outgoingTransfer!,
        (value) {
      return _then(_value.copyWith(outgoingTransfer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenSwapBackCopyWith<$Res>? get swapBack {
    if (_value.swapBack == null) {
      return null;
    }

    return $TokenSwapBackCopyWith<$Res>(_value.swapBack!, (value) {
      return _then(_value.copyWith(swapBack: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TokenWalletOrdinaryTransactionCopyWith<$Res>
    implements $TokenWalletOrdinaryTransactionCopyWith<$Res> {
  factory _$$_TokenWalletOrdinaryTransactionCopyWith(
          _$_TokenWalletOrdinaryTransaction value,
          $Res Function(_$_TokenWalletOrdinaryTransaction) then) =
      __$$_TokenWalletOrdinaryTransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lt,
      bool isOutgoing,
      @amountJsonConverter Fixed value,
      Address address,
      @dateSecondsSinceEpochJsonConverter DateTime date,
      @amountJsonConverter Fixed fees,
      String hash,
      String? prevTransactionLt,
      TokenIncomingTransfer? incomingTransfer,
      TokenOutgoingTransfer? outgoingTransfer,
      TokenSwapBack? swapBack,
      @amountJsonConverter Fixed? accept,
      @amountJsonConverter Fixed? transferBounced,
      @amountJsonConverter Fixed? swapBackBounced});

  @override
  $AddressCopyWith<$Res> get address;
  @override
  $TokenIncomingTransferCopyWith<$Res>? get incomingTransfer;
  @override
  $TokenOutgoingTransferCopyWith<$Res>? get outgoingTransfer;
  @override
  $TokenSwapBackCopyWith<$Res>? get swapBack;
}

/// @nodoc
class __$$_TokenWalletOrdinaryTransactionCopyWithImpl<$Res>
    extends _$TokenWalletOrdinaryTransactionCopyWithImpl<$Res,
        _$_TokenWalletOrdinaryTransaction>
    implements _$$_TokenWalletOrdinaryTransactionCopyWith<$Res> {
  __$$_TokenWalletOrdinaryTransactionCopyWithImpl(
      _$_TokenWalletOrdinaryTransaction _value,
      $Res Function(_$_TokenWalletOrdinaryTransaction) _then)
      : super(_value, _then);

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
  }) {
    return _then(_$_TokenWalletOrdinaryTransaction(
      lt: null == lt
          ? _value.lt
          : lt // ignore: cast_nullable_to_non_nullable
              as String,
      isOutgoing: null == isOutgoing
          ? _value.isOutgoing
          : isOutgoing // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Fixed,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fees: null == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as Fixed,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      prevTransactionLt: freezed == prevTransactionLt
          ? _value.prevTransactionLt
          : prevTransactionLt // ignore: cast_nullable_to_non_nullable
              as String?,
      incomingTransfer: freezed == incomingTransfer
          ? _value.incomingTransfer
          : incomingTransfer // ignore: cast_nullable_to_non_nullable
              as TokenIncomingTransfer?,
      outgoingTransfer: freezed == outgoingTransfer
          ? _value.outgoingTransfer
          : outgoingTransfer // ignore: cast_nullable_to_non_nullable
              as TokenOutgoingTransfer?,
      swapBack: freezed == swapBack
          ? _value.swapBack
          : swapBack // ignore: cast_nullable_to_non_nullable
              as TokenSwapBack?,
      accept: freezed == accept
          ? _value.accept
          : accept // ignore: cast_nullable_to_non_nullable
              as Fixed?,
      transferBounced: freezed == transferBounced
          ? _value.transferBounced
          : transferBounced // ignore: cast_nullable_to_non_nullable
              as Fixed?,
      swapBackBounced: freezed == swapBackBounced
          ? _value.swapBackBounced
          : swapBackBounced // ignore: cast_nullable_to_non_nullable
              as Fixed?,
    ));
  }
}

/// @nodoc

class _$_TokenWalletOrdinaryTransaction
    implements _TokenWalletOrdinaryTransaction {
  const _$_TokenWalletOrdinaryTransaction(
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
      @amountJsonConverter this.swapBackBounced});

  @override
  final String lt;
  @override
  final bool isOutgoing;
  @override
  @amountJsonConverter
  final Fixed value;
  @override
  final Address address;
  @override
  @dateSecondsSinceEpochJsonConverter
  final DateTime date;
  @override
  @amountJsonConverter
  final Fixed fees;
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
  final Fixed? accept;
  @override
  @amountJsonConverter
  final Fixed? transferBounced;
  @override
  @amountJsonConverter
  final Fixed? swapBackBounced;

  @override
  String toString() {
    return 'TokenWalletOrdinaryTransaction(lt: $lt, isOutgoing: $isOutgoing, value: $value, address: $address, date: $date, fees: $fees, hash: $hash, prevTransactionLt: $prevTransactionLt, incomingTransfer: $incomingTransfer, outgoingTransfer: $outgoingTransfer, swapBack: $swapBack, accept: $accept, transferBounced: $transferBounced, swapBackBounced: $swapBackBounced)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenWalletOrdinaryTransaction &&
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
                other.swapBackBounced == swapBackBounced));
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
      swapBackBounced);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenWalletOrdinaryTransactionCopyWith<_$_TokenWalletOrdinaryTransaction>
      get copyWith => __$$_TokenWalletOrdinaryTransactionCopyWithImpl<
          _$_TokenWalletOrdinaryTransaction>(this, _$identity);
}

abstract class _TokenWalletOrdinaryTransaction
    implements TokenWalletOrdinaryTransaction {
  const factory _TokenWalletOrdinaryTransaction(
          {required final String lt,
          required final bool isOutgoing,
          @amountJsonConverter required final Fixed value,
          required final Address address,
          @dateSecondsSinceEpochJsonConverter required final DateTime date,
          @amountJsonConverter required final Fixed fees,
          required final String hash,
          final String? prevTransactionLt,
          final TokenIncomingTransfer? incomingTransfer,
          final TokenOutgoingTransfer? outgoingTransfer,
          final TokenSwapBack? swapBack,
          @amountJsonConverter final Fixed? accept,
          @amountJsonConverter final Fixed? transferBounced,
          @amountJsonConverter final Fixed? swapBackBounced}) =
      _$_TokenWalletOrdinaryTransaction;

  @override
  String get lt;
  @override
  bool get isOutgoing;
  @override
  @amountJsonConverter
  Fixed get value;
  @override
  Address get address;
  @override
  @dateSecondsSinceEpochJsonConverter
  DateTime get date;
  @override
  @amountJsonConverter
  Fixed get fees;
  @override
  String get hash;
  @override
  String? get prevTransactionLt;
  @override
  TokenIncomingTransfer? get incomingTransfer;
  @override
  TokenOutgoingTransfer? get outgoingTransfer;
  @override
  TokenSwapBack? get swapBack;
  @override
  @amountJsonConverter
  Fixed? get accept;
  @override
  @amountJsonConverter
  Fixed? get transferBounced;
  @override
  @amountJsonConverter
  Fixed? get swapBackBounced;
  @override
  @JsonKey(ignore: true)
  _$$_TokenWalletOrdinaryTransactionCopyWith<_$_TokenWalletOrdinaryTransaction>
      get copyWith => throw _privateConstructorUsedError;
}
