// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ton_wallet_ordinary_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TonWalletOrdinaryTransaction {
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
  String? get comment => throw _privateConstructorUsedError;
  DePoolOnRoundCompleteNotification? get dePoolOnRoundCompleteNotification =>
      throw _privateConstructorUsedError;
  DePoolReceiveAnswerNotification? get dePoolReceiveAnswerNotification =>
      throw _privateConstructorUsedError;
  TokenWalletDeployedNotification? get tokenWalletDeployedNotification =>
      throw _privateConstructorUsedError;
  WalletInteractionInfo? get walletInteractionInfo =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TonWalletOrdinaryTransactionCopyWith<TonWalletOrdinaryTransaction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TonWalletOrdinaryTransactionCopyWith<$Res> {
  factory $TonWalletOrdinaryTransactionCopyWith(
          TonWalletOrdinaryTransaction value,
          $Res Function(TonWalletOrdinaryTransaction) then) =
      _$TonWalletOrdinaryTransactionCopyWithImpl<$Res,
          TonWalletOrdinaryTransaction>;
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
      String? comment,
      DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,
      DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,
      TokenWalletDeployedNotification? tokenWalletDeployedNotification,
      WalletInteractionInfo? walletInteractionInfo});

  $AddressCopyWith<$Res> get address;
  $DePoolOnRoundCompleteNotificationCopyWith<$Res>?
      get dePoolOnRoundCompleteNotification;
  $DePoolReceiveAnswerNotificationCopyWith<$Res>?
      get dePoolReceiveAnswerNotification;
  $TokenWalletDeployedNotificationCopyWith<$Res>?
      get tokenWalletDeployedNotification;
  $WalletInteractionInfoCopyWith<$Res>? get walletInteractionInfo;
}

/// @nodoc
class _$TonWalletOrdinaryTransactionCopyWithImpl<$Res,
        $Val extends TonWalletOrdinaryTransaction>
    implements $TonWalletOrdinaryTransactionCopyWith<$Res> {
  _$TonWalletOrdinaryTransactionCopyWithImpl(this._value, this._then);

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
    Object? comment = freezed,
    Object? dePoolOnRoundCompleteNotification = freezed,
    Object? dePoolReceiveAnswerNotification = freezed,
    Object? tokenWalletDeployedNotification = freezed,
    Object? walletInteractionInfo = freezed,
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
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      dePoolOnRoundCompleteNotification: freezed ==
              dePoolOnRoundCompleteNotification
          ? _value.dePoolOnRoundCompleteNotification
          : dePoolOnRoundCompleteNotification // ignore: cast_nullable_to_non_nullable
              as DePoolOnRoundCompleteNotification?,
      dePoolReceiveAnswerNotification: freezed ==
              dePoolReceiveAnswerNotification
          ? _value.dePoolReceiveAnswerNotification
          : dePoolReceiveAnswerNotification // ignore: cast_nullable_to_non_nullable
              as DePoolReceiveAnswerNotification?,
      tokenWalletDeployedNotification: freezed ==
              tokenWalletDeployedNotification
          ? _value.tokenWalletDeployedNotification
          : tokenWalletDeployedNotification // ignore: cast_nullable_to_non_nullable
              as TokenWalletDeployedNotification?,
      walletInteractionInfo: freezed == walletInteractionInfo
          ? _value.walletInteractionInfo
          : walletInteractionInfo // ignore: cast_nullable_to_non_nullable
              as WalletInteractionInfo?,
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
  $DePoolOnRoundCompleteNotificationCopyWith<$Res>?
      get dePoolOnRoundCompleteNotification {
    if (_value.dePoolOnRoundCompleteNotification == null) {
      return null;
    }

    return $DePoolOnRoundCompleteNotificationCopyWith<$Res>(
        _value.dePoolOnRoundCompleteNotification!, (value) {
      return _then(
          _value.copyWith(dePoolOnRoundCompleteNotification: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DePoolReceiveAnswerNotificationCopyWith<$Res>?
      get dePoolReceiveAnswerNotification {
    if (_value.dePoolReceiveAnswerNotification == null) {
      return null;
    }

    return $DePoolReceiveAnswerNotificationCopyWith<$Res>(
        _value.dePoolReceiveAnswerNotification!, (value) {
      return _then(
          _value.copyWith(dePoolReceiveAnswerNotification: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenWalletDeployedNotificationCopyWith<$Res>?
      get tokenWalletDeployedNotification {
    if (_value.tokenWalletDeployedNotification == null) {
      return null;
    }

    return $TokenWalletDeployedNotificationCopyWith<$Res>(
        _value.tokenWalletDeployedNotification!, (value) {
      return _then(
          _value.copyWith(tokenWalletDeployedNotification: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletInteractionInfoCopyWith<$Res>? get walletInteractionInfo {
    if (_value.walletInteractionInfo == null) {
      return null;
    }

    return $WalletInteractionInfoCopyWith<$Res>(_value.walletInteractionInfo!,
        (value) {
      return _then(_value.copyWith(walletInteractionInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TonWalletOrdinaryTransactionCopyWith<$Res>
    implements $TonWalletOrdinaryTransactionCopyWith<$Res> {
  factory _$$_TonWalletOrdinaryTransactionCopyWith(
          _$_TonWalletOrdinaryTransaction value,
          $Res Function(_$_TonWalletOrdinaryTransaction) then) =
      __$$_TonWalletOrdinaryTransactionCopyWithImpl<$Res>;
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
      String? comment,
      DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,
      DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,
      TokenWalletDeployedNotification? tokenWalletDeployedNotification,
      WalletInteractionInfo? walletInteractionInfo});

  @override
  $AddressCopyWith<$Res> get address;
  @override
  $DePoolOnRoundCompleteNotificationCopyWith<$Res>?
      get dePoolOnRoundCompleteNotification;
  @override
  $DePoolReceiveAnswerNotificationCopyWith<$Res>?
      get dePoolReceiveAnswerNotification;
  @override
  $TokenWalletDeployedNotificationCopyWith<$Res>?
      get tokenWalletDeployedNotification;
  @override
  $WalletInteractionInfoCopyWith<$Res>? get walletInteractionInfo;
}

/// @nodoc
class __$$_TonWalletOrdinaryTransactionCopyWithImpl<$Res>
    extends _$TonWalletOrdinaryTransactionCopyWithImpl<$Res,
        _$_TonWalletOrdinaryTransaction>
    implements _$$_TonWalletOrdinaryTransactionCopyWith<$Res> {
  __$$_TonWalletOrdinaryTransactionCopyWithImpl(
      _$_TonWalletOrdinaryTransaction _value,
      $Res Function(_$_TonWalletOrdinaryTransaction) _then)
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
    Object? comment = freezed,
    Object? dePoolOnRoundCompleteNotification = freezed,
    Object? dePoolReceiveAnswerNotification = freezed,
    Object? tokenWalletDeployedNotification = freezed,
    Object? walletInteractionInfo = freezed,
  }) {
    return _then(_$_TonWalletOrdinaryTransaction(
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
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      dePoolOnRoundCompleteNotification: freezed ==
              dePoolOnRoundCompleteNotification
          ? _value.dePoolOnRoundCompleteNotification
          : dePoolOnRoundCompleteNotification // ignore: cast_nullable_to_non_nullable
              as DePoolOnRoundCompleteNotification?,
      dePoolReceiveAnswerNotification: freezed ==
              dePoolReceiveAnswerNotification
          ? _value.dePoolReceiveAnswerNotification
          : dePoolReceiveAnswerNotification // ignore: cast_nullable_to_non_nullable
              as DePoolReceiveAnswerNotification?,
      tokenWalletDeployedNotification: freezed ==
              tokenWalletDeployedNotification
          ? _value.tokenWalletDeployedNotification
          : tokenWalletDeployedNotification // ignore: cast_nullable_to_non_nullable
              as TokenWalletDeployedNotification?,
      walletInteractionInfo: freezed == walletInteractionInfo
          ? _value.walletInteractionInfo
          : walletInteractionInfo // ignore: cast_nullable_to_non_nullable
              as WalletInteractionInfo?,
    ));
  }
}

/// @nodoc

class _$_TonWalletOrdinaryTransaction implements _TonWalletOrdinaryTransaction {
  const _$_TonWalletOrdinaryTransaction(
      {required this.lt,
      required this.isOutgoing,
      @amountJsonConverter required this.value,
      required this.address,
      @dateSecondsSinceEpochJsonConverter required this.date,
      @amountJsonConverter required this.fees,
      required this.hash,
      this.prevTransactionLt,
      this.comment,
      this.dePoolOnRoundCompleteNotification,
      this.dePoolReceiveAnswerNotification,
      this.tokenWalletDeployedNotification,
      this.walletInteractionInfo});

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
  final String? comment;
  @override
  final DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification;
  @override
  final DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification;
  @override
  final TokenWalletDeployedNotification? tokenWalletDeployedNotification;
  @override
  final WalletInteractionInfo? walletInteractionInfo;

  @override
  String toString() {
    return 'TonWalletOrdinaryTransaction(lt: $lt, isOutgoing: $isOutgoing, value: $value, address: $address, date: $date, fees: $fees, hash: $hash, prevTransactionLt: $prevTransactionLt, comment: $comment, dePoolOnRoundCompleteNotification: $dePoolOnRoundCompleteNotification, dePoolReceiveAnswerNotification: $dePoolReceiveAnswerNotification, tokenWalletDeployedNotification: $tokenWalletDeployedNotification, walletInteractionInfo: $walletInteractionInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TonWalletOrdinaryTransaction &&
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
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.dePoolOnRoundCompleteNotification,
                    dePoolOnRoundCompleteNotification) ||
                other.dePoolOnRoundCompleteNotification ==
                    dePoolOnRoundCompleteNotification) &&
            (identical(other.dePoolReceiveAnswerNotification,
                    dePoolReceiveAnswerNotification) ||
                other.dePoolReceiveAnswerNotification ==
                    dePoolReceiveAnswerNotification) &&
            (identical(other.tokenWalletDeployedNotification,
                    tokenWalletDeployedNotification) ||
                other.tokenWalletDeployedNotification ==
                    tokenWalletDeployedNotification) &&
            (identical(other.walletInteractionInfo, walletInteractionInfo) ||
                other.walletInteractionInfo == walletInteractionInfo));
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
      comment,
      dePoolOnRoundCompleteNotification,
      dePoolReceiveAnswerNotification,
      tokenWalletDeployedNotification,
      walletInteractionInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TonWalletOrdinaryTransactionCopyWith<_$_TonWalletOrdinaryTransaction>
      get copyWith => __$$_TonWalletOrdinaryTransactionCopyWithImpl<
          _$_TonWalletOrdinaryTransaction>(this, _$identity);
}

abstract class _TonWalletOrdinaryTransaction
    implements TonWalletOrdinaryTransaction {
  const factory _TonWalletOrdinaryTransaction(
      {required final String lt,
      required final bool isOutgoing,
      @amountJsonConverter required final Fixed value,
      required final Address address,
      @dateSecondsSinceEpochJsonConverter required final DateTime date,
      @amountJsonConverter required final Fixed fees,
      required final String hash,
      final String? prevTransactionLt,
      final String? comment,
      final DePoolOnRoundCompleteNotification?
          dePoolOnRoundCompleteNotification,
      final DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,
      final TokenWalletDeployedNotification? tokenWalletDeployedNotification,
      final WalletInteractionInfo?
          walletInteractionInfo}) = _$_TonWalletOrdinaryTransaction;

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
  String? get comment;
  @override
  DePoolOnRoundCompleteNotification? get dePoolOnRoundCompleteNotification;
  @override
  DePoolReceiveAnswerNotification? get dePoolReceiveAnswerNotification;
  @override
  TokenWalletDeployedNotification? get tokenWalletDeployedNotification;
  @override
  WalletInteractionInfo? get walletInteractionInfo;
  @override
  @JsonKey(ignore: true)
  _$$_TonWalletOrdinaryTransactionCopyWith<_$_TonWalletOrdinaryTransaction>
      get copyWith => throw _privateConstructorUsedError;
}
