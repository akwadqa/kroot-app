// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_event_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateEventResponse {
  @JsonKey(name: 'event_id')
  String? get eventId;
  @JsonKey(name: 'occasion_id')
  String? get occasionId;
  String? get image;

  /// Create a copy of CreateEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateEventResponseCopyWith<CreateEventResponse> get copyWith =>
      _$CreateEventResponseCopyWithImpl<CreateEventResponse>(
          this as CreateEventResponse, _$identity);

  /// Serializes this CreateEventResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateEventResponse &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.occasionId, occasionId) ||
                other.occasionId == occasionId) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, occasionId, image);

  @override
  String toString() {
    return 'CreateEventResponse(eventId: $eventId, occasionId: $occasionId, image: $image)';
  }
}

/// @nodoc
abstract mixin class $CreateEventResponseCopyWith<$Res> {
  factory $CreateEventResponseCopyWith(
          CreateEventResponse value, $Res Function(CreateEventResponse) _then) =
      _$CreateEventResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String? eventId,
      @JsonKey(name: 'occasion_id') String? occasionId,
      String? image});
}

/// @nodoc
class _$CreateEventResponseCopyWithImpl<$Res>
    implements $CreateEventResponseCopyWith<$Res> {
  _$CreateEventResponseCopyWithImpl(this._self, this._then);

  final CreateEventResponse _self;
  final $Res Function(CreateEventResponse) _then;

  /// Create a copy of CreateEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = freezed,
    Object? occasionId = freezed,
    Object? image = freezed,
  }) {
    return _then(_self.copyWith(
      eventId: freezed == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      occasionId: freezed == occasionId
          ? _self.occasionId
          : occasionId // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateEventResponse].
extension CreateEventResponsePatterns on CreateEventResponse {
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
    TResult Function(_CreateEventResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateEventResponse() when $default != null:
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
    TResult Function(_CreateEventResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateEventResponse():
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
    TResult? Function(_CreateEventResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateEventResponse() when $default != null:
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
    TResult Function(@JsonKey(name: 'event_id') String? eventId,
            @JsonKey(name: 'occasion_id') String? occasionId, String? image)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateEventResponse() when $default != null:
        return $default(_that.eventId, _that.occasionId, _that.image);
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
    TResult Function(@JsonKey(name: 'event_id') String? eventId,
            @JsonKey(name: 'occasion_id') String? occasionId, String? image)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateEventResponse():
        return $default(_that.eventId, _that.occasionId, _that.image);
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
    TResult? Function(@JsonKey(name: 'event_id') String? eventId,
            @JsonKey(name: 'occasion_id') String? occasionId, String? image)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateEventResponse() when $default != null:
        return $default(_that.eventId, _that.occasionId, _that.image);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateEventResponse implements CreateEventResponse {
  const _CreateEventResponse(
      {@JsonKey(name: 'event_id') this.eventId,
      @JsonKey(name: 'occasion_id') this.occasionId,
      this.image});
  factory _CreateEventResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEventResponseFromJson(json);

  @override
  @JsonKey(name: 'event_id')
  final String? eventId;
  @override
  @JsonKey(name: 'occasion_id')
  final String? occasionId;
  @override
  final String? image;

  /// Create a copy of CreateEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateEventResponseCopyWith<_CreateEventResponse> get copyWith =>
      __$CreateEventResponseCopyWithImpl<_CreateEventResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateEventResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateEventResponse &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.occasionId, occasionId) ||
                other.occasionId == occasionId) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, occasionId, image);

  @override
  String toString() {
    return 'CreateEventResponse(eventId: $eventId, occasionId: $occasionId, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$CreateEventResponseCopyWith<$Res>
    implements $CreateEventResponseCopyWith<$Res> {
  factory _$CreateEventResponseCopyWith(_CreateEventResponse value,
          $Res Function(_CreateEventResponse) _then) =
      __$CreateEventResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String? eventId,
      @JsonKey(name: 'occasion_id') String? occasionId,
      String? image});
}

/// @nodoc
class __$CreateEventResponseCopyWithImpl<$Res>
    implements _$CreateEventResponseCopyWith<$Res> {
  __$CreateEventResponseCopyWithImpl(this._self, this._then);

  final _CreateEventResponse _self;
  final $Res Function(_CreateEventResponse) _then;

  /// Create a copy of CreateEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = freezed,
    Object? occasionId = freezed,
    Object? image = freezed,
  }) {
    return _then(_CreateEventResponse(
      eventId: freezed == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      occasionId: freezed == occasionId
          ? _self.occasionId
          : occasionId // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
