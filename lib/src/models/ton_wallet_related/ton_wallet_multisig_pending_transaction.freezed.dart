// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ton_wallet_multisig_pending_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TonWalletMultisigPendingTransaction {
  String get lt => throw _privateConstructorUsedError;
  PublicKey get creator => throw _privateConstructorUsedError;
  List<PublicKey> get confirmations => throw _privateConstructorUsedError;
  List<PublicKey> get custodians => throw _privateConstructorUsedError;
  bool get isOutgoing => throw _privateConstructorUsedError;
  @amountJsonConverter
  Fixed get value => throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;
  Address get walletAddress => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @amountJsonConverter
  Fixed get fees => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  int get signsReceived => throw _privateConstructorUsedError;
  int get signsRequired => throw _privateConstructorUsedError;
  String get transactionId => throw _privateConstructorUsedError;
  List<PublicKey> get publicKeys => throw _privateConstructorUsedError;
  bool get canConfirm => throw _privateConstructorUsedError;
  DateTime get expireAt => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get prevTransactionLt => throw _privateConstructorUsedError;
  DePoolOnRoundCompleteNotification? get dePoolOnRoundCompleteNotification =>
      throw _privateConstructorUsedError;
  DePoolReceiveAnswerNotification? get dePoolReceiveAnswerNotification =>
      throw _privateConstructorUsedError;
  TokenWalletDeployedNotification? get tokenWalletDeployedNotification =>
      throw _privateConstructorUsedError;
  WalletInteractionInfo? get walletInteractionInfo =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TonWalletMultisigPendingTransactionCopyWith<
          TonWalletMultisigPendingTransaction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TonWalletMultisigPendingTransactionCopyWith<$Res> {
  factory $TonWalletMultisigPendingTransactionCopyWith(
          TonWalletMultisigPendingTransaction value,
          $Res Function(TonWalletMultisigPendingTransaction) then) =
      _$TonWalletMultisigPendingTransactionCopyWithImpl<$Res,
          TonWalletMultisigPendingTransaction>;
  @useResult
  $Res call(
      {String lt,
      PublicKey creator,
      List<PublicKey> confirmations,
      List<PublicKey> custodians,
      bool isOutgoing,
      @amountJsonConverter Fixed value,
      Address address,
      Address walletAddress,
      DateTime date,
      @amountJsonConverter Fixed fees,
      String hash,
      int signsReceived,
      int signsRequired,
      String transactionId,
      List<PublicKey> publicKeys,
      bool canConfirm,
      DateTime expireAt,
      String? comment,
      String? prevTransactionLt,
      DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,
      DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,
      TokenWalletDeployedNotification? tokenWalletDeployedNotification,
      WalletInteractionInfo? walletInteractionInfo});

  $PublicKeyCopyWith<$Res> get creator;
  $AddressCopyWith<$Res> get address;
  $AddressCopyWith<$Res> get walletAddress;
  $DePoolOnRoundCompleteNotificationCopyWith<$Res>?
      get dePoolOnRoundCompleteNotification;
  $DePoolReceiveAnswerNotificationCopyWith<$Res>?
      get dePoolReceiveAnswerNotification;
  $TokenWalletDeployedNotificationCopyWith<$Res>?
      get tokenWalletDeployedNotification;
  $WalletInteractionInfoCopyWith<$Res>? get walletInteractionInfo;
}

/// @nodoc
class _$TonWalletMultisigPendingTransactionCopyWithImpl<$Res,
        $Val extends TonWalletMultisigPendingTransaction>
    implements $TonWalletMultisigPendingTransactionCopyWith<$Res> {
  _$TonWalletMultisigPendingTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lt = null,
    Object? creator = null,
    Object? confirmations = null,
    Object? custodians = null,
    Object? isOutgoing = null,
    Object? value = null,
    Object? address = null,
    Object? walletAddress = null,
    Object? date = null,
    Object? fees = null,
    Object? hash = null,
    Object? signsReceived = null,
    Object? signsRequired = null,
    Object? transactionId = null,
    Object? publicKeys = null,
    Object? canConfirm = null,
    Object? expireAt = null,
    Object? comment = freezed,
    Object? prevTransactionLt = freezed,
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
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      confirmations: null == confirmations
          ? _value.confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as List<PublicKey>,
      custodians: null == custodians
          ? _value.custodians
          : custodians // ignore: cast_nullable_to_non_nullable
              as List<PublicKey>,
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
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
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
      signsReceived: null == signsReceived
          ? _value.signsReceived
          : signsReceived // ignore: cast_nullable_to_non_nullable
              as int,
      signsRequired: null == signsRequired
          ? _value.signsRequired
          : signsRequired // ignore: cast_nullable_to_non_nullable
              as int,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      publicKeys: null == publicKeys
          ? _value.publicKeys
          : publicKeys // ignore: cast_nullable_to_non_nullable
              as List<PublicKey>,
      canConfirm: null == canConfirm
          ? _value.canConfirm
          : canConfirm // ignore: cast_nullable_to_non_nullable
              as bool,
      expireAt: null == expireAt
          ? _value.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      prevTransactionLt: freezed == prevTransactionLt
          ? _value.prevTransactionLt
          : prevTransactionLt // ignore: cast_nullable_to_non_nullable
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
  $PublicKeyCopyWith<$Res> get creator {
    return $PublicKeyCopyWith<$Res>(_value.creator, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
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
  $AddressCopyWith<$Res> get walletAddress {
    return $AddressCopyWith<$Res>(_value.walletAddress, (value) {
      return _then(_value.copyWith(walletAddress: value) as $Val);
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
abstract class _$$_TonWalletMultisigPendingTransactionCopyWith<$Res>
    implements $TonWalletMultisigPendingTransactionCopyWith<$Res> {
  factory _$$_TonWalletMultisigPendingTransactionCopyWith(
          _$_TonWalletMultisigPendingTransaction value,
          $Res Function(_$_TonWalletMultisigPendingTransaction) then) =
      __$$_TonWalletMultisigPendingTransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lt,
      PublicKey creator,
      List<PublicKey> confirmations,
      List<PublicKey> custodians,
      bool isOutgoing,
      @amountJsonConverter Fixed value,
      Address address,
      Address walletAddress,
      DateTime date,
      @amountJsonConverter Fixed fees,
      String hash,
      int signsReceived,
      int signsRequired,
      String transactionId,
      List<PublicKey> publicKeys,
      bool canConfirm,
      DateTime expireAt,
      String? comment,
      String? prevTransactionLt,
      DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,
      DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,
      TokenWalletDeployedNotification? tokenWalletDeployedNotification,
      WalletInteractionInfo? walletInteractionInfo});

  @override
  $PublicKeyCopyWith<$Res> get creator;
  @override
  $AddressCopyWith<$Res> get address;
  @override
  $AddressCopyWith<$Res> get walletAddress;
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
class __$$_TonWalletMultisigPendingTransactionCopyWithImpl<$Res>
    extends _$TonWalletMultisigPendingTransactionCopyWithImpl<$Res,
        _$_TonWalletMultisigPendingTransaction>
    implements _$$_TonWalletMultisigPendingTransactionCopyWith<$Res> {
  __$$_TonWalletMultisigPendingTransactionCopyWithImpl(
      _$_TonWalletMultisigPendingTransaction _value,
      $Res Function(_$_TonWalletMultisigPendingTransaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lt = null,
    Object? creator = null,
    Object? confirmations = null,
    Object? custodians = null,
    Object? isOutgoing = null,
    Object? value = null,
    Object? address = null,
    Object? walletAddress = null,
    Object? date = null,
    Object? fees = null,
    Object? hash = null,
    Object? signsReceived = null,
    Object? signsRequired = null,
    Object? transactionId = null,
    Object? publicKeys = null,
    Object? canConfirm = null,
    Object? expireAt = null,
    Object? comment = freezed,
    Object? prevTransactionLt = freezed,
    Object? dePoolOnRoundCompleteNotification = freezed,
    Object? dePoolReceiveAnswerNotification = freezed,
    Object? tokenWalletDeployedNotification = freezed,
    Object? walletInteractionInfo = freezed,
  }) {
    return _then(_$_TonWalletMultisigPendingTransaction(
      lt: null == lt
          ? _value.lt
          : lt // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      confirmations: null == confirmations
          ? _value._confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as List<PublicKey>,
      custodians: null == custodians
          ? _value._custodians
          : custodians // ignore: cast_nullable_to_non_nullable
              as List<PublicKey>,
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
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
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
      signsReceived: null == signsReceived
          ? _value.signsReceived
          : signsReceived // ignore: cast_nullable_to_non_nullable
              as int,
      signsRequired: null == signsRequired
          ? _value.signsRequired
          : signsRequired // ignore: cast_nullable_to_non_nullable
              as int,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      publicKeys: null == publicKeys
          ? _value._publicKeys
          : publicKeys // ignore: cast_nullable_to_non_nullable
              as List<PublicKey>,
      canConfirm: null == canConfirm
          ? _value.canConfirm
          : canConfirm // ignore: cast_nullable_to_non_nullable
              as bool,
      expireAt: null == expireAt
          ? _value.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      prevTransactionLt: freezed == prevTransactionLt
          ? _value.prevTransactionLt
          : prevTransactionLt // ignore: cast_nullable_to_non_nullable
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

class _$_TonWalletMultisigPendingTransaction
    implements _TonWalletMultisigPendingTransaction {
  const _$_TonWalletMultisigPendingTransaction(
      {required this.lt,
      required this.creator,
      required final List<PublicKey> confirmations,
      required final List<PublicKey> custodians,
      required this.isOutgoing,
      @amountJsonConverter required this.value,
      required this.address,
      required this.walletAddress,
      required this.date,
      @amountJsonConverter required this.fees,
      required this.hash,
      required this.signsReceived,
      required this.signsRequired,
      required this.transactionId,
      required final List<PublicKey> publicKeys,
      required this.canConfirm,
      required this.expireAt,
      this.comment,
      this.prevTransactionLt,
      this.dePoolOnRoundCompleteNotification,
      this.dePoolReceiveAnswerNotification,
      this.tokenWalletDeployedNotification,
      this.walletInteractionInfo})
      : _confirmations = confirmations,
        _custodians = custodians,
        _publicKeys = publicKeys;

  @override
  final String lt;
  @override
  final PublicKey creator;
  final List<PublicKey> _confirmations;
  @override
  List<PublicKey> get confirmations {
    if (_confirmations is EqualUnmodifiableListView) return _confirmations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_confirmations);
  }

  final List<PublicKey> _custodians;
  @override
  List<PublicKey> get custodians {
    if (_custodians is EqualUnmodifiableListView) return _custodians;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_custodians);
  }

  @override
  final bool isOutgoing;
  @override
  @amountJsonConverter
  final Fixed value;
  @override
  final Address address;
  @override
  final Address walletAddress;
  @override
  final DateTime date;
  @override
  @amountJsonConverter
  final Fixed fees;
  @override
  final String hash;
  @override
  final int signsReceived;
  @override
  final int signsRequired;
  @override
  final String transactionId;
  final List<PublicKey> _publicKeys;
  @override
  List<PublicKey> get publicKeys {
    if (_publicKeys is EqualUnmodifiableListView) return _publicKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_publicKeys);
  }

  @override
  final bool canConfirm;
  @override
  final DateTime expireAt;
  @override
  final String? comment;
  @override
  final String? prevTransactionLt;
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
    return 'TonWalletMultisigPendingTransaction(lt: $lt, creator: $creator, confirmations: $confirmations, custodians: $custodians, isOutgoing: $isOutgoing, value: $value, address: $address, walletAddress: $walletAddress, date: $date, fees: $fees, hash: $hash, signsReceived: $signsReceived, signsRequired: $signsRequired, transactionId: $transactionId, publicKeys: $publicKeys, canConfirm: $canConfirm, expireAt: $expireAt, comment: $comment, prevTransactionLt: $prevTransactionLt, dePoolOnRoundCompleteNotification: $dePoolOnRoundCompleteNotification, dePoolReceiveAnswerNotification: $dePoolReceiveAnswerNotification, tokenWalletDeployedNotification: $tokenWalletDeployedNotification, walletInteractionInfo: $walletInteractionInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TonWalletMultisigPendingTransaction &&
            (identical(other.lt, lt) || other.lt == lt) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            const DeepCollectionEquality()
                .equals(other._confirmations, _confirmations) &&
            const DeepCollectionEquality()
                .equals(other._custodians, _custodians) &&
            (identical(other.isOutgoing, isOutgoing) ||
                other.isOutgoing == isOutgoing) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.signsReceived, signsReceived) ||
                other.signsReceived == signsReceived) &&
            (identical(other.signsRequired, signsRequired) ||
                other.signsRequired == signsRequired) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            const DeepCollectionEquality()
                .equals(other._publicKeys, _publicKeys) &&
            (identical(other.canConfirm, canConfirm) ||
                other.canConfirm == canConfirm) &&
            (identical(other.expireAt, expireAt) ||
                other.expireAt == expireAt) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.prevTransactionLt, prevTransactionLt) ||
                other.prevTransactionLt == prevTransactionLt) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        lt,
        creator,
        const DeepCollectionEquality().hash(_confirmations),
        const DeepCollectionEquality().hash(_custodians),
        isOutgoing,
        value,
        address,
        walletAddress,
        date,
        fees,
        hash,
        signsReceived,
        signsRequired,
        transactionId,
        const DeepCollectionEquality().hash(_publicKeys),
        canConfirm,
        expireAt,
        comment,
        prevTransactionLt,
        dePoolOnRoundCompleteNotification,
        dePoolReceiveAnswerNotification,
        tokenWalletDeployedNotification,
        walletInteractionInfo
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TonWalletMultisigPendingTransactionCopyWith<
          _$_TonWalletMultisigPendingTransaction>
      get copyWith => __$$_TonWalletMultisigPendingTransactionCopyWithImpl<
          _$_TonWalletMultisigPendingTransaction>(this, _$identity);
}

abstract class _TonWalletMultisigPendingTransaction
    implements TonWalletMultisigPendingTransaction {
  const factory _TonWalletMultisigPendingTransaction(
      {required final String lt,
      required final PublicKey creator,
      required final List<PublicKey> confirmations,
      required final List<PublicKey> custodians,
      required final bool isOutgoing,
      @amountJsonConverter required final Fixed value,
      required final Address address,
      required final Address walletAddress,
      required final DateTime date,
      @amountJsonConverter required final Fixed fees,
      required final String hash,
      required final int signsReceived,
      required final int signsRequired,
      required final String transactionId,
      required final List<PublicKey> publicKeys,
      required final bool canConfirm,
      required final DateTime expireAt,
      final String? comment,
      final String? prevTransactionLt,
      final DePoolOnRoundCompleteNotification?
          dePoolOnRoundCompleteNotification,
      final DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,
      final TokenWalletDeployedNotification? tokenWalletDeployedNotification,
      final WalletInteractionInfo?
          walletInteractionInfo}) = _$_TonWalletMultisigPendingTransaction;

  @override
  String get lt;
  @override
  PublicKey get creator;
  @override
  List<PublicKey> get confirmations;
  @override
  List<PublicKey> get custodians;
  @override
  bool get isOutgoing;
  @override
  @amountJsonConverter
  Fixed get value;
  @override
  Address get address;
  @override
  Address get walletAddress;
  @override
  DateTime get date;
  @override
  @amountJsonConverter
  Fixed get fees;
  @override
  String get hash;
  @override
  int get signsReceived;
  @override
  int get signsRequired;
  @override
  String get transactionId;
  @override
  List<PublicKey> get publicKeys;
  @override
  bool get canConfirm;
  @override
  DateTime get expireAt;
  @override
  String? get comment;
  @override
  String? get prevTransactionLt;
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
  _$$_TonWalletMultisigPendingTransactionCopyWith<
          _$_TonWalletMultisigPendingTransaction>
      get copyWith => throw _privateConstructorUsedError;
}
