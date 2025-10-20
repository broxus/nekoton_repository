// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NftCollection {

 Address get address; NftJsonData get json; List<ContractInterface> get interfaces;
/// Create a copy of NftCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NftCollectionCopyWith<NftCollection> get copyWith => _$NftCollectionCopyWithImpl<NftCollection>(this as NftCollection, _$identity);

  /// Serializes this NftCollection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NftCollection&&(identical(other.address, address) || other.address == address)&&(identical(other.json, json) || other.json == json)&&const DeepCollectionEquality().equals(other.interfaces, interfaces));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,json,const DeepCollectionEquality().hash(interfaces));

@override
String toString() {
  return 'NftCollection(address: $address, json: $json, interfaces: $interfaces)';
}


}

/// @nodoc
abstract mixin class $NftCollectionCopyWith<$Res>  {
  factory $NftCollectionCopyWith(NftCollection value, $Res Function(NftCollection) _then) = _$NftCollectionCopyWithImpl;
@useResult
$Res call({
 Address address, NftJsonData json, List<ContractInterface> interfaces
});


$AddressCopyWith<$Res> get address;$NftJsonDataCopyWith<$Res> get json;

}
/// @nodoc
class _$NftCollectionCopyWithImpl<$Res>
    implements $NftCollectionCopyWith<$Res> {
  _$NftCollectionCopyWithImpl(this._self, this._then);

  final NftCollection _self;
  final $Res Function(NftCollection) _then;

/// Create a copy of NftCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? json = null,Object? interfaces = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,json: null == json ? _self.json : json // ignore: cast_nullable_to_non_nullable
as NftJsonData,interfaces: null == interfaces ? _self.interfaces : interfaces // ignore: cast_nullable_to_non_nullable
as List<ContractInterface>,
  ));
}
/// Create a copy of NftCollection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of NftCollection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NftJsonDataCopyWith<$Res> get json {
  
  return $NftJsonDataCopyWith<$Res>(_self.json, (value) {
    return _then(_self.copyWith(json: value));
  });
}
}


/// Adds pattern-matching-related methods to [NftCollection].
extension NftCollectionPatterns on NftCollection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NftCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NftCollection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NftCollection value)  $default,){
final _that = this;
switch (_that) {
case _NftCollection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NftCollection value)?  $default,){
final _that = this;
switch (_that) {
case _NftCollection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Address address,  NftJsonData json,  List<ContractInterface> interfaces)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NftCollection() when $default != null:
return $default(_that.address,_that.json,_that.interfaces);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Address address,  NftJsonData json,  List<ContractInterface> interfaces)  $default,) {final _that = this;
switch (_that) {
case _NftCollection():
return $default(_that.address,_that.json,_that.interfaces);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Address address,  NftJsonData json,  List<ContractInterface> interfaces)?  $default,) {final _that = this;
switch (_that) {
case _NftCollection() when $default != null:
return $default(_that.address,_that.json,_that.interfaces);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NftCollection extends NftCollection {
  const _NftCollection({required this.address, required this.json, required final  List<ContractInterface> interfaces}): _interfaces = interfaces,super._();
  factory _NftCollection.fromJson(Map<String, dynamic> json) => _$NftCollectionFromJson(json);

@override final  Address address;
@override final  NftJsonData json;
 final  List<ContractInterface> _interfaces;
@override List<ContractInterface> get interfaces {
  if (_interfaces is EqualUnmodifiableListView) return _interfaces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interfaces);
}


/// Create a copy of NftCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NftCollectionCopyWith<_NftCollection> get copyWith => __$NftCollectionCopyWithImpl<_NftCollection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NftCollectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NftCollection&&(identical(other.address, address) || other.address == address)&&(identical(other.json, json) || other.json == json)&&const DeepCollectionEquality().equals(other._interfaces, _interfaces));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,json,const DeepCollectionEquality().hash(_interfaces));

@override
String toString() {
  return 'NftCollection(address: $address, json: $json, interfaces: $interfaces)';
}


}

/// @nodoc
abstract mixin class _$NftCollectionCopyWith<$Res> implements $NftCollectionCopyWith<$Res> {
  factory _$NftCollectionCopyWith(_NftCollection value, $Res Function(_NftCollection) _then) = __$NftCollectionCopyWithImpl;
@override @useResult
$Res call({
 Address address, NftJsonData json, List<ContractInterface> interfaces
});


@override $AddressCopyWith<$Res> get address;@override $NftJsonDataCopyWith<$Res> get json;

}
/// @nodoc
class __$NftCollectionCopyWithImpl<$Res>
    implements _$NftCollectionCopyWith<$Res> {
  __$NftCollectionCopyWithImpl(this._self, this._then);

  final _NftCollection _self;
  final $Res Function(_NftCollection) _then;

/// Create a copy of NftCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? json = null,Object? interfaces = null,}) {
  return _then(_NftCollection(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,json: null == json ? _self.json : json // ignore: cast_nullable_to_non_nullable
as NftJsonData,interfaces: null == interfaces ? _self._interfaces : interfaces // ignore: cast_nullable_to_non_nullable
as List<ContractInterface>,
  ));
}

/// Create a copy of NftCollection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of NftCollection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NftJsonDataCopyWith<$Res> get json {
  
  return $NftJsonDataCopyWith<$Res>(_self.json, (value) {
    return _then(_self.copyWith(json: value));
  });
}
}

// dart format on
