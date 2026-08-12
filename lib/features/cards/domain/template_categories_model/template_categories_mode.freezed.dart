// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_categories_mode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TemplateCategoriesModel {
  String get name;
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @JsonKey(name: 'category_icon')
  String? get categoryIcon;
  @JsonKey(name: 'display_order')
  int? get displayOrder;
  @JsonKey(name: 'default_font_color')
  String? get defaultFontColor;
  List<Filter> get filters;

  /// Create a copy of TemplateCategoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateCategoriesModelCopyWith<TemplateCategoriesModel> get copyWith =>
      _$TemplateCategoriesModelCopyWithImpl<TemplateCategoriesModel>(
          this as TemplateCategoriesModel, _$identity);

  /// Serializes this TemplateCategoriesModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TemplateCategoriesModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryIcon, categoryIcon) ||
                other.categoryIcon == categoryIcon) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.defaultFontColor, defaultFontColor) ||
                other.defaultFontColor == defaultFontColor) &&
            const DeepCollectionEquality().equals(other.filters, filters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      categoryName,
      categoryIcon,
      displayOrder,
      defaultFontColor,
      const DeepCollectionEquality().hash(filters));

  @override
  String toString() {
    return 'TemplateCategoriesModel(name: $name, categoryName: $categoryName, categoryIcon: $categoryIcon, displayOrder: $displayOrder, defaultFontColor: $defaultFontColor, filters: $filters)';
  }
}

/// @nodoc
abstract mixin class $TemplateCategoriesModelCopyWith<$Res> {
  factory $TemplateCategoriesModelCopyWith(TemplateCategoriesModel value,
          $Res Function(TemplateCategoriesModel) _then) =
      _$TemplateCategoriesModelCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_icon') String? categoryIcon,
      @JsonKey(name: 'display_order') int? displayOrder,
      @JsonKey(name: 'default_font_color') String? defaultFontColor,
      List<Filter> filters});
}

/// @nodoc
class _$TemplateCategoriesModelCopyWithImpl<$Res>
    implements $TemplateCategoriesModelCopyWith<$Res> {
  _$TemplateCategoriesModelCopyWithImpl(this._self, this._then);

  final TemplateCategoriesModel _self;
  final $Res Function(TemplateCategoriesModel) _then;

  /// Create a copy of TemplateCategoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? categoryName = freezed,
    Object? categoryIcon = freezed,
    Object? displayOrder = freezed,
    Object? defaultFontColor = freezed,
    Object? filters = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: freezed == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: freezed == categoryIcon
          ? _self.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      displayOrder: freezed == displayOrder
          ? _self.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      defaultFontColor: freezed == defaultFontColor
          ? _self.defaultFontColor
          : defaultFontColor // ignore: cast_nullable_to_non_nullable
              as String?,
      filters: null == filters
          ? _self.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<Filter>,
    ));
  }
}

/// Adds pattern-matching-related methods to [TemplateCategoriesModel].
extension TemplateCategoriesModelPatterns on TemplateCategoriesModel {
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
    TResult Function(_TemplateCategoriesModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TemplateCategoriesModel() when $default != null:
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
    TResult Function(_TemplateCategoriesModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateCategoriesModel():
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
    TResult? Function(_TemplateCategoriesModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateCategoriesModel() when $default != null:
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
            String name,
            @JsonKey(name: 'category_name') String? categoryName,
            @JsonKey(name: 'category_icon') String? categoryIcon,
            @JsonKey(name: 'display_order') int? displayOrder,
            @JsonKey(name: 'default_font_color') String? defaultFontColor,
            List<Filter> filters)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TemplateCategoriesModel() when $default != null:
        return $default(_that.name, _that.categoryName, _that.categoryIcon,
            _that.displayOrder, _that.defaultFontColor, _that.filters);
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
            String name,
            @JsonKey(name: 'category_name') String? categoryName,
            @JsonKey(name: 'category_icon') String? categoryIcon,
            @JsonKey(name: 'display_order') int? displayOrder,
            @JsonKey(name: 'default_font_color') String? defaultFontColor,
            List<Filter> filters)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateCategoriesModel():
        return $default(_that.name, _that.categoryName, _that.categoryIcon,
            _that.displayOrder, _that.defaultFontColor, _that.filters);
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
            String name,
            @JsonKey(name: 'category_name') String? categoryName,
            @JsonKey(name: 'category_icon') String? categoryIcon,
            @JsonKey(name: 'display_order') int? displayOrder,
            @JsonKey(name: 'default_font_color') String? defaultFontColor,
            List<Filter> filters)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateCategoriesModel() when $default != null:
        return $default(_that.name, _that.categoryName, _that.categoryIcon,
            _that.displayOrder, _that.defaultFontColor, _that.filters);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TemplateCategoriesModel implements TemplateCategoriesModel {
  const _TemplateCategoriesModel(
      {required this.name,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'category_icon') this.categoryIcon,
      @JsonKey(name: 'display_order') this.displayOrder,
      @JsonKey(name: 'default_font_color') this.defaultFontColor,
      final List<Filter> filters = const []})
      : _filters = filters;
  factory _TemplateCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateCategoriesModelFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  @JsonKey(name: 'category_icon')
  final String? categoryIcon;
  @override
  @JsonKey(name: 'display_order')
  final int? displayOrder;
  @override
  @JsonKey(name: 'default_font_color')
  final String? defaultFontColor;
  final List<Filter> _filters;
  @override
  @JsonKey()
  List<Filter> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  /// Create a copy of TemplateCategoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TemplateCategoriesModelCopyWith<_TemplateCategoriesModel> get copyWith =>
      __$TemplateCategoriesModelCopyWithImpl<_TemplateCategoriesModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateCategoriesModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TemplateCategoriesModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryIcon, categoryIcon) ||
                other.categoryIcon == categoryIcon) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.defaultFontColor, defaultFontColor) ||
                other.defaultFontColor == defaultFontColor) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      categoryName,
      categoryIcon,
      displayOrder,
      defaultFontColor,
      const DeepCollectionEquality().hash(_filters));

  @override
  String toString() {
    return 'TemplateCategoriesModel(name: $name, categoryName: $categoryName, categoryIcon: $categoryIcon, displayOrder: $displayOrder, defaultFontColor: $defaultFontColor, filters: $filters)';
  }
}

/// @nodoc
abstract mixin class _$TemplateCategoriesModelCopyWith<$Res>
    implements $TemplateCategoriesModelCopyWith<$Res> {
  factory _$TemplateCategoriesModelCopyWith(_TemplateCategoriesModel value,
          $Res Function(_TemplateCategoriesModel) _then) =
      __$TemplateCategoriesModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_icon') String? categoryIcon,
      @JsonKey(name: 'display_order') int? displayOrder,
      @JsonKey(name: 'default_font_color') String? defaultFontColor,
      List<Filter> filters});
}

/// @nodoc
class __$TemplateCategoriesModelCopyWithImpl<$Res>
    implements _$TemplateCategoriesModelCopyWith<$Res> {
  __$TemplateCategoriesModelCopyWithImpl(this._self, this._then);

  final _TemplateCategoriesModel _self;
  final $Res Function(_TemplateCategoriesModel) _then;

  /// Create a copy of TemplateCategoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? categoryName = freezed,
    Object? categoryIcon = freezed,
    Object? displayOrder = freezed,
    Object? defaultFontColor = freezed,
    Object? filters = null,
  }) {
    return _then(_TemplateCategoriesModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: freezed == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: freezed == categoryIcon
          ? _self.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      displayOrder: freezed == displayOrder
          ? _self.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      defaultFontColor: freezed == defaultFontColor
          ? _self.defaultFontColor
          : defaultFontColor // ignore: cast_nullable_to_non_nullable
              as String?,
      filters: null == filters
          ? _self._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<Filter>,
    ));
  }
}

/// @nodoc
mixin _$Filter {
  @JsonKey(name: 'filter_label')
  String get filterLabel;
  List<Option> get options;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilterCopyWith<Filter> get copyWith =>
      _$FilterCopyWithImpl<Filter>(this as Filter, _$identity);

  /// Serializes this Filter to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Filter &&
            (identical(other.filterLabel, filterLabel) ||
                other.filterLabel == filterLabel) &&
            const DeepCollectionEquality().equals(other.options, options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, filterLabel, const DeepCollectionEquality().hash(options));

  @override
  String toString() {
    return 'Filter(filterLabel: $filterLabel, options: $options)';
  }
}

/// @nodoc
abstract mixin class $FilterCopyWith<$Res> {
  factory $FilterCopyWith(Filter value, $Res Function(Filter) _then) =
      _$FilterCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'filter_label') String filterLabel,
      List<Option> options});
}

/// @nodoc
class _$FilterCopyWithImpl<$Res> implements $FilterCopyWith<$Res> {
  _$FilterCopyWithImpl(this._self, this._then);

  final Filter _self;
  final $Res Function(Filter) _then;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterLabel = null,
    Object? options = null,
  }) {
    return _then(_self.copyWith(
      filterLabel: null == filterLabel
          ? _self.filterLabel
          : filterLabel // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Filter].
extension FilterPatterns on Filter {
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
    TResult Function(_Filter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Filter() when $default != null:
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
    TResult Function(_Filter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Filter():
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
    TResult? Function(_Filter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Filter() when $default != null:
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
    TResult Function(@JsonKey(name: 'filter_label') String filterLabel,
            List<Option> options)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Filter() when $default != null:
        return $default(_that.filterLabel, _that.options);
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
    TResult Function(@JsonKey(name: 'filter_label') String filterLabel,
            List<Option> options)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Filter():
        return $default(_that.filterLabel, _that.options);
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
    TResult? Function(@JsonKey(name: 'filter_label') String filterLabel,
            List<Option> options)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Filter() when $default != null:
        return $default(_that.filterLabel, _that.options);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Filter implements Filter {
  const _Filter(
      {@JsonKey(name: 'filter_label') required this.filterLabel,
      final List<Option> options = const []})
      : _options = options;
  factory _Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  @override
  @JsonKey(name: 'filter_label')
  final String filterLabel;
  final List<Option> _options;
  @override
  @JsonKey()
  List<Option> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilterCopyWith<_Filter> get copyWith =>
      __$FilterCopyWithImpl<_Filter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FilterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Filter &&
            (identical(other.filterLabel, filterLabel) ||
                other.filterLabel == filterLabel) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, filterLabel, const DeepCollectionEquality().hash(_options));

  @override
  String toString() {
    return 'Filter(filterLabel: $filterLabel, options: $options)';
  }
}

/// @nodoc
abstract mixin class _$FilterCopyWith<$Res> implements $FilterCopyWith<$Res> {
  factory _$FilterCopyWith(_Filter value, $Res Function(_Filter) _then) =
      __$FilterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'filter_label') String filterLabel,
      List<Option> options});
}

/// @nodoc
class __$FilterCopyWithImpl<$Res> implements _$FilterCopyWith<$Res> {
  __$FilterCopyWithImpl(this._self, this._then);

  final _Filter _self;
  final $Res Function(_Filter) _then;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filterLabel = null,
    Object? options = null,
  }) {
    return _then(_Filter(
      filterLabel: null == filterLabel
          ? _self.filterLabel
          : filterLabel // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _self._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ));
  }
}

/// @nodoc
mixin _$Option {
  @JsonKey(name: 'option_value')
  String get optionValue;
  @JsonKey(name: 'option_label')
  String? get optionLabel;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OptionCopyWith<Option> get copyWith =>
      _$OptionCopyWithImpl<Option>(this as Option, _$identity);

  /// Serializes this Option to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Option &&
            (identical(other.optionValue, optionValue) ||
                other.optionValue == optionValue) &&
            (identical(other.optionLabel, optionLabel) ||
                other.optionLabel == optionLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, optionValue, optionLabel);

  @override
  String toString() {
    return 'Option(optionValue: $optionValue, optionLabel: $optionLabel)';
  }
}

/// @nodoc
abstract mixin class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) _then) =
      _$OptionCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'option_value') String optionValue,
      @JsonKey(name: 'option_label') String? optionLabel});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res> implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._self, this._then);

  final Option _self;
  final $Res Function(Option) _then;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionValue = null,
    Object? optionLabel = freezed,
  }) {
    return _then(_self.copyWith(
      optionValue: null == optionValue
          ? _self.optionValue
          : optionValue // ignore: cast_nullable_to_non_nullable
              as String,
      optionLabel: freezed == optionLabel
          ? _self.optionLabel
          : optionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Option].
extension OptionPatterns on Option {
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
    TResult Function(_Option value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Option() when $default != null:
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
    TResult Function(_Option value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Option():
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
    TResult? Function(_Option value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Option() when $default != null:
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
    TResult Function(@JsonKey(name: 'option_value') String optionValue,
            @JsonKey(name: 'option_label') String? optionLabel)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Option() when $default != null:
        return $default(_that.optionValue, _that.optionLabel);
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
    TResult Function(@JsonKey(name: 'option_value') String optionValue,
            @JsonKey(name: 'option_label') String? optionLabel)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Option():
        return $default(_that.optionValue, _that.optionLabel);
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
    TResult? Function(@JsonKey(name: 'option_value') String optionValue,
            @JsonKey(name: 'option_label') String? optionLabel)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Option() when $default != null:
        return $default(_that.optionValue, _that.optionLabel);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Option implements Option {
  const _Option(
      {@JsonKey(name: 'option_value') required this.optionValue,
      @JsonKey(name: 'option_label') this.optionLabel});
  factory _Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  @override
  @JsonKey(name: 'option_value')
  final String optionValue;
  @override
  @JsonKey(name: 'option_label')
  final String? optionLabel;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OptionCopyWith<_Option> get copyWith =>
      __$OptionCopyWithImpl<_Option>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OptionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Option &&
            (identical(other.optionValue, optionValue) ||
                other.optionValue == optionValue) &&
            (identical(other.optionLabel, optionLabel) ||
                other.optionLabel == optionLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, optionValue, optionLabel);

  @override
  String toString() {
    return 'Option(optionValue: $optionValue, optionLabel: $optionLabel)';
  }
}

/// @nodoc
abstract mixin class _$OptionCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$OptionCopyWith(_Option value, $Res Function(_Option) _then) =
      __$OptionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'option_value') String optionValue,
      @JsonKey(name: 'option_label') String? optionLabel});
}

/// @nodoc
class __$OptionCopyWithImpl<$Res> implements _$OptionCopyWith<$Res> {
  __$OptionCopyWithImpl(this._self, this._then);

  final _Option _self;
  final $Res Function(_Option) _then;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? optionValue = null,
    Object? optionLabel = freezed,
  }) {
    return _then(_Option(
      optionValue: null == optionValue
          ? _self.optionValue
          : optionValue // ignore: cast_nullable_to_non_nullable
              as String,
      optionLabel: freezed == optionLabel
          ? _self.optionLabel
          : optionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
