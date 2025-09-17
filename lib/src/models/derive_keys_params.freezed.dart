// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'derive_keys_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeriveKeysParams {

 int get accountId;
/// Create a copy of DeriveKeysParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeriveKeysParamsCopyWith<DeriveKeysParams> get copyWith => _$DeriveKeysParamsCopyWithImpl<DeriveKeysParams>(this as DeriveKeysParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeriveKeysParams&&(identical(other.accountId, accountId) || other.accountId == accountId));
}


@override
int get hashCode => Object.hash(runtimeType,accountId);

@override
String toString() {
  return 'DeriveKeysParams(accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $DeriveKeysParamsCopyWith<$Res>  {
  factory $DeriveKeysParamsCopyWith(DeriveKeysParams value, $Res Function(DeriveKeysParams) _then) = _$DeriveKeysParamsCopyWithImpl;
@useResult
$Res call({
 int accountId
});




}
/// @nodoc
class _$DeriveKeysParamsCopyWithImpl<$Res>
    implements $DeriveKeysParamsCopyWith<$Res> {
  _$DeriveKeysParamsCopyWithImpl(this._self, this._then);

  final DeriveKeysParams _self;
  final $Res Function(DeriveKeysParams) _then;

/// Create a copy of DeriveKeysParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DeriveKeysParams].
extension DeriveKeysParamsPatterns on DeriveKeysParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeriveKeysParamsDerived value)?  derived,TResult Function( DeriveKeysParamsLedger value)?  ledger,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeriveKeysParamsDerived() when derived != null:
return derived(_that);case DeriveKeysParamsLedger() when ledger != null:
return ledger(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeriveKeysParamsDerived value)  derived,required TResult Function( DeriveKeysParamsLedger value)  ledger,}){
final _that = this;
switch (_that) {
case DeriveKeysParamsDerived():
return derived(_that);case DeriveKeysParamsLedger():
return ledger(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeriveKeysParamsDerived value)?  derived,TResult? Function( DeriveKeysParamsLedger value)?  ledger,}){
final _that = this;
switch (_that) {
case DeriveKeysParamsDerived() when derived != null:
return derived(_that);case DeriveKeysParamsLedger() when ledger != null:
return ledger(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int accountId,  PublicKey masterKey,  String password)?  derived,TResult Function( int accountId)?  ledger,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeriveKeysParamsDerived() when derived != null:
return derived(_that.accountId,_that.masterKey,_that.password);case DeriveKeysParamsLedger() when ledger != null:
return ledger(_that.accountId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int accountId,  PublicKey masterKey,  String password)  derived,required TResult Function( int accountId)  ledger,}) {final _that = this;
switch (_that) {
case DeriveKeysParamsDerived():
return derived(_that.accountId,_that.masterKey,_that.password);case DeriveKeysParamsLedger():
return ledger(_that.accountId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int accountId,  PublicKey masterKey,  String password)?  derived,TResult? Function( int accountId)?  ledger,}) {final _that = this;
switch (_that) {
case DeriveKeysParamsDerived() when derived != null:
return derived(_that.accountId,_that.masterKey,_that.password);case DeriveKeysParamsLedger() when ledger != null:
return ledger(_that.accountId);case _:
  return null;

}
}

}

/// @nodoc


class DeriveKeysParamsDerived implements DeriveKeysParams {
  const DeriveKeysParamsDerived({required this.accountId, required this.masterKey, required this.password});
  

@override final  int accountId;
 final  PublicKey masterKey;
 final  String password;

/// Create a copy of DeriveKeysParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeriveKeysParamsDerivedCopyWith<DeriveKeysParamsDerived> get copyWith => _$DeriveKeysParamsDerivedCopyWithImpl<DeriveKeysParamsDerived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeriveKeysParamsDerived&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.masterKey, masterKey) || other.masterKey == masterKey)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,masterKey,password);

@override
String toString() {
  return 'DeriveKeysParams.derived(accountId: $accountId, masterKey: $masterKey, password: $password)';
}


}

/// @nodoc
abstract mixin class $DeriveKeysParamsDerivedCopyWith<$Res> implements $DeriveKeysParamsCopyWith<$Res> {
  factory $DeriveKeysParamsDerivedCopyWith(DeriveKeysParamsDerived value, $Res Function(DeriveKeysParamsDerived) _then) = _$DeriveKeysParamsDerivedCopyWithImpl;
@override @useResult
$Res call({
 int accountId, PublicKey masterKey, String password
});


$PublicKeyCopyWith<$Res> get masterKey;

}
/// @nodoc
class _$DeriveKeysParamsDerivedCopyWithImpl<$Res>
    implements $DeriveKeysParamsDerivedCopyWith<$Res> {
  _$DeriveKeysParamsDerivedCopyWithImpl(this._self, this._then);

  final DeriveKeysParamsDerived _self;
  final $Res Function(DeriveKeysParamsDerived) _then;

/// Create a copy of DeriveKeysParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? masterKey = null,Object? password = null,}) {
  return _then(DeriveKeysParamsDerived(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,masterKey: null == masterKey ? _self.masterKey : masterKey // ignore: cast_nullable_to_non_nullable
as PublicKey,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DeriveKeysParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PublicKeyCopyWith<$Res> get masterKey {
  
  return $PublicKeyCopyWith<$Res>(_self.masterKey, (value) {
    return _then(_self.copyWith(masterKey: value));
  });
}
}

/// @nodoc


class DeriveKeysParamsLedger implements DeriveKeysParams {
  const DeriveKeysParamsLedger({required this.accountId});
  

@override final  int accountId;

/// Create a copy of DeriveKeysParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeriveKeysParamsLedgerCopyWith<DeriveKeysParamsLedger> get copyWith => _$DeriveKeysParamsLedgerCopyWithImpl<DeriveKeysParamsLedger>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeriveKeysParamsLedger&&(identical(other.accountId, accountId) || other.accountId == accountId));
}


@override
int get hashCode => Object.hash(runtimeType,accountId);

@override
String toString() {
  return 'DeriveKeysParams.ledger(accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $DeriveKeysParamsLedgerCopyWith<$Res> implements $DeriveKeysParamsCopyWith<$Res> {
  factory $DeriveKeysParamsLedgerCopyWith(DeriveKeysParamsLedger value, $Res Function(DeriveKeysParamsLedger) _then) = _$DeriveKeysParamsLedgerCopyWithImpl;
@override @useResult
$Res call({
 int accountId
});




}
/// @nodoc
class _$DeriveKeysParamsLedgerCopyWithImpl<$Res>
    implements $DeriveKeysParamsLedgerCopyWith<$Res> {
  _$DeriveKeysParamsLedgerCopyWithImpl(this._self, this._then);

  final DeriveKeysParamsLedger _self;
  final $Res Function(DeriveKeysParamsLedger) _then;

/// Create a copy of DeriveKeysParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,}) {
  return _then(DeriveKeysParamsLedger(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
