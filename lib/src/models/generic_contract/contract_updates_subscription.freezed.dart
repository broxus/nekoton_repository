// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_updates_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractUpdatesSubscription {

@JsonKey(includeIfNull: false, name: 'state') bool? get contractState;@JsonKey(includeIfNull: false) bool? get transactions;
/// Create a copy of ContractUpdatesSubscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractUpdatesSubscriptionCopyWith<ContractUpdatesSubscription> get copyWith => _$ContractUpdatesSubscriptionCopyWithImpl<ContractUpdatesSubscription>(this as ContractUpdatesSubscription, _$identity);

  /// Serializes this ContractUpdatesSubscription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractUpdatesSubscription&&(identical(other.contractState, contractState) || other.contractState == contractState)&&(identical(other.transactions, transactions) || other.transactions == transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contractState,transactions);

@override
String toString() {
  return 'ContractUpdatesSubscription(contractState: $contractState, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $ContractUpdatesSubscriptionCopyWith<$Res>  {
  factory $ContractUpdatesSubscriptionCopyWith(ContractUpdatesSubscription value, $Res Function(ContractUpdatesSubscription) _then) = _$ContractUpdatesSubscriptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, name: 'state') bool? contractState,@JsonKey(includeIfNull: false) bool? transactions
});




}
/// @nodoc
class _$ContractUpdatesSubscriptionCopyWithImpl<$Res>
    implements $ContractUpdatesSubscriptionCopyWith<$Res> {
  _$ContractUpdatesSubscriptionCopyWithImpl(this._self, this._then);

  final ContractUpdatesSubscription _self;
  final $Res Function(ContractUpdatesSubscription) _then;

/// Create a copy of ContractUpdatesSubscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contractState = freezed,Object? transactions = freezed,}) {
  return _then(_self.copyWith(
contractState: freezed == contractState ? _self.contractState : contractState // ignore: cast_nullable_to_non_nullable
as bool?,transactions: freezed == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractUpdatesSubscription].
extension ContractUpdatesSubscriptionPatterns on ContractUpdatesSubscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractUpdatesSubscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractUpdatesSubscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractUpdatesSubscription value)  $default,){
final _that = this;
switch (_that) {
case _ContractUpdatesSubscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractUpdatesSubscription value)?  $default,){
final _that = this;
switch (_that) {
case _ContractUpdatesSubscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, name: 'state')  bool? contractState, @JsonKey(includeIfNull: false)  bool? transactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractUpdatesSubscription() when $default != null:
return $default(_that.contractState,_that.transactions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, name: 'state')  bool? contractState, @JsonKey(includeIfNull: false)  bool? transactions)  $default,) {final _that = this;
switch (_that) {
case _ContractUpdatesSubscription():
return $default(_that.contractState,_that.transactions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false, name: 'state')  bool? contractState, @JsonKey(includeIfNull: false)  bool? transactions)?  $default,) {final _that = this;
switch (_that) {
case _ContractUpdatesSubscription() when $default != null:
return $default(_that.contractState,_that.transactions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractUpdatesSubscription implements ContractUpdatesSubscription {
  const _ContractUpdatesSubscription({@JsonKey(includeIfNull: false, name: 'state') this.contractState, @JsonKey(includeIfNull: false) this.transactions});
  factory _ContractUpdatesSubscription.fromJson(Map<String, dynamic> json) => _$ContractUpdatesSubscriptionFromJson(json);

@override@JsonKey(includeIfNull: false, name: 'state') final  bool? contractState;
@override@JsonKey(includeIfNull: false) final  bool? transactions;

/// Create a copy of ContractUpdatesSubscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractUpdatesSubscriptionCopyWith<_ContractUpdatesSubscription> get copyWith => __$ContractUpdatesSubscriptionCopyWithImpl<_ContractUpdatesSubscription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractUpdatesSubscriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractUpdatesSubscription&&(identical(other.contractState, contractState) || other.contractState == contractState)&&(identical(other.transactions, transactions) || other.transactions == transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contractState,transactions);

@override
String toString() {
  return 'ContractUpdatesSubscription(contractState: $contractState, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class _$ContractUpdatesSubscriptionCopyWith<$Res> implements $ContractUpdatesSubscriptionCopyWith<$Res> {
  factory _$ContractUpdatesSubscriptionCopyWith(_ContractUpdatesSubscription value, $Res Function(_ContractUpdatesSubscription) _then) = __$ContractUpdatesSubscriptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, name: 'state') bool? contractState,@JsonKey(includeIfNull: false) bool? transactions
});




}
/// @nodoc
class __$ContractUpdatesSubscriptionCopyWithImpl<$Res>
    implements _$ContractUpdatesSubscriptionCopyWith<$Res> {
  __$ContractUpdatesSubscriptionCopyWithImpl(this._self, this._then);

  final _ContractUpdatesSubscription _self;
  final $Res Function(_ContractUpdatesSubscription) _then;

/// Create a copy of ContractUpdatesSubscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contractState = freezed,Object? transactions = freezed,}) {
  return _then(_ContractUpdatesSubscription(
contractState: freezed == contractState ? _self.contractState : contractState // ignore: cast_nullable_to_non_nullable
as bool?,transactions: freezed == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
