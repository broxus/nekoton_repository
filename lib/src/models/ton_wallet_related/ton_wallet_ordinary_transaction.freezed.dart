// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ton_wallet_ordinary_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TonWalletOrdinaryTransaction {

 String get lt; bool get isOutgoing;@amountJsonConverter BigInt get value; Address get address;@dateSecondsSinceEpochJsonConverter DateTime get date;@amountJsonConverter BigInt get fees; String get hash; String? get prevTransactionLt; String? get comment; DePoolOnRoundCompleteNotification? get dePoolOnRoundCompleteNotification; DePoolReceiveAnswerNotification? get dePoolReceiveAnswerNotification; TokenWalletDeployedNotification? get tokenWalletDeployedNotification; WalletInteractionInfo? get walletInteractionInfo;
/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TonWalletOrdinaryTransactionCopyWith<TonWalletOrdinaryTransaction> get copyWith => _$TonWalletOrdinaryTransactionCopyWithImpl<TonWalletOrdinaryTransaction>(this as TonWalletOrdinaryTransaction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TonWalletOrdinaryTransaction&&(identical(other.lt, lt) || other.lt == lt)&&(identical(other.isOutgoing, isOutgoing) || other.isOutgoing == isOutgoing)&&(identical(other.value, value) || other.value == value)&&(identical(other.address, address) || other.address == address)&&(identical(other.date, date) || other.date == date)&&(identical(other.fees, fees) || other.fees == fees)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.prevTransactionLt, prevTransactionLt) || other.prevTransactionLt == prevTransactionLt)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.dePoolOnRoundCompleteNotification, dePoolOnRoundCompleteNotification) || other.dePoolOnRoundCompleteNotification == dePoolOnRoundCompleteNotification)&&(identical(other.dePoolReceiveAnswerNotification, dePoolReceiveAnswerNotification) || other.dePoolReceiveAnswerNotification == dePoolReceiveAnswerNotification)&&(identical(other.tokenWalletDeployedNotification, tokenWalletDeployedNotification) || other.tokenWalletDeployedNotification == tokenWalletDeployedNotification)&&(identical(other.walletInteractionInfo, walletInteractionInfo) || other.walletInteractionInfo == walletInteractionInfo));
}


@override
int get hashCode => Object.hash(runtimeType,lt,isOutgoing,value,address,date,fees,hash,prevTransactionLt,comment,dePoolOnRoundCompleteNotification,dePoolReceiveAnswerNotification,tokenWalletDeployedNotification,walletInteractionInfo);

@override
String toString() {
  return 'TonWalletOrdinaryTransaction(lt: $lt, isOutgoing: $isOutgoing, value: $value, address: $address, date: $date, fees: $fees, hash: $hash, prevTransactionLt: $prevTransactionLt, comment: $comment, dePoolOnRoundCompleteNotification: $dePoolOnRoundCompleteNotification, dePoolReceiveAnswerNotification: $dePoolReceiveAnswerNotification, tokenWalletDeployedNotification: $tokenWalletDeployedNotification, walletInteractionInfo: $walletInteractionInfo)';
}


}

/// @nodoc
abstract mixin class $TonWalletOrdinaryTransactionCopyWith<$Res>  {
  factory $TonWalletOrdinaryTransactionCopyWith(TonWalletOrdinaryTransaction value, $Res Function(TonWalletOrdinaryTransaction) _then) = _$TonWalletOrdinaryTransactionCopyWithImpl;
@useResult
$Res call({
 String lt, bool isOutgoing,@amountJsonConverter BigInt value, Address address,@dateSecondsSinceEpochJsonConverter DateTime date,@amountJsonConverter BigInt fees, String hash, String? prevTransactionLt, String? comment, DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification, DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification, TokenWalletDeployedNotification? tokenWalletDeployedNotification, WalletInteractionInfo? walletInteractionInfo
});


$AddressCopyWith<$Res> get address;$DePoolOnRoundCompleteNotificationCopyWith<$Res>? get dePoolOnRoundCompleteNotification;$DePoolReceiveAnswerNotificationCopyWith<$Res>? get dePoolReceiveAnswerNotification;$TokenWalletDeployedNotificationCopyWith<$Res>? get tokenWalletDeployedNotification;$WalletInteractionInfoCopyWith<$Res>? get walletInteractionInfo;

}
/// @nodoc
class _$TonWalletOrdinaryTransactionCopyWithImpl<$Res>
    implements $TonWalletOrdinaryTransactionCopyWith<$Res> {
  _$TonWalletOrdinaryTransactionCopyWithImpl(this._self, this._then);

  final TonWalletOrdinaryTransaction _self;
  final $Res Function(TonWalletOrdinaryTransaction) _then;

/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lt = null,Object? isOutgoing = null,Object? value = null,Object? address = null,Object? date = null,Object? fees = null,Object? hash = null,Object? prevTransactionLt = freezed,Object? comment = freezed,Object? dePoolOnRoundCompleteNotification = freezed,Object? dePoolReceiveAnswerNotification = freezed,Object? tokenWalletDeployedNotification = freezed,Object? walletInteractionInfo = freezed,}) {
  return _then(_self.copyWith(
lt: null == lt ? _self.lt : lt // ignore: cast_nullable_to_non_nullable
as String,isOutgoing: null == isOutgoing ? _self.isOutgoing : isOutgoing // ignore: cast_nullable_to_non_nullable
as bool,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as BigInt,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,fees: null == fees ? _self.fees : fees // ignore: cast_nullable_to_non_nullable
as BigInt,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,prevTransactionLt: freezed == prevTransactionLt ? _self.prevTransactionLt : prevTransactionLt // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,dePoolOnRoundCompleteNotification: freezed == dePoolOnRoundCompleteNotification ? _self.dePoolOnRoundCompleteNotification : dePoolOnRoundCompleteNotification // ignore: cast_nullable_to_non_nullable
as DePoolOnRoundCompleteNotification?,dePoolReceiveAnswerNotification: freezed == dePoolReceiveAnswerNotification ? _self.dePoolReceiveAnswerNotification : dePoolReceiveAnswerNotification // ignore: cast_nullable_to_non_nullable
as DePoolReceiveAnswerNotification?,tokenWalletDeployedNotification: freezed == tokenWalletDeployedNotification ? _self.tokenWalletDeployedNotification : tokenWalletDeployedNotification // ignore: cast_nullable_to_non_nullable
as TokenWalletDeployedNotification?,walletInteractionInfo: freezed == walletInteractionInfo ? _self.walletInteractionInfo : walletInteractionInfo // ignore: cast_nullable_to_non_nullable
as WalletInteractionInfo?,
  ));
}
/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DePoolOnRoundCompleteNotificationCopyWith<$Res>? get dePoolOnRoundCompleteNotification {
    if (_self.dePoolOnRoundCompleteNotification == null) {
    return null;
  }

  return $DePoolOnRoundCompleteNotificationCopyWith<$Res>(_self.dePoolOnRoundCompleteNotification!, (value) {
    return _then(_self.copyWith(dePoolOnRoundCompleteNotification: value));
  });
}/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DePoolReceiveAnswerNotificationCopyWith<$Res>? get dePoolReceiveAnswerNotification {
    if (_self.dePoolReceiveAnswerNotification == null) {
    return null;
  }

  return $DePoolReceiveAnswerNotificationCopyWith<$Res>(_self.dePoolReceiveAnswerNotification!, (value) {
    return _then(_self.copyWith(dePoolReceiveAnswerNotification: value));
  });
}/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenWalletDeployedNotificationCopyWith<$Res>? get tokenWalletDeployedNotification {
    if (_self.tokenWalletDeployedNotification == null) {
    return null;
  }

  return $TokenWalletDeployedNotificationCopyWith<$Res>(_self.tokenWalletDeployedNotification!, (value) {
    return _then(_self.copyWith(tokenWalletDeployedNotification: value));
  });
}/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletInteractionInfoCopyWith<$Res>? get walletInteractionInfo {
    if (_self.walletInteractionInfo == null) {
    return null;
  }

  return $WalletInteractionInfoCopyWith<$Res>(_self.walletInteractionInfo!, (value) {
    return _then(_self.copyWith(walletInteractionInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [TonWalletOrdinaryTransaction].
extension TonWalletOrdinaryTransactionPatterns on TonWalletOrdinaryTransaction {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TonWalletOrdinaryTransaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TonWalletOrdinaryTransaction() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TonWalletOrdinaryTransaction value)  $default,){
final _that = this;
switch (_that) {
case _TonWalletOrdinaryTransaction():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TonWalletOrdinaryTransaction value)?  $default,){
final _that = this;
switch (_that) {
case _TonWalletOrdinaryTransaction() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lt,  bool isOutgoing, @amountJsonConverter  BigInt value,  Address address, @dateSecondsSinceEpochJsonConverter  DateTime date, @amountJsonConverter  BigInt fees,  String hash,  String? prevTransactionLt,  String? comment,  DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,  DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,  TokenWalletDeployedNotification? tokenWalletDeployedNotification,  WalletInteractionInfo? walletInteractionInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TonWalletOrdinaryTransaction() when $default != null:
return $default(_that.lt,_that.isOutgoing,_that.value,_that.address,_that.date,_that.fees,_that.hash,_that.prevTransactionLt,_that.comment,_that.dePoolOnRoundCompleteNotification,_that.dePoolReceiveAnswerNotification,_that.tokenWalletDeployedNotification,_that.walletInteractionInfo);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lt,  bool isOutgoing, @amountJsonConverter  BigInt value,  Address address, @dateSecondsSinceEpochJsonConverter  DateTime date, @amountJsonConverter  BigInt fees,  String hash,  String? prevTransactionLt,  String? comment,  DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,  DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,  TokenWalletDeployedNotification? tokenWalletDeployedNotification,  WalletInteractionInfo? walletInteractionInfo)  $default,) {final _that = this;
switch (_that) {
case _TonWalletOrdinaryTransaction():
return $default(_that.lt,_that.isOutgoing,_that.value,_that.address,_that.date,_that.fees,_that.hash,_that.prevTransactionLt,_that.comment,_that.dePoolOnRoundCompleteNotification,_that.dePoolReceiveAnswerNotification,_that.tokenWalletDeployedNotification,_that.walletInteractionInfo);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lt,  bool isOutgoing, @amountJsonConverter  BigInt value,  Address address, @dateSecondsSinceEpochJsonConverter  DateTime date, @amountJsonConverter  BigInt fees,  String hash,  String? prevTransactionLt,  String? comment,  DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification,  DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification,  TokenWalletDeployedNotification? tokenWalletDeployedNotification,  WalletInteractionInfo? walletInteractionInfo)?  $default,) {final _that = this;
switch (_that) {
case _TonWalletOrdinaryTransaction() when $default != null:
return $default(_that.lt,_that.isOutgoing,_that.value,_that.address,_that.date,_that.fees,_that.hash,_that.prevTransactionLt,_that.comment,_that.dePoolOnRoundCompleteNotification,_that.dePoolReceiveAnswerNotification,_that.tokenWalletDeployedNotification,_that.walletInteractionInfo);case _:
  return null;

}
}

}

/// @nodoc


class _TonWalletOrdinaryTransaction implements TonWalletOrdinaryTransaction {
  const _TonWalletOrdinaryTransaction({required this.lt, required this.isOutgoing, @amountJsonConverter required this.value, required this.address, @dateSecondsSinceEpochJsonConverter required this.date, @amountJsonConverter required this.fees, required this.hash, this.prevTransactionLt, this.comment, this.dePoolOnRoundCompleteNotification, this.dePoolReceiveAnswerNotification, this.tokenWalletDeployedNotification, this.walletInteractionInfo});
  

@override final  String lt;
@override final  bool isOutgoing;
@override@amountJsonConverter final  BigInt value;
@override final  Address address;
@override@dateSecondsSinceEpochJsonConverter final  DateTime date;
@override@amountJsonConverter final  BigInt fees;
@override final  String hash;
@override final  String? prevTransactionLt;
@override final  String? comment;
@override final  DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification;
@override final  DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification;
@override final  TokenWalletDeployedNotification? tokenWalletDeployedNotification;
@override final  WalletInteractionInfo? walletInteractionInfo;

/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TonWalletOrdinaryTransactionCopyWith<_TonWalletOrdinaryTransaction> get copyWith => __$TonWalletOrdinaryTransactionCopyWithImpl<_TonWalletOrdinaryTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TonWalletOrdinaryTransaction&&(identical(other.lt, lt) || other.lt == lt)&&(identical(other.isOutgoing, isOutgoing) || other.isOutgoing == isOutgoing)&&(identical(other.value, value) || other.value == value)&&(identical(other.address, address) || other.address == address)&&(identical(other.date, date) || other.date == date)&&(identical(other.fees, fees) || other.fees == fees)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.prevTransactionLt, prevTransactionLt) || other.prevTransactionLt == prevTransactionLt)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.dePoolOnRoundCompleteNotification, dePoolOnRoundCompleteNotification) || other.dePoolOnRoundCompleteNotification == dePoolOnRoundCompleteNotification)&&(identical(other.dePoolReceiveAnswerNotification, dePoolReceiveAnswerNotification) || other.dePoolReceiveAnswerNotification == dePoolReceiveAnswerNotification)&&(identical(other.tokenWalletDeployedNotification, tokenWalletDeployedNotification) || other.tokenWalletDeployedNotification == tokenWalletDeployedNotification)&&(identical(other.walletInteractionInfo, walletInteractionInfo) || other.walletInteractionInfo == walletInteractionInfo));
}


@override
int get hashCode => Object.hash(runtimeType,lt,isOutgoing,value,address,date,fees,hash,prevTransactionLt,comment,dePoolOnRoundCompleteNotification,dePoolReceiveAnswerNotification,tokenWalletDeployedNotification,walletInteractionInfo);

@override
String toString() {
  return 'TonWalletOrdinaryTransaction(lt: $lt, isOutgoing: $isOutgoing, value: $value, address: $address, date: $date, fees: $fees, hash: $hash, prevTransactionLt: $prevTransactionLt, comment: $comment, dePoolOnRoundCompleteNotification: $dePoolOnRoundCompleteNotification, dePoolReceiveAnswerNotification: $dePoolReceiveAnswerNotification, tokenWalletDeployedNotification: $tokenWalletDeployedNotification, walletInteractionInfo: $walletInteractionInfo)';
}


}

/// @nodoc
abstract mixin class _$TonWalletOrdinaryTransactionCopyWith<$Res> implements $TonWalletOrdinaryTransactionCopyWith<$Res> {
  factory _$TonWalletOrdinaryTransactionCopyWith(_TonWalletOrdinaryTransaction value, $Res Function(_TonWalletOrdinaryTransaction) _then) = __$TonWalletOrdinaryTransactionCopyWithImpl;
@override @useResult
$Res call({
 String lt, bool isOutgoing,@amountJsonConverter BigInt value, Address address,@dateSecondsSinceEpochJsonConverter DateTime date,@amountJsonConverter BigInt fees, String hash, String? prevTransactionLt, String? comment, DePoolOnRoundCompleteNotification? dePoolOnRoundCompleteNotification, DePoolReceiveAnswerNotification? dePoolReceiveAnswerNotification, TokenWalletDeployedNotification? tokenWalletDeployedNotification, WalletInteractionInfo? walletInteractionInfo
});


@override $AddressCopyWith<$Res> get address;@override $DePoolOnRoundCompleteNotificationCopyWith<$Res>? get dePoolOnRoundCompleteNotification;@override $DePoolReceiveAnswerNotificationCopyWith<$Res>? get dePoolReceiveAnswerNotification;@override $TokenWalletDeployedNotificationCopyWith<$Res>? get tokenWalletDeployedNotification;@override $WalletInteractionInfoCopyWith<$Res>? get walletInteractionInfo;

}
/// @nodoc
class __$TonWalletOrdinaryTransactionCopyWithImpl<$Res>
    implements _$TonWalletOrdinaryTransactionCopyWith<$Res> {
  __$TonWalletOrdinaryTransactionCopyWithImpl(this._self, this._then);

  final _TonWalletOrdinaryTransaction _self;
  final $Res Function(_TonWalletOrdinaryTransaction) _then;

/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lt = null,Object? isOutgoing = null,Object? value = null,Object? address = null,Object? date = null,Object? fees = null,Object? hash = null,Object? prevTransactionLt = freezed,Object? comment = freezed,Object? dePoolOnRoundCompleteNotification = freezed,Object? dePoolReceiveAnswerNotification = freezed,Object? tokenWalletDeployedNotification = freezed,Object? walletInteractionInfo = freezed,}) {
  return _then(_TonWalletOrdinaryTransaction(
lt: null == lt ? _self.lt : lt // ignore: cast_nullable_to_non_nullable
as String,isOutgoing: null == isOutgoing ? _self.isOutgoing : isOutgoing // ignore: cast_nullable_to_non_nullable
as bool,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as BigInt,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,fees: null == fees ? _self.fees : fees // ignore: cast_nullable_to_non_nullable
as BigInt,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,prevTransactionLt: freezed == prevTransactionLt ? _self.prevTransactionLt : prevTransactionLt // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,dePoolOnRoundCompleteNotification: freezed == dePoolOnRoundCompleteNotification ? _self.dePoolOnRoundCompleteNotification : dePoolOnRoundCompleteNotification // ignore: cast_nullable_to_non_nullable
as DePoolOnRoundCompleteNotification?,dePoolReceiveAnswerNotification: freezed == dePoolReceiveAnswerNotification ? _self.dePoolReceiveAnswerNotification : dePoolReceiveAnswerNotification // ignore: cast_nullable_to_non_nullable
as DePoolReceiveAnswerNotification?,tokenWalletDeployedNotification: freezed == tokenWalletDeployedNotification ? _self.tokenWalletDeployedNotification : tokenWalletDeployedNotification // ignore: cast_nullable_to_non_nullable
as TokenWalletDeployedNotification?,walletInteractionInfo: freezed == walletInteractionInfo ? _self.walletInteractionInfo : walletInteractionInfo // ignore: cast_nullable_to_non_nullable
as WalletInteractionInfo?,
  ));
}

/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DePoolOnRoundCompleteNotificationCopyWith<$Res>? get dePoolOnRoundCompleteNotification {
    if (_self.dePoolOnRoundCompleteNotification == null) {
    return null;
  }

  return $DePoolOnRoundCompleteNotificationCopyWith<$Res>(_self.dePoolOnRoundCompleteNotification!, (value) {
    return _then(_self.copyWith(dePoolOnRoundCompleteNotification: value));
  });
}/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DePoolReceiveAnswerNotificationCopyWith<$Res>? get dePoolReceiveAnswerNotification {
    if (_self.dePoolReceiveAnswerNotification == null) {
    return null;
  }

  return $DePoolReceiveAnswerNotificationCopyWith<$Res>(_self.dePoolReceiveAnswerNotification!, (value) {
    return _then(_self.copyWith(dePoolReceiveAnswerNotification: value));
  });
}/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenWalletDeployedNotificationCopyWith<$Res>? get tokenWalletDeployedNotification {
    if (_self.tokenWalletDeployedNotification == null) {
    return null;
  }

  return $TokenWalletDeployedNotificationCopyWith<$Res>(_self.tokenWalletDeployedNotification!, (value) {
    return _then(_self.copyWith(tokenWalletDeployedNotification: value));
  });
}/// Create a copy of TonWalletOrdinaryTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletInteractionInfoCopyWith<$Res>? get walletInteractionInfo {
    if (_self.walletInteractionInfo == null) {
    return null;
  }

  return $WalletInteractionInfoCopyWith<$Res>(_self.walletInteractionInfo!, (value) {
    return _then(_self.copyWith(walletInteractionInfo: value));
  });
}
}

// dart format on
