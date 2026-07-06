// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvitationTemplateModel {
  String get name;
  num get price;
  @JsonKey(name: 'template_name')
  String get templateName;
  @JsonKey(name: 'sample_image')
  String get sampleImage;

  /// Create a copy of InvitationTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvitationTemplateModelCopyWith<InvitationTemplateModel> get copyWith =>
      _$InvitationTemplateModelCopyWithImpl<InvitationTemplateModel>(
          this as InvitationTemplateModel, _$identity);

  /// Serializes this InvitationTemplateModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvitationTemplateModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.templateName, templateName) ||
                other.templateName == templateName) &&
            (identical(other.sampleImage, sampleImage) ||
                other.sampleImage == sampleImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, price, templateName, sampleImage);

  @override
  String toString() {
    return 'InvitationTemplateModel(name: $name, price: $price, templateName: $templateName, sampleImage: $sampleImage)';
  }
}

/// @nodoc
abstract mixin class $InvitationTemplateModelCopyWith<$Res> {
  factory $InvitationTemplateModelCopyWith(InvitationTemplateModel value,
          $Res Function(InvitationTemplateModel) _then) =
      _$InvitationTemplateModelCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      num price,
      @JsonKey(name: 'template_name') String templateName,
      @JsonKey(name: 'sample_image') String sampleImage});
}

/// @nodoc
class _$InvitationTemplateModelCopyWithImpl<$Res>
    implements $InvitationTemplateModelCopyWith<$Res> {
  _$InvitationTemplateModelCopyWithImpl(this._self, this._then);

  final InvitationTemplateModel _self;
  final $Res Function(InvitationTemplateModel) _then;

  /// Create a copy of InvitationTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? templateName = null,
    Object? sampleImage = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      templateName: null == templateName
          ? _self.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      sampleImage: null == sampleImage
          ? _self.sampleImage
          : sampleImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [InvitationTemplateModel].
extension InvitationTemplateModelPatterns on InvitationTemplateModel {
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
    TResult Function(_InvitationTemplateModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitationTemplateModel() when $default != null:
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
    TResult Function(_InvitationTemplateModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitationTemplateModel():
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
    TResult? Function(_InvitationTemplateModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitationTemplateModel() when $default != null:
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
            num price,
            @JsonKey(name: 'template_name') String templateName,
            @JsonKey(name: 'sample_image') String sampleImage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitationTemplateModel() when $default != null:
        return $default(
            _that.name, _that.price, _that.templateName, _that.sampleImage);
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
            num price,
            @JsonKey(name: 'template_name') String templateName,
            @JsonKey(name: 'sample_image') String sampleImage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitationTemplateModel():
        return $default(
            _that.name, _that.price, _that.templateName, _that.sampleImage);
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
            num price,
            @JsonKey(name: 'template_name') String templateName,
            @JsonKey(name: 'sample_image') String sampleImage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitationTemplateModel() when $default != null:
        return $default(
            _that.name, _that.price, _that.templateName, _that.sampleImage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InvitationTemplateModel implements InvitationTemplateModel {
  const _InvitationTemplateModel(
      {required this.name,
      required this.price,
      @JsonKey(name: 'template_name') required this.templateName,
      @JsonKey(name: 'sample_image') required this.sampleImage});
  factory _InvitationTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$InvitationTemplateModelFromJson(json);

  @override
  final String name;
  @override
  final num price;
  @override
  @JsonKey(name: 'template_name')
  final String templateName;
  @override
  @JsonKey(name: 'sample_image')
  final String sampleImage;

  /// Create a copy of InvitationTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvitationTemplateModelCopyWith<_InvitationTemplateModel> get copyWith =>
      __$InvitationTemplateModelCopyWithImpl<_InvitationTemplateModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InvitationTemplateModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvitationTemplateModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.templateName, templateName) ||
                other.templateName == templateName) &&
            (identical(other.sampleImage, sampleImage) ||
                other.sampleImage == sampleImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, price, templateName, sampleImage);

  @override
  String toString() {
    return 'InvitationTemplateModel(name: $name, price: $price, templateName: $templateName, sampleImage: $sampleImage)';
  }
}

/// @nodoc
abstract mixin class _$InvitationTemplateModelCopyWith<$Res>
    implements $InvitationTemplateModelCopyWith<$Res> {
  factory _$InvitationTemplateModelCopyWith(_InvitationTemplateModel value,
          $Res Function(_InvitationTemplateModel) _then) =
      __$InvitationTemplateModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      num price,
      @JsonKey(name: 'template_name') String templateName,
      @JsonKey(name: 'sample_image') String sampleImage});
}

/// @nodoc
class __$InvitationTemplateModelCopyWithImpl<$Res>
    implements _$InvitationTemplateModelCopyWith<$Res> {
  __$InvitationTemplateModelCopyWithImpl(this._self, this._then);

  final _InvitationTemplateModel _self;
  final $Res Function(_InvitationTemplateModel) _then;

  /// Create a copy of InvitationTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? templateName = null,
    Object? sampleImage = null,
  }) {
    return _then(_InvitationTemplateModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      templateName: null == templateName
          ? _self.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      sampleImage: null == sampleImage
          ? _self.sampleImage
          : sampleImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
