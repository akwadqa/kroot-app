// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_event_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfirmEventResponse {
  @JsonKey(name: 'occasion_id')
  String get occasionId;
  @JsonKey(name: 'recipient_list')
  String get recipientList;
  @JsonKey(name: 'bulk_message')
  String get bulkMessage;
  String get status;

  /// Create a copy of ConfirmEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfirmEventResponseCopyWith<ConfirmEventResponse> get copyWith =>
      _$ConfirmEventResponseCopyWithImpl<ConfirmEventResponse>(
          this as ConfirmEventResponse, _$identity);

  /// Serializes this ConfirmEventResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfirmEventResponse &&
            (identical(other.occasionId, occasionId) ||
                other.occasionId == occasionId) &&
            (identical(other.recipientList, recipientList) ||
                other.recipientList == recipientList) &&
            (identical(other.bulkMessage, bulkMessage) ||
                other.bulkMessage == bulkMessage) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, occasionId, recipientList, bulkMessage, status);

  @override
  String toString() {
    return 'ConfirmEventResponse(occasionId: $occasionId, recipientList: $recipientList, bulkMessage: $bulkMessage, status: $status)';
  }
}

/// @nodoc
abstract mixin class $ConfirmEventResponseCopyWith<$Res> {
  factory $ConfirmEventResponseCopyWith(ConfirmEventResponse value,
          $Res Function(ConfirmEventResponse) _then) =
      _$ConfirmEventResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'occasion_id') String occasionId,
      @JsonKey(name: 'recipient_list') String recipientList,
      @JsonKey(name: 'bulk_message') String bulkMessage,
      String status});
}

/// @nodoc
class _$ConfirmEventResponseCopyWithImpl<$Res>
    implements $ConfirmEventResponseCopyWith<$Res> {
  _$ConfirmEventResponseCopyWithImpl(this._self, this._then);

  final ConfirmEventResponse _self;
  final $Res Function(ConfirmEventResponse) _then;

  /// Create a copy of ConfirmEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? occasionId = null,
    Object? recipientList = null,
    Object? bulkMessage = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      occasionId: null == occasionId
          ? _self.occasionId
          : occasionId // ignore: cast_nullable_to_non_nullable
              as String,
      recipientList: null == recipientList
          ? _self.recipientList
          : recipientList // ignore: cast_nullable_to_non_nullable
              as String,
      bulkMessage: null == bulkMessage
          ? _self.bulkMessage
          : bulkMessage // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ConfirmEventResponse].
extension ConfirmEventResponsePatterns on ConfirmEventResponse {
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
    TResult Function(_ConfirmEventResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConfirmEventResponse() when $default != null:
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
    TResult Function(_ConfirmEventResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfirmEventResponse():
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
    TResult? Function(_ConfirmEventResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfirmEventResponse() when $default != null:
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
            @JsonKey(name: 'occasion_id') String occasionId,
            @JsonKey(name: 'recipient_list') String recipientList,
            @JsonKey(name: 'bulk_message') String bulkMessage,
            String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConfirmEventResponse() when $default != null:
        return $default(_that.occasionId, _that.recipientList,
            _that.bulkMessage, _that.status);
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
            @JsonKey(name: 'occasion_id') String occasionId,
            @JsonKey(name: 'recipient_list') String recipientList,
            @JsonKey(name: 'bulk_message') String bulkMessage,
            String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfirmEventResponse():
        return $default(_that.occasionId, _that.recipientList,
            _that.bulkMessage, _that.status);
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
            @JsonKey(name: 'occasion_id') String occasionId,
            @JsonKey(name: 'recipient_list') String recipientList,
            @JsonKey(name: 'bulk_message') String bulkMessage,
            String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfirmEventResponse() when $default != null:
        return $default(_that.occasionId, _that.recipientList,
            _that.bulkMessage, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ConfirmEventResponse implements ConfirmEventResponse {
  const _ConfirmEventResponse(
      {@JsonKey(name: 'occasion_id') required this.occasionId,
      @JsonKey(name: 'recipient_list') required this.recipientList,
      @JsonKey(name: 'bulk_message') required this.bulkMessage,
      required this.status});
  factory _ConfirmEventResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmEventResponseFromJson(json);

  @override
  @JsonKey(name: 'occasion_id')
  final String occasionId;
  @override
  @JsonKey(name: 'recipient_list')
  final String recipientList;
  @override
  @JsonKey(name: 'bulk_message')
  final String bulkMessage;
  @override
  final String status;

  /// Create a copy of ConfirmEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConfirmEventResponseCopyWith<_ConfirmEventResponse> get copyWith =>
      __$ConfirmEventResponseCopyWithImpl<_ConfirmEventResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConfirmEventResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConfirmEventResponse &&
            (identical(other.occasionId, occasionId) ||
                other.occasionId == occasionId) &&
            (identical(other.recipientList, recipientList) ||
                other.recipientList == recipientList) &&
            (identical(other.bulkMessage, bulkMessage) ||
                other.bulkMessage == bulkMessage) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, occasionId, recipientList, bulkMessage, status);

  @override
  String toString() {
    return 'ConfirmEventResponse(occasionId: $occasionId, recipientList: $recipientList, bulkMessage: $bulkMessage, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ConfirmEventResponseCopyWith<$Res>
    implements $ConfirmEventResponseCopyWith<$Res> {
  factory _$ConfirmEventResponseCopyWith(_ConfirmEventResponse value,
          $Res Function(_ConfirmEventResponse) _then) =
      __$ConfirmEventResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'occasion_id') String occasionId,
      @JsonKey(name: 'recipient_list') String recipientList,
      @JsonKey(name: 'bulk_message') String bulkMessage,
      String status});
}

/// @nodoc
class __$ConfirmEventResponseCopyWithImpl<$Res>
    implements _$ConfirmEventResponseCopyWith<$Res> {
  __$ConfirmEventResponseCopyWithImpl(this._self, this._then);

  final _ConfirmEventResponse _self;
  final $Res Function(_ConfirmEventResponse) _then;

  /// Create a copy of ConfirmEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? occasionId = null,
    Object? recipientList = null,
    Object? bulkMessage = null,
    Object? status = null,
  }) {
    return _then(_ConfirmEventResponse(
      occasionId: null == occasionId
          ? _self.occasionId
          : occasionId // ignore: cast_nullable_to_non_nullable
              as String,
      recipientList: null == recipientList
          ? _self.recipientList
          : recipientList // ignore: cast_nullable_to_non_nullable
              as String,
      bulkMessage: null == bulkMessage
          ? _self.bulkMessage
          : bulkMessage // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
