// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_handler_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteHandlerResponse {
  List<String> get removed;
  @JsonKey(name: 'not_found')
  List<String> get notFound;

  /// Create a copy of DeleteHandlerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteHandlerResponseCopyWith<DeleteHandlerResponse> get copyWith =>
      _$DeleteHandlerResponseCopyWithImpl<DeleteHandlerResponse>(
          this as DeleteHandlerResponse, _$identity);

  /// Serializes this DeleteHandlerResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteHandlerResponse &&
            const DeepCollectionEquality().equals(other.removed, removed) &&
            const DeepCollectionEquality().equals(other.notFound, notFound));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(removed),
      const DeepCollectionEquality().hash(notFound));

  @override
  String toString() {
    return 'DeleteHandlerResponse(removed: $removed, notFound: $notFound)';
  }
}

/// @nodoc
abstract mixin class $DeleteHandlerResponseCopyWith<$Res> {
  factory $DeleteHandlerResponseCopyWith(DeleteHandlerResponse value,
          $Res Function(DeleteHandlerResponse) _then) =
      _$DeleteHandlerResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<String> removed,
      @JsonKey(name: 'not_found') List<String> notFound});
}

/// @nodoc
class _$DeleteHandlerResponseCopyWithImpl<$Res>
    implements $DeleteHandlerResponseCopyWith<$Res> {
  _$DeleteHandlerResponseCopyWithImpl(this._self, this._then);

  final DeleteHandlerResponse _self;
  final $Res Function(DeleteHandlerResponse) _then;

  /// Create a copy of DeleteHandlerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? removed = null,
    Object? notFound = null,
  }) {
    return _then(_self.copyWith(
      removed: null == removed
          ? _self.removed
          : removed // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notFound: null == notFound
          ? _self.notFound
          : notFound // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeleteHandlerResponse].
extension DeleteHandlerResponsePatterns on DeleteHandlerResponse {
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
    TResult Function(_DeleteHandlerResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeleteHandlerResponse() when $default != null:
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
    TResult Function(_DeleteHandlerResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeleteHandlerResponse():
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
    TResult? Function(_DeleteHandlerResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeleteHandlerResponse() when $default != null:
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
    TResult Function(List<String> removed,
            @JsonKey(name: 'not_found') List<String> notFound)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeleteHandlerResponse() when $default != null:
        return $default(_that.removed, _that.notFound);
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
    TResult Function(List<String> removed,
            @JsonKey(name: 'not_found') List<String> notFound)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeleteHandlerResponse():
        return $default(_that.removed, _that.notFound);
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
    TResult? Function(List<String> removed,
            @JsonKey(name: 'not_found') List<String> notFound)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeleteHandlerResponse() when $default != null:
        return $default(_that.removed, _that.notFound);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeleteHandlerResponse implements DeleteHandlerResponse {
  const _DeleteHandlerResponse(
      {required final List<String> removed,
      @JsonKey(name: 'not_found') required final List<String> notFound})
      : _removed = removed,
        _notFound = notFound;
  factory _DeleteHandlerResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteHandlerResponseFromJson(json);

  final List<String> _removed;
  @override
  List<String> get removed {
    if (_removed is EqualUnmodifiableListView) return _removed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_removed);
  }

  final List<String> _notFound;
  @override
  @JsonKey(name: 'not_found')
  List<String> get notFound {
    if (_notFound is EqualUnmodifiableListView) return _notFound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notFound);
  }

  /// Create a copy of DeleteHandlerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteHandlerResponseCopyWith<_DeleteHandlerResponse> get copyWith =>
      __$DeleteHandlerResponseCopyWithImpl<_DeleteHandlerResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeleteHandlerResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteHandlerResponse &&
            const DeepCollectionEquality().equals(other._removed, _removed) &&
            const DeepCollectionEquality().equals(other._notFound, _notFound));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_removed),
      const DeepCollectionEquality().hash(_notFound));

  @override
  String toString() {
    return 'DeleteHandlerResponse(removed: $removed, notFound: $notFound)';
  }
}

/// @nodoc
abstract mixin class _$DeleteHandlerResponseCopyWith<$Res>
    implements $DeleteHandlerResponseCopyWith<$Res> {
  factory _$DeleteHandlerResponseCopyWith(_DeleteHandlerResponse value,
          $Res Function(_DeleteHandlerResponse) _then) =
      __$DeleteHandlerResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<String> removed,
      @JsonKey(name: 'not_found') List<String> notFound});
}

/// @nodoc
class __$DeleteHandlerResponseCopyWithImpl<$Res>
    implements _$DeleteHandlerResponseCopyWith<$Res> {
  __$DeleteHandlerResponseCopyWithImpl(this._self, this._then);

  final _DeleteHandlerResponse _self;
  final $Res Function(_DeleteHandlerResponse) _then;

  /// Create a copy of DeleteHandlerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? removed = null,
    Object? notFound = null,
  }) {
    return _then(_DeleteHandlerResponse(
      removed: null == removed
          ? _self._removed
          : removed // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notFound: null == notFound
          ? _self._notFound
          : notFound // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
