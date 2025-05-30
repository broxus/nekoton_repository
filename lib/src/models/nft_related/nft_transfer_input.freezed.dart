// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_transfer_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NftTransferInput {
  Address get to => throw _privateConstructorUsedError;
  Address get sendGasTo => throw _privateConstructorUsedError;
  Map<Address, NftCallbackPayload> get callbacks =>
      throw _privateConstructorUsedError;

  /// Create a copy of NftTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftTransferInputCopyWith<NftTransferInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftTransferInputCopyWith<$Res> {
  factory $NftTransferInputCopyWith(
          NftTransferInput value, $Res Function(NftTransferInput) then) =
      _$NftTransferInputCopyWithImpl<$Res, NftTransferInput>;
  @useResult
  $Res call(
      {Address to,
      Address sendGasTo,
      Map<Address, NftCallbackPayload> callbacks});

  $AddressCopyWith<$Res> get to;
  $AddressCopyWith<$Res> get sendGasTo;
}

/// @nodoc
class _$NftTransferInputCopyWithImpl<$Res, $Val extends NftTransferInput>
    implements $NftTransferInputCopyWith<$Res> {
  _$NftTransferInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NftTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? to = null,
    Object? sendGasTo = null,
    Object? callbacks = null,
  }) {
    return _then(_value.copyWith(
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Address,
      sendGasTo: null == sendGasTo
          ? _value.sendGasTo
          : sendGasTo // ignore: cast_nullable_to_non_nullable
              as Address,
      callbacks: null == callbacks
          ? _value.callbacks
          : callbacks // ignore: cast_nullable_to_non_nullable
              as Map<Address, NftCallbackPayload>,
    ) as $Val);
  }

  /// Create a copy of NftTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get to {
    return $AddressCopyWith<$Res>(_value.to, (value) {
      return _then(_value.copyWith(to: value) as $Val);
    });
  }

  /// Create a copy of NftTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get sendGasTo {
    return $AddressCopyWith<$Res>(_value.sendGasTo, (value) {
      return _then(_value.copyWith(sendGasTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NftTransferInputImplCopyWith<$Res>
    implements $NftTransferInputCopyWith<$Res> {
  factory _$$NftTransferInputImplCopyWith(_$NftTransferInputImpl value,
          $Res Function(_$NftTransferInputImpl) then) =
      __$$NftTransferInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Address to,
      Address sendGasTo,
      Map<Address, NftCallbackPayload> callbacks});

  @override
  $AddressCopyWith<$Res> get to;
  @override
  $AddressCopyWith<$Res> get sendGasTo;
}

/// @nodoc
class __$$NftTransferInputImplCopyWithImpl<$Res>
    extends _$NftTransferInputCopyWithImpl<$Res, _$NftTransferInputImpl>
    implements _$$NftTransferInputImplCopyWith<$Res> {
  __$$NftTransferInputImplCopyWithImpl(_$NftTransferInputImpl _value,
      $Res Function(_$NftTransferInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of NftTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? to = null,
    Object? sendGasTo = null,
    Object? callbacks = null,
  }) {
    return _then(_$NftTransferInputImpl(
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Address,
      sendGasTo: null == sendGasTo
          ? _value.sendGasTo
          : sendGasTo // ignore: cast_nullable_to_non_nullable
              as Address,
      callbacks: null == callbacks
          ? _value._callbacks
          : callbacks // ignore: cast_nullable_to_non_nullable
              as Map<Address, NftCallbackPayload>,
    ));
  }
}

/// @nodoc

class _$NftTransferInputImpl extends _NftTransferInput {
  const _$NftTransferInputImpl(
      {required this.to,
      required this.sendGasTo,
      required final Map<Address, NftCallbackPayload> callbacks})
      : _callbacks = callbacks,
        super._();

  @override
  final Address to;
  @override
  final Address sendGasTo;
  final Map<Address, NftCallbackPayload> _callbacks;
  @override
  Map<Address, NftCallbackPayload> get callbacks {
    if (_callbacks is EqualUnmodifiableMapView) return _callbacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_callbacks);
  }

  @override
  String toString() {
    return 'NftTransferInput(to: $to, sendGasTo: $sendGasTo, callbacks: $callbacks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftTransferInputImpl &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.sendGasTo, sendGasTo) ||
                other.sendGasTo == sendGasTo) &&
            const DeepCollectionEquality()
                .equals(other._callbacks, _callbacks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, to, sendGasTo,
      const DeepCollectionEquality().hash(_callbacks));

  /// Create a copy of NftTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftTransferInputImplCopyWith<_$NftTransferInputImpl> get copyWith =>
      __$$NftTransferInputImplCopyWithImpl<_$NftTransferInputImpl>(
          this, _$identity);
}

abstract class _NftTransferInput extends NftTransferInput {
  const factory _NftTransferInput(
          {required final Address to,
          required final Address sendGasTo,
          required final Map<Address, NftCallbackPayload> callbacks}) =
      _$NftTransferInputImpl;
  const _NftTransferInput._() : super._();

  @override
  Address get to;
  @override
  Address get sendGasTo;
  @override
  Map<Address, NftCallbackPayload> get callbacks;

  /// Create a copy of NftTransferInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftTransferInputImplCopyWith<_$NftTransferInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
