// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NftInfo {
  String get id;
  Address get owner;
  Address get manager;
  Address get collection;

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftInfoCopyWith<NftInfo> get copyWith =>
      _$NftInfoCopyWithImpl<NftInfo>(this as NftInfo, _$identity);

  /// Serializes this NftInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NftInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.manager, manager) || other.manager == manager) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, owner, manager, collection);

  @override
  String toString() {
    return 'NftInfo(id: $id, owner: $owner, manager: $manager, collection: $collection)';
  }
}

/// @nodoc
abstract mixin class $NftInfoCopyWith<$Res> {
  factory $NftInfoCopyWith(NftInfo value, $Res Function(NftInfo) _then) =
      _$NftInfoCopyWithImpl;
  @useResult
  $Res call({String id, Address owner, Address manager, Address collection});

  $AddressCopyWith<$Res> get owner;
  $AddressCopyWith<$Res> get manager;
  $AddressCopyWith<$Res> get collection;
}

/// @nodoc
class _$NftInfoCopyWithImpl<$Res> implements $NftInfoCopyWith<$Res> {
  _$NftInfoCopyWithImpl(this._self, this._then);

  final NftInfo _self;
  final $Res Function(NftInfo) _then;

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owner = null,
    Object? manager = null,
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
      manager: null == manager
          ? _self.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as Address,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get owner {
    return $AddressCopyWith<$Res>(_self.owner, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get manager {
    return $AddressCopyWith<$Res>(_self.manager, (value) {
      return _then(_self.copyWith(manager: value));
    });
  }

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get collection {
    return $AddressCopyWith<$Res>(_self.collection, (value) {
      return _then(_self.copyWith(collection: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NftInfo].
extension NftInfoPatterns on NftInfo {
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
    TResult Function(_NftInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NftInfo() when $default != null:
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
    TResult Function(_NftInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftInfo():
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
    TResult? Function(_NftInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftInfo() when $default != null:
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
            String id, Address owner, Address manager, Address collection)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NftInfo() when $default != null:
        return $default(_that.id, _that.owner, _that.manager, _that.collection);
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
            String id, Address owner, Address manager, Address collection)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftInfo():
        return $default(_that.id, _that.owner, _that.manager, _that.collection);
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
            String id, Address owner, Address manager, Address collection)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftInfo() when $default != null:
        return $default(_that.id, _that.owner, _that.manager, _that.collection);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NftInfo implements NftInfo {
  const _NftInfo(
      {required this.id,
      required this.owner,
      required this.manager,
      required this.collection});
  factory _NftInfo.fromJson(Map<String, dynamic> json) =>
      _$NftInfoFromJson(json);

  @override
  final String id;
  @override
  final Address owner;
  @override
  final Address manager;
  @override
  final Address collection;

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NftInfoCopyWith<_NftInfo> get copyWith =>
      __$NftInfoCopyWithImpl<_NftInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NftInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NftInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.manager, manager) || other.manager == manager) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, owner, manager, collection);

  @override
  String toString() {
    return 'NftInfo(id: $id, owner: $owner, manager: $manager, collection: $collection)';
  }
}

/// @nodoc
abstract mixin class _$NftInfoCopyWith<$Res> implements $NftInfoCopyWith<$Res> {
  factory _$NftInfoCopyWith(_NftInfo value, $Res Function(_NftInfo) _then) =
      __$NftInfoCopyWithImpl;
  @override
  @useResult
  $Res call({String id, Address owner, Address manager, Address collection});

  @override
  $AddressCopyWith<$Res> get owner;
  @override
  $AddressCopyWith<$Res> get manager;
  @override
  $AddressCopyWith<$Res> get collection;
}

/// @nodoc
class __$NftInfoCopyWithImpl<$Res> implements _$NftInfoCopyWith<$Res> {
  __$NftInfoCopyWithImpl(this._self, this._then);

  final _NftInfo _self;
  final $Res Function(_NftInfo) _then;

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? owner = null,
    Object? manager = null,
    Object? collection = null,
  }) {
    return _then(_NftInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Address,
      manager: null == manager
          ? _self.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as Address,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get owner {
    return $AddressCopyWith<$Res>(_self.owner, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }

  /// Create a copy of NftInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get manager {
    return $AddressCopyWith<$Res>(_self.manager, (value) {
      return _then(_self.copyWith(manager: value));
    });
  }

  /// Create a copy of NftInfo
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
