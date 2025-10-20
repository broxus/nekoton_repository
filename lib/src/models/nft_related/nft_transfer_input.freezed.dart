// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_transfer_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NftTransferInput {

 Address get to; Address get sendGasTo; Map<Address, NftCallbackPayload> get callbacks;
/// Create a copy of NftTransferInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NftTransferInputCopyWith<NftTransferInput> get copyWith => _$NftTransferInputCopyWithImpl<NftTransferInput>(this as NftTransferInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NftTransferInput&&(identical(other.to, to) || other.to == to)&&(identical(other.sendGasTo, sendGasTo) || other.sendGasTo == sendGasTo)&&const DeepCollectionEquality().equals(other.callbacks, callbacks));
}


@override
int get hashCode => Object.hash(runtimeType,to,sendGasTo,const DeepCollectionEquality().hash(callbacks));

@override
String toString() {
  return 'NftTransferInput(to: $to, sendGasTo: $sendGasTo, callbacks: $callbacks)';
}


}

/// @nodoc
abstract mixin class $NftTransferInputCopyWith<$Res>  {
  factory $NftTransferInputCopyWith(NftTransferInput value, $Res Function(NftTransferInput) _then) = _$NftTransferInputCopyWithImpl;
@useResult
$Res call({
 Address to, Address sendGasTo, Map<Address, NftCallbackPayload> callbacks
});


$AddressCopyWith<$Res> get to;$AddressCopyWith<$Res> get sendGasTo;

}
/// @nodoc
class _$NftTransferInputCopyWithImpl<$Res>
    implements $NftTransferInputCopyWith<$Res> {
  _$NftTransferInputCopyWithImpl(this._self, this._then);

  final NftTransferInput _self;
  final $Res Function(NftTransferInput) _then;

/// Create a copy of NftTransferInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? to = null,Object? sendGasTo = null,Object? callbacks = null,}) {
  return _then(_self.copyWith(
to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as Address,sendGasTo: null == sendGasTo ? _self.sendGasTo : sendGasTo // ignore: cast_nullable_to_non_nullable
as Address,callbacks: null == callbacks ? _self.callbacks : callbacks // ignore: cast_nullable_to_non_nullable
as Map<Address, NftCallbackPayload>,
  ));
}
/// Create a copy of NftTransferInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get to {
  
  return $AddressCopyWith<$Res>(_self.to, (value) {
    return _then(_self.copyWith(to: value));
  });
}/// Create a copy of NftTransferInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get sendGasTo {
  
  return $AddressCopyWith<$Res>(_self.sendGasTo, (value) {
    return _then(_self.copyWith(sendGasTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [NftTransferInput].
extension NftTransferInputPatterns on NftTransferInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NftTransferInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NftTransferInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NftTransferInput value)  $default,){
final _that = this;
switch (_that) {
case _NftTransferInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NftTransferInput value)?  $default,){
final _that = this;
switch (_that) {
case _NftTransferInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Address to,  Address sendGasTo,  Map<Address, NftCallbackPayload> callbacks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NftTransferInput() when $default != null:
return $default(_that.to,_that.sendGasTo,_that.callbacks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Address to,  Address sendGasTo,  Map<Address, NftCallbackPayload> callbacks)  $default,) {final _that = this;
switch (_that) {
case _NftTransferInput():
return $default(_that.to,_that.sendGasTo,_that.callbacks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Address to,  Address sendGasTo,  Map<Address, NftCallbackPayload> callbacks)?  $default,) {final _that = this;
switch (_that) {
case _NftTransferInput() when $default != null:
return $default(_that.to,_that.sendGasTo,_that.callbacks);case _:
  return null;

}
}

}

/// @nodoc


class _NftTransferInput extends NftTransferInput {
  const _NftTransferInput({required this.to, required this.sendGasTo, required final  Map<Address, NftCallbackPayload> callbacks}): _callbacks = callbacks,super._();
  

@override final  Address to;
@override final  Address sendGasTo;
 final  Map<Address, NftCallbackPayload> _callbacks;
@override Map<Address, NftCallbackPayload> get callbacks {
  if (_callbacks is EqualUnmodifiableMapView) return _callbacks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_callbacks);
}


/// Create a copy of NftTransferInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NftTransferInputCopyWith<_NftTransferInput> get copyWith => __$NftTransferInputCopyWithImpl<_NftTransferInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NftTransferInput&&(identical(other.to, to) || other.to == to)&&(identical(other.sendGasTo, sendGasTo) || other.sendGasTo == sendGasTo)&&const DeepCollectionEquality().equals(other._callbacks, _callbacks));
}


@override
int get hashCode => Object.hash(runtimeType,to,sendGasTo,const DeepCollectionEquality().hash(_callbacks));

@override
String toString() {
  return 'NftTransferInput(to: $to, sendGasTo: $sendGasTo, callbacks: $callbacks)';
}


}

/// @nodoc
abstract mixin class _$NftTransferInputCopyWith<$Res> implements $NftTransferInputCopyWith<$Res> {
  factory _$NftTransferInputCopyWith(_NftTransferInput value, $Res Function(_NftTransferInput) _then) = __$NftTransferInputCopyWithImpl;
@override @useResult
$Res call({
 Address to, Address sendGasTo, Map<Address, NftCallbackPayload> callbacks
});


@override $AddressCopyWith<$Res> get to;@override $AddressCopyWith<$Res> get sendGasTo;

}
/// @nodoc
class __$NftTransferInputCopyWithImpl<$Res>
    implements _$NftTransferInputCopyWith<$Res> {
  __$NftTransferInputCopyWithImpl(this._self, this._then);

  final _NftTransferInput _self;
  final $Res Function(_NftTransferInput) _then;

/// Create a copy of NftTransferInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? to = null,Object? sendGasTo = null,Object? callbacks = null,}) {
  return _then(_NftTransferInput(
to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as Address,sendGasTo: null == sendGasTo ? _self.sendGasTo : sendGasTo // ignore: cast_nullable_to_non_nullable
as Address,callbacks: null == callbacks ? _self._callbacks : callbacks // ignore: cast_nullable_to_non_nullable
as Map<Address, NftCallbackPayload>,
  ));
}

/// Create a copy of NftTransferInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get to {
  
  return $AddressCopyWith<$Res>(_self.to, (value) {
    return _then(_self.copyWith(to: value));
  });
}/// Create a copy of NftTransferInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get sendGasTo {
  
  return $AddressCopyWith<$Res>(_self.sendGasTo, (value) {
    return _then(_self.copyWith(sendGasTo: value));
  });
}
}

// dart format on
