// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ton_wallet_multisig_ordinary_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TonWalletMultisigOrdinaryTransaction {
  String get lt; // initiator of transactions
  PublicKey get creator; // custodians who accepted this transaction
  List<PublicKey> get confirmations; // list of possible custodians
  List<PublicKey>
      get custodians; // if this transaction was sent from this wallet
  bool get isOutgoing;
  BigInt get value; // address of destination or source depends on isOutgoing
  Address get address;
  @dateSecondsSinceEpochJsonConverter
  DateTime get date;
  BigInt get fees;
  String get hash;
  String? get comment;
  String? get prevTransactionLt;
  DePoolOnRoundCompleteNotification? get dePoolOnRoundCompleteNotification;
  DePoolReceiveAnswerNotification? get dePoolReceiveAnswerNotification;
  TokenWalletDeployedNotification? get tokenWalletDeployedNotification;
  WalletInteractionInfo? get walletInteractionInfo;

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TonWalletMultisigOrdinaryTransactionCopyWith<
          TonWalletMultisigOrdinaryTransaction>
      get copyWith => _$TonWalletMultisigOrdinaryTransactionCopyWithImpl<
              TonWalletMultisigOrdinaryTransaction>(
          this as TonWalletMultisigOrdinaryTransaction, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TonWalletMultisigOrdinaryTransaction &&
            (identical(other.lt, lt) || other.lt == lt) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            const DeepCollectionEquality()
                .equals(other.confirmations, confirmations) &&
            const DeepCollectionEquality()
                .equals(other.custodians, custodians) &&
            (identical(other.isOutgoing, isOutgoing) ||
                other.isOutgoing == isOutgoing) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.hash, hash) || other.hash == hash) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      lt,
      creator,
      const DeepCollectionEquality().hash(confirmations),
      const DeepCollectionEquality().hash(custodians),
      isOutgoing,
      value,
      address,
      date,
      fees,
      hash,
      comment,
      prevTransactionLt,
      dePoolOnRoundCompleteNotification,
      dePoolReceiveAnswerNotification,
      tokenWalletDeployedNotification,
      walletInteractionInfo);

  @override
  String toString() {
    return 'TonWalletMultisigOrdinaryTransaction(lt: $lt, creator: $creator, confirmations: $confirmations, custodians: $custodians, isOutgoing: $isOutgoing, value: $value, address: $address, date: $date, fees: $fees, hash: $hash, comment: $comment, prevTransactionLt: $prevTransactionLt, dePoolOnRoundCompleteNotification: $dePoolOnRoundCompleteNotification, dePoolReceiveAnswerNotification: $dePoolReceiveAnswerNotification, tokenWalletDeployedNotification: $tokenWalletDeployedNotification, walletInteractionInfo: $walletInteractionInfo)';
  }
}

/// @nodoc
abstract mixin class $TonWalletMultisigOrdinaryTransactionCopyWith<$Res> {
  factory $TonWalletMultisigOrdinaryTransactionCopyWith(
          TonWalletMultisigOrdinaryTransaction value,
          $Res Function(TonWalletMultisigOrdinaryTransaction) _then) =
      _$TonWalletMultisigOrdinaryTransactionCopyWithImpl;
  @useResult
  $Res call(
      {String lt,
      PublicKey creator,
      List<PublicKey> confirmations,
      List<PublicKey> custodians,
      bool isOutgoing,
      BigInt value,
      Address address,
      @dateSecondsSinceEpochJsonConverter DateTime date,
      BigInt fees,
      String hash,
      String? comment,
      String? prevTransactionLt,
      DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,
      DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,
      TokenWalletDeployedNotification? tokenWalletDeployedNotification,
      WalletInteractionInfo? walletInteractionInfo});

  $PublicKeyCopyWith<$Res> get creator;
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
class _$TonWalletMultisigOrdinaryTransactionCopyWithImpl<$Res>
    implements $TonWalletMultisigOrdinaryTransactionCopyWith<$Res> {
  _$TonWalletMultisigOrdinaryTransactionCopyWithImpl(this._self, this._then);

  final TonWalletMultisigOrdinaryTransaction _self;
  final $Res Function(TonWalletMultisigOrdinaryTransaction) _then;

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
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
    Object? date = null,
    Object? fees = null,
    Object? hash = null,
    Object? comment = freezed,
    Object? prevTransactionLt = freezed,
    Object? dePoolOnRoundCompleteNotification = freezed,
    Object? dePoolReceiveAnswerNotification = freezed,
    Object? tokenWalletDeployedNotification = freezed,
    Object? walletInteractionInfo = freezed,
  }) {
    return _then(_self.copyWith(
      lt: null == lt
          ? _self.lt
          : lt // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _self.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      confirmations: null == confirmations
          ? _self.confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as List<PublicKey>,
      custodians: null == custodians
          ? _self.custodians
          : custodians // ignore: cast_nullable_to_non_nullable
              as List<PublicKey>,
      isOutgoing: null == isOutgoing
          ? _self.isOutgoing
          : isOutgoing // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as BigInt,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fees: null == fees
          ? _self.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as BigInt,
      hash: null == hash
          ? _self.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      prevTransactionLt: freezed == prevTransactionLt
          ? _self.prevTransactionLt
          : prevTransactionLt // ignore: cast_nullable_to_non_nullable
              as String?,
      dePoolOnRoundCompleteNotification: freezed ==
              dePoolOnRoundCompleteNotification
          ? _self.dePoolOnRoundCompleteNotification
          : dePoolOnRoundCompleteNotification // ignore: cast_nullable_to_non_nullable
              as DePoolOnRoundCompleteNotification?,
      dePoolReceiveAnswerNotification: freezed ==
              dePoolReceiveAnswerNotification
          ? _self.dePoolReceiveAnswerNotification
          : dePoolReceiveAnswerNotification // ignore: cast_nullable_to_non_nullable
              as DePoolReceiveAnswerNotification?,
      tokenWalletDeployedNotification: freezed ==
              tokenWalletDeployedNotification
          ? _self.tokenWalletDeployedNotification
          : tokenWalletDeployedNotification // ignore: cast_nullable_to_non_nullable
              as TokenWalletDeployedNotification?,
      walletInteractionInfo: freezed == walletInteractionInfo
          ? _self.walletInteractionInfo
          : walletInteractionInfo // ignore: cast_nullable_to_non_nullable
              as WalletInteractionInfo?,
    ));
  }

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PublicKeyCopyWith<$Res> get creator {
    return $PublicKeyCopyWith<$Res>(_self.creator, (value) {
      return _then(_self.copyWith(creator: value));
    });
  }

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DePoolOnRoundCompleteNotificationCopyWith<$Res>?
      get dePoolOnRoundCompleteNotification {
    if (_self.dePoolOnRoundCompleteNotification == null) {
      return null;
    }

    return $DePoolOnRoundCompleteNotificationCopyWith<$Res>(
        _self.dePoolOnRoundCompleteNotification!, (value) {
      return _then(_self.copyWith(dePoolOnRoundCompleteNotification: value));
    });
  }

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DePoolReceiveAnswerNotificationCopyWith<$Res>?
      get dePoolReceiveAnswerNotification {
    if (_self.dePoolReceiveAnswerNotification == null) {
      return null;
    }

    return $DePoolReceiveAnswerNotificationCopyWith<$Res>(
        _self.dePoolReceiveAnswerNotification!, (value) {
      return _then(_self.copyWith(dePoolReceiveAnswerNotification: value));
    });
  }

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenWalletDeployedNotificationCopyWith<$Res>?
      get tokenWalletDeployedNotification {
    if (_self.tokenWalletDeployedNotification == null) {
      return null;
    }

    return $TokenWalletDeployedNotificationCopyWith<$Res>(
        _self.tokenWalletDeployedNotification!, (value) {
      return _then(_self.copyWith(tokenWalletDeployedNotification: value));
    });
  }

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletInteractionInfoCopyWith<$Res>? get walletInteractionInfo {
    if (_self.walletInteractionInfo == null) {
      return null;
    }

    return $WalletInteractionInfoCopyWith<$Res>(_self.walletInteractionInfo!,
        (value) {
      return _then(_self.copyWith(walletInteractionInfo: value));
    });
  }
}

/// @nodoc

class _TonWalletMultisigOrdinaryTransaction
    implements TonWalletMultisigOrdinaryTransaction {
  const _TonWalletMultisigOrdinaryTransaction(
      {required this.lt,
      required this.creator,
      required final List<PublicKey> confirmations,
      required final List<PublicKey> custodians,
      required this.isOutgoing,
      required this.value,
      required this.address,
      @dateSecondsSinceEpochJsonConverter required this.date,
      required this.fees,
      required this.hash,
      this.comment,
      this.prevTransactionLt,
      this.dePoolOnRoundCompleteNotification,
      this.dePoolReceiveAnswerNotification,
      this.tokenWalletDeployedNotification,
      this.walletInteractionInfo})
      : _confirmations = confirmations,
        _custodians = custodians;

  @override
  final String lt;
// initiator of transactions
  @override
  final PublicKey creator;
// custodians who accepted this transaction
  final List<PublicKey> _confirmations;
// custodians who accepted this transaction
  @override
  List<PublicKey> get confirmations {
    if (_confirmations is EqualUnmodifiableListView) return _confirmations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_confirmations);
  }

// list of possible custodians
  final List<PublicKey> _custodians;
// list of possible custodians
  @override
  List<PublicKey> get custodians {
    if (_custodians is EqualUnmodifiableListView) return _custodians;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_custodians);
  }

// if this transaction was sent from this wallet
  @override
  final bool isOutgoing;
  @override
  final BigInt value;
// address of destination or source depends on isOutgoing
  @override
  final Address address;
  @override
  @dateSecondsSinceEpochJsonConverter
  final DateTime date;
  @override
  final BigInt fees;
  @override
  final String hash;
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

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TonWalletMultisigOrdinaryTransactionCopyWith<
          _TonWalletMultisigOrdinaryTransaction>
      get copyWith => __$TonWalletMultisigOrdinaryTransactionCopyWithImpl<
          _TonWalletMultisigOrdinaryTransaction>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TonWalletMultisigOrdinaryTransaction &&
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
            (identical(other.date, date) || other.date == date) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.hash, hash) || other.hash == hash) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      lt,
      creator,
      const DeepCollectionEquality().hash(_confirmations),
      const DeepCollectionEquality().hash(_custodians),
      isOutgoing,
      value,
      address,
      date,
      fees,
      hash,
      comment,
      prevTransactionLt,
      dePoolOnRoundCompleteNotification,
      dePoolReceiveAnswerNotification,
      tokenWalletDeployedNotification,
      walletInteractionInfo);

  @override
  String toString() {
    return 'TonWalletMultisigOrdinaryTransaction(lt: $lt, creator: $creator, confirmations: $confirmations, custodians: $custodians, isOutgoing: $isOutgoing, value: $value, address: $address, date: $date, fees: $fees, hash: $hash, comment: $comment, prevTransactionLt: $prevTransactionLt, dePoolOnRoundCompleteNotification: $dePoolOnRoundCompleteNotification, dePoolReceiveAnswerNotification: $dePoolReceiveAnswerNotification, tokenWalletDeployedNotification: $tokenWalletDeployedNotification, walletInteractionInfo: $walletInteractionInfo)';
  }
}

/// @nodoc
abstract mixin class _$TonWalletMultisigOrdinaryTransactionCopyWith<$Res>
    implements $TonWalletMultisigOrdinaryTransactionCopyWith<$Res> {
  factory _$TonWalletMultisigOrdinaryTransactionCopyWith(
          _TonWalletMultisigOrdinaryTransaction value,
          $Res Function(_TonWalletMultisigOrdinaryTransaction) _then) =
      __$TonWalletMultisigOrdinaryTransactionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String lt,
      PublicKey creator,
      List<PublicKey> confirmations,
      List<PublicKey> custodians,
      bool isOutgoing,
      BigInt value,
      Address address,
      @dateSecondsSinceEpochJsonConverter DateTime date,
      BigInt fees,
      String hash,
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
class __$TonWalletMultisigOrdinaryTransactionCopyWithImpl<$Res>
    implements _$TonWalletMultisigOrdinaryTransactionCopyWith<$Res> {
  __$TonWalletMultisigOrdinaryTransactionCopyWithImpl(this._self, this._then);

  final _TonWalletMultisigOrdinaryTransaction _self;
  final $Res Function(_TonWalletMultisigOrdinaryTransaction) _then;

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lt = null,
    Object? creator = null,
    Object? confirmations = null,
    Object? custodians = null,
    Object? isOutgoing = null,
    Object? value = null,
    Object? address = null,
    Object? date = null,
    Object? fees = null,
    Object? hash = null,
    Object? comment = freezed,
    Object? prevTransactionLt = freezed,
    Object? dePoolOnRoundCompleteNotification = freezed,
    Object? dePoolReceiveAnswerNotification = freezed,
    Object? tokenWalletDeployedNotification = freezed,
    Object? walletInteractionInfo = freezed,
  }) {
    return _then(_TonWalletMultisigOrdinaryTransaction(
      lt: null == lt
          ? _self.lt
          : lt // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _self.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      confirmations: null == confirmations
          ? _self._confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as List<PublicKey>,
      custodians: null == custodians
          ? _self._custodians
          : custodians // ignore: cast_nullable_to_non_nullable
              as List<PublicKey>,
      isOutgoing: null == isOutgoing
          ? _self.isOutgoing
          : isOutgoing // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as BigInt,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fees: null == fees
          ? _self.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as BigInt,
      hash: null == hash
          ? _self.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      prevTransactionLt: freezed == prevTransactionLt
          ? _self.prevTransactionLt
          : prevTransactionLt // ignore: cast_nullable_to_non_nullable
              as String?,
      dePoolOnRoundCompleteNotification: freezed ==
              dePoolOnRoundCompleteNotification
          ? _self.dePoolOnRoundCompleteNotification
          : dePoolOnRoundCompleteNotification // ignore: cast_nullable_to_non_nullable
              as DePoolOnRoundCompleteNotification?,
      dePoolReceiveAnswerNotification: freezed ==
              dePoolReceiveAnswerNotification
          ? _self.dePoolReceiveAnswerNotification
          : dePoolReceiveAnswerNotification // ignore: cast_nullable_to_non_nullable
              as DePoolReceiveAnswerNotification?,
      tokenWalletDeployedNotification: freezed ==
              tokenWalletDeployedNotification
          ? _self.tokenWalletDeployedNotification
          : tokenWalletDeployedNotification // ignore: cast_nullable_to_non_nullable
              as TokenWalletDeployedNotification?,
      walletInteractionInfo: freezed == walletInteractionInfo
          ? _self.walletInteractionInfo
          : walletInteractionInfo // ignore: cast_nullable_to_non_nullable
              as WalletInteractionInfo?,
    ));
  }

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PublicKeyCopyWith<$Res> get creator {
    return $PublicKeyCopyWith<$Res>(_self.creator, (value) {
      return _then(_self.copyWith(creator: value));
    });
  }

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DePoolOnRoundCompleteNotificationCopyWith<$Res>?
      get dePoolOnRoundCompleteNotification {
    if (_self.dePoolOnRoundCompleteNotification == null) {
      return null;
    }

    return $DePoolOnRoundCompleteNotificationCopyWith<$Res>(
        _self.dePoolOnRoundCompleteNotification!, (value) {
      return _then(_self.copyWith(dePoolOnRoundCompleteNotification: value));
    });
  }

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DePoolReceiveAnswerNotificationCopyWith<$Res>?
      get dePoolReceiveAnswerNotification {
    if (_self.dePoolReceiveAnswerNotification == null) {
      return null;
    }

    return $DePoolReceiveAnswerNotificationCopyWith<$Res>(
        _self.dePoolReceiveAnswerNotification!, (value) {
      return _then(_self.copyWith(dePoolReceiveAnswerNotification: value));
    });
  }

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenWalletDeployedNotificationCopyWith<$Res>?
      get tokenWalletDeployedNotification {
    if (_self.tokenWalletDeployedNotification == null) {
      return null;
    }

    return $TokenWalletDeployedNotificationCopyWith<$Res>(
        _self.tokenWalletDeployedNotification!, (value) {
      return _then(_self.copyWith(tokenWalletDeployedNotification: value));
    });
  }

  /// Create a copy of TonWalletMultisigOrdinaryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletInteractionInfoCopyWith<$Res>? get walletInteractionInfo {
    if (_self.walletInteractionInfo == null) {
      return null;
    }

    return $WalletInteractionInfoCopyWith<$Res>(_self.walletInteractionInfo!,
        (value) {
      return _then(_self.copyWith(walletInteractionInfo: value));
    });
  }
}

// dart format on
