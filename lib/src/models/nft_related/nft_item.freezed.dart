// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NftItem {
  Nft get nft => throw _privateConstructorUsedError;
  MultitokenWallet? get wallet => throw _privateConstructorUsedError;

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftItemCopyWith<NftItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftItemCopyWith<$Res> {
  factory $NftItemCopyWith(NftItem value, $Res Function(NftItem) then) =
      _$NftItemCopyWithImpl<$Res, NftItem>;
  @useResult
  $Res call({Nft nft, MultitokenWallet? wallet});

  $NftCopyWith<$Res> get nft;
  $MultitokenWalletCopyWith<$Res>? get wallet;
}

/// @nodoc
class _$NftItemCopyWithImpl<$Res, $Val extends NftItem>
    implements $NftItemCopyWith<$Res> {
  _$NftItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nft = null,
    Object? wallet = freezed,
  }) {
    return _then(_value.copyWith(
      nft: null == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as Nft,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as MultitokenWallet?,
    ) as $Val);
  }

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NftCopyWith<$Res> get nft {
    return $NftCopyWith<$Res>(_value.nft, (value) {
      return _then(_value.copyWith(nft: value) as $Val);
    });
  }

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MultitokenWalletCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $MultitokenWalletCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NftItemImplCopyWith<$Res> implements $NftItemCopyWith<$Res> {
  factory _$$NftItemImplCopyWith(
          _$NftItemImpl value, $Res Function(_$NftItemImpl) then) =
      __$$NftItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Nft nft, MultitokenWallet? wallet});

  @override
  $NftCopyWith<$Res> get nft;
  @override
  $MultitokenWalletCopyWith<$Res>? get wallet;
}

/// @nodoc
class __$$NftItemImplCopyWithImpl<$Res>
    extends _$NftItemCopyWithImpl<$Res, _$NftItemImpl>
    implements _$$NftItemImplCopyWith<$Res> {
  __$$NftItemImplCopyWithImpl(
      _$NftItemImpl _value, $Res Function(_$NftItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nft = null,
    Object? wallet = freezed,
  }) {
    return _then(_$NftItemImpl(
      nft: null == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as Nft,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as MultitokenWallet?,
    ));
  }
}

/// @nodoc

class _$NftItemImpl implements _NftItem {
  const _$NftItemImpl({required this.nft, this.wallet});

  @override
  final Nft nft;
  @override
  final MultitokenWallet? wallet;

  @override
  String toString() {
    return 'NftItem(nft: $nft, wallet: $wallet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftItemImpl &&
            (identical(other.nft, nft) || other.nft == nft) &&
            (identical(other.wallet, wallet) || other.wallet == wallet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nft, wallet);

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftItemImplCopyWith<_$NftItemImpl> get copyWith =>
      __$$NftItemImplCopyWithImpl<_$NftItemImpl>(this, _$identity);
}

abstract class _NftItem implements NftItem {
  const factory _NftItem(
      {required final Nft nft, final MultitokenWallet? wallet}) = _$NftItemImpl;

  @override
  Nft get nft;
  @override
  MultitokenWallet? get wallet;

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftItemImplCopyWith<_$NftItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
