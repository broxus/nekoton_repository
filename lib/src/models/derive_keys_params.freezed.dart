// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'derive_keys_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeriveKeysParams {
  int get accountId;

  /// Create a copy of DeriveKeysParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeriveKeysParamsCopyWith<DeriveKeysParams> get copyWith =>
      _$DeriveKeysParamsCopyWithImpl<DeriveKeysParams>(
          this as DeriveKeysParams, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeriveKeysParams &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId);

  @override
  String toString() {
    return 'DeriveKeysParams(accountId: $accountId)';
  }
}

/// @nodoc
abstract mixin class $DeriveKeysParamsCopyWith<$Res> {
  factory $DeriveKeysParamsCopyWith(
          DeriveKeysParams value, $Res Function(DeriveKeysParams) _then) =
      _$DeriveKeysParamsCopyWithImpl;
  @useResult
  $Res call({int accountId});
}

/// @nodoc
class _$DeriveKeysParamsCopyWithImpl<$Res>
    implements $DeriveKeysParamsCopyWith<$Res> {
  _$DeriveKeysParamsCopyWithImpl(this._self, this._then);

  final DeriveKeysParams _self;
  final $Res Function(DeriveKeysParams) _then;

  /// Create a copy of DeriveKeysParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
  }) {
    return _then(_self.copyWith(
      accountId: null == accountId
          ? _self.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class DeriveKeysParamsDerived implements DeriveKeysParams {
  const DeriveKeysParamsDerived(
      {required this.accountId,
      required this.masterKey,
      required this.password});

  @override
  final int accountId;
  final PublicKey masterKey;
  final String password;

  /// Create a copy of DeriveKeysParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeriveKeysParamsDerivedCopyWith<DeriveKeysParamsDerived> get copyWith =>
      _$DeriveKeysParamsDerivedCopyWithImpl<DeriveKeysParamsDerived>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeriveKeysParamsDerived &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.masterKey, masterKey) ||
                other.masterKey == masterKey) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId, masterKey, password);

  @override
  String toString() {
    return 'DeriveKeysParams.derived(accountId: $accountId, masterKey: $masterKey, password: $password)';
  }
}

/// @nodoc
abstract mixin class $DeriveKeysParamsDerivedCopyWith<$Res>
    implements $DeriveKeysParamsCopyWith<$Res> {
  factory $DeriveKeysParamsDerivedCopyWith(DeriveKeysParamsDerived value,
          $Res Function(DeriveKeysParamsDerived) _then) =
      _$DeriveKeysParamsDerivedCopyWithImpl;
  @override
  @useResult
  $Res call({int accountId, PublicKey masterKey, String password});

  $PublicKeyCopyWith<$Res> get masterKey;
}

/// @nodoc
class _$DeriveKeysParamsDerivedCopyWithImpl<$Res>
    implements $DeriveKeysParamsDerivedCopyWith<$Res> {
  _$DeriveKeysParamsDerivedCopyWithImpl(this._self, this._then);

  final DeriveKeysParamsDerived _self;
  final $Res Function(DeriveKeysParamsDerived) _then;

  /// Create a copy of DeriveKeysParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accountId = null,
    Object? masterKey = null,
    Object? password = null,
  }) {
    return _then(DeriveKeysParamsDerived(
      accountId: null == accountId
          ? _self.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      masterKey: null == masterKey
          ? _self.masterKey
          : masterKey // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of DeriveKeysParams
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

class DeriveKeysParamsLedger implements DeriveKeysParams {
  const DeriveKeysParamsLedger({required this.accountId});

  @override
  final int accountId;

  /// Create a copy of DeriveKeysParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeriveKeysParamsLedgerCopyWith<DeriveKeysParamsLedger> get copyWith =>
      _$DeriveKeysParamsLedgerCopyWithImpl<DeriveKeysParamsLedger>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeriveKeysParamsLedger &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId);

  @override
  String toString() {
    return 'DeriveKeysParams.ledger(accountId: $accountId)';
  }
}

/// @nodoc
abstract mixin class $DeriveKeysParamsLedgerCopyWith<$Res>
    implements $DeriveKeysParamsCopyWith<$Res> {
  factory $DeriveKeysParamsLedgerCopyWith(DeriveKeysParamsLedger value,
          $Res Function(DeriveKeysParamsLedger) _then) =
      _$DeriveKeysParamsLedgerCopyWithImpl;
  @override
  @useResult
  $Res call({int accountId});
}

/// @nodoc
class _$DeriveKeysParamsLedgerCopyWithImpl<$Res>
    implements $DeriveKeysParamsLedgerCopyWith<$Res> {
  _$DeriveKeysParamsLedgerCopyWithImpl(this._self, this._then);

  final DeriveKeysParamsLedger _self;
  final $Res Function(DeriveKeysParamsLedger) _then;

  /// Create a copy of DeriveKeysParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accountId = null,
  }) {
    return _then(DeriveKeysParamsLedger(
      accountId: null == accountId
          ? _self.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
