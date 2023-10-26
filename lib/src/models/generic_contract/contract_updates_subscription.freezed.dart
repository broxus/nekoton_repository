// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_updates_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContractUpdatesSubscription _$ContractUpdatesSubscriptionFromJson(
    Map<String, dynamic> json) {
  return _ContractUpdatesSubscription.fromJson(json);
}

/// @nodoc
mixin _$ContractUpdatesSubscription {
  @JsonKey(includeIfNull: false, name: 'state')
  bool? get contractState => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  bool? get transactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractUpdatesSubscriptionCopyWith<ContractUpdatesSubscription>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractUpdatesSubscriptionCopyWith<$Res> {
  factory $ContractUpdatesSubscriptionCopyWith(
          ContractUpdatesSubscription value,
          $Res Function(ContractUpdatesSubscription) then) =
      _$ContractUpdatesSubscriptionCopyWithImpl<$Res,
          ContractUpdatesSubscription>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false, name: 'state') bool? contractState,
      @JsonKey(includeIfNull: false) bool? transactions});
}

/// @nodoc
class _$ContractUpdatesSubscriptionCopyWithImpl<$Res,
        $Val extends ContractUpdatesSubscription>
    implements $ContractUpdatesSubscriptionCopyWith<$Res> {
  _$ContractUpdatesSubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractState = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_value.copyWith(
      contractState: freezed == contractState
          ? _value.contractState
          : contractState // ignore: cast_nullable_to_non_nullable
              as bool?,
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContractUpdatesSubscriptionImplCopyWith<$Res>
    implements $ContractUpdatesSubscriptionCopyWith<$Res> {
  factory _$$ContractUpdatesSubscriptionImplCopyWith(
          _$ContractUpdatesSubscriptionImpl value,
          $Res Function(_$ContractUpdatesSubscriptionImpl) then) =
      __$$ContractUpdatesSubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false, name: 'state') bool? contractState,
      @JsonKey(includeIfNull: false) bool? transactions});
}

/// @nodoc
class __$$ContractUpdatesSubscriptionImplCopyWithImpl<$Res>
    extends _$ContractUpdatesSubscriptionCopyWithImpl<$Res,
        _$ContractUpdatesSubscriptionImpl>
    implements _$$ContractUpdatesSubscriptionImplCopyWith<$Res> {
  __$$ContractUpdatesSubscriptionImplCopyWithImpl(
      _$ContractUpdatesSubscriptionImpl _value,
      $Res Function(_$ContractUpdatesSubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractState = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_$ContractUpdatesSubscriptionImpl(
      contractState: freezed == contractState
          ? _value.contractState
          : contractState // ignore: cast_nullable_to_non_nullable
              as bool?,
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContractUpdatesSubscriptionImpl
    implements _ContractUpdatesSubscription {
  const _$ContractUpdatesSubscriptionImpl(
      {@JsonKey(includeIfNull: false, name: 'state') this.contractState,
      @JsonKey(includeIfNull: false) this.transactions});

  factory _$ContractUpdatesSubscriptionImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ContractUpdatesSubscriptionImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false, name: 'state')
  final bool? contractState;
  @override
  @JsonKey(includeIfNull: false)
  final bool? transactions;

  @override
  String toString() {
    return 'ContractUpdatesSubscription(contractState: $contractState, transactions: $transactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractUpdatesSubscriptionImpl &&
            (identical(other.contractState, contractState) ||
                other.contractState == contractState) &&
            (identical(other.transactions, transactions) ||
                other.transactions == transactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contractState, transactions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractUpdatesSubscriptionImplCopyWith<_$ContractUpdatesSubscriptionImpl>
      get copyWith => __$$ContractUpdatesSubscriptionImplCopyWithImpl<
          _$ContractUpdatesSubscriptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractUpdatesSubscriptionImplToJson(
      this,
    );
  }
}

abstract class _ContractUpdatesSubscription
    implements ContractUpdatesSubscription {
  const factory _ContractUpdatesSubscription(
      {@JsonKey(includeIfNull: false, name: 'state') final bool? contractState,
      @JsonKey(includeIfNull: false)
      final bool? transactions}) = _$ContractUpdatesSubscriptionImpl;

  factory _ContractUpdatesSubscription.fromJson(Map<String, dynamic> json) =
      _$ContractUpdatesSubscriptionImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false, name: 'state')
  bool? get contractState;
  @override
  @JsonKey(includeIfNull: false)
  bool? get transactions;
  @override
  @JsonKey(ignore: true)
  _$$ContractUpdatesSubscriptionImplCopyWith<_$ContractUpdatesSubscriptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
