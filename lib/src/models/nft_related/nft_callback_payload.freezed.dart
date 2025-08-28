// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_callback_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NftCallbackPayload {
  @amountJsonConverter
  BigInt get value;
  String get payload;

  /// Create a copy of NftCallbackPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftCallbackPayloadCopyWith<NftCallbackPayload> get copyWith =>
      _$NftCallbackPayloadCopyWithImpl<NftCallbackPayload>(
          this as NftCallbackPayload, _$identity);

  /// Serializes this NftCallbackPayload to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NftCallbackPayload &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, payload);

  @override
  String toString() {
    return 'NftCallbackPayload(value: $value, payload: $payload)';
  }
}

/// @nodoc
abstract mixin class $NftCallbackPayloadCopyWith<$Res> {
  factory $NftCallbackPayloadCopyWith(
          NftCallbackPayload value, $Res Function(NftCallbackPayload) _then) =
      _$NftCallbackPayloadCopyWithImpl;
  @useResult
  $Res call({@amountJsonConverter BigInt value, String payload});
}

/// @nodoc
class _$NftCallbackPayloadCopyWithImpl<$Res>
    implements $NftCallbackPayloadCopyWith<$Res> {
  _$NftCallbackPayloadCopyWithImpl(this._self, this._then);

  final NftCallbackPayload _self;
  final $Res Function(NftCallbackPayload) _then;

  /// Create a copy of NftCallbackPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? payload = null,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as BigInt,
      payload: null == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [NftCallbackPayload].
extension NftCallbackPayloadPatterns on NftCallbackPayload {
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
    TResult Function(_NftCallbackPayload value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NftCallbackPayload() when $default != null:
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
    TResult Function(_NftCallbackPayload value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftCallbackPayload():
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
    TResult? Function(_NftCallbackPayload value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftCallbackPayload() when $default != null:
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
    TResult Function(@amountJsonConverter BigInt value, String payload)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NftCallbackPayload() when $default != null:
        return $default(_that.value, _that.payload);
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
    TResult Function(@amountJsonConverter BigInt value, String payload)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftCallbackPayload():
        return $default(_that.value, _that.payload);
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
    TResult? Function(@amountJsonConverter BigInt value, String payload)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftCallbackPayload() when $default != null:
        return $default(_that.value, _that.payload);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NftCallbackPayload implements NftCallbackPayload {
  const _NftCallbackPayload(
      {@amountJsonConverter required this.value, required this.payload});
  factory _NftCallbackPayload.fromJson(Map<String, dynamic> json) =>
      _$NftCallbackPayloadFromJson(json);

  @override
  @amountJsonConverter
  final BigInt value;
  @override
  final String payload;

  /// Create a copy of NftCallbackPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NftCallbackPayloadCopyWith<_NftCallbackPayload> get copyWith =>
      __$NftCallbackPayloadCopyWithImpl<_NftCallbackPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NftCallbackPayloadToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NftCallbackPayload &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, payload);

  @override
  String toString() {
    return 'NftCallbackPayload(value: $value, payload: $payload)';
  }
}

/// @nodoc
abstract mixin class _$NftCallbackPayloadCopyWith<$Res>
    implements $NftCallbackPayloadCopyWith<$Res> {
  factory _$NftCallbackPayloadCopyWith(
          _NftCallbackPayload value, $Res Function(_NftCallbackPayload) _then) =
      __$NftCallbackPayloadCopyWithImpl;
  @override
  @useResult
  $Res call({@amountJsonConverter BigInt value, String payload});
}

/// @nodoc
class __$NftCallbackPayloadCopyWithImpl<$Res>
    implements _$NftCallbackPayloadCopyWith<$Res> {
  __$NftCallbackPayloadCopyWithImpl(this._self, this._then);

  final _NftCallbackPayload _self;
  final $Res Function(_NftCallbackPayload) _then;

  /// Create a copy of NftCallbackPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? payload = null,
  }) {
    return _then(_NftCallbackPayload(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as BigInt,
      payload: null == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
