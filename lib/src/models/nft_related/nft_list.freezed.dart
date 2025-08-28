// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NftList {
  List<NftItem> get items;
  String? get continuation;

  /// Create a copy of NftList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftListCopyWith<NftList> get copyWith =>
      _$NftListCopyWithImpl<NftList>(this as NftList, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NftList &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.continuation, continuation) ||
                other.continuation == continuation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(items), continuation);

  @override
  String toString() {
    return 'NftList(items: $items, continuation: $continuation)';
  }
}

/// @nodoc
abstract mixin class $NftListCopyWith<$Res> {
  factory $NftListCopyWith(NftList value, $Res Function(NftList) _then) =
      _$NftListCopyWithImpl;
  @useResult
  $Res call({List<NftItem> items, String? continuation});
}

/// @nodoc
class _$NftListCopyWithImpl<$Res> implements $NftListCopyWith<$Res> {
  _$NftListCopyWithImpl(this._self, this._then);

  final NftList _self;
  final $Res Function(NftList) _then;

  /// Create a copy of NftList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? continuation = freezed,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NftItem>,
      continuation: freezed == continuation
          ? _self.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [NftList].
extension NftListPatterns on NftList {
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
    TResult Function(_NftList value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NftList() when $default != null:
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
    TResult Function(_NftList value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftList():
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
    TResult? Function(_NftList value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftList() when $default != null:
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
    TResult Function(List<NftItem> items, String? continuation)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NftList() when $default != null:
        return $default(_that.items, _that.continuation);
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
    TResult Function(List<NftItem> items, String? continuation) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftList():
        return $default(_that.items, _that.continuation);
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
    TResult? Function(List<NftItem> items, String? continuation)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftList() when $default != null:
        return $default(_that.items, _that.continuation);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NftList implements NftList {
  const _NftList({required final List<NftItem> items, this.continuation})
      : _items = items;

  final List<NftItem> _items;
  @override
  List<NftItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? continuation;

  /// Create a copy of NftList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NftListCopyWith<_NftList> get copyWith =>
      __$NftListCopyWithImpl<_NftList>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NftList &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.continuation, continuation) ||
                other.continuation == continuation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), continuation);

  @override
  String toString() {
    return 'NftList(items: $items, continuation: $continuation)';
  }
}

/// @nodoc
abstract mixin class _$NftListCopyWith<$Res> implements $NftListCopyWith<$Res> {
  factory _$NftListCopyWith(_NftList value, $Res Function(_NftList) _then) =
      __$NftListCopyWithImpl;
  @override
  @useResult
  $Res call({List<NftItem> items, String? continuation});
}

/// @nodoc
class __$NftListCopyWithImpl<$Res> implements _$NftListCopyWith<$Res> {
  __$NftListCopyWithImpl(this._self, this._then);

  final _NftList _self;
  final $Res Function(_NftList) _then;

  /// Create a copy of NftList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? continuation = freezed,
  }) {
    return _then(_NftList(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NftItem>,
      continuation: freezed == continuation
          ? _self.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
