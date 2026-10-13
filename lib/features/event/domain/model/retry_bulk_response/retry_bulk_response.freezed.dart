// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'retry_bulk_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RetryBulkResponse {
  @JsonKey(name: 'occasion_id')
  String get occasionId;
  @JsonKey(name: 'total_bulk_messages')
  int get totalBulkMessages;
  @JsonKey(name: 'retried_count')
  int get retriedCount;
  @JsonKey(name: 'failed_count')
  int get failedCount;
  @JsonKey(name: 'failed_bulk_messages')
  List<String> get failedBulkMessages;
  List<RetriedBulkMessage> get retried;

  /// Create a copy of RetryBulkResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RetryBulkResponseCopyWith<RetryBulkResponse> get copyWith =>
      _$RetryBulkResponseCopyWithImpl<RetryBulkResponse>(
          this as RetryBulkResponse, _$identity);

  /// Serializes this RetryBulkResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RetryBulkResponse &&
            (identical(other.occasionId, occasionId) ||
                other.occasionId == occasionId) &&
            (identical(other.totalBulkMessages, totalBulkMessages) ||
                other.totalBulkMessages == totalBulkMessages) &&
            (identical(other.retriedCount, retriedCount) ||
                other.retriedCount == retriedCount) &&
            (identical(other.failedCount, failedCount) ||
                other.failedCount == failedCount) &&
            const DeepCollectionEquality()
                .equals(other.failedBulkMessages, failedBulkMessages) &&
            const DeepCollectionEquality().equals(other.retried, retried));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      occasionId,
      totalBulkMessages,
      retriedCount,
      failedCount,
      const DeepCollectionEquality().hash(failedBulkMessages),
      const DeepCollectionEquality().hash(retried));

  @override
  String toString() {
    return 'RetryBulkResponse(occasionId: $occasionId, totalBulkMessages: $totalBulkMessages, retriedCount: $retriedCount, failedCount: $failedCount, failedBulkMessages: $failedBulkMessages, retried: $retried)';
  }
}

/// @nodoc
abstract mixin class $RetryBulkResponseCopyWith<$Res> {
  factory $RetryBulkResponseCopyWith(
          RetryBulkResponse value, $Res Function(RetryBulkResponse) _then) =
      _$RetryBulkResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'occasion_id') String occasionId,
      @JsonKey(name: 'total_bulk_messages') int totalBulkMessages,
      @JsonKey(name: 'retried_count') int retriedCount,
      @JsonKey(name: 'failed_count') int failedCount,
      @JsonKey(name: 'failed_bulk_messages') List<String> failedBulkMessages,
      List<RetriedBulkMessage> retried});
}

/// @nodoc
class _$RetryBulkResponseCopyWithImpl<$Res>
    implements $RetryBulkResponseCopyWith<$Res> {
  _$RetryBulkResponseCopyWithImpl(this._self, this._then);

  final RetryBulkResponse _self;
  final $Res Function(RetryBulkResponse) _then;

  /// Create a copy of RetryBulkResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? occasionId = null,
    Object? totalBulkMessages = null,
    Object? retriedCount = null,
    Object? failedCount = null,
    Object? failedBulkMessages = null,
    Object? retried = null,
  }) {
    return _then(_self.copyWith(
      occasionId: null == occasionId
          ? _self.occasionId
          : occasionId // ignore: cast_nullable_to_non_nullable
              as String,
      totalBulkMessages: null == totalBulkMessages
          ? _self.totalBulkMessages
          : totalBulkMessages // ignore: cast_nullable_to_non_nullable
              as int,
      retriedCount: null == retriedCount
          ? _self.retriedCount
          : retriedCount // ignore: cast_nullable_to_non_nullable
              as int,
      failedCount: null == failedCount
          ? _self.failedCount
          : failedCount // ignore: cast_nullable_to_non_nullable
              as int,
      failedBulkMessages: null == failedBulkMessages
          ? _self.failedBulkMessages
          : failedBulkMessages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      retried: null == retried
          ? _self.retried
          : retried // ignore: cast_nullable_to_non_nullable
              as List<RetriedBulkMessage>,
    ));
  }
}

/// Adds pattern-matching-related methods to [RetryBulkResponse].
extension RetryBulkResponsePatterns on RetryBulkResponse {
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
    TResult Function(_RetryBulkResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RetryBulkResponse() when $default != null:
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
    TResult Function(_RetryBulkResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RetryBulkResponse():
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
    TResult? Function(_RetryBulkResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RetryBulkResponse() when $default != null:
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
            @JsonKey(name: 'total_bulk_messages') int totalBulkMessages,
            @JsonKey(name: 'retried_count') int retriedCount,
            @JsonKey(name: 'failed_count') int failedCount,
            @JsonKey(name: 'failed_bulk_messages')
            List<String> failedBulkMessages,
            List<RetriedBulkMessage> retried)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RetryBulkResponse() when $default != null:
        return $default(
            _that.occasionId,
            _that.totalBulkMessages,
            _that.retriedCount,
            _that.failedCount,
            _that.failedBulkMessages,
            _that.retried);
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
            @JsonKey(name: 'total_bulk_messages') int totalBulkMessages,
            @JsonKey(name: 'retried_count') int retriedCount,
            @JsonKey(name: 'failed_count') int failedCount,
            @JsonKey(name: 'failed_bulk_messages')
            List<String> failedBulkMessages,
            List<RetriedBulkMessage> retried)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RetryBulkResponse():
        return $default(
            _that.occasionId,
            _that.totalBulkMessages,
            _that.retriedCount,
            _that.failedCount,
            _that.failedBulkMessages,
            _that.retried);
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
            @JsonKey(name: 'total_bulk_messages') int totalBulkMessages,
            @JsonKey(name: 'retried_count') int retriedCount,
            @JsonKey(name: 'failed_count') int failedCount,
            @JsonKey(name: 'failed_bulk_messages')
            List<String> failedBulkMessages,
            List<RetriedBulkMessage> retried)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RetryBulkResponse() when $default != null:
        return $default(
            _that.occasionId,
            _that.totalBulkMessages,
            _that.retriedCount,
            _that.failedCount,
            _that.failedBulkMessages,
            _that.retried);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RetryBulkResponse implements RetryBulkResponse {
  const _RetryBulkResponse(
      {@JsonKey(name: 'occasion_id') required this.occasionId,
      @JsonKey(name: 'total_bulk_messages') required this.totalBulkMessages,
      @JsonKey(name: 'retried_count') required this.retriedCount,
      @JsonKey(name: 'failed_count') required this.failedCount,
      @JsonKey(name: 'failed_bulk_messages')
      required final List<String> failedBulkMessages,
      required final List<RetriedBulkMessage> retried})
      : _failedBulkMessages = failedBulkMessages,
        _retried = retried;
  factory _RetryBulkResponse.fromJson(Map<String, dynamic> json) =>
      _$RetryBulkResponseFromJson(json);

  @override
  @JsonKey(name: 'occasion_id')
  final String occasionId;
  @override
  @JsonKey(name: 'total_bulk_messages')
  final int totalBulkMessages;
  @override
  @JsonKey(name: 'retried_count')
  final int retriedCount;
  @override
  @JsonKey(name: 'failed_count')
  final int failedCount;
  final List<String> _failedBulkMessages;
  @override
  @JsonKey(name: 'failed_bulk_messages')
  List<String> get failedBulkMessages {
    if (_failedBulkMessages is EqualUnmodifiableListView)
      return _failedBulkMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_failedBulkMessages);
  }

  final List<RetriedBulkMessage> _retried;
  @override
  List<RetriedBulkMessage> get retried {
    if (_retried is EqualUnmodifiableListView) return _retried;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_retried);
  }

  /// Create a copy of RetryBulkResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RetryBulkResponseCopyWith<_RetryBulkResponse> get copyWith =>
      __$RetryBulkResponseCopyWithImpl<_RetryBulkResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RetryBulkResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RetryBulkResponse &&
            (identical(other.occasionId, occasionId) ||
                other.occasionId == occasionId) &&
            (identical(other.totalBulkMessages, totalBulkMessages) ||
                other.totalBulkMessages == totalBulkMessages) &&
            (identical(other.retriedCount, retriedCount) ||
                other.retriedCount == retriedCount) &&
            (identical(other.failedCount, failedCount) ||
                other.failedCount == failedCount) &&
            const DeepCollectionEquality()
                .equals(other._failedBulkMessages, _failedBulkMessages) &&
            const DeepCollectionEquality().equals(other._retried, _retried));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      occasionId,
      totalBulkMessages,
      retriedCount,
      failedCount,
      const DeepCollectionEquality().hash(_failedBulkMessages),
      const DeepCollectionEquality().hash(_retried));

  @override
  String toString() {
    return 'RetryBulkResponse(occasionId: $occasionId, totalBulkMessages: $totalBulkMessages, retriedCount: $retriedCount, failedCount: $failedCount, failedBulkMessages: $failedBulkMessages, retried: $retried)';
  }
}

/// @nodoc
abstract mixin class _$RetryBulkResponseCopyWith<$Res>
    implements $RetryBulkResponseCopyWith<$Res> {
  factory _$RetryBulkResponseCopyWith(
          _RetryBulkResponse value, $Res Function(_RetryBulkResponse) _then) =
      __$RetryBulkResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'occasion_id') String occasionId,
      @JsonKey(name: 'total_bulk_messages') int totalBulkMessages,
      @JsonKey(name: 'retried_count') int retriedCount,
      @JsonKey(name: 'failed_count') int failedCount,
      @JsonKey(name: 'failed_bulk_messages') List<String> failedBulkMessages,
      List<RetriedBulkMessage> retried});
}

/// @nodoc
class __$RetryBulkResponseCopyWithImpl<$Res>
    implements _$RetryBulkResponseCopyWith<$Res> {
  __$RetryBulkResponseCopyWithImpl(this._self, this._then);

  final _RetryBulkResponse _self;
  final $Res Function(_RetryBulkResponse) _then;

  /// Create a copy of RetryBulkResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? occasionId = null,
    Object? totalBulkMessages = null,
    Object? retriedCount = null,
    Object? failedCount = null,
    Object? failedBulkMessages = null,
    Object? retried = null,
  }) {
    return _then(_RetryBulkResponse(
      occasionId: null == occasionId
          ? _self.occasionId
          : occasionId // ignore: cast_nullable_to_non_nullable
              as String,
      totalBulkMessages: null == totalBulkMessages
          ? _self.totalBulkMessages
          : totalBulkMessages // ignore: cast_nullable_to_non_nullable
              as int,
      retriedCount: null == retriedCount
          ? _self.retriedCount
          : retriedCount // ignore: cast_nullable_to_non_nullable
              as int,
      failedCount: null == failedCount
          ? _self.failedCount
          : failedCount // ignore: cast_nullable_to_non_nullable
              as int,
      failedBulkMessages: null == failedBulkMessages
          ? _self._failedBulkMessages
          : failedBulkMessages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      retried: null == retried
          ? _self._retried
          : retried // ignore: cast_nullable_to_non_nullable
              as List<RetriedBulkMessage>,
    ));
  }
}

/// @nodoc
mixin _$RetriedBulkMessage {
  @JsonKey(name: 'bulk_message')
  String get bulkMessage;
  bool get result;

  /// Create a copy of RetriedBulkMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RetriedBulkMessageCopyWith<RetriedBulkMessage> get copyWith =>
      _$RetriedBulkMessageCopyWithImpl<RetriedBulkMessage>(
          this as RetriedBulkMessage, _$identity);

  /// Serializes this RetriedBulkMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RetriedBulkMessage &&
            (identical(other.bulkMessage, bulkMessage) ||
                other.bulkMessage == bulkMessage) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bulkMessage, result);

  @override
  String toString() {
    return 'RetriedBulkMessage(bulkMessage: $bulkMessage, result: $result)';
  }
}

/// @nodoc
abstract mixin class $RetriedBulkMessageCopyWith<$Res> {
  factory $RetriedBulkMessageCopyWith(
          RetriedBulkMessage value, $Res Function(RetriedBulkMessage) _then) =
      _$RetriedBulkMessageCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'bulk_message') String bulkMessage, bool result});
}

/// @nodoc
class _$RetriedBulkMessageCopyWithImpl<$Res>
    implements $RetriedBulkMessageCopyWith<$Res> {
  _$RetriedBulkMessageCopyWithImpl(this._self, this._then);

  final RetriedBulkMessage _self;
  final $Res Function(RetriedBulkMessage) _then;

  /// Create a copy of RetriedBulkMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bulkMessage = null,
    Object? result = null,
  }) {
    return _then(_self.copyWith(
      bulkMessage: null == bulkMessage
          ? _self.bulkMessage
          : bulkMessage // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [RetriedBulkMessage].
extension RetriedBulkMessagePatterns on RetriedBulkMessage {
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
    TResult Function(_RetriedBulkMessage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RetriedBulkMessage() when $default != null:
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
    TResult Function(_RetriedBulkMessage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RetriedBulkMessage():
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
    TResult? Function(_RetriedBulkMessage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RetriedBulkMessage() when $default != null:
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
            @JsonKey(name: 'bulk_message') String bulkMessage, bool result)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RetriedBulkMessage() when $default != null:
        return $default(_that.bulkMessage, _that.result);
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
            @JsonKey(name: 'bulk_message') String bulkMessage, bool result)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RetriedBulkMessage():
        return $default(_that.bulkMessage, _that.result);
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
            @JsonKey(name: 'bulk_message') String bulkMessage, bool result)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RetriedBulkMessage() when $default != null:
        return $default(_that.bulkMessage, _that.result);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RetriedBulkMessage implements RetriedBulkMessage {
  const _RetriedBulkMessage(
      {@JsonKey(name: 'bulk_message') required this.bulkMessage,
      required this.result});
  factory _RetriedBulkMessage.fromJson(Map<String, dynamic> json) =>
      _$RetriedBulkMessageFromJson(json);

  @override
  @JsonKey(name: 'bulk_message')
  final String bulkMessage;
  @override
  final bool result;

  /// Create a copy of RetriedBulkMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RetriedBulkMessageCopyWith<_RetriedBulkMessage> get copyWith =>
      __$RetriedBulkMessageCopyWithImpl<_RetriedBulkMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RetriedBulkMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RetriedBulkMessage &&
            (identical(other.bulkMessage, bulkMessage) ||
                other.bulkMessage == bulkMessage) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bulkMessage, result);

  @override
  String toString() {
    return 'RetriedBulkMessage(bulkMessage: $bulkMessage, result: $result)';
  }
}

/// @nodoc
abstract mixin class _$RetriedBulkMessageCopyWith<$Res>
    implements $RetriedBulkMessageCopyWith<$Res> {
  factory _$RetriedBulkMessageCopyWith(
          _RetriedBulkMessage value, $Res Function(_RetriedBulkMessage) _then) =
      __$RetriedBulkMessageCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'bulk_message') String bulkMessage, bool result});
}

/// @nodoc
class __$RetriedBulkMessageCopyWithImpl<$Res>
    implements _$RetriedBulkMessageCopyWith<$Res> {
  __$RetriedBulkMessageCopyWithImpl(this._self, this._then);

  final _RetriedBulkMessage _self;
  final $Res Function(_RetriedBulkMessage) _then;

  /// Create a copy of RetriedBulkMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bulkMessage = null,
    Object? result = null,
  }) {
    return _then(_RetriedBulkMessage(
      bulkMessage: null == bulkMessage
          ? _self.bulkMessage
          : bulkMessage // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
