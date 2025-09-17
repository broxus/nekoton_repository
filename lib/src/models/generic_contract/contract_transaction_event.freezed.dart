// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_transaction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractFoundTransactionEvent {

 Address get address; List<Transaction> get transactions; TransactionsBatchInfo get info;
/// Create a copy of ContractFoundTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractFoundTransactionEventCopyWith<ContractFoundTransactionEvent> get copyWith => _$ContractFoundTransactionEventCopyWithImpl<ContractFoundTransactionEvent>(this as ContractFoundTransactionEvent, _$identity);

  /// Serializes this ContractFoundTransactionEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractFoundTransactionEvent&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.info, info) || other.info == info));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,const DeepCollectionEquality().hash(transactions),info);

@override
String toString() {
  return 'ContractFoundTransactionEvent(address: $address, transactions: $transactions, info: $info)';
}


}

/// @nodoc
abstract mixin class $ContractFoundTransactionEventCopyWith<$Res>  {
  factory $ContractFoundTransactionEventCopyWith(ContractFoundTransactionEvent value, $Res Function(ContractFoundTransactionEvent) _then) = _$ContractFoundTransactionEventCopyWithImpl;
@useResult
$Res call({
 Address address, List<Transaction> transactions, TransactionsBatchInfo info
});


$AddressCopyWith<$Res> get address;$TransactionsBatchInfoCopyWith<$Res> get info;

}
/// @nodoc
class _$ContractFoundTransactionEventCopyWithImpl<$Res>
    implements $ContractFoundTransactionEventCopyWith<$Res> {
  _$ContractFoundTransactionEventCopyWithImpl(this._self, this._then);

  final ContractFoundTransactionEvent _self;
  final $Res Function(ContractFoundTransactionEvent) _then;

/// Create a copy of ContractFoundTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? transactions = null,Object? info = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as TransactionsBatchInfo,
  ));
}
/// Create a copy of ContractFoundTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of ContractFoundTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionsBatchInfoCopyWith<$Res> get info {
  
  return $TransactionsBatchInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContractFoundTransactionEvent].
extension ContractFoundTransactionEventPatterns on ContractFoundTransactionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractFoundTransactionEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractFoundTransactionEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractFoundTransactionEvent value)  $default,){
final _that = this;
switch (_that) {
case _ContractFoundTransactionEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractFoundTransactionEvent value)?  $default,){
final _that = this;
switch (_that) {
case _ContractFoundTransactionEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Address address,  List<Transaction> transactions,  TransactionsBatchInfo info)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractFoundTransactionEvent() when $default != null:
return $default(_that.address,_that.transactions,_that.info);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Address address,  List<Transaction> transactions,  TransactionsBatchInfo info)  $default,) {final _that = this;
switch (_that) {
case _ContractFoundTransactionEvent():
return $default(_that.address,_that.transactions,_that.info);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Address address,  List<Transaction> transactions,  TransactionsBatchInfo info)?  $default,) {final _that = this;
switch (_that) {
case _ContractFoundTransactionEvent() when $default != null:
return $default(_that.address,_that.transactions,_that.info);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractFoundTransactionEvent implements ContractFoundTransactionEvent {
  const _ContractFoundTransactionEvent({required this.address, required final  List<Transaction> transactions, required this.info}): _transactions = transactions;
  factory _ContractFoundTransactionEvent.fromJson(Map<String, dynamic> json) => _$ContractFoundTransactionEventFromJson(json);

@override final  Address address;
 final  List<Transaction> _transactions;
@override List<Transaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override final  TransactionsBatchInfo info;

/// Create a copy of ContractFoundTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractFoundTransactionEventCopyWith<_ContractFoundTransactionEvent> get copyWith => __$ContractFoundTransactionEventCopyWithImpl<_ContractFoundTransactionEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractFoundTransactionEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractFoundTransactionEvent&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.info, info) || other.info == info));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,const DeepCollectionEquality().hash(_transactions),info);

@override
String toString() {
  return 'ContractFoundTransactionEvent(address: $address, transactions: $transactions, info: $info)';
}


}

/// @nodoc
abstract mixin class _$ContractFoundTransactionEventCopyWith<$Res> implements $ContractFoundTransactionEventCopyWith<$Res> {
  factory _$ContractFoundTransactionEventCopyWith(_ContractFoundTransactionEvent value, $Res Function(_ContractFoundTransactionEvent) _then) = __$ContractFoundTransactionEventCopyWithImpl;
@override @useResult
$Res call({
 Address address, List<Transaction> transactions, TransactionsBatchInfo info
});


@override $AddressCopyWith<$Res> get address;@override $TransactionsBatchInfoCopyWith<$Res> get info;

}
/// @nodoc
class __$ContractFoundTransactionEventCopyWithImpl<$Res>
    implements _$ContractFoundTransactionEventCopyWith<$Res> {
  __$ContractFoundTransactionEventCopyWithImpl(this._self, this._then);

  final _ContractFoundTransactionEvent _self;
  final $Res Function(_ContractFoundTransactionEvent) _then;

/// Create a copy of ContractFoundTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? transactions = null,Object? info = null,}) {
  return _then(_ContractFoundTransactionEvent(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as TransactionsBatchInfo,
  ));
}

/// Create a copy of ContractFoundTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of ContractFoundTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionsBatchInfoCopyWith<$Res> get info {
  
  return $TransactionsBatchInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

// dart format on
