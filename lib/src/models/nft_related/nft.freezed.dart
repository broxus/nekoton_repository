// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Nft {
  Address get address;
  NftInfo get info;
  NftJsonData get json;
  BigInt? get supply;

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftCopyWith<Nft> get copyWith =>
      _$NftCopyWithImpl<Nft>(this as Nft, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Nft &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.json, json) || other.json == json) &&
            (identical(other.supply, supply) || other.supply == supply));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, info, json, supply);

  @override
  String toString() {
    return 'Nft(address: $address, info: $info, json: $json, supply: $supply)';
  }
}

/// @nodoc
abstract mixin class $NftCopyWith<$Res> {
  factory $NftCopyWith(Nft value, $Res Function(Nft) _then) = _$NftCopyWithImpl;
  @useResult
  $Res call({Address address, NftInfo info, NftJsonData json, BigInt? supply});

  $AddressCopyWith<$Res> get address;
  $NftInfoCopyWith<$Res> get info;
  $NftJsonDataCopyWith<$Res> get json;
}

/// @nodoc
class _$NftCopyWithImpl<$Res> implements $NftCopyWith<$Res> {
  _$NftCopyWithImpl(this._self, this._then);

  final Nft _self;
  final $Res Function(Nft) _then;

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? info = null,
    Object? json = null,
    Object? supply = freezed,
  }) {
    return _then(_self.copyWith(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      info: null == info
          ? _self.info
          : info // ignore: cast_nullable_to_non_nullable
              as NftInfo,
      json: null == json
          ? _self.json
          : json // ignore: cast_nullable_to_non_nullable
              as NftJsonData,
      supply: freezed == supply
          ? _self.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as BigInt?,
    ));
  }

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NftInfoCopyWith<$Res> get info {
    return $NftInfoCopyWith<$Res>(_self.info, (value) {
      return _then(_self.copyWith(info: value));
    });
  }

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NftJsonDataCopyWith<$Res> get json {
    return $NftJsonDataCopyWith<$Res>(_self.json, (value) {
      return _then(_self.copyWith(json: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Nft].
extension NftPatterns on Nft {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Nft value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Nft() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Nft value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nft():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Nft value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nft() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Address address, NftInfo info, NftJsonData json, BigInt? supply)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Nft() when $default != null:
        return $default(_that.address, _that.info, _that.json, _that.supply);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Address address, NftInfo info, NftJsonData json, BigInt? supply)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nft():
        return $default(_that.address, _that.info, _that.json, _that.supply);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            Address address, NftInfo info, NftJsonData json, BigInt? supply)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nft() when $default != null:
        return $default(_that.address, _that.info, _that.json, _that.supply);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Nft extends Nft {
  const _Nft(
      {required this.address,
      required this.info,
      required this.json,
      this.supply})
      : super._();

  @override
  final Address address;
  @override
  final NftInfo info;
  @override
  final NftJsonData json;
  @override
  final BigInt? supply;

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NftCopyWith<_Nft> get copyWith =>
      __$NftCopyWithImpl<_Nft>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Nft &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.json, json) || other.json == json) &&
            (identical(other.supply, supply) || other.supply == supply));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, info, json, supply);

  @override
  String toString() {
    return 'Nft(address: $address, info: $info, json: $json, supply: $supply)';
  }
}

/// @nodoc
abstract mixin class _$NftCopyWith<$Res> implements $NftCopyWith<$Res> {
  factory _$NftCopyWith(_Nft value, $Res Function(_Nft) _then) =
      __$NftCopyWithImpl;
  @override
  @useResult
  $Res call({Address address, NftInfo info, NftJsonData json, BigInt? supply});

  @override
  $AddressCopyWith<$Res> get address;
  @override
  $NftInfoCopyWith<$Res> get info;
  @override
  $NftJsonDataCopyWith<$Res> get json;
}

/// @nodoc
class __$NftCopyWithImpl<$Res> implements _$NftCopyWith<$Res> {
  __$NftCopyWithImpl(this._self, this._then);

  final _Nft _self;
  final $Res Function(_Nft) _then;

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = null,
    Object? info = null,
    Object? json = null,
    Object? supply = freezed,
  }) {
    return _then(_Nft(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      info: null == info
          ? _self.info
          : info // ignore: cast_nullable_to_non_nullable
              as NftInfo,
      json: null == json
          ? _self.json
          : json // ignore: cast_nullable_to_non_nullable
              as NftJsonData,
      supply: freezed == supply
          ? _self.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as BigInt?,
    ));
  }

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of Nft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NftInfoCopyWith<$Res> get info {
    return $NftInfoCopyWith<$Res>(_self.info, (value) {
      return _then(_self.copyWith(info: value));
    });
  }

  /// Create a copy of Nft
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
