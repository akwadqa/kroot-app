part of 'delete_handler_response.dart';

T _$identity<T>(T value) => value;

mixin _$DeleteHandlerResponse {
  List<String> get removed;
  @JsonKey(name: 'not_found')
  List<String> get notFound;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteHandlerResponseCopyWith<DeleteHandlerResponse> get copyWith =>
      _$DeleteHandlerResponseCopyWithImpl<DeleteHandlerResponse>(
        this as DeleteHandlerResponse,
        _$identity,
      );

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
    const DeepCollectionEquality().hash(notFound),
  );

  @override
  String toString() {
    return 'DeleteHandlerResponse(removed: $removed, notFound: $notFound)';
  }
}

abstract mixin class $DeleteHandlerResponseCopyWith<$Res> {
  factory $DeleteHandlerResponseCopyWith(
    DeleteHandlerResponse value,
    $Res Function(DeleteHandlerResponse) _then,
  ) = _$DeleteHandlerResponseCopyWithImpl;
  @useResult
  $Res call({
    List<String> removed,
    @JsonKey(name: 'not_found') List<String> notFound,
  });
}

class _$DeleteHandlerResponseCopyWithImpl<$Res>
    implements $DeleteHandlerResponseCopyWith<$Res> {
  _$DeleteHandlerResponseCopyWithImpl(this._self, this._then);

  final DeleteHandlerResponse _self;
  final $Res Function(DeleteHandlerResponse) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? removed = null, Object? notFound = null}) {
    return _then(
      _self.copyWith(
        removed: null == removed ? _self.removed : removed as List<String>,
        notFound: null == notFound ? _self.notFound : notFound as List<String>,
      ),
    );
  }
}

extension DeleteHandlerResponsePatterns on DeleteHandlerResponse {
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      List<String> removed,
      @JsonKey(name: 'not_found') List<String> notFound,
    )?
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      List<String> removed,
      @JsonKey(name: 'not_found') List<String> notFound,
    )
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      List<String> removed,
      @JsonKey(name: 'not_found') List<String> notFound,
    )?
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

@JsonSerializable()
class _DeleteHandlerResponse implements DeleteHandlerResponse {
  const _DeleteHandlerResponse({
    required final List<String> removed,
    @JsonKey(name: 'not_found') required final List<String> notFound,
  }) : _removed = removed,
       _notFound = notFound;
  factory _DeleteHandlerResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteHandlerResponseFromJson(json);

  final List<String> _removed;
  @override
  List<String> get removed {
    if (_removed is EqualUnmodifiableListView) return _removed;

    return EqualUnmodifiableListView(_removed);
  }

  final List<String> _notFound;
  @override
  @JsonKey(name: 'not_found')
  List<String> get notFound {
    if (_notFound is EqualUnmodifiableListView) return _notFound;

    return EqualUnmodifiableListView(_notFound);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteHandlerResponseCopyWith<_DeleteHandlerResponse> get copyWith =>
      __$DeleteHandlerResponseCopyWithImpl<_DeleteHandlerResponse>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$DeleteHandlerResponseToJson(this);
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
    const DeepCollectionEquality().hash(_notFound),
  );

  @override
  String toString() {
    return 'DeleteHandlerResponse(removed: $removed, notFound: $notFound)';
  }
}

abstract mixin class _$DeleteHandlerResponseCopyWith<$Res>
    implements $DeleteHandlerResponseCopyWith<$Res> {
  factory _$DeleteHandlerResponseCopyWith(
    _DeleteHandlerResponse value,
    $Res Function(_DeleteHandlerResponse) _then,
  ) = __$DeleteHandlerResponseCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<String> removed,
    @JsonKey(name: 'not_found') List<String> notFound,
  });
}

class __$DeleteHandlerResponseCopyWithImpl<$Res>
    implements _$DeleteHandlerResponseCopyWith<$Res> {
  __$DeleteHandlerResponseCopyWithImpl(this._self, this._then);

  final _DeleteHandlerResponse _self;
  final $Res Function(_DeleteHandlerResponse) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? removed = null, Object? notFound = null}) {
    return _then(
      _DeleteHandlerResponse(
        removed: null == removed ? _self._removed : removed as List<String>,
        notFound: null == notFound ? _self._notFound : notFound as List<String>,
      ),
    );
  }
}
