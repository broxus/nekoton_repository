// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multitoken_wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MultitokenWallet {
  Address get address => throw _privateConstructorUsedError;
  BigInt get balance => throw _privateConstructorUsedError;
  MultitokenWalletInfo get info => throw _privateConstructorUsedError;

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MultitokenWalletCopyWith<MultitokenWallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultitokenWalletCopyWith<$Res> {
  factory $MultitokenWalletCopyWith(
          MultitokenWallet value, $Res Function(MultitokenWallet) then) =
      _$MultitokenWalletCopyWithImpl<$Res, MultitokenWallet>;
  @useResult
  $Res call({Address address, BigInt balance, MultitokenWalletInfo info});

  $AddressCopyWith<$Res> get address;
  $MultitokenWalletInfoCopyWith<$Res> get info;
}

/// @nodoc
class _$MultitokenWalletCopyWithImpl<$Res, $Val extends MultitokenWallet>
    implements $MultitokenWalletCopyWith<$Res> {
  _$MultitokenWalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? balance = null,
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as BigInt,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as MultitokenWalletInfo,
    ) as $Val);
  }

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MultitokenWalletInfoCopyWith<$Res> get info {
    return $MultitokenWalletInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MultitokenWalletImplCopyWith<$Res>
    implements $MultitokenWalletCopyWith<$Res> {
  factory _$$MultitokenWalletImplCopyWith(_$MultitokenWalletImpl value,
          $Res Function(_$MultitokenWalletImpl) then) =
      __$$MultitokenWalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Address address, BigInt balance, MultitokenWalletInfo info});

  @override
  $AddressCopyWith<$Res> get address;
  @override
  $MultitokenWalletInfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$MultitokenWalletImplCopyWithImpl<$Res>
    extends _$MultitokenWalletCopyWithImpl<$Res, _$MultitokenWalletImpl>
    implements _$$MultitokenWalletImplCopyWith<$Res> {
  __$$MultitokenWalletImplCopyWithImpl(_$MultitokenWalletImpl _value,
      $Res Function(_$MultitokenWalletImpl) _then)
      : super(_value, _then);

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? balance = null,
    Object? info = null,
  }) {
    return _then(_$MultitokenWalletImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as BigInt,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as MultitokenWalletInfo,
    ));
  }
}

/// @nodoc

class _$MultitokenWalletImpl implements _MultitokenWallet {
  const _$MultitokenWalletImpl(
      {required this.address, required this.balance, required this.info});

  @override
  final Address address;
  @override
  final BigInt balance;
  @override
  final MultitokenWalletInfo info;

  @override
  String toString() {
    return 'MultitokenWallet(address: $address, balance: $balance, info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultitokenWalletImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, balance, info);

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MultitokenWalletImplCopyWith<_$MultitokenWalletImpl> get copyWith =>
      __$$MultitokenWalletImplCopyWithImpl<_$MultitokenWalletImpl>(
          this, _$identity);
}

abstract class _MultitokenWallet implements MultitokenWallet {
  const factory _MultitokenWallet(
      {required final Address address,
      required final BigInt balance,
      required final MultitokenWalletInfo info}) = _$MultitokenWalletImpl;

  @override
  Address get address;
  @override
  BigInt get balance;
  @override
  MultitokenWalletInfo get info;

  /// Create a copy of MultitokenWallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MultitokenWalletImplCopyWith<_$MultitokenWalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
