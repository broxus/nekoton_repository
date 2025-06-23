// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_state_changed_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractStateChangedEvent {
  Address get address;
  ContractState get state;

  /// Create a copy of ContractStateChangedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContractStateChangedEventCopyWith<ContractStateChangedEvent> get copyWith =>
      _$ContractStateChangedEventCopyWithImpl<ContractStateChangedEvent>(
          this as ContractStateChangedEvent, _$identity);

  /// Serializes this ContractStateChangedEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContractStateChangedEvent &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address, state);

  @override
  String toString() {
    return 'ContractStateChangedEvent(address: $address, state: $state)';
  }
}

/// @nodoc
abstract mixin class $ContractStateChangedEventCopyWith<$Res> {
  factory $ContractStateChangedEventCopyWith(ContractStateChangedEvent value,
          $Res Function(ContractStateChangedEvent) _then) =
      _$ContractStateChangedEventCopyWithImpl;
  @useResult
  $Res call({Address address, ContractState state});

  $AddressCopyWith<$Res> get address;
  $ContractStateCopyWith<$Res> get state;
}

/// @nodoc
class _$ContractStateChangedEventCopyWithImpl<$Res>
    implements $ContractStateChangedEventCopyWith<$Res> {
  _$ContractStateChangedEventCopyWithImpl(this._self, this._then);

  final ContractStateChangedEvent _self;
  final $Res Function(ContractStateChangedEvent) _then;

  /// Create a copy of ContractStateChangedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? state = null,
  }) {
    return _then(_self.copyWith(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as ContractState,
    ));
  }

  /// Create a copy of ContractStateChangedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of ContractStateChangedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContractStateCopyWith<$Res> get state {
    return $ContractStateCopyWith<$Res>(_self.state, (value) {
      return _then(_self.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ContractStateChangedEvent implements ContractStateChangedEvent {
  const _ContractStateChangedEvent(
      {required this.address, required this.state});
  factory _ContractStateChangedEvent.fromJson(Map<String, dynamic> json) =>
      _$ContractStateChangedEventFromJson(json);

  @override
  final Address address;
  @override
  final ContractState state;

  /// Create a copy of ContractStateChangedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContractStateChangedEventCopyWith<_ContractStateChangedEvent>
      get copyWith =>
          __$ContractStateChangedEventCopyWithImpl<_ContractStateChangedEvent>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContractStateChangedEventToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContractStateChangedEvent &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address, state);

  @override
  String toString() {
    return 'ContractStateChangedEvent(address: $address, state: $state)';
  }
}

/// @nodoc
abstract mixin class _$ContractStateChangedEventCopyWith<$Res>
    implements $ContractStateChangedEventCopyWith<$Res> {
  factory _$ContractStateChangedEventCopyWith(_ContractStateChangedEvent value,
          $Res Function(_ContractStateChangedEvent) _then) =
      __$ContractStateChangedEventCopyWithImpl;
  @override
  @useResult
  $Res call({Address address, ContractState state});

  @override
  $AddressCopyWith<$Res> get address;
  @override
  $ContractStateCopyWith<$Res> get state;
}

/// @nodoc
class __$ContractStateChangedEventCopyWithImpl<$Res>
    implements _$ContractStateChangedEventCopyWith<$Res> {
  __$ContractStateChangedEventCopyWithImpl(this._self, this._then);

  final _ContractStateChangedEvent _self;
  final $Res Function(_ContractStateChangedEvent) _then;

  /// Create a copy of ContractStateChangedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = null,
    Object? state = null,
  }) {
    return _then(_ContractStateChangedEvent(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as ContractState,
    ));
  }

  /// Create a copy of ContractStateChangedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_self.address, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of ContractStateChangedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContractStateCopyWith<$Res> get state {
    return $ContractStateCopyWith<$Res>(_self.state, (value) {
      return _then(_self.copyWith(state: value));
    });
  }
}

// dart format on
