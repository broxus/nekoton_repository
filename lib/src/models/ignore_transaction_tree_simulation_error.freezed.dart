// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ignore_transaction_tree_simulation_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IgnoreTransactionTreeSimulationError
    _$IgnoreTransactionTreeSimulationErrorFromJson(Map<String, dynamic> json) {
  return _IgnoreTransactionTreeSimulationError.fromJson(json);
}

/// @nodoc
mixin _$IgnoreTransactionTreeSimulationError {
  int get code => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;

  /// Serializes this IgnoreTransactionTreeSimulationError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IgnoreTransactionTreeSimulationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IgnoreTransactionTreeSimulationErrorCopyWith<
          IgnoreTransactionTreeSimulationError>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IgnoreTransactionTreeSimulationErrorCopyWith<$Res> {
  factory $IgnoreTransactionTreeSimulationErrorCopyWith(
          IgnoreTransactionTreeSimulationError value,
          $Res Function(IgnoreTransactionTreeSimulationError) then) =
      _$IgnoreTransactionTreeSimulationErrorCopyWithImpl<$Res,
          IgnoreTransactionTreeSimulationError>;
  @useResult
  $Res call({int code, Address? address});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$IgnoreTransactionTreeSimulationErrorCopyWithImpl<$Res,
        $Val extends IgnoreTransactionTreeSimulationError>
    implements $IgnoreTransactionTreeSimulationErrorCopyWith<$Res> {
  _$IgnoreTransactionTreeSimulationErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IgnoreTransactionTreeSimulationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
    ) as $Val);
  }

  /// Create a copy of IgnoreTransactionTreeSimulationError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IgnoreTransactionTreeSimulationErrorImplCopyWith<$Res>
    implements $IgnoreTransactionTreeSimulationErrorCopyWith<$Res> {
  factory _$$IgnoreTransactionTreeSimulationErrorImplCopyWith(
          _$IgnoreTransactionTreeSimulationErrorImpl value,
          $Res Function(_$IgnoreTransactionTreeSimulationErrorImpl) then) =
      __$$IgnoreTransactionTreeSimulationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, Address? address});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$IgnoreTransactionTreeSimulationErrorImplCopyWithImpl<$Res>
    extends _$IgnoreTransactionTreeSimulationErrorCopyWithImpl<$Res,
        _$IgnoreTransactionTreeSimulationErrorImpl>
    implements _$$IgnoreTransactionTreeSimulationErrorImplCopyWith<$Res> {
  __$$IgnoreTransactionTreeSimulationErrorImplCopyWithImpl(
      _$IgnoreTransactionTreeSimulationErrorImpl _value,
      $Res Function(_$IgnoreTransactionTreeSimulationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of IgnoreTransactionTreeSimulationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? address = freezed,
  }) {
    return _then(_$IgnoreTransactionTreeSimulationErrorImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IgnoreTransactionTreeSimulationErrorImpl
    extends _IgnoreTransactionTreeSimulationError {
  const _$IgnoreTransactionTreeSimulationErrorImpl(
      {required this.code, this.address})
      : super._();

  factory _$IgnoreTransactionTreeSimulationErrorImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$IgnoreTransactionTreeSimulationErrorImplFromJson(json);

  @override
  final int code;
  @override
  final Address? address;

  @override
  String toString() {
    return 'IgnoreTransactionTreeSimulationError(code: $code, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IgnoreTransactionTreeSimulationErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, address);

  /// Create a copy of IgnoreTransactionTreeSimulationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IgnoreTransactionTreeSimulationErrorImplCopyWith<
          _$IgnoreTransactionTreeSimulationErrorImpl>
      get copyWith => __$$IgnoreTransactionTreeSimulationErrorImplCopyWithImpl<
          _$IgnoreTransactionTreeSimulationErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IgnoreTransactionTreeSimulationErrorImplToJson(
      this,
    );
  }
}

abstract class _IgnoreTransactionTreeSimulationError
    extends IgnoreTransactionTreeSimulationError {
  const factory _IgnoreTransactionTreeSimulationError(
      {required final int code,
      final Address? address}) = _$IgnoreTransactionTreeSimulationErrorImpl;
  const _IgnoreTransactionTreeSimulationError._() : super._();

  factory _IgnoreTransactionTreeSimulationError.fromJson(
          Map<String, dynamic> json) =
      _$IgnoreTransactionTreeSimulationErrorImpl.fromJson;

  @override
  int get code;
  @override
  Address? get address;

  /// Create a copy of IgnoreTransactionTreeSimulationError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IgnoreTransactionTreeSimulationErrorImplCopyWith<
          _$IgnoreTransactionTreeSimulationErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
