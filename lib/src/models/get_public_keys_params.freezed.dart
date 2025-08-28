// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_public_keys_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetPublicKeysParams {
  int get limit;
  int get offset;

  /// Create a copy of GetPublicKeysParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetPublicKeysParamsCopyWith<GetPublicKeysParams> get copyWith =>
      _$GetPublicKeysParamsCopyWithImpl<GetPublicKeysParams>(
          this as GetPublicKeysParams, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetPublicKeysParams &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);

  @override
  String toString() {
    return 'GetPublicKeysParams(limit: $limit, offset: $offset)';
  }
}

/// @nodoc
abstract mixin class $GetPublicKeysParamsCopyWith<$Res> {
  factory $GetPublicKeysParamsCopyWith(
          GetPublicKeysParams value, $Res Function(GetPublicKeysParams) _then) =
      _$GetPublicKeysParamsCopyWithImpl;
  @useResult
  $Res call({int limit, int offset});
}

/// @nodoc
class _$GetPublicKeysParamsCopyWithImpl<$Res>
    implements $GetPublicKeysParamsCopyWith<$Res> {
  _$GetPublicKeysParamsCopyWithImpl(this._self, this._then);

  final GetPublicKeysParams _self;
  final $Res Function(GetPublicKeysParams) _then;

  /// Create a copy of GetPublicKeysParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_self.copyWith(
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [GetPublicKeysParams].
extension GetPublicKeysParamsPatterns on GetPublicKeysParams {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPublicKeysParamsDerived value)? derived,
    TResult Function(GetPublicKeysParamsLedger value)? ledger,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetPublicKeysParamsDerived() when derived != null:
        return derived(_that);
      case GetPublicKeysParamsLedger() when ledger != null:
        return ledger(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(GetPublicKeysParamsDerived value) derived,
    required TResult Function(GetPublicKeysParamsLedger value) ledger,
  }) {
    final _that = this;
    switch (_that) {
      case GetPublicKeysParamsDerived():
        return derived(_that);
      case GetPublicKeysParamsLedger():
        return ledger(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPublicKeysParamsDerived value)? derived,
    TResult? Function(GetPublicKeysParamsLedger value)? ledger,
  }) {
    final _that = this;
    switch (_that) {
      case GetPublicKeysParamsDerived() when derived != null:
        return derived(_that);
      case GetPublicKeysParamsLedger() when ledger != null:
        return ledger(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PublicKey masterKey, String password, int limit, int offset)?
        derived,
    TResult Function(int limit, int offset)? ledger,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetPublicKeysParamsDerived() when derived != null:
        return derived(
            _that.masterKey, _that.password, _that.limit, _that.offset);
      case GetPublicKeysParamsLedger() when ledger != null:
        return ledger(_that.limit, _that.offset);
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
  TResult when<TResult extends Object?>({
    required TResult Function(
            PublicKey masterKey, String password, int limit, int offset)
        derived,
    required TResult Function(int limit, int offset) ledger,
  }) {
    final _that = this;
    switch (_that) {
      case GetPublicKeysParamsDerived():
        return derived(
            _that.masterKey, _that.password, _that.limit, _that.offset);
      case GetPublicKeysParamsLedger():
        return ledger(_that.limit, _that.offset);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PublicKey masterKey, String password, int limit, int offset)?
        derived,
    TResult? Function(int limit, int offset)? ledger,
  }) {
    final _that = this;
    switch (_that) {
      case GetPublicKeysParamsDerived() when derived != null:
        return derived(
            _that.masterKey, _that.password, _that.limit, _that.offset);
      case GetPublicKeysParamsLedger() when ledger != null:
        return ledger(_that.limit, _that.offset);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetPublicKeysParamsDerived implements GetPublicKeysParams {
  const GetPublicKeysParamsDerived(
      {required this.masterKey,
      required this.password,
      required this.limit,
      required this.offset});

  final PublicKey masterKey;
  final String password;
  @override
  final int limit;
  @override
  final int offset;

  /// Create a copy of GetPublicKeysParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetPublicKeysParamsDerivedCopyWith<GetPublicKeysParamsDerived>
      get copyWith =>
          _$GetPublicKeysParamsDerivedCopyWithImpl<GetPublicKeysParamsDerived>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetPublicKeysParamsDerived &&
            (identical(other.masterKey, masterKey) ||
                other.masterKey == masterKey) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, masterKey, password, limit, offset);

  @override
  String toString() {
    return 'GetPublicKeysParams.derived(masterKey: $masterKey, password: $password, limit: $limit, offset: $offset)';
  }
}

/// @nodoc
abstract mixin class $GetPublicKeysParamsDerivedCopyWith<$Res>
    implements $GetPublicKeysParamsCopyWith<$Res> {
  factory $GetPublicKeysParamsDerivedCopyWith(GetPublicKeysParamsDerived value,
          $Res Function(GetPublicKeysParamsDerived) _then) =
      _$GetPublicKeysParamsDerivedCopyWithImpl;
  @override
  @useResult
  $Res call({PublicKey masterKey, String password, int limit, int offset});

  $PublicKeyCopyWith<$Res> get masterKey;
}

/// @nodoc
class _$GetPublicKeysParamsDerivedCopyWithImpl<$Res>
    implements $GetPublicKeysParamsDerivedCopyWith<$Res> {
  _$GetPublicKeysParamsDerivedCopyWithImpl(this._self, this._then);

  final GetPublicKeysParamsDerived _self;
  final $Res Function(GetPublicKeysParamsDerived) _then;

  /// Create a copy of GetPublicKeysParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? masterKey = null,
    Object? password = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(GetPublicKeysParamsDerived(
      masterKey: null == masterKey
          ? _self.masterKey
          : masterKey // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of GetPublicKeysParams
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

class GetPublicKeysParamsLedger implements GetPublicKeysParams {
  const GetPublicKeysParamsLedger({required this.limit, required this.offset});

  @override
  final int limit;
  @override
  final int offset;

  /// Create a copy of GetPublicKeysParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetPublicKeysParamsLedgerCopyWith<GetPublicKeysParamsLedger> get copyWith =>
      _$GetPublicKeysParamsLedgerCopyWithImpl<GetPublicKeysParamsLedger>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetPublicKeysParamsLedger &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);

  @override
  String toString() {
    return 'GetPublicKeysParams.ledger(limit: $limit, offset: $offset)';
  }
}

/// @nodoc
abstract mixin class $GetPublicKeysParamsLedgerCopyWith<$Res>
    implements $GetPublicKeysParamsCopyWith<$Res> {
  factory $GetPublicKeysParamsLedgerCopyWith(GetPublicKeysParamsLedger value,
          $Res Function(GetPublicKeysParamsLedger) _then) =
      _$GetPublicKeysParamsLedgerCopyWithImpl;
  @override
  @useResult
  $Res call({int limit, int offset});
}

/// @nodoc
class _$GetPublicKeysParamsLedgerCopyWithImpl<$Res>
    implements $GetPublicKeysParamsLedgerCopyWith<$Res> {
  _$GetPublicKeysParamsLedgerCopyWithImpl(this._self, this._then);

  final GetPublicKeysParamsLedger _self;
  final $Res Function(GetPublicKeysParamsLedger) _then;

  /// Create a copy of GetPublicKeysParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(GetPublicKeysParamsLedger(
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
