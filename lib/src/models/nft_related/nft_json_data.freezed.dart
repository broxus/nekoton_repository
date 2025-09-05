// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_json_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NftJsonData {
  String? get name;
  String? get description;
  FileMetadata? get preview;
  List<FileMetadata>? get files;
  @JsonKey(name: 'external_url')
  String? get externalUrl;

  /// Create a copy of NftJsonData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NftJsonDataCopyWith<NftJsonData> get copyWith =>
      _$NftJsonDataCopyWithImpl<NftJsonData>(this as NftJsonData, _$identity);

  /// Serializes this NftJsonData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NftJsonData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            const DeepCollectionEquality().equals(other.files, files) &&
            (identical(other.externalUrl, externalUrl) ||
                other.externalUrl == externalUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, preview,
      const DeepCollectionEquality().hash(files), externalUrl);

  @override
  String toString() {
    return 'NftJsonData(name: $name, description: $description, preview: $preview, files: $files, externalUrl: $externalUrl)';
  }
}

/// @nodoc
abstract mixin class $NftJsonDataCopyWith<$Res> {
  factory $NftJsonDataCopyWith(
          NftJsonData value, $Res Function(NftJsonData) _then) =
      _$NftJsonDataCopyWithImpl;
  @useResult
  $Res call(
      {String? name,
      String? description,
      FileMetadata? preview,
      List<FileMetadata>? files,
      @JsonKey(name: 'external_url') String? externalUrl});

  $FileMetadataCopyWith<$Res>? get preview;
}

/// @nodoc
class _$NftJsonDataCopyWithImpl<$Res> implements $NftJsonDataCopyWith<$Res> {
  _$NftJsonDataCopyWithImpl(this._self, this._then);

  final NftJsonData _self;
  final $Res Function(NftJsonData) _then;

  /// Create a copy of NftJsonData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? preview = freezed,
    Object? files = freezed,
    Object? externalUrl = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      preview: freezed == preview
          ? _self.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as FileMetadata?,
      files: freezed == files
          ? _self.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileMetadata>?,
      externalUrl: freezed == externalUrl
          ? _self.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of NftJsonData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileMetadataCopyWith<$Res>? get preview {
    if (_self.preview == null) {
      return null;
    }

    return $FileMetadataCopyWith<$Res>(_self.preview!, (value) {
      return _then(_self.copyWith(preview: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NftJsonData].
extension NftJsonDataPatterns on NftJsonData {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NftJsonData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NftJsonData() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NftJsonData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftJsonData():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NftJsonData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftJsonData() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? name,
            String? description,
            FileMetadata? preview,
            List<FileMetadata>? files,
            @JsonKey(name: 'external_url') String? externalUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NftJsonData() when $default != null:
        return $default(_that.name, _that.description, _that.preview,
            _that.files, _that.externalUrl);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? name,
            String? description,
            FileMetadata? preview,
            List<FileMetadata>? files,
            @JsonKey(name: 'external_url') String? externalUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftJsonData():
        return $default(_that.name, _that.description, _that.preview,
            _that.files, _that.externalUrl);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? name,
            String? description,
            FileMetadata? preview,
            List<FileMetadata>? files,
            @JsonKey(name: 'external_url') String? externalUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NftJsonData() when $default != null:
        return $default(_that.name, _that.description, _that.preview,
            _that.files, _that.externalUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NftJsonData extends NftJsonData {
  const _NftJsonData(
      {this.name,
      this.description,
      this.preview,
      final List<FileMetadata>? files,
      @JsonKey(name: 'external_url') this.externalUrl})
      : _files = files,
        super._();
  factory _NftJsonData.fromJson(Map<String, dynamic> json) =>
      _$NftJsonDataFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  final FileMetadata? preview;
  final List<FileMetadata>? _files;
  @override
  List<FileMetadata>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'external_url')
  final String? externalUrl;

  /// Create a copy of NftJsonData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NftJsonDataCopyWith<_NftJsonData> get copyWith =>
      __$NftJsonDataCopyWithImpl<_NftJsonData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NftJsonDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NftJsonData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.externalUrl, externalUrl) ||
                other.externalUrl == externalUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, preview,
      const DeepCollectionEquality().hash(_files), externalUrl);

  @override
  String toString() {
    return 'NftJsonData(name: $name, description: $description, preview: $preview, files: $files, externalUrl: $externalUrl)';
  }
}

/// @nodoc
abstract mixin class _$NftJsonDataCopyWith<$Res>
    implements $NftJsonDataCopyWith<$Res> {
  factory _$NftJsonDataCopyWith(
          _NftJsonData value, $Res Function(_NftJsonData) _then) =
      __$NftJsonDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? name,
      String? description,
      FileMetadata? preview,
      List<FileMetadata>? files,
      @JsonKey(name: 'external_url') String? externalUrl});

  @override
  $FileMetadataCopyWith<$Res>? get preview;
}

/// @nodoc
class __$NftJsonDataCopyWithImpl<$Res> implements _$NftJsonDataCopyWith<$Res> {
  __$NftJsonDataCopyWithImpl(this._self, this._then);

  final _NftJsonData _self;
  final $Res Function(_NftJsonData) _then;

  /// Create a copy of NftJsonData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? preview = freezed,
    Object? files = freezed,
    Object? externalUrl = freezed,
  }) {
    return _then(_NftJsonData(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      preview: freezed == preview
          ? _self.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as FileMetadata?,
      files: freezed == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileMetadata>?,
      externalUrl: freezed == externalUrl
          ? _self.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of NftJsonData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileMetadataCopyWith<$Res>? get preview {
    if (_self.preview == null) {
      return null;
    }

    return $FileMetadataCopyWith<$Res>(_self.preview!, (value) {
      return _then(_self.copyWith(preview: value));
    });
  }
}

// dart format on
