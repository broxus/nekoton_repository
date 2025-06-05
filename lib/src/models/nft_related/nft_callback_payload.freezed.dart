// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_callback_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NftCallbackPayload _$NftCallbackPayloadFromJson(Map<String, dynamic> json) {
  return _NftCallbackPayload.fromJson(json);
}

/// @nodoc
mixin _$NftCallbackPayload {
  @amountJsonConverter
  BigInt get value => throw _privateConstructorUsedError;
  String get payload => throw _privateConstructorUsedError;

  /// Serializes this NftCallbackPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NftCallbackPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftCallbackPayloadCopyWith<NftCallbackPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftCallbackPayloadCopyWith<$Res> {
  factory $NftCallbackPayloadCopyWith(
          NftCallbackPayload value, $Res Function(NftCallbackPayload) then) =
      _$NftCallbackPayloadCopyWithImpl<$Res, NftCallbackPayload>;
  @useResult
  $Res call({@amountJsonConverter BigInt value, String payload});
}

/// @nodoc
class _$NftCallbackPayloadCopyWithImpl<$Res, $Val extends NftCallbackPayload>
    implements $NftCallbackPayloadCopyWith<$Res> {
  _$NftCallbackPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NftCallbackPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? payload = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as BigInt,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NftCallbackPayloadImplCopyWith<$Res>
    implements $NftCallbackPayloadCopyWith<$Res> {
  factory _$$NftCallbackPayloadImplCopyWith(_$NftCallbackPayloadImpl value,
          $Res Function(_$NftCallbackPayloadImpl) then) =
      __$$NftCallbackPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@amountJsonConverter BigInt value, String payload});
}

/// @nodoc
class __$$NftCallbackPayloadImplCopyWithImpl<$Res>
    extends _$NftCallbackPayloadCopyWithImpl<$Res, _$NftCallbackPayloadImpl>
    implements _$$NftCallbackPayloadImplCopyWith<$Res> {
  __$$NftCallbackPayloadImplCopyWithImpl(_$NftCallbackPayloadImpl _value,
      $Res Function(_$NftCallbackPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of NftCallbackPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? payload = null,
  }) {
    return _then(_$NftCallbackPayloadImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as BigInt,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NftCallbackPayloadImpl implements _NftCallbackPayload {
  const _$NftCallbackPayloadImpl(
      {@amountJsonConverter required this.value, required this.payload});

  factory _$NftCallbackPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$NftCallbackPayloadImplFromJson(json);

  @override
  @amountJsonConverter
  final BigInt value;
  @override
  final String payload;

  @override
  String toString() {
    return 'NftCallbackPayload(value: $value, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftCallbackPayloadImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, payload);

  /// Create a copy of NftCallbackPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftCallbackPayloadImplCopyWith<_$NftCallbackPayloadImpl> get copyWith =>
      __$$NftCallbackPayloadImplCopyWithImpl<_$NftCallbackPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NftCallbackPayloadImplToJson(
      this,
    );
  }
}

abstract class _NftCallbackPayload implements NftCallbackPayload {
  const factory _NftCallbackPayload(
      {@amountJsonConverter required final BigInt value,
      required final String payload}) = _$NftCallbackPayloadImpl;

  factory _NftCallbackPayload.fromJson(Map<String, dynamic> json) =
      _$NftCallbackPayloadImpl.fromJson;

  @override
  @amountJsonConverter
  BigInt get value;
  @override
  String get payload;

  /// Create a copy of NftCallbackPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftCallbackPayloadImplCopyWith<_$NftCallbackPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
