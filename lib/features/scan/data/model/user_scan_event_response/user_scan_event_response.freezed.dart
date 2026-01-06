part of 'user_scan_event_response.dart';

T _$identity<T>(T value) => value;

mixin _$UserScanEventResponse {
  @JsonKey(name: 'events')
  List<EventModel> get events;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserScanEventResponseCopyWith<UserScanEventResponse> get copyWith =>
      _$UserScanEventResponseCopyWithImpl<UserScanEventResponse>(
        this as UserScanEventResponse,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserScanEventResponse &&
            const DeepCollectionEquality().equals(other.events, events));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(events));

  @override
  String toString() {
    return 'UserScanEventResponse(events: $events)';
  }
}

abstract mixin class $UserScanEventResponseCopyWith<$Res> {
  factory $UserScanEventResponseCopyWith(
    UserScanEventResponse value,
    $Res Function(UserScanEventResponse) _then,
  ) = _$UserScanEventResponseCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'events') List<EventModel> events});
}

class _$UserScanEventResponseCopyWithImpl<$Res>
    implements $UserScanEventResponseCopyWith<$Res> {
  _$UserScanEventResponseCopyWithImpl(this._self, this._then);

  final UserScanEventResponse _self;
  final $Res Function(UserScanEventResponse) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? events = null}) {
    return _then(
      _self.copyWith(
        events: null == events ? _self.events : events as List<EventModel>,
      ),
    );
  }
}

extension UserScanEventResponsePatterns on UserScanEventResponse {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserScanEventResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserScanEventResponse() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserScanEventResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserScanEventResponse():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserScanEventResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserScanEventResponse() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'events') List<EventModel> events)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserScanEventResponse() when $default != null:
        return $default(_that.events);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'events') List<EventModel> events) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserScanEventResponse():
        return $default(_that.events);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: 'events') List<EventModel> events)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserScanEventResponse() when $default != null:
        return $default(_that.events);
      case _:
        return null;
    }
  }
}

@JsonSerializable()
class _UserScanEventResponse implements UserScanEventResponse {
  const _UserScanEventResponse({
    @JsonKey(name: 'events') required final List<EventModel> events,
  }) : _events = events;
  factory _UserScanEventResponse.fromJson(Map<String, dynamic> json) =>
      _$UserScanEventResponseFromJson(json);

  final List<EventModel> _events;

  @override
  @JsonKey(name: 'events')
  List<EventModel> get events {
    if (_events is EqualUnmodifiableListView) return _events;

    return EqualUnmodifiableListView(_events);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserScanEventResponseCopyWith<_UserScanEventResponse> get copyWith =>
      __$UserScanEventResponseCopyWithImpl<_UserScanEventResponse>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$UserScanEventResponseToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserScanEventResponse &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_events));

  @override
  String toString() {
    return 'UserScanEventResponse(events: $events)';
  }
}

abstract mixin class _$UserScanEventResponseCopyWith<$Res>
    implements $UserScanEventResponseCopyWith<$Res> {
  factory _$UserScanEventResponseCopyWith(
    _UserScanEventResponse value,
    $Res Function(_UserScanEventResponse) _then,
  ) = __$UserScanEventResponseCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'events') List<EventModel> events});
}

class __$UserScanEventResponseCopyWithImpl<$Res>
    implements _$UserScanEventResponseCopyWith<$Res> {
  __$UserScanEventResponseCopyWithImpl(this._self, this._then);

  final _UserScanEventResponse _self;
  final $Res Function(_UserScanEventResponse) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? events = null}) {
    return _then(
      _UserScanEventResponse(
        events: null == events ? _self._events : events as List<EventModel>,
      ),
    );
  }
}
