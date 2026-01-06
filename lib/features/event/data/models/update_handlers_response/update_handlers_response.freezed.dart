part of 'update_handlers_response.dart';

T _$identity<T>(T value) => value;

mixin _$UpdateHandlersResponse {
  List<HandlerModel>? get added;
  List<String>? get duplicates;
  List<String>? get handlers;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateHandlersResponseCopyWith<UpdateHandlersResponse> get copyWith =>
      _$UpdateHandlersResponseCopyWithImpl<UpdateHandlersResponse>(
        this as UpdateHandlersResponse,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateHandlersResponse &&
            const DeepCollectionEquality().equals(other.added, added) &&
            const DeepCollectionEquality().equals(
              other.duplicates,
              duplicates,
            ) &&
            const DeepCollectionEquality().equals(other.handlers, handlers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(added),
    const DeepCollectionEquality().hash(duplicates),
    const DeepCollectionEquality().hash(handlers),
  );

  @override
  String toString() {
    return 'UpdateHandlersResponse(added: $added, duplicates: $duplicates, handlers: $handlers)';
  }
}

abstract mixin class $UpdateHandlersResponseCopyWith<$Res> {
  factory $UpdateHandlersResponseCopyWith(
    UpdateHandlersResponse value,
    $Res Function(UpdateHandlersResponse) _then,
  ) = _$UpdateHandlersResponseCopyWithImpl;
  @useResult
  $Res call({
    List<HandlerModel>? added,
    List<String>? duplicates,
    List<String>? handlers,
  });
}

class _$UpdateHandlersResponseCopyWithImpl<$Res>
    implements $UpdateHandlersResponseCopyWith<$Res> {
  _$UpdateHandlersResponseCopyWithImpl(this._self, this._then);

  final UpdateHandlersResponse _self;
  final $Res Function(UpdateHandlersResponse) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? added = freezed,
    Object? duplicates = freezed,
    Object? handlers = freezed,
  }) {
    return _then(
      _self.copyWith(
        added: freezed == added ? _self.added : added as List<HandlerModel>?,
        duplicates: freezed == duplicates
            ? _self.duplicates
            : duplicates as List<String>?,
        handlers: freezed == handlers
            ? _self.handlers
            : handlers as List<String>?,
      ),
    );
  }
}

extension UpdateHandlersResponsePatterns on UpdateHandlersResponse {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UpdateHandlersResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateHandlersResponse() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UpdateHandlersResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateHandlersResponse():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UpdateHandlersResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateHandlersResponse() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      List<HandlerModel>? added,
      List<String>? duplicates,
      List<String>? handlers,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateHandlersResponse() when $default != null:
        return $default(_that.added, _that.duplicates, _that.handlers);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      List<HandlerModel>? added,
      List<String>? duplicates,
      List<String>? handlers,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateHandlersResponse():
        return $default(_that.added, _that.duplicates, _that.handlers);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      List<HandlerModel>? added,
      List<String>? duplicates,
      List<String>? handlers,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateHandlersResponse() when $default != null:
        return $default(_that.added, _that.duplicates, _that.handlers);
      case _:
        return null;
    }
  }
}

@JsonSerializable()
class _UpdateHandlersResponse implements UpdateHandlersResponse {
  const _UpdateHandlersResponse({
    final List<HandlerModel>? added,
    final List<String>? duplicates,
    final List<String>? handlers,
  }) : _added = added,
       _duplicates = duplicates,
       _handlers = handlers;
  factory _UpdateHandlersResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateHandlersResponseFromJson(json);

  final List<HandlerModel>? _added;
  @override
  List<HandlerModel>? get added {
    final value = _added;
    if (value == null) return null;
    if (_added is EqualUnmodifiableListView) return _added;

    return EqualUnmodifiableListView(value);
  }

  final List<String>? _duplicates;
  @override
  List<String>? get duplicates {
    final value = _duplicates;
    if (value == null) return null;
    if (_duplicates is EqualUnmodifiableListView) return _duplicates;

    return EqualUnmodifiableListView(value);
  }

  final List<String>? _handlers;
  @override
  List<String>? get handlers {
    final value = _handlers;
    if (value == null) return null;
    if (_handlers is EqualUnmodifiableListView) return _handlers;

    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateHandlersResponseCopyWith<_UpdateHandlersResponse> get copyWith =>
      __$UpdateHandlersResponseCopyWithImpl<_UpdateHandlersResponse>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateHandlersResponseToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateHandlersResponse &&
            const DeepCollectionEquality().equals(other._added, _added) &&
            const DeepCollectionEquality().equals(
              other._duplicates,
              _duplicates,
            ) &&
            const DeepCollectionEquality().equals(other._handlers, _handlers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_added),
    const DeepCollectionEquality().hash(_duplicates),
    const DeepCollectionEquality().hash(_handlers),
  );

  @override
  String toString() {
    return 'UpdateHandlersResponse(added: $added, duplicates: $duplicates, handlers: $handlers)';
  }
}

abstract mixin class _$UpdateHandlersResponseCopyWith<$Res>
    implements $UpdateHandlersResponseCopyWith<$Res> {
  factory _$UpdateHandlersResponseCopyWith(
    _UpdateHandlersResponse value,
    $Res Function(_UpdateHandlersResponse) _then,
  ) = __$UpdateHandlersResponseCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<HandlerModel>? added,
    List<String>? duplicates,
    List<String>? handlers,
  });
}

class __$UpdateHandlersResponseCopyWithImpl<$Res>
    implements _$UpdateHandlersResponseCopyWith<$Res> {
  __$UpdateHandlersResponseCopyWithImpl(this._self, this._then);

  final _UpdateHandlersResponse _self;
  final $Res Function(_UpdateHandlersResponse) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? added = freezed,
    Object? duplicates = freezed,
    Object? handlers = freezed,
  }) {
    return _then(
      _UpdateHandlersResponse(
        added: freezed == added ? _self._added : added as List<HandlerModel>?,
        duplicates: freezed == duplicates
            ? _self._duplicates
            : duplicates as List<String>?,
        handlers: freezed == handlers
            ? _self._handlers
            : handlers as List<String>?,
      ),
    );
  }
}
