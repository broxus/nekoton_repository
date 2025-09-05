// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ignore_transaction_tree_simulation_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IgnoreTransactionTreeSimulationError {
  int get code;
  Address? get address;

  /// Create a copy of IgnoreTransactionTreeSimulationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IgnoreTransactionTreeSimulationErrorCopyWith<
          IgnoreTransactionTreeSimulationError>
      get copyWith => _$IgnoreTransactionTreeSimulationErrorCopyWithImpl<
              IgnoreTransactionTreeSimulationError>(
          this as IgnoreTransactionTreeSimulationError, _$identity);

  /// Serializes this IgnoreTransactionTreeSimulationError to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IgnoreTransactionTreeSimulationError &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, address);

  @override
  String toString() {
    return 'IgnoreTransactionTreeSimulationError(code: $code, address: $address)';
  }
}

/// @nodoc
abstract mixin class $IgnoreTransactionTreeSimulationErrorCopyWith<$Res> {
  factory $IgnoreTransactionTreeSimulationErrorCopyWith(
          IgnoreTransactionTreeSimulationError value,
          $Res Function(IgnoreTransactionTreeSimulationError) _then) =
      _$IgnoreTransactionTreeSimulationErrorCopyWithImpl;
  @useResult
  $Res call({int code, Address? address});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$IgnoreTransactionTreeSimulationErrorCopyWithImpl<$Res>
    implements $IgnoreTransactionTreeSimulationErrorCopyWith<$Res> {
  _$IgnoreTransactionTreeSimulationErrorCopyWithImpl(this._self, this._then);

  final IgnoreTransactionTreeSimulationError _self;
  final $Res Function(IgnoreTransactionTreeSimulationError) _then;

  /// Create a copy of IgnoreTransactionTreeSimulationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? address = freezed,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
    ));
  }

  /// Create a copy of IgnoreTransactionTreeSimulationError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_self.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_self.address!, (value) {
      return _then(_self.copyWith(address: value));
    });
  }
}

/// Adds pattern-matching-related methods to [IgnoreTransactionTreeSimulationError].
extension IgnoreTransactionTreeSimulationErrorPatterns
    on IgnoreTransactionTreeSimulationError {
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
    TResult Function(_IgnoreTransactionTreeSimulationError value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IgnoreTransactionTreeSimulationError() when $default != null:
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
    TResult Function(_IgnoreTransactionTreeSimulationError value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IgnoreTransactionTreeSimulationError():
        return $default(_that);
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
    TResult? Function(_IgnoreTransactionTreeSimulationError value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IgnoreTransactionTreeSimulationError() when $default != null:
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
    TResult Function(int code, Address? address)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IgnoreTransactionTreeSimulationError() when $default != null:
        return $default(_that.code, _that.address);
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
    TResult Function(int code, Address? address) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IgnoreTransactionTreeSimulationError():
        return $default(_that.code, _that.address);
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
    TResult? Function(int code, Address? address)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IgnoreTransactionTreeSimulationError() when $default != null:
        return $default(_that.code, _that.address);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IgnoreTransactionTreeSimulationError
    extends IgnoreTransactionTreeSimulationError {
  const _IgnoreTransactionTreeSimulationError(
      {required this.code, this.address})
      : super._();
  factory _IgnoreTransactionTreeSimulationError.fromJson(
          Map<String, dynamic> json) =>
      _$IgnoreTransactionTreeSimulationErrorFromJson(json);

  @override
  final int code;
  @override
  final Address? address;

  /// Create a copy of IgnoreTransactionTreeSimulationError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IgnoreTransactionTreeSimulationErrorCopyWith<
          _IgnoreTransactionTreeSimulationError>
      get copyWith => __$IgnoreTransactionTreeSimulationErrorCopyWithImpl<
          _IgnoreTransactionTreeSimulationError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IgnoreTransactionTreeSimulationErrorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IgnoreTransactionTreeSimulationError &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, address);

  @override
  String toString() {
    return 'IgnoreTransactionTreeSimulationError(code: $code, address: $address)';
  }
}

/// @nodoc
abstract mixin class _$IgnoreTransactionTreeSimulationErrorCopyWith<$Res>
    implements $IgnoreTransactionTreeSimulationErrorCopyWith<$Res> {
  factory _$IgnoreTransactionTreeSimulationErrorCopyWith(
          _IgnoreTransactionTreeSimulationError value,
          $Res Function(_IgnoreTransactionTreeSimulationError) _then) =
      __$IgnoreTransactionTreeSimulationErrorCopyWithImpl;
  @override
  @useResult
  $Res call({int code, Address? address});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$IgnoreTransactionTreeSimulationErrorCopyWithImpl<$Res>
    implements _$IgnoreTransactionTreeSimulationErrorCopyWith<$Res> {
  __$IgnoreTransactionTreeSimulationErrorCopyWithImpl(this._self, this._then);

  final _IgnoreTransactionTreeSimulationError _self;
  final $Res Function(_IgnoreTransactionTreeSimulationError) _then;

  /// Create a copy of IgnoreTransactionTreeSimulationError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? address = freezed,
  }) {
    return _then(_IgnoreTransactionTreeSimulationError(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
    ));
  }

  /// Create a copy of IgnoreTransactionTreeSimulationError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_self.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_self.address!, (value) {
      return _then(_self.copyWith(address: value));
    });
  }
}

// dart format on
