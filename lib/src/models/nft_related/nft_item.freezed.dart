// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NftItem {
  Nft get nft;
  MultitokenWallet? get wallet;

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftItemCopyWith<NftItem> get copyWith =>
      _$NftItemCopyWithImpl<NftItem>(this as NftItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NftItem &&
            (identical(other.nft, nft) || other.nft == nft) &&
            (identical(other.wallet, wallet) || other.wallet == wallet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nft, wallet);

  @override
  String toString() {
    return 'NftItem(nft: $nft, wallet: $wallet)';
  }
}

/// @nodoc
abstract mixin class $NftItemCopyWith<$Res> {
  factory $NftItemCopyWith(NftItem value, $Res Function(NftItem) _then) =
      _$NftItemCopyWithImpl;
  @useResult
  $Res call({Nft nft, MultitokenWallet? wallet});

  $NftCopyWith<$Res> get nft;
  $MultitokenWalletCopyWith<$Res>? get wallet;
}

/// @nodoc
class _$NftItemCopyWithImpl<$Res> implements $NftItemCopyWith<$Res> {
  _$NftItemCopyWithImpl(this._self, this._then);

  final NftItem _self;
  final $Res Function(NftItem) _then;

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nft = null,
    Object? wallet = freezed,
  }) {
    return _then(_self.copyWith(
      nft: null == nft
          ? _self.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as Nft,
      wallet: freezed == wallet
          ? _self.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as MultitokenWallet?,
    ));
  }

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NftCopyWith<$Res> get nft {
    return $NftCopyWith<$Res>(_self.nft, (value) {
      return _then(_self.copyWith(nft: value));
    });
  }

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MultitokenWalletCopyWith<$Res>? get wallet {
    if (_self.wallet == null) {
      return null;
    }

    return $MultitokenWalletCopyWith<$Res>(_self.wallet!, (value) {
      return _then(_self.copyWith(wallet: value));
    });
  }
}

/// @nodoc

class _NftItem implements NftItem {
  const _NftItem({required this.nft, this.wallet});

  @override
  final Nft nft;
  @override
  final MultitokenWallet? wallet;

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NftItemCopyWith<_NftItem> get copyWith =>
      __$NftItemCopyWithImpl<_NftItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NftItem &&
            (identical(other.nft, nft) || other.nft == nft) &&
            (identical(other.wallet, wallet) || other.wallet == wallet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nft, wallet);

  @override
  String toString() {
    return 'NftItem(nft: $nft, wallet: $wallet)';
  }
}

/// @nodoc
abstract mixin class _$NftItemCopyWith<$Res> implements $NftItemCopyWith<$Res> {
  factory _$NftItemCopyWith(_NftItem value, $Res Function(_NftItem) _then) =
      __$NftItemCopyWithImpl;
  @override
  @useResult
  $Res call({Nft nft, MultitokenWallet? wallet});

  @override
  $NftCopyWith<$Res> get nft;
  @override
  $MultitokenWalletCopyWith<$Res>? get wallet;
}

/// @nodoc
class __$NftItemCopyWithImpl<$Res> implements _$NftItemCopyWith<$Res> {
  __$NftItemCopyWithImpl(this._self, this._then);

  final _NftItem _self;
  final $Res Function(_NftItem) _then;

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nft = null,
    Object? wallet = freezed,
  }) {
    return _then(_NftItem(
      nft: null == nft
          ? _self.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as Nft,
      wallet: freezed == wallet
          ? _self.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as MultitokenWallet?,
    ));
  }

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NftCopyWith<$Res> get nft {
    return $NftCopyWith<$Res>(_self.nft, (value) {
      return _then(_self.copyWith(nft: value));
    });
  }

  /// Create a copy of NftItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MultitokenWalletCopyWith<$Res>? get wallet {
    if (_self.wallet == null) {
      return null;
    }

    return $MultitokenWalletCopyWith<$Res>(_self.wallet!, (value) {
      return _then(_self.copyWith(wallet: value));
    });
  }
}

// dart format on
