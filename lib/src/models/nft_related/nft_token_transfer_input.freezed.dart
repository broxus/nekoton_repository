// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_token_transfer_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NftTokenTransferInput {
  BigInt get count;
  BigInt get deployTokenWalletValue;
  Address get recipient;
  Address get remainingGasTo;
  String get payload;
  bool get notify;

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftTokenTransferInputCopyWith<NftTokenTransferInput> get copyWith =>
      _$NftTokenTransferInputCopyWithImpl<NftTokenTransferInput>(
          this as NftTokenTransferInput, _$identity);

  /// Serializes this NftTokenTransferInput to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NftTokenTransferInput &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.deployTokenWalletValue, deployTokenWalletValue) ||
                other.deployTokenWalletValue == deployTokenWalletValue) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.remainingGasTo, remainingGasTo) ||
                other.remainingGasTo == remainingGasTo) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.notify, notify) || other.notify == notify));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, deployTokenWalletValue,
      recipient, remainingGasTo, payload, notify);

  @override
  String toString() {
    return 'NftTokenTransferInput(count: $count, deployTokenWalletValue: $deployTokenWalletValue, recipient: $recipient, remainingGasTo: $remainingGasTo, payload: $payload, notify: $notify)';
  }
}

/// @nodoc
abstract mixin class $NftTokenTransferInputCopyWith<$Res> {
  factory $NftTokenTransferInputCopyWith(NftTokenTransferInput value,
          $Res Function(NftTokenTransferInput) _then) =
      _$NftTokenTransferInputCopyWithImpl;
  @useResult
  $Res call(
      {BigInt count,
      BigInt deployTokenWalletValue,
      Address recipient,
      Address remainingGasTo,
      String payload,
      bool notify});

  $AddressCopyWith<$Res> get recipient;
  $AddressCopyWith<$Res> get remainingGasTo;
}

/// @nodoc
class _$NftTokenTransferInputCopyWithImpl<$Res>
    implements $NftTokenTransferInputCopyWith<$Res> {
  _$NftTokenTransferInputCopyWithImpl(this._self, this._then);

  final NftTokenTransferInput _self;
  final $Res Function(NftTokenTransferInput) _then;

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? deployTokenWalletValue = null,
    Object? recipient = null,
    Object? remainingGasTo = null,
    Object? payload = null,
    Object? notify = null,
  }) {
    return _then(_self.copyWith(
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as BigInt,
      deployTokenWalletValue: null == deployTokenWalletValue
          ? _self.deployTokenWalletValue
          : deployTokenWalletValue // ignore: cast_nullable_to_non_nullable
              as BigInt,
      recipient: null == recipient
          ? _self.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as Address,
      remainingGasTo: null == remainingGasTo
          ? _self.remainingGasTo
          : remainingGasTo // ignore: cast_nullable_to_non_nullable
              as Address,
      payload: null == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      notify: null == notify
          ? _self.notify
          : notify // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get recipient {
    return $AddressCopyWith<$Res>(_self.recipient, (value) {
      return _then(_self.copyWith(recipient: value));
    });
  }

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get remainingGasTo {
    return $AddressCopyWith<$Res>(_self.remainingGasTo, (value) {
      return _then(_self.copyWith(remainingGasTo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _NftTokenTransferInput implements NftTokenTransferInput {
  const _NftTokenTransferInput(
      {required this.count,
      required this.deployTokenWalletValue,
      required this.recipient,
      required this.remainingGasTo,
      required this.payload,
      required this.notify});
  factory _NftTokenTransferInput.fromJson(Map<String, dynamic> json) =>
      _$NftTokenTransferInputFromJson(json);

  @override
  final BigInt count;
  @override
  final BigInt deployTokenWalletValue;
  @override
  final Address recipient;
  @override
  final Address remainingGasTo;
  @override
  final String payload;
  @override
  final bool notify;

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NftTokenTransferInputCopyWith<_NftTokenTransferInput> get copyWith =>
      __$NftTokenTransferInputCopyWithImpl<_NftTokenTransferInput>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NftTokenTransferInputToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NftTokenTransferInput &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.deployTokenWalletValue, deployTokenWalletValue) ||
                other.deployTokenWalletValue == deployTokenWalletValue) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.remainingGasTo, remainingGasTo) ||
                other.remainingGasTo == remainingGasTo) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.notify, notify) || other.notify == notify));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, deployTokenWalletValue,
      recipient, remainingGasTo, payload, notify);

  @override
  String toString() {
    return 'NftTokenTransferInput(count: $count, deployTokenWalletValue: $deployTokenWalletValue, recipient: $recipient, remainingGasTo: $remainingGasTo, payload: $payload, notify: $notify)';
  }
}

/// @nodoc
abstract mixin class _$NftTokenTransferInputCopyWith<$Res>
    implements $NftTokenTransferInputCopyWith<$Res> {
  factory _$NftTokenTransferInputCopyWith(_NftTokenTransferInput value,
          $Res Function(_NftTokenTransferInput) _then) =
      __$NftTokenTransferInputCopyWithImpl;
  @override
  @useResult
  $Res call(
      {BigInt count,
      BigInt deployTokenWalletValue,
      Address recipient,
      Address remainingGasTo,
      String payload,
      bool notify});

  @override
  $AddressCopyWith<$Res> get recipient;
  @override
  $AddressCopyWith<$Res> get remainingGasTo;
}

/// @nodoc
class __$NftTokenTransferInputCopyWithImpl<$Res>
    implements _$NftTokenTransferInputCopyWith<$Res> {
  __$NftTokenTransferInputCopyWithImpl(this._self, this._then);

  final _NftTokenTransferInput _self;
  final $Res Function(_NftTokenTransferInput) _then;

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? count = null,
    Object? deployTokenWalletValue = null,
    Object? recipient = null,
    Object? remainingGasTo = null,
    Object? payload = null,
    Object? notify = null,
  }) {
    return _then(_NftTokenTransferInput(
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as BigInt,
      deployTokenWalletValue: null == deployTokenWalletValue
          ? _self.deployTokenWalletValue
          : deployTokenWalletValue // ignore: cast_nullable_to_non_nullable
              as BigInt,
      recipient: null == recipient
          ? _self.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as Address,
      remainingGasTo: null == remainingGasTo
          ? _self.remainingGasTo
          : remainingGasTo // ignore: cast_nullable_to_non_nullable
              as Address,
      payload: null == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      notify: null == notify
          ? _self.notify
          : notify // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get recipient {
    return $AddressCopyWith<$Res>(_self.recipient, (value) {
      return _then(_self.copyWith(recipient: value));
    });
  }

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get remainingGasTo {
    return $AddressCopyWith<$Res>(_self.remainingGasTo, (value) {
      return _then(_self.copyWith(remainingGasTo: value));
    });
  }
}

// dart format on
