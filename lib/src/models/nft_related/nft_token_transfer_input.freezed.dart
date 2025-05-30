// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_token_transfer_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NftTokenTransferInput _$NftTokenTransferInputFromJson(
    Map<String, dynamic> json) {
  return _NftTokenTransferInput.fromJson(json);
}

/// @nodoc
mixin _$NftTokenTransferInput {
  @amountJsonConverter
  BigInt get count => throw _privateConstructorUsedError;
  @amountJsonConverter
  BigInt get deployTokenWalletValue => throw _privateConstructorUsedError;
  Address get recipient => throw _privateConstructorUsedError;
  Address get remainingGasTo => throw _privateConstructorUsedError;
  String get payload => throw _privateConstructorUsedError;
  bool get notify => throw _privateConstructorUsedError;

  /// Serializes this NftTokenTransferInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftTokenTransferInputCopyWith<NftTokenTransferInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftTokenTransferInputCopyWith<$Res> {
  factory $NftTokenTransferInputCopyWith(NftTokenTransferInput value,
          $Res Function(NftTokenTransferInput) then) =
      _$NftTokenTransferInputCopyWithImpl<$Res, NftTokenTransferInput>;
  @useResult
  $Res call(
      {@amountJsonConverter BigInt count,
      @amountJsonConverter BigInt deployTokenWalletValue,
      Address recipient,
      Address remainingGasTo,
      String payload,
      bool notify});

  $AddressCopyWith<$Res> get recipient;
  $AddressCopyWith<$Res> get remainingGasTo;
}

/// @nodoc
class _$NftTokenTransferInputCopyWithImpl<$Res,
        $Val extends NftTokenTransferInput>
    implements $NftTokenTransferInputCopyWith<$Res> {
  _$NftTokenTransferInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as BigInt,
      deployTokenWalletValue: null == deployTokenWalletValue
          ? _value.deployTokenWalletValue
          : deployTokenWalletValue // ignore: cast_nullable_to_non_nullable
              as BigInt,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as Address,
      remainingGasTo: null == remainingGasTo
          ? _value.remainingGasTo
          : remainingGasTo // ignore: cast_nullable_to_non_nullable
              as Address,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      notify: null == notify
          ? _value.notify
          : notify // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get recipient {
    return $AddressCopyWith<$Res>(_value.recipient, (value) {
      return _then(_value.copyWith(recipient: value) as $Val);
    });
  }

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get remainingGasTo {
    return $AddressCopyWith<$Res>(_value.remainingGasTo, (value) {
      return _then(_value.copyWith(remainingGasTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NftTokenTransferInputImplCopyWith<$Res>
    implements $NftTokenTransferInputCopyWith<$Res> {
  factory _$$NftTokenTransferInputImplCopyWith(
          _$NftTokenTransferInputImpl value,
          $Res Function(_$NftTokenTransferInputImpl) then) =
      __$$NftTokenTransferInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@amountJsonConverter BigInt count,
      @amountJsonConverter BigInt deployTokenWalletValue,
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
class __$$NftTokenTransferInputImplCopyWithImpl<$Res>
    extends _$NftTokenTransferInputCopyWithImpl<$Res,
        _$NftTokenTransferInputImpl>
    implements _$$NftTokenTransferInputImplCopyWith<$Res> {
  __$$NftTokenTransferInputImplCopyWithImpl(_$NftTokenTransferInputImpl _value,
      $Res Function(_$NftTokenTransferInputImpl) _then)
      : super(_value, _then);

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
    return _then(_$NftTokenTransferInputImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as BigInt,
      deployTokenWalletValue: null == deployTokenWalletValue
          ? _value.deployTokenWalletValue
          : deployTokenWalletValue // ignore: cast_nullable_to_non_nullable
              as BigInt,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as Address,
      remainingGasTo: null == remainingGasTo
          ? _value.remainingGasTo
          : remainingGasTo // ignore: cast_nullable_to_non_nullable
              as Address,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      notify: null == notify
          ? _value.notify
          : notify // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NftTokenTransferInputImpl implements _NftTokenTransferInput {
  const _$NftTokenTransferInputImpl(
      {@amountJsonConverter required this.count,
      @amountJsonConverter required this.deployTokenWalletValue,
      required this.recipient,
      required this.remainingGasTo,
      required this.payload,
      required this.notify});

  factory _$NftTokenTransferInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$NftTokenTransferInputImplFromJson(json);

  @override
  @amountJsonConverter
  final BigInt count;
  @override
  @amountJsonConverter
  final BigInt deployTokenWalletValue;
  @override
  final Address recipient;
  @override
  final Address remainingGasTo;
  @override
  final String payload;
  @override
  final bool notify;

  @override
  String toString() {
    return 'NftTokenTransferInput(count: $count, deployTokenWalletValue: $deployTokenWalletValue, recipient: $recipient, remainingGasTo: $remainingGasTo, payload: $payload, notify: $notify)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftTokenTransferInputImpl &&
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

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftTokenTransferInputImplCopyWith<_$NftTokenTransferInputImpl>
      get copyWith => __$$NftTokenTransferInputImplCopyWithImpl<
          _$NftTokenTransferInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NftTokenTransferInputImplToJson(
      this,
    );
  }
}

abstract class _NftTokenTransferInput implements NftTokenTransferInput {
  const factory _NftTokenTransferInput(
      {@amountJsonConverter required final BigInt count,
      @amountJsonConverter required final BigInt deployTokenWalletValue,
      required final Address recipient,
      required final Address remainingGasTo,
      required final String payload,
      required final bool notify}) = _$NftTokenTransferInputImpl;

  factory _NftTokenTransferInput.fromJson(Map<String, dynamic> json) =
      _$NftTokenTransferInputImpl.fromJson;

  @override
  @amountJsonConverter
  BigInt get count;
  @override
  @amountJsonConverter
  BigInt get deployTokenWalletValue;
  @override
  Address get recipient;
  @override
  Address get remainingGasTo;
  @override
  String get payload;
  @override
  bool get notify;

  /// Create a copy of NftTokenTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftTokenTransferInputImplCopyWith<_$NftTokenTransferInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
