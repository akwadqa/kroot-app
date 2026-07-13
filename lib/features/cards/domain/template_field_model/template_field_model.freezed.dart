// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_field_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TemplateFieldModel {
  @JsonKey(name: 'field_name')
  String? get fieldName;
  @JsonKey(name: 'field_type')
  String? get fieldType;
  @JsonKey(name: 'field_label')
  String? get fieldLabel;
  @JsonKey(name: 'select_options')
  List<String>? get selectOptions;
  @JsonKey(name: 'is_required')
  @JsonKeyTransform()
  bool? get isRequired;
  String? get placeholder;

  /// Create a copy of TemplateFieldModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateFieldModelCopyWith<TemplateFieldModel> get copyWith =>
      _$TemplateFieldModelCopyWithImpl<TemplateFieldModel>(
          this as TemplateFieldModel, _$identity);

  /// Serializes this TemplateFieldModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TemplateFieldModel &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.fieldType, fieldType) ||
                other.fieldType == fieldType) &&
            (identical(other.fieldLabel, fieldLabel) ||
                other.fieldLabel == fieldLabel) &&
            const DeepCollectionEquality()
                .equals(other.selectOptions, selectOptions) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fieldName,
      fieldType,
      fieldLabel,
      const DeepCollectionEquality().hash(selectOptions),
      isRequired,
      placeholder);

  @override
  String toString() {
    return 'TemplateFieldModel(fieldName: $fieldName, fieldType: $fieldType, fieldLabel: $fieldLabel, selectOptions: $selectOptions, isRequired: $isRequired, placeholder: $placeholder)';
  }
}

/// @nodoc
abstract mixin class $TemplateFieldModelCopyWith<$Res> {
  factory $TemplateFieldModelCopyWith(
          TemplateFieldModel value, $Res Function(TemplateFieldModel) _then) =
      _$TemplateFieldModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'field_name') String? fieldName,
      @JsonKey(name: 'field_type') String? fieldType,
      @JsonKey(name: 'field_label') String? fieldLabel,
      @JsonKey(name: 'select_options') List<String>? selectOptions,
      @JsonKey(name: 'is_required') @JsonKeyTransform() bool? isRequired,
      String? placeholder});
}

/// @nodoc
class _$TemplateFieldModelCopyWithImpl<$Res>
    implements $TemplateFieldModelCopyWith<$Res> {
  _$TemplateFieldModelCopyWithImpl(this._self, this._then);

  final TemplateFieldModel _self;
  final $Res Function(TemplateFieldModel) _then;

  /// Create a copy of TemplateFieldModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldName = freezed,
    Object? fieldType = freezed,
    Object? fieldLabel = freezed,
    Object? selectOptions = freezed,
    Object? isRequired = freezed,
    Object? placeholder = freezed,
  }) {
    return _then(_self.copyWith(
      fieldName: freezed == fieldName
          ? _self.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldType: freezed == fieldType
          ? _self.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldLabel: freezed == fieldLabel
          ? _self.fieldLabel
          : fieldLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      selectOptions: freezed == selectOptions
          ? _self.selectOptions
          : selectOptions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isRequired: freezed == isRequired
          ? _self.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      placeholder: freezed == placeholder
          ? _self.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TemplateFieldModel].
extension TemplateFieldModelPatterns on TemplateFieldModel {
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
    TResult Function(_TemplateFieldModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TemplateFieldModel() when $default != null:
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
    TResult Function(_TemplateFieldModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateFieldModel():
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
    TResult? Function(_TemplateFieldModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateFieldModel() when $default != null:
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
            @JsonKey(name: 'field_name') String? fieldName,
            @JsonKey(name: 'field_type') String? fieldType,
            @JsonKey(name: 'field_label') String? fieldLabel,
            @JsonKey(name: 'select_options') List<String>? selectOptions,
            @JsonKey(name: 'is_required') @JsonKeyTransform() bool? isRequired,
            String? placeholder)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TemplateFieldModel() when $default != null:
        return $default(_that.fieldName, _that.fieldType, _that.fieldLabel,
            _that.selectOptions, _that.isRequired, _that.placeholder);
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
            @JsonKey(name: 'field_name') String? fieldName,
            @JsonKey(name: 'field_type') String? fieldType,
            @JsonKey(name: 'field_label') String? fieldLabel,
            @JsonKey(name: 'select_options') List<String>? selectOptions,
            @JsonKey(name: 'is_required') @JsonKeyTransform() bool? isRequired,
            String? placeholder)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateFieldModel():
        return $default(_that.fieldName, _that.fieldType, _that.fieldLabel,
            _that.selectOptions, _that.isRequired, _that.placeholder);
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
            @JsonKey(name: 'field_name') String? fieldName,
            @JsonKey(name: 'field_type') String? fieldType,
            @JsonKey(name: 'field_label') String? fieldLabel,
            @JsonKey(name: 'select_options') List<String>? selectOptions,
            @JsonKey(name: 'is_required') @JsonKeyTransform() bool? isRequired,
            String? placeholder)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateFieldModel() when $default != null:
        return $default(_that.fieldName, _that.fieldType, _that.fieldLabel,
            _that.selectOptions, _that.isRequired, _that.placeholder);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TemplateFieldModel implements TemplateFieldModel {
  const _TemplateFieldModel(
      {@JsonKey(name: 'field_name') this.fieldName,
      @JsonKey(name: 'field_type') this.fieldType,
      @JsonKey(name: 'field_label') this.fieldLabel,
      @JsonKey(name: 'select_options') final List<String>? selectOptions,
      @JsonKey(name: 'is_required') @JsonKeyTransform() this.isRequired,
      this.placeholder})
      : _selectOptions = selectOptions;
  factory _TemplateFieldModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateFieldModelFromJson(json);

  @override
  @JsonKey(name: 'field_name')
  final String? fieldName;
  @override
  @JsonKey(name: 'field_type')
  final String? fieldType;
  @override
  @JsonKey(name: 'field_label')
  final String? fieldLabel;
  final List<String>? _selectOptions;
  @override
  @JsonKey(name: 'select_options')
  List<String>? get selectOptions {
    final value = _selectOptions;
    if (value == null) return null;
    if (_selectOptions is EqualUnmodifiableListView) return _selectOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_required')
  @JsonKeyTransform()
  final bool? isRequired;
  @override
  final String? placeholder;

  /// Create a copy of TemplateFieldModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TemplateFieldModelCopyWith<_TemplateFieldModel> get copyWith =>
      __$TemplateFieldModelCopyWithImpl<_TemplateFieldModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateFieldModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TemplateFieldModel &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.fieldType, fieldType) ||
                other.fieldType == fieldType) &&
            (identical(other.fieldLabel, fieldLabel) ||
                other.fieldLabel == fieldLabel) &&
            const DeepCollectionEquality()
                .equals(other._selectOptions, _selectOptions) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fieldName,
      fieldType,
      fieldLabel,
      const DeepCollectionEquality().hash(_selectOptions),
      isRequired,
      placeholder);

  @override
  String toString() {
    return 'TemplateFieldModel(fieldName: $fieldName, fieldType: $fieldType, fieldLabel: $fieldLabel, selectOptions: $selectOptions, isRequired: $isRequired, placeholder: $placeholder)';
  }
}

/// @nodoc
abstract mixin class _$TemplateFieldModelCopyWith<$Res>
    implements $TemplateFieldModelCopyWith<$Res> {
  factory _$TemplateFieldModelCopyWith(
          _TemplateFieldModel value, $Res Function(_TemplateFieldModel) _then) =
      __$TemplateFieldModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'field_name') String? fieldName,
      @JsonKey(name: 'field_type') String? fieldType,
      @JsonKey(name: 'field_label') String? fieldLabel,
      @JsonKey(name: 'select_options') List<String>? selectOptions,
      @JsonKey(name: 'is_required') @JsonKeyTransform() bool? isRequired,
      String? placeholder});
}

/// @nodoc
class __$TemplateFieldModelCopyWithImpl<$Res>
    implements _$TemplateFieldModelCopyWith<$Res> {
  __$TemplateFieldModelCopyWithImpl(this._self, this._then);

  final _TemplateFieldModel _self;
  final $Res Function(_TemplateFieldModel) _then;

  /// Create a copy of TemplateFieldModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fieldName = freezed,
    Object? fieldType = freezed,
    Object? fieldLabel = freezed,
    Object? selectOptions = freezed,
    Object? isRequired = freezed,
    Object? placeholder = freezed,
  }) {
    return _then(_TemplateFieldModel(
      fieldName: freezed == fieldName
          ? _self.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldType: freezed == fieldType
          ? _self.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldLabel: freezed == fieldLabel
          ? _self.fieldLabel
          : fieldLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      selectOptions: freezed == selectOptions
          ? _self._selectOptions
          : selectOptions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isRequired: freezed == isRequired
          ? _self.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      placeholder: freezed == placeholder
          ? _self.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
