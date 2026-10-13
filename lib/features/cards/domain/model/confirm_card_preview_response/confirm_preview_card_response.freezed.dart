// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_preview_card_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfirmPreviewCardResponse {
  String get name;
  @JsonKey(name: 'final_image')
  String get finalImage;
  num? get amount;
  String? get category;
  @JsonKey(name: 'invitation_template')
  String? get invitationTemplate;

  /// Create a copy of ConfirmPreviewCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfirmPreviewCardResponseCopyWith<ConfirmPreviewCardResponse>
      get copyWith =>
          _$ConfirmPreviewCardResponseCopyWithImpl<ConfirmPreviewCardResponse>(
              this as ConfirmPreviewCardResponse, _$identity);

  /// Serializes this ConfirmPreviewCardResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfirmPreviewCardResponse &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.finalImage, finalImage) ||
                other.finalImage == finalImage) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.invitationTemplate, invitationTemplate) ||
                other.invitationTemplate == invitationTemplate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, finalImage, amount, category, invitationTemplate);

  @override
  String toString() {
    return 'ConfirmPreviewCardResponse(name: $name, finalImage: $finalImage, amount: $amount, category: $category, invitationTemplate: $invitationTemplate)';
  }
}

/// @nodoc
abstract mixin class $ConfirmPreviewCardResponseCopyWith<$Res> {
  factory $ConfirmPreviewCardResponseCopyWith(ConfirmPreviewCardResponse value,
          $Res Function(ConfirmPreviewCardResponse) _then) =
      _$ConfirmPreviewCardResponseCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'final_image') String finalImage,
      num? amount,
      String? category,
      @JsonKey(name: 'invitation_template') String? invitationTemplate});
}

/// @nodoc
class _$ConfirmPreviewCardResponseCopyWithImpl<$Res>
    implements $ConfirmPreviewCardResponseCopyWith<$Res> {
  _$ConfirmPreviewCardResponseCopyWithImpl(this._self, this._then);

  final ConfirmPreviewCardResponse _self;
  final $Res Function(ConfirmPreviewCardResponse) _then;

  /// Create a copy of ConfirmPreviewCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? finalImage = null,
    Object? amount = freezed,
    Object? category = freezed,
    Object? invitationTemplate = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      finalImage: null == finalImage
          ? _self.finalImage
          : finalImage // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      invitationTemplate: freezed == invitationTemplate
          ? _self.invitationTemplate
          : invitationTemplate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ConfirmPreviewCardResponse].
extension ConfirmPreviewCardResponsePatterns on ConfirmPreviewCardResponse {
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
    TResult Function(_ConfirmPreviewCardResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConfirmPreviewCardResponse() when $default != null:
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
    TResult Function(_ConfirmPreviewCardResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfirmPreviewCardResponse():
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
    TResult? Function(_ConfirmPreviewCardResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfirmPreviewCardResponse() when $default != null:
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
            @JsonKey(name: 'final_image') String finalImage,
            num? amount,
            String? category,
            @JsonKey(name: 'invitation_template') String? invitationTemplate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConfirmPreviewCardResponse() when $default != null:
        return $default(_that.name, _that.finalImage, _that.amount,
            _that.category, _that.invitationTemplate);
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
            @JsonKey(name: 'final_image') String finalImage,
            num? amount,
            String? category,
            @JsonKey(name: 'invitation_template') String? invitationTemplate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfirmPreviewCardResponse():
        return $default(_that.name, _that.finalImage, _that.amount,
            _that.category, _that.invitationTemplate);
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
            @JsonKey(name: 'final_image') String finalImage,
            num? amount,
            String? category,
            @JsonKey(name: 'invitation_template') String? invitationTemplate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfirmPreviewCardResponse() when $default != null:
        return $default(_that.name, _that.finalImage, _that.amount,
            _that.category, _that.invitationTemplate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ConfirmPreviewCardResponse implements ConfirmPreviewCardResponse {
  const _ConfirmPreviewCardResponse(
      {required this.name,
      @JsonKey(name: 'final_image') required this.finalImage,
      this.amount,
      this.category,
      @JsonKey(name: 'invitation_template') this.invitationTemplate});
  factory _ConfirmPreviewCardResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmPreviewCardResponseFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'final_image')
  final String finalImage;
  @override
  final num? amount;
  @override
  final String? category;
  @override
  @JsonKey(name: 'invitation_template')
  final String? invitationTemplate;

  /// Create a copy of ConfirmPreviewCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConfirmPreviewCardResponseCopyWith<_ConfirmPreviewCardResponse>
      get copyWith => __$ConfirmPreviewCardResponseCopyWithImpl<
          _ConfirmPreviewCardResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConfirmPreviewCardResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConfirmPreviewCardResponse &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.finalImage, finalImage) ||
                other.finalImage == finalImage) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.invitationTemplate, invitationTemplate) ||
                other.invitationTemplate == invitationTemplate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, finalImage, amount, category, invitationTemplate);

  @override
  String toString() {
    return 'ConfirmPreviewCardResponse(name: $name, finalImage: $finalImage, amount: $amount, category: $category, invitationTemplate: $invitationTemplate)';
  }
}

/// @nodoc
abstract mixin class _$ConfirmPreviewCardResponseCopyWith<$Res>
    implements $ConfirmPreviewCardResponseCopyWith<$Res> {
  factory _$ConfirmPreviewCardResponseCopyWith(
          _ConfirmPreviewCardResponse value,
          $Res Function(_ConfirmPreviewCardResponse) _then) =
      __$ConfirmPreviewCardResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'final_image') String finalImage,
      num? amount,
      String? category,
      @JsonKey(name: 'invitation_template') String? invitationTemplate});
}

/// @nodoc
class __$ConfirmPreviewCardResponseCopyWithImpl<$Res>
    implements _$ConfirmPreviewCardResponseCopyWith<$Res> {
  __$ConfirmPreviewCardResponseCopyWithImpl(this._self, this._then);

  final _ConfirmPreviewCardResponse _self;
  final $Res Function(_ConfirmPreviewCardResponse) _then;

  /// Create a copy of ConfirmPreviewCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? finalImage = null,
    Object? amount = freezed,
    Object? category = freezed,
    Object? invitationTemplate = freezed,
  }) {
    return _then(_ConfirmPreviewCardResponse(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      finalImage: null == finalImage
          ? _self.finalImage
          : finalImage // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      invitationTemplate: freezed == invitationTemplate
          ? _self.invitationTemplate
          : invitationTemplate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
