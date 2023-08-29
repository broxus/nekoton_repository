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
  @JsonKey(includeIfNull: false)
  bool? get state => throw _privateConstructorUsedError;
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
      {@JsonKey(includeIfNull: false) bool? state,
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
    Object? state = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_value.copyWith(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool?,
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContractUpdatesSubscriptionCopyWith<$Res>
    implements $ContractUpdatesSubscriptionCopyWith<$Res> {
  factory _$$_ContractUpdatesSubscriptionCopyWith(
          _$_ContractUpdatesSubscription value,
          $Res Function(_$_ContractUpdatesSubscription) then) =
      __$$_ContractUpdatesSubscriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) bool? state,
      @JsonKey(includeIfNull: false) bool? transactions});
}

/// @nodoc
class __$$_ContractUpdatesSubscriptionCopyWithImpl<$Res>
    extends _$ContractUpdatesSubscriptionCopyWithImpl<$Res,
        _$_ContractUpdatesSubscription>
    implements _$$_ContractUpdatesSubscriptionCopyWith<$Res> {
  __$$_ContractUpdatesSubscriptionCopyWithImpl(
      _$_ContractUpdatesSubscription _value,
      $Res Function(_$_ContractUpdatesSubscription) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_$_ContractUpdatesSubscription(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
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
class _$_ContractUpdatesSubscription implements _ContractUpdatesSubscription {
  const _$_ContractUpdatesSubscription(
      {@JsonKey(includeIfNull: false) this.state,
      @JsonKey(includeIfNull: false) this.transactions});

  factory _$_ContractUpdatesSubscription.fromJson(Map<String, dynamic> json) =>
      _$$_ContractUpdatesSubscriptionFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final bool? state;
  @override
  @JsonKey(includeIfNull: false)
  final bool? transactions;

  @override
  String toString() {
    return 'ContractUpdatesSubscription(state: $state, transactions: $transactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContractUpdatesSubscription &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.transactions, transactions) ||
                other.transactions == transactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, transactions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContractUpdatesSubscriptionCopyWith<_$_ContractUpdatesSubscription>
      get copyWith => __$$_ContractUpdatesSubscriptionCopyWithImpl<
          _$_ContractUpdatesSubscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContractUpdatesSubscriptionToJson(
      this,
    );
  }
}

abstract class _ContractUpdatesSubscription
    implements ContractUpdatesSubscription {
  const factory _ContractUpdatesSubscription(
          {@JsonKey(includeIfNull: false) final bool? state,
          @JsonKey(includeIfNull: false) final bool? transactions}) =
      _$_ContractUpdatesSubscription;

  factory _ContractUpdatesSubscription.fromJson(Map<String, dynamic> json) =
      _$_ContractUpdatesSubscription.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  bool? get state;
  @override
  @JsonKey(includeIfNull: false)
  bool? get transactions;
  @override
  @JsonKey(ignore: true)
  _$$_ContractUpdatesSubscriptionCopyWith<_$_ContractUpdatesSubscription>
      get copyWith => throw _privateConstructorUsedError;
}
