// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NftList {
  List<NftItem> get items => throw _privateConstructorUsedError;
  String? get continuation => throw _privateConstructorUsedError;

  /// Create a copy of NftList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NftListCopyWith<NftList> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftListCopyWith<$Res> {
  factory $NftListCopyWith(NftList value, $Res Function(NftList) then) =
      _$NftListCopyWithImpl<$Res, NftList>;
  @useResult
  $Res call({List<NftItem> items, String? continuation});
}

/// @nodoc
class _$NftListCopyWithImpl<$Res, $Val extends NftList>
    implements $NftListCopyWith<$Res> {
  _$NftListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NftList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? continuation = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NftItem>,
      continuation: freezed == continuation
          ? _value.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NftListImplCopyWith<$Res> implements $NftListCopyWith<$Res> {
  factory _$$NftListImplCopyWith(
          _$NftListImpl value, $Res Function(_$NftListImpl) then) =
      __$$NftListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NftItem> items, String? continuation});
}

/// @nodoc
class __$$NftListImplCopyWithImpl<$Res>
    extends _$NftListCopyWithImpl<$Res, _$NftListImpl>
    implements _$$NftListImplCopyWith<$Res> {
  __$$NftListImplCopyWithImpl(
      _$NftListImpl _value, $Res Function(_$NftListImpl) _then)
      : super(_value, _then);

  /// Create a copy of NftList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? continuation = freezed,
  }) {
    return _then(_$NftListImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NftItem>,
      continuation: freezed == continuation
          ? _value.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NftListImpl implements _NftList {
  const _$NftListImpl({required final List<NftItem> items, this.continuation})
      : _items = items;

  final List<NftItem> _items;
  @override
  List<NftItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? continuation;

  @override
  String toString() {
    return 'NftList(items: $items, continuation: $continuation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftListImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.continuation, continuation) ||
                other.continuation == continuation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), continuation);

  /// Create a copy of NftList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NftListImplCopyWith<_$NftListImpl> get copyWith =>
      __$$NftListImplCopyWithImpl<_$NftListImpl>(this, _$identity);
}

abstract class _NftList implements NftList {
  const factory _NftList(
      {required final List<NftItem> items,
      final String? continuation}) = _$NftListImpl;

  @override
  List<NftItem> get items;
  @override
  String? get continuation;

  /// Create a copy of NftList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NftListImplCopyWith<_$NftListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
