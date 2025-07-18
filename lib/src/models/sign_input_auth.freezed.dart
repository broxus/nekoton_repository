// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_input_auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignInputAuth {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInputAuth);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInputAuth()';
  }
}

/// @nodoc
class $SignInputAuthCopyWith<$Res> {
  $SignInputAuthCopyWith(SignInputAuth _, $Res Function(SignInputAuth) __);
}

/// @nodoc

class SignInputAuthPassword extends SignInputAuth {
  const SignInputAuthPassword(this.password) : super._();

  final String password;

  /// Create a copy of SignInputAuth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInputAuthPasswordCopyWith<SignInputAuthPassword> get copyWith =>
      _$SignInputAuthPasswordCopyWithImpl<SignInputAuthPassword>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInputAuthPassword &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @override
  String toString() {
    return 'SignInputAuth.password(password: $password)';
  }
}

/// @nodoc
abstract mixin class $SignInputAuthPasswordCopyWith<$Res>
    implements $SignInputAuthCopyWith<$Res> {
  factory $SignInputAuthPasswordCopyWith(SignInputAuthPassword value,
          $Res Function(SignInputAuthPassword) _then) =
      _$SignInputAuthPasswordCopyWithImpl;
  @useResult
  $Res call({String password});
}

/// @nodoc
class _$SignInputAuthPasswordCopyWithImpl<$Res>
    implements $SignInputAuthPasswordCopyWith<$Res> {
  _$SignInputAuthPasswordCopyWithImpl(this._self, this._then);

  final SignInputAuthPassword _self;
  final $Res Function(SignInputAuthPassword) _then;

  /// Create a copy of SignInputAuth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? password = null,
  }) {
    return _then(SignInputAuthPassword(
      null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SignInputAuthLedger extends SignInputAuth {
  const SignInputAuthLedger({required this.wallet, this.context}) : super._();

  final WalletType wallet;
  final LedgerSignatureContext? context;

  /// Create a copy of SignInputAuth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInputAuthLedgerCopyWith<SignInputAuthLedger> get copyWith =>
      _$SignInputAuthLedgerCopyWithImpl<SignInputAuthLedger>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInputAuthLedger &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wallet, context);

  @override
  String toString() {
    return 'SignInputAuth.ledger(wallet: $wallet, context: $context)';
  }
}

/// @nodoc
abstract mixin class $SignInputAuthLedgerCopyWith<$Res>
    implements $SignInputAuthCopyWith<$Res> {
  factory $SignInputAuthLedgerCopyWith(
          SignInputAuthLedger value, $Res Function(SignInputAuthLedger) _then) =
      _$SignInputAuthLedgerCopyWithImpl;
  @useResult
  $Res call({WalletType wallet, LedgerSignatureContext? context});

  $WalletTypeCopyWith<$Res> get wallet;
  $LedgerSignatureContextCopyWith<$Res>? get context;
}

/// @nodoc
class _$SignInputAuthLedgerCopyWithImpl<$Res>
    implements $SignInputAuthLedgerCopyWith<$Res> {
  _$SignInputAuthLedgerCopyWithImpl(this._self, this._then);

  final SignInputAuthLedger _self;
  final $Res Function(SignInputAuthLedger) _then;

  /// Create a copy of SignInputAuth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? wallet = null,
    Object? context = freezed,
  }) {
    return _then(SignInputAuthLedger(
      wallet: null == wallet
          ? _self.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletType,
      context: freezed == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as LedgerSignatureContext?,
    ));
  }

  /// Create a copy of SignInputAuth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletTypeCopyWith<$Res> get wallet {
    return $WalletTypeCopyWith<$Res>(_self.wallet, (value) {
      return _then(_self.copyWith(wallet: value));
    });
  }

  /// Create a copy of SignInputAuth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LedgerSignatureContextCopyWith<$Res>? get context {
    if (_self.context == null) {
      return null;
    }

    return $LedgerSignatureContextCopyWith<$Res>(_self.context!, (value) {
      return _then(_self.copyWith(context: value));
    });
  }
}

// dart format on
