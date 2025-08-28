// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multitoken_wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MultitokenWallet {
  Address get address;
  BigInt get balance;
  MultitokenWalletInfo get info;

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MultitokenWalletCopyWith<MultitokenWallet> get copyWith =>
      _$MultitokenWalletCopyWithImpl<MultitokenWallet>(
          this as MultitokenWallet, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MultitokenWallet &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, balance, info);

  @override
  String toString() {
    return 'MultitokenWallet(address: $address, balance: $balance, info: $info)';
  }
}

/// @nodoc
abstract mixin class $MultitokenWalletCopyWith<$Res> {
  factory $MultitokenWalletCopyWith(
          MultitokenWallet value, $Res Function(MultitokenWallet) _then) =
      _$MultitokenWalletCopyWithImpl;
  @useResult
  $Res call({Address address, BigInt balance, MultitokenWalletInfo info});

  $AddressCopyWith<$Res> get address;
  $MultitokenWalletInfoCopyWith<$Res> get info;
}

/// @nodoc
class _$MultitokenWalletCopyWithImpl<$Res>
    implements $MultitokenWalletCopyWith<$Res> {
  _$MultitokenWalletCopyWithImpl(this._self, this._then);

  final MultitokenWallet _self;
  final $Res Function(MultitokenWallet) _then;

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? balance = null,
    Object? info = null,
  }) {
    return _then(_self.copyWith(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as BigInt,
      info: null == info
          ? _self.info
          : info // ignore: cast_nullable_to_non_nullable
              as MultitokenWalletInfo,
    ));
  }

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MultitokenWalletInfoCopyWith<$Res> get info {
    return $MultitokenWalletInfoCopyWith<$Res>(_self.info, (value) {
      return _then(_self.copyWith(info: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MultitokenWallet].
extension MultitokenWalletPatterns on MultitokenWallet {
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
    TResult Function(_MultitokenWallet value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MultitokenWallet() when $default != null:
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
    TResult Function(_MultitokenWallet value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultitokenWallet():
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
    TResult? Function(_MultitokenWallet value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultitokenWallet() when $default != null:
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
            Address address, BigInt balance, MultitokenWalletInfo info)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MultitokenWallet() when $default != null:
        return $default(_that.address, _that.balance, _that.info);
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
    TResult Function(Address address, BigInt balance, MultitokenWalletInfo info)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultitokenWallet():
        return $default(_that.address, _that.balance, _that.info);
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
            Address address, BigInt balance, MultitokenWalletInfo info)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultitokenWallet() when $default != null:
        return $default(_that.address, _that.balance, _that.info);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MultitokenWallet implements MultitokenWallet {
  const _MultitokenWallet(
      {required this.address, required this.balance, required this.info});

  @override
  final Address address;
  @override
  final BigInt balance;
  @override
  final MultitokenWalletInfo info;

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MultitokenWalletCopyWith<_MultitokenWallet> get copyWith =>
      __$MultitokenWalletCopyWithImpl<_MultitokenWallet>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MultitokenWallet &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, balance, info);

  @override
  String toString() {
    return 'MultitokenWallet(address: $address, balance: $balance, info: $info)';
  }
}

/// @nodoc
abstract mixin class _$MultitokenWalletCopyWith<$Res>
    implements $MultitokenWalletCopyWith<$Res> {
  factory _$MultitokenWalletCopyWith(
          _MultitokenWallet value, $Res Function(_MultitokenWallet) _then) =
      __$MultitokenWalletCopyWithImpl;
  @override
  @useResult
  $Res call({Address address, BigInt balance, MultitokenWalletInfo info});

  @override
  $AddressCopyWith<$Res> get address;
  @override
  $MultitokenWalletInfoCopyWith<$Res> get info;
}

/// @nodoc
class __$MultitokenWalletCopyWithImpl<$Res>
    implements _$MultitokenWalletCopyWith<$Res> {
  __$MultitokenWalletCopyWithImpl(this._self, this._then);

  final _MultitokenWallet _self;
  final $Res Function(_MultitokenWallet) _then;

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = null,
    Object? balance = null,
    Object? info = null,
  }) {
    return _then(_MultitokenWallet(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as BigInt,
      info: null == info
          ? _self.info
          : info // ignore: cast_nullable_to_non_nullable
              as MultitokenWalletInfo,
    ));
  }

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MultitokenWalletInfoCopyWith<$Res> get info {
    return $MultitokenWalletInfoCopyWith<$Res>(_self.info, (value) {
      return _then(_self.copyWith(info: value));
    });
  }
}

// dart format on
