// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utils_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UtilsResponse {
  SubscriberModel? get subscriber;
  @JsonKey(name: 'event_types')
  List<String>? get eventTypes;
  @JsonKey(name: 'bundles')
  List<BundleModel>? get bundles;
  @JsonKey(name: 'invite_templates')
  List<TemplateModel>? get templates;
  @JsonKey(name: 'apple_review')
  int? get appleReview;

  /// Create a copy of UtilsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UtilsResponseCopyWith<UtilsResponse> get copyWith =>
      _$UtilsResponseCopyWithImpl<UtilsResponse>(
          this as UtilsResponse, _$identity);

  /// Serializes this UtilsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UtilsResponse &&
            (identical(other.subscriber, subscriber) ||
                other.subscriber == subscriber) &&
            const DeepCollectionEquality()
                .equals(other.eventTypes, eventTypes) &&
            const DeepCollectionEquality().equals(other.bundles, bundles) &&
            const DeepCollectionEquality().equals(other.templates, templates) &&
            (identical(other.appleReview, appleReview) ||
                other.appleReview == appleReview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      subscriber,
      const DeepCollectionEquality().hash(eventTypes),
      const DeepCollectionEquality().hash(bundles),
      const DeepCollectionEquality().hash(templates),
      appleReview);

  @override
  String toString() {
    return 'UtilsResponse(subscriber: $subscriber, eventTypes: $eventTypes, bundles: $bundles, templates: $templates, appleReview: $appleReview)';
  }
}

/// @nodoc
abstract mixin class $UtilsResponseCopyWith<$Res> {
  factory $UtilsResponseCopyWith(
          UtilsResponse value, $Res Function(UtilsResponse) _then) =
      _$UtilsResponseCopyWithImpl;
  @useResult
  $Res call(
      {SubscriberModel? subscriber,
      @JsonKey(name: 'event_types') List<String>? eventTypes,
      @JsonKey(name: 'bundles') List<BundleModel>? bundles,
      @JsonKey(name: 'invite_templates') List<TemplateModel>? templates,
      @JsonKey(name: 'apple_review') int? appleReview});

  $SubscriberModelCopyWith<$Res>? get subscriber;
}

/// @nodoc
class _$UtilsResponseCopyWithImpl<$Res>
    implements $UtilsResponseCopyWith<$Res> {
  _$UtilsResponseCopyWithImpl(this._self, this._then);

  final UtilsResponse _self;
  final $Res Function(UtilsResponse) _then;

  /// Create a copy of UtilsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriber = freezed,
    Object? eventTypes = freezed,
    Object? bundles = freezed,
    Object? templates = freezed,
    Object? appleReview = freezed,
  }) {
    return _then(_self.copyWith(
      subscriber: freezed == subscriber
          ? _self.subscriber
          : subscriber // ignore: cast_nullable_to_non_nullable
              as SubscriberModel?,
      eventTypes: freezed == eventTypes
          ? _self.eventTypes
          : eventTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      bundles: freezed == bundles
          ? _self.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<BundleModel>?,
      templates: freezed == templates
          ? _self.templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<TemplateModel>?,
      appleReview: freezed == appleReview
          ? _self.appleReview
          : appleReview // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of UtilsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriberModelCopyWith<$Res>? get subscriber {
    if (_self.subscriber == null) {
      return null;
    }

    return $SubscriberModelCopyWith<$Res>(_self.subscriber!, (value) {
      return _then(_self.copyWith(subscriber: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UtilsResponse].
extension UtilsResponsePatterns on UtilsResponse {
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
    TResult Function(_UtilsResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UtilsResponse() when $default != null:
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
    TResult Function(_UtilsResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UtilsResponse():
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
    TResult? Function(_UtilsResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UtilsResponse() when $default != null:
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
            SubscriberModel? subscriber,
            @JsonKey(name: 'event_types') List<String>? eventTypes,
            @JsonKey(name: 'bundles') List<BundleModel>? bundles,
            @JsonKey(name: 'invite_templates') List<TemplateModel>? templates,
            @JsonKey(name: 'apple_review') int? appleReview)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UtilsResponse() when $default != null:
        return $default(_that.subscriber, _that.eventTypes, _that.bundles,
            _that.templates, _that.appleReview);
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
            SubscriberModel? subscriber,
            @JsonKey(name: 'event_types') List<String>? eventTypes,
            @JsonKey(name: 'bundles') List<BundleModel>? bundles,
            @JsonKey(name: 'invite_templates') List<TemplateModel>? templates,
            @JsonKey(name: 'apple_review') int? appleReview)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UtilsResponse():
        return $default(_that.subscriber, _that.eventTypes, _that.bundles,
            _that.templates, _that.appleReview);
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
            SubscriberModel? subscriber,
            @JsonKey(name: 'event_types') List<String>? eventTypes,
            @JsonKey(name: 'bundles') List<BundleModel>? bundles,
            @JsonKey(name: 'invite_templates') List<TemplateModel>? templates,
            @JsonKey(name: 'apple_review') int? appleReview)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UtilsResponse() when $default != null:
        return $default(_that.subscriber, _that.eventTypes, _that.bundles,
            _that.templates, _that.appleReview);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UtilsResponse implements UtilsResponse {
  const _UtilsResponse(
      {this.subscriber,
      @JsonKey(name: 'event_types') final List<String>? eventTypes,
      @JsonKey(name: 'bundles') final List<BundleModel>? bundles,
      @JsonKey(name: 'invite_templates') final List<TemplateModel>? templates,
      @JsonKey(name: 'apple_review') this.appleReview})
      : _eventTypes = eventTypes,
        _bundles = bundles,
        _templates = templates;
  factory _UtilsResponse.fromJson(Map<String, dynamic> json) =>
      _$UtilsResponseFromJson(json);

  @override
  final SubscriberModel? subscriber;
  final List<String>? _eventTypes;
  @override
  @JsonKey(name: 'event_types')
  List<String>? get eventTypes {
    final value = _eventTypes;
    if (value == null) return null;
    if (_eventTypes is EqualUnmodifiableListView) return _eventTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BundleModel>? _bundles;
  @override
  @JsonKey(name: 'bundles')
  List<BundleModel>? get bundles {
    final value = _bundles;
    if (value == null) return null;
    if (_bundles is EqualUnmodifiableListView) return _bundles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TemplateModel>? _templates;
  @override
  @JsonKey(name: 'invite_templates')
  List<TemplateModel>? get templates {
    final value = _templates;
    if (value == null) return null;
    if (_templates is EqualUnmodifiableListView) return _templates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'apple_review')
  final int? appleReview;

  /// Create a copy of UtilsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UtilsResponseCopyWith<_UtilsResponse> get copyWith =>
      __$UtilsResponseCopyWithImpl<_UtilsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UtilsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UtilsResponse &&
            (identical(other.subscriber, subscriber) ||
                other.subscriber == subscriber) &&
            const DeepCollectionEquality()
                .equals(other._eventTypes, _eventTypes) &&
            const DeepCollectionEquality().equals(other._bundles, _bundles) &&
            const DeepCollectionEquality()
                .equals(other._templates, _templates) &&
            (identical(other.appleReview, appleReview) ||
                other.appleReview == appleReview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      subscriber,
      const DeepCollectionEquality().hash(_eventTypes),
      const DeepCollectionEquality().hash(_bundles),
      const DeepCollectionEquality().hash(_templates),
      appleReview);

  @override
  String toString() {
    return 'UtilsResponse(subscriber: $subscriber, eventTypes: $eventTypes, bundles: $bundles, templates: $templates, appleReview: $appleReview)';
  }
}

/// @nodoc
abstract mixin class _$UtilsResponseCopyWith<$Res>
    implements $UtilsResponseCopyWith<$Res> {
  factory _$UtilsResponseCopyWith(
          _UtilsResponse value, $Res Function(_UtilsResponse) _then) =
      __$UtilsResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SubscriberModel? subscriber,
      @JsonKey(name: 'event_types') List<String>? eventTypes,
      @JsonKey(name: 'bundles') List<BundleModel>? bundles,
      @JsonKey(name: 'invite_templates') List<TemplateModel>? templates,
      @JsonKey(name: 'apple_review') int? appleReview});

  @override
  $SubscriberModelCopyWith<$Res>? get subscriber;
}

/// @nodoc
class __$UtilsResponseCopyWithImpl<$Res>
    implements _$UtilsResponseCopyWith<$Res> {
  __$UtilsResponseCopyWithImpl(this._self, this._then);

  final _UtilsResponse _self;
  final $Res Function(_UtilsResponse) _then;

  /// Create a copy of UtilsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subscriber = freezed,
    Object? eventTypes = freezed,
    Object? bundles = freezed,
    Object? templates = freezed,
    Object? appleReview = freezed,
  }) {
    return _then(_UtilsResponse(
      subscriber: freezed == subscriber
          ? _self.subscriber
          : subscriber // ignore: cast_nullable_to_non_nullable
              as SubscriberModel?,
      eventTypes: freezed == eventTypes
          ? _self._eventTypes
          : eventTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      bundles: freezed == bundles
          ? _self._bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<BundleModel>?,
      templates: freezed == templates
          ? _self._templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<TemplateModel>?,
      appleReview: freezed == appleReview
          ? _self.appleReview
          : appleReview // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of UtilsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriberModelCopyWith<$Res>? get subscriber {
    if (_self.subscriber == null) {
      return null;
    }

    return $SubscriberModelCopyWith<$Res>(_self.subscriber!, (value) {
      return _then(_self.copyWith(subscriber: value));
    });
  }
}

/// @nodoc
mixin _$SubscriberModel {
  String? get name;
  String? get subscriber;
  @JsonKey(name: 'first_name')
  String? get firstName;
  @JsonKey(name: 'last_name')
  String? get lastName;
  String? get mobile;
  String? get email;
  @JsonKey(name: 'remaining_balance')
  int? get remainingBalance;

  /// Create a copy of SubscriberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriberModelCopyWith<SubscriberModel> get copyWith =>
      _$SubscriberModelCopyWithImpl<SubscriberModel>(
          this as SubscriberModel, _$identity);

  /// Serializes this SubscriberModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriberModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subscriber, subscriber) ||
                other.subscriber == subscriber) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.remainingBalance, remainingBalance) ||
                other.remainingBalance == remainingBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, subscriber, firstName,
      lastName, mobile, email, remainingBalance);

  @override
  String toString() {
    return 'SubscriberModel(name: $name, subscriber: $subscriber, firstName: $firstName, lastName: $lastName, mobile: $mobile, email: $email, remainingBalance: $remainingBalance)';
  }
}

/// @nodoc
abstract mixin class $SubscriberModelCopyWith<$Res> {
  factory $SubscriberModelCopyWith(
          SubscriberModel value, $Res Function(SubscriberModel) _then) =
      _$SubscriberModelCopyWithImpl;
  @useResult
  $Res call(
      {String? name,
      String? subscriber,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? mobile,
      String? email,
      @JsonKey(name: 'remaining_balance') int? remainingBalance});
}

/// @nodoc
class _$SubscriberModelCopyWithImpl<$Res>
    implements $SubscriberModelCopyWith<$Res> {
  _$SubscriberModelCopyWithImpl(this._self, this._then);

  final SubscriberModel _self;
  final $Res Function(SubscriberModel) _then;

  /// Create a copy of SubscriberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? subscriber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? remainingBalance = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriber: freezed == subscriber
          ? _self.subscriber
          : subscriber // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _self.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      remainingBalance: freezed == remainingBalance
          ? _self.remainingBalance
          : remainingBalance // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubscriberModel].
extension SubscriberModelPatterns on SubscriberModel {
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
    TResult Function(_SubscriberModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriberModel() when $default != null:
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
    TResult Function(_SubscriberModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriberModel():
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
    TResult? Function(_SubscriberModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriberModel() when $default != null:
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
            String? subscriber,
            @JsonKey(name: 'first_name') String? firstName,
            @JsonKey(name: 'last_name') String? lastName,
            String? mobile,
            String? email,
            @JsonKey(name: 'remaining_balance') int? remainingBalance)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriberModel() when $default != null:
        return $default(_that.name, _that.subscriber, _that.firstName,
            _that.lastName, _that.mobile, _that.email, _that.remainingBalance);
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
            String? subscriber,
            @JsonKey(name: 'first_name') String? firstName,
            @JsonKey(name: 'last_name') String? lastName,
            String? mobile,
            String? email,
            @JsonKey(name: 'remaining_balance') int? remainingBalance)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriberModel():
        return $default(_that.name, _that.subscriber, _that.firstName,
            _that.lastName, _that.mobile, _that.email, _that.remainingBalance);
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
            String? subscriber,
            @JsonKey(name: 'first_name') String? firstName,
            @JsonKey(name: 'last_name') String? lastName,
            String? mobile,
            String? email,
            @JsonKey(name: 'remaining_balance') int? remainingBalance)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriberModel() when $default != null:
        return $default(_that.name, _that.subscriber, _that.firstName,
            _that.lastName, _that.mobile, _that.email, _that.remainingBalance);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriberModel implements SubscriberModel {
  const _SubscriberModel(
      {this.name,
      this.subscriber,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.mobile,
      this.email,
      @JsonKey(name: 'remaining_balance') this.remainingBalance});
  factory _SubscriberModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriberModelFromJson(json);

  @override
  final String? name;
  @override
  final String? subscriber;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? mobile;
  @override
  final String? email;
  @override
  @JsonKey(name: 'remaining_balance')
  final int? remainingBalance;

  /// Create a copy of SubscriberModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriberModelCopyWith<_SubscriberModel> get copyWith =>
      __$SubscriberModelCopyWithImpl<_SubscriberModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriberModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriberModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subscriber, subscriber) ||
                other.subscriber == subscriber) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.remainingBalance, remainingBalance) ||
                other.remainingBalance == remainingBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, subscriber, firstName,
      lastName, mobile, email, remainingBalance);

  @override
  String toString() {
    return 'SubscriberModel(name: $name, subscriber: $subscriber, firstName: $firstName, lastName: $lastName, mobile: $mobile, email: $email, remainingBalance: $remainingBalance)';
  }
}

/// @nodoc
abstract mixin class _$SubscriberModelCopyWith<$Res>
    implements $SubscriberModelCopyWith<$Res> {
  factory _$SubscriberModelCopyWith(
          _SubscriberModel value, $Res Function(_SubscriberModel) _then) =
      __$SubscriberModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? name,
      String? subscriber,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? mobile,
      String? email,
      @JsonKey(name: 'remaining_balance') int? remainingBalance});
}

/// @nodoc
class __$SubscriberModelCopyWithImpl<$Res>
    implements _$SubscriberModelCopyWith<$Res> {
  __$SubscriberModelCopyWithImpl(this._self, this._then);

  final _SubscriberModel _self;
  final $Res Function(_SubscriberModel) _then;

  /// Create a copy of SubscriberModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? subscriber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? remainingBalance = freezed,
  }) {
    return _then(_SubscriberModel(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriber: freezed == subscriber
          ? _self.subscriber
          : subscriber // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _self.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      remainingBalance: freezed == remainingBalance
          ? _self.remainingBalance
          : remainingBalance // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$SubscriptionModel {
  String? get name;
  @JsonKey(name: 'subscription_name')
  String? get subscriptionName;
  @JsonKey(name: 'max_kroots')
  int? get maxKroots;
  @JsonKey(name: 'duration_in_days')
  int? get durationInDays;
  @JsonKey(name: 'csv_import')
  int? get csvImport;
  @JsonKey(name: 'premium_designs')
  int? get premiumDesigns;
  int? get operators;
  @JsonKey(name: 'sub_account')
  int? get subAccount;
  double? get price;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionModelCopyWith<SubscriptionModel> get copyWith =>
      _$SubscriptionModelCopyWithImpl<SubscriptionModel>(
          this as SubscriptionModel, _$identity);

  /// Serializes this SubscriptionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subscriptionName, subscriptionName) ||
                other.subscriptionName == subscriptionName) &&
            (identical(other.maxKroots, maxKroots) ||
                other.maxKroots == maxKroots) &&
            (identical(other.durationInDays, durationInDays) ||
                other.durationInDays == durationInDays) &&
            (identical(other.csvImport, csvImport) ||
                other.csvImport == csvImport) &&
            (identical(other.premiumDesigns, premiumDesigns) ||
                other.premiumDesigns == premiumDesigns) &&
            (identical(other.operators, operators) ||
                other.operators == operators) &&
            (identical(other.subAccount, subAccount) ||
                other.subAccount == subAccount) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      subscriptionName,
      maxKroots,
      durationInDays,
      csvImport,
      premiumDesigns,
      operators,
      subAccount,
      price);

  @override
  String toString() {
    return 'SubscriptionModel(name: $name, subscriptionName: $subscriptionName, maxKroots: $maxKroots, durationInDays: $durationInDays, csvImport: $csvImport, premiumDesigns: $premiumDesigns, operators: $operators, subAccount: $subAccount, price: $price)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionModelCopyWith<$Res> {
  factory $SubscriptionModelCopyWith(
          SubscriptionModel value, $Res Function(SubscriptionModel) _then) =
      _$SubscriptionModelCopyWithImpl;
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'subscription_name') String? subscriptionName,
      @JsonKey(name: 'max_kroots') int? maxKroots,
      @JsonKey(name: 'duration_in_days') int? durationInDays,
      @JsonKey(name: 'csv_import') int? csvImport,
      @JsonKey(name: 'premium_designs') int? premiumDesigns,
      int? operators,
      @JsonKey(name: 'sub_account') int? subAccount,
      double? price});
}

/// @nodoc
class _$SubscriptionModelCopyWithImpl<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  _$SubscriptionModelCopyWithImpl(this._self, this._then);

  final SubscriptionModel _self;
  final $Res Function(SubscriptionModel) _then;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? subscriptionName = freezed,
    Object? maxKroots = freezed,
    Object? durationInDays = freezed,
    Object? csvImport = freezed,
    Object? premiumDesigns = freezed,
    Object? operators = freezed,
    Object? subAccount = freezed,
    Object? price = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionName: freezed == subscriptionName
          ? _self.subscriptionName
          : subscriptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      maxKroots: freezed == maxKroots
          ? _self.maxKroots
          : maxKroots // ignore: cast_nullable_to_non_nullable
              as int?,
      durationInDays: freezed == durationInDays
          ? _self.durationInDays
          : durationInDays // ignore: cast_nullable_to_non_nullable
              as int?,
      csvImport: freezed == csvImport
          ? _self.csvImport
          : csvImport // ignore: cast_nullable_to_non_nullable
              as int?,
      premiumDesigns: freezed == premiumDesigns
          ? _self.premiumDesigns
          : premiumDesigns // ignore: cast_nullable_to_non_nullable
              as int?,
      operators: freezed == operators
          ? _self.operators
          : operators // ignore: cast_nullable_to_non_nullable
              as int?,
      subAccount: freezed == subAccount
          ? _self.subAccount
          : subAccount // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubscriptionModel].
extension SubscriptionModelPatterns on SubscriptionModel {
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
    TResult Function(_SubscriptionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionModel() when $default != null:
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
    TResult Function(_SubscriptionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionModel():
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
    TResult? Function(_SubscriptionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionModel() when $default != null:
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
            @JsonKey(name: 'subscription_name') String? subscriptionName,
            @JsonKey(name: 'max_kroots') int? maxKroots,
            @JsonKey(name: 'duration_in_days') int? durationInDays,
            @JsonKey(name: 'csv_import') int? csvImport,
            @JsonKey(name: 'premium_designs') int? premiumDesigns,
            int? operators,
            @JsonKey(name: 'sub_account') int? subAccount,
            double? price)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionModel() when $default != null:
        return $default(
            _that.name,
            _that.subscriptionName,
            _that.maxKroots,
            _that.durationInDays,
            _that.csvImport,
            _that.premiumDesigns,
            _that.operators,
            _that.subAccount,
            _that.price);
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
            @JsonKey(name: 'subscription_name') String? subscriptionName,
            @JsonKey(name: 'max_kroots') int? maxKroots,
            @JsonKey(name: 'duration_in_days') int? durationInDays,
            @JsonKey(name: 'csv_import') int? csvImport,
            @JsonKey(name: 'premium_designs') int? premiumDesigns,
            int? operators,
            @JsonKey(name: 'sub_account') int? subAccount,
            double? price)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionModel():
        return $default(
            _that.name,
            _that.subscriptionName,
            _that.maxKroots,
            _that.durationInDays,
            _that.csvImport,
            _that.premiumDesigns,
            _that.operators,
            _that.subAccount,
            _that.price);
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
            @JsonKey(name: 'subscription_name') String? subscriptionName,
            @JsonKey(name: 'max_kroots') int? maxKroots,
            @JsonKey(name: 'duration_in_days') int? durationInDays,
            @JsonKey(name: 'csv_import') int? csvImport,
            @JsonKey(name: 'premium_designs') int? premiumDesigns,
            int? operators,
            @JsonKey(name: 'sub_account') int? subAccount,
            double? price)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionModel() when $default != null:
        return $default(
            _that.name,
            _that.subscriptionName,
            _that.maxKroots,
            _that.durationInDays,
            _that.csvImport,
            _that.premiumDesigns,
            _that.operators,
            _that.subAccount,
            _that.price);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriptionModel implements SubscriptionModel {
  const _SubscriptionModel(
      {this.name,
      @JsonKey(name: 'subscription_name') this.subscriptionName,
      @JsonKey(name: 'max_kroots') this.maxKroots,
      @JsonKey(name: 'duration_in_days') this.durationInDays,
      @JsonKey(name: 'csv_import') this.csvImport,
      @JsonKey(name: 'premium_designs') this.premiumDesigns,
      this.operators,
      @JsonKey(name: 'sub_account') this.subAccount,
      this.price});
  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  @override
  final String? name;
  @override
  @JsonKey(name: 'subscription_name')
  final String? subscriptionName;
  @override
  @JsonKey(name: 'max_kroots')
  final int? maxKroots;
  @override
  @JsonKey(name: 'duration_in_days')
  final int? durationInDays;
  @override
  @JsonKey(name: 'csv_import')
  final int? csvImport;
  @override
  @JsonKey(name: 'premium_designs')
  final int? premiumDesigns;
  @override
  final int? operators;
  @override
  @JsonKey(name: 'sub_account')
  final int? subAccount;
  @override
  final double? price;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionModelCopyWith<_SubscriptionModel> get copyWith =>
      __$SubscriptionModelCopyWithImpl<_SubscriptionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriptionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subscriptionName, subscriptionName) ||
                other.subscriptionName == subscriptionName) &&
            (identical(other.maxKroots, maxKroots) ||
                other.maxKroots == maxKroots) &&
            (identical(other.durationInDays, durationInDays) ||
                other.durationInDays == durationInDays) &&
            (identical(other.csvImport, csvImport) ||
                other.csvImport == csvImport) &&
            (identical(other.premiumDesigns, premiumDesigns) ||
                other.premiumDesigns == premiumDesigns) &&
            (identical(other.operators, operators) ||
                other.operators == operators) &&
            (identical(other.subAccount, subAccount) ||
                other.subAccount == subAccount) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      subscriptionName,
      maxKroots,
      durationInDays,
      csvImport,
      premiumDesigns,
      operators,
      subAccount,
      price);

  @override
  String toString() {
    return 'SubscriptionModel(name: $name, subscriptionName: $subscriptionName, maxKroots: $maxKroots, durationInDays: $durationInDays, csvImport: $csvImport, premiumDesigns: $premiumDesigns, operators: $operators, subAccount: $subAccount, price: $price)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionModelCopyWith<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  factory _$SubscriptionModelCopyWith(
          _SubscriptionModel value, $Res Function(_SubscriptionModel) _then) =
      __$SubscriptionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'subscription_name') String? subscriptionName,
      @JsonKey(name: 'max_kroots') int? maxKroots,
      @JsonKey(name: 'duration_in_days') int? durationInDays,
      @JsonKey(name: 'csv_import') int? csvImport,
      @JsonKey(name: 'premium_designs') int? premiumDesigns,
      int? operators,
      @JsonKey(name: 'sub_account') int? subAccount,
      double? price});
}

/// @nodoc
class __$SubscriptionModelCopyWithImpl<$Res>
    implements _$SubscriptionModelCopyWith<$Res> {
  __$SubscriptionModelCopyWithImpl(this._self, this._then);

  final _SubscriptionModel _self;
  final $Res Function(_SubscriptionModel) _then;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? subscriptionName = freezed,
    Object? maxKroots = freezed,
    Object? durationInDays = freezed,
    Object? csvImport = freezed,
    Object? premiumDesigns = freezed,
    Object? operators = freezed,
    Object? subAccount = freezed,
    Object? price = freezed,
  }) {
    return _then(_SubscriptionModel(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionName: freezed == subscriptionName
          ? _self.subscriptionName
          : subscriptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      maxKroots: freezed == maxKroots
          ? _self.maxKroots
          : maxKroots // ignore: cast_nullable_to_non_nullable
              as int?,
      durationInDays: freezed == durationInDays
          ? _self.durationInDays
          : durationInDays // ignore: cast_nullable_to_non_nullable
              as int?,
      csvImport: freezed == csvImport
          ? _self.csvImport
          : csvImport // ignore: cast_nullable_to_non_nullable
              as int?,
      premiumDesigns: freezed == premiumDesigns
          ? _self.premiumDesigns
          : premiumDesigns // ignore: cast_nullable_to_non_nullable
              as int?,
      operators: freezed == operators
          ? _self.operators
          : operators // ignore: cast_nullable_to_non_nullable
              as int?,
      subAccount: freezed == subAccount
          ? _self.subAccount
          : subAccount // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$BundleModel {
  String? get name;
  double? get price;
  int? get amount;

  /// Create a copy of BundleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BundleModelCopyWith<BundleModel> get copyWith =>
      _$BundleModelCopyWithImpl<BundleModel>(this as BundleModel, _$identity);

  /// Serializes this BundleModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BundleModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, price, amount);

  @override
  String toString() {
    return 'BundleModel(name: $name, price: $price, amount: $amount)';
  }
}

/// @nodoc
abstract mixin class $BundleModelCopyWith<$Res> {
  factory $BundleModelCopyWith(
          BundleModel value, $Res Function(BundleModel) _then) =
      _$BundleModelCopyWithImpl;
  @useResult
  $Res call({String? name, double? price, int? amount});
}

/// @nodoc
class _$BundleModelCopyWithImpl<$Res> implements $BundleModelCopyWith<$Res> {
  _$BundleModelCopyWithImpl(this._self, this._then);

  final BundleModel _self;
  final $Res Function(BundleModel) _then;

  /// Create a copy of BundleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? amount = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BundleModel].
extension BundleModelPatterns on BundleModel {
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
    TResult Function(_BundleModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BundleModel() when $default != null:
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
    TResult Function(_BundleModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BundleModel():
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
    TResult? Function(_BundleModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BundleModel() when $default != null:
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
    TResult Function(String? name, double? price, int? amount)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BundleModel() when $default != null:
        return $default(_that.name, _that.price, _that.amount);
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
    TResult Function(String? name, double? price, int? amount) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BundleModel():
        return $default(_that.name, _that.price, _that.amount);
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
    TResult? Function(String? name, double? price, int? amount)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BundleModel() when $default != null:
        return $default(_that.name, _that.price, _that.amount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BundleModel implements BundleModel {
  const _BundleModel({this.name, this.price, this.amount});
  factory _BundleModel.fromJson(Map<String, dynamic> json) =>
      _$BundleModelFromJson(json);

  @override
  final String? name;
  @override
  final double? price;
  @override
  final int? amount;

  /// Create a copy of BundleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BundleModelCopyWith<_BundleModel> get copyWith =>
      __$BundleModelCopyWithImpl<_BundleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BundleModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BundleModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, price, amount);

  @override
  String toString() {
    return 'BundleModel(name: $name, price: $price, amount: $amount)';
  }
}

/// @nodoc
abstract mixin class _$BundleModelCopyWith<$Res>
    implements $BundleModelCopyWith<$Res> {
  factory _$BundleModelCopyWith(
          _BundleModel value, $Res Function(_BundleModel) _then) =
      __$BundleModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? name, double? price, int? amount});
}

/// @nodoc
class __$BundleModelCopyWithImpl<$Res> implements _$BundleModelCopyWith<$Res> {
  __$BundleModelCopyWithImpl(this._self, this._then);

  final _BundleModel _self;
  final $Res Function(_BundleModel) _then;

  /// Create a copy of BundleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? amount = freezed,
  }) {
    return _then(_BundleModel(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$TemplateModel {
  String? get name;
  String? get template;
  @JsonKey(name: 'sample_values')
  String? get sampleValues;
  @JsonKey(name: 'for_doctype')
  String? get forDoctype;
  @JsonKey(name: 'field_names')
  String? get fieldNames;
  String? get language;

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateModelCopyWith<TemplateModel> get copyWith =>
      _$TemplateModelCopyWithImpl<TemplateModel>(
          this as TemplateModel, _$identity);

  /// Serializes this TemplateModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TemplateModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.template, template) ||
                other.template == template) &&
            (identical(other.sampleValues, sampleValues) ||
                other.sampleValues == sampleValues) &&
            (identical(other.forDoctype, forDoctype) ||
                other.forDoctype == forDoctype) &&
            (identical(other.fieldNames, fieldNames) ||
                other.fieldNames == fieldNames) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, template, sampleValues,
      forDoctype, fieldNames, language);

  @override
  String toString() {
    return 'TemplateModel(name: $name, template: $template, sampleValues: $sampleValues, forDoctype: $forDoctype, fieldNames: $fieldNames, language: $language)';
  }
}

/// @nodoc
abstract mixin class $TemplateModelCopyWith<$Res> {
  factory $TemplateModelCopyWith(
          TemplateModel value, $Res Function(TemplateModel) _then) =
      _$TemplateModelCopyWithImpl;
  @useResult
  $Res call(
      {String? name,
      String? template,
      @JsonKey(name: 'sample_values') String? sampleValues,
      @JsonKey(name: 'for_doctype') String? forDoctype,
      @JsonKey(name: 'field_names') String? fieldNames,
      String? language});
}

/// @nodoc
class _$TemplateModelCopyWithImpl<$Res>
    implements $TemplateModelCopyWith<$Res> {
  _$TemplateModelCopyWithImpl(this._self, this._then);

  final TemplateModel _self;
  final $Res Function(TemplateModel) _then;

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? template = freezed,
    Object? sampleValues = freezed,
    Object? forDoctype = freezed,
    Object? fieldNames = freezed,
    Object? language = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _self.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
      sampleValues: freezed == sampleValues
          ? _self.sampleValues
          : sampleValues // ignore: cast_nullable_to_non_nullable
              as String?,
      forDoctype: freezed == forDoctype
          ? _self.forDoctype
          : forDoctype // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldNames: freezed == fieldNames
          ? _self.fieldNames
          : fieldNames // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TemplateModel].
extension TemplateModelPatterns on TemplateModel {
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
    TResult Function(_TemplateModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TemplateModel() when $default != null:
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
    TResult Function(_TemplateModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateModel():
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
    TResult? Function(_TemplateModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateModel() when $default != null:
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
            String? template,
            @JsonKey(name: 'sample_values') String? sampleValues,
            @JsonKey(name: 'for_doctype') String? forDoctype,
            @JsonKey(name: 'field_names') String? fieldNames,
            String? language)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TemplateModel() when $default != null:
        return $default(_that.name, _that.template, _that.sampleValues,
            _that.forDoctype, _that.fieldNames, _that.language);
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
            String? template,
            @JsonKey(name: 'sample_values') String? sampleValues,
            @JsonKey(name: 'for_doctype') String? forDoctype,
            @JsonKey(name: 'field_names') String? fieldNames,
            String? language)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateModel():
        return $default(_that.name, _that.template, _that.sampleValues,
            _that.forDoctype, _that.fieldNames, _that.language);
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
            String? template,
            @JsonKey(name: 'sample_values') String? sampleValues,
            @JsonKey(name: 'for_doctype') String? forDoctype,
            @JsonKey(name: 'field_names') String? fieldNames,
            String? language)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateModel() when $default != null:
        return $default(_that.name, _that.template, _that.sampleValues,
            _that.forDoctype, _that.fieldNames, _that.language);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TemplateModel implements TemplateModel {
  const _TemplateModel(
      {this.name,
      this.template,
      @JsonKey(name: 'sample_values') this.sampleValues,
      @JsonKey(name: 'for_doctype') this.forDoctype,
      @JsonKey(name: 'field_names') this.fieldNames,
      this.language});
  factory _TemplateModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateModelFromJson(json);

  @override
  final String? name;
  @override
  final String? template;
  @override
  @JsonKey(name: 'sample_values')
  final String? sampleValues;
  @override
  @JsonKey(name: 'for_doctype')
  final String? forDoctype;
  @override
  @JsonKey(name: 'field_names')
  final String? fieldNames;
  @override
  final String? language;

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TemplateModelCopyWith<_TemplateModel> get copyWith =>
      __$TemplateModelCopyWithImpl<_TemplateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TemplateModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.template, template) ||
                other.template == template) &&
            (identical(other.sampleValues, sampleValues) ||
                other.sampleValues == sampleValues) &&
            (identical(other.forDoctype, forDoctype) ||
                other.forDoctype == forDoctype) &&
            (identical(other.fieldNames, fieldNames) ||
                other.fieldNames == fieldNames) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, template, sampleValues,
      forDoctype, fieldNames, language);

  @override
  String toString() {
    return 'TemplateModel(name: $name, template: $template, sampleValues: $sampleValues, forDoctype: $forDoctype, fieldNames: $fieldNames, language: $language)';
  }
}

/// @nodoc
abstract mixin class _$TemplateModelCopyWith<$Res>
    implements $TemplateModelCopyWith<$Res> {
  factory _$TemplateModelCopyWith(
          _TemplateModel value, $Res Function(_TemplateModel) _then) =
      __$TemplateModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? name,
      String? template,
      @JsonKey(name: 'sample_values') String? sampleValues,
      @JsonKey(name: 'for_doctype') String? forDoctype,
      @JsonKey(name: 'field_names') String? fieldNames,
      String? language});
}

/// @nodoc
class __$TemplateModelCopyWithImpl<$Res>
    implements _$TemplateModelCopyWith<$Res> {
  __$TemplateModelCopyWithImpl(this._self, this._then);

  final _TemplateModel _self;
  final $Res Function(_TemplateModel) _then;

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? template = freezed,
    Object? sampleValues = freezed,
    Object? forDoctype = freezed,
    Object? fieldNames = freezed,
    Object? language = freezed,
  }) {
    return _then(_TemplateModel(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _self.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
      sampleValues: freezed == sampleValues
          ? _self.sampleValues
          : sampleValues // ignore: cast_nullable_to_non_nullable
              as String?,
      forDoctype: freezed == forDoctype
          ? _self.forDoctype
          : forDoctype // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldNames: freezed == fieldNames
          ? _self.fieldNames
          : fieldNames // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
