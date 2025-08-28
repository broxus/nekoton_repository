// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multitoken_wallet_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MultitokenWalletInfo {
  String get id;
  Address get owner;
  Address get collection;

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MultitokenWalletInfoCopyWith<MultitokenWalletInfo> get copyWith =>
      _$MultitokenWalletInfoCopyWithImpl<MultitokenWalletInfo>(
          this as MultitokenWalletInfo, _$identity);

  /// Serializes this MultitokenWalletInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MultitokenWalletInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, owner, collection);

  @override
  String toString() {
    return 'MultitokenWalletInfo(id: $id, owner: $owner, collection: $collection)';
  }
}

/// @nodoc
abstract mixin class $MultitokenWalletInfoCopyWith<$Res> {
  factory $MultitokenWalletInfoCopyWith(MultitokenWalletInfo value,
          $Res Function(MultitokenWalletInfo) _then) =
      _$MultitokenWalletInfoCopyWithImpl;
  @useResult
  $Res call({String id, Address owner, Address collection});

  $AddressCopyWith<$Res> get owner;
  $AddressCopyWith<$Res> get collection;
}

/// @nodoc
class _$MultitokenWalletInfoCopyWithImpl<$Res>
    implements $MultitokenWalletInfoCopyWith<$Res> {
  _$MultitokenWalletInfoCopyWithImpl(this._self, this._then);

  final MultitokenWalletInfo _self;
  final $Res Function(MultitokenWalletInfo) _then;

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owner = null,
    Object? collection = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Address,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get owner {
    return $AddressCopyWith<$Res>(_self.owner, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_self.collection, (value) {
      return _then(_self.copyWith(collection: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MultitokenWalletInfo].
extension MultitokenWalletInfoPatterns on MultitokenWalletInfo {
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
    TResult Function(_MultitokenWalletInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MultitokenWalletInfo() when $default != null:
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
    TResult Function(_MultitokenWalletInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultitokenWalletInfo():
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
    TResult? Function(_MultitokenWalletInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultitokenWalletInfo() when $default != null:
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
    TResult Function(String id, Address owner, Address collection)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MultitokenWalletInfo() when $default != null:
        return $default(_that.id, _that.owner, _that.collection);
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
    TResult Function(String id, Address owner, Address collection) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultitokenWalletInfo():
        return $default(_that.id, _that.owner, _that.collection);
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
    TResult? Function(String id, Address owner, Address collection)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultitokenWalletInfo() when $default != null:
        return $default(_that.id, _that.owner, _that.collection);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MultitokenWalletInfo implements MultitokenWalletInfo {
  const _MultitokenWalletInfo(
      {required this.id, required this.owner, required this.collection});
  factory _MultitokenWalletInfo.fromJson(Map<String, dynamic> json) =>
      _$MultitokenWalletInfoFromJson(json);

  @override
  final String id;
  @override
  final Address owner;
  @override
  final Address collection;

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MultitokenWalletInfoCopyWith<_MultitokenWalletInfo> get copyWith =>
      __$MultitokenWalletInfoCopyWithImpl<_MultitokenWalletInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MultitokenWalletInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MultitokenWalletInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, owner, collection);

  @override
  String toString() {
    return 'MultitokenWalletInfo(id: $id, owner: $owner, collection: $collection)';
  }
}

/// @nodoc
abstract mixin class _$MultitokenWalletInfoCopyWith<$Res>
    implements $MultitokenWalletInfoCopyWith<$Res> {
  factory _$MultitokenWalletInfoCopyWith(_MultitokenWalletInfo value,
          $Res Function(_MultitokenWalletInfo) _then) =
      __$MultitokenWalletInfoCopyWithImpl;
  @override
  @useResult
  $Res call({String id, Address owner, Address collection});

  @override
  $AddressCopyWith<$Res> get owner;
  @override
  $AddressCopyWith<$Res> get collection;
}

/// @nodoc
class __$MultitokenWalletInfoCopyWithImpl<$Res>
    implements _$MultitokenWalletInfoCopyWith<$Res> {
  __$MultitokenWalletInfoCopyWithImpl(this._self, this._then);

  final _MultitokenWalletInfo _self;
  final $Res Function(_MultitokenWalletInfo) _then;

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? owner = null,
    Object? collection = null,
  }) {
    return _then(_MultitokenWalletInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Address,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get owner {
    return $AddressCopyWith<$Res>(_self.owner, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }

  /// Create a copy of MultitokenWalletInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_self.collection, (value) {
      return _then(_self.copyWith(collection: value));
    });
  }
}

// dart format on
