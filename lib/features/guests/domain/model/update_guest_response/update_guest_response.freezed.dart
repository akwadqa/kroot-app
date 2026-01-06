part of 'update_guest_response.dart';

T _$identity<T>(T value) => value;

mixin _$UpdateGuestResponse {
  @JsonKey(name: 'invitee_id')
  String get inviteeId;
  @JsonKey(name: 'full_name')
  String? get fullName;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateGuestResponseCopyWith<UpdateGuestResponse> get copyWith =>
      _$UpdateGuestResponseCopyWithImpl<UpdateGuestResponse>(
        this as UpdateGuestResponse,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateGuestResponse &&
            (identical(other.inviteeId, inviteeId) ||
                other.inviteeId == inviteeId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, inviteeId, fullName);

  @override
  String toString() {
    return 'UpdateGuestResponse(inviteeId: $inviteeId, fullName: $fullName)';
  }
}

abstract mixin class $UpdateGuestResponseCopyWith<$Res> {
  factory $UpdateGuestResponseCopyWith(
    UpdateGuestResponse value,
    $Res Function(UpdateGuestResponse) _then,
  ) = _$UpdateGuestResponseCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: 'invitee_id') String inviteeId,
    @JsonKey(name: 'full_name') String? fullName,
  });
}

class _$UpdateGuestResponseCopyWithImpl<$Res>
    implements $UpdateGuestResponseCopyWith<$Res> {
  _$UpdateGuestResponseCopyWithImpl(this._self, this._then);

  final UpdateGuestResponse _self;
  final $Res Function(UpdateGuestResponse) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? inviteeId = null, Object? fullName = freezed}) {
    return _then(
      _self.copyWith(
        inviteeId: null == inviteeId ? _self.inviteeId : inviteeId as String,
        fullName: freezed == fullName ? _self.fullName : fullName as String?,
      ),
    );
  }
}

extension UpdateGuestResponsePatterns on UpdateGuestResponse {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UpdateGuestResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateGuestResponse() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UpdateGuestResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateGuestResponse():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UpdateGuestResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateGuestResponse() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'invitee_id') String inviteeId,
      @JsonKey(name: 'full_name') String? fullName,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateGuestResponse() when $default != null:
        return $default(_that.inviteeId, _that.fullName);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'invitee_id') String inviteeId,
      @JsonKey(name: 'full_name') String? fullName,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateGuestResponse():
        return $default(_that.inviteeId, _that.fullName);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      @JsonKey(name: 'invitee_id') String inviteeId,
      @JsonKey(name: 'full_name') String? fullName,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateGuestResponse() when $default != null:
        return $default(_that.inviteeId, _that.fullName);
      case _:
        return null;
    }
  }
}

@JsonSerializable()
class _UpdateGuestResponse implements UpdateGuestResponse {
  const _UpdateGuestResponse({
    @JsonKey(name: 'invitee_id') required this.inviteeId,
    @JsonKey(name: 'full_name') this.fullName,
  });
  factory _UpdateGuestResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateGuestResponseFromJson(json);

  @override
  @JsonKey(name: 'invitee_id')
  final String inviteeId;

  @override
  @JsonKey(name: 'full_name')
  final String? fullName;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateGuestResponseCopyWith<_UpdateGuestResponse> get copyWith =>
      __$UpdateGuestResponseCopyWithImpl<_UpdateGuestResponse>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateGuestResponseToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateGuestResponse &&
            (identical(other.inviteeId, inviteeId) ||
                other.inviteeId == inviteeId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, inviteeId, fullName);

  @override
  String toString() {
    return 'UpdateGuestResponse(inviteeId: $inviteeId, fullName: $fullName)';
  }
}

abstract mixin class _$UpdateGuestResponseCopyWith<$Res>
    implements $UpdateGuestResponseCopyWith<$Res> {
  factory _$UpdateGuestResponseCopyWith(
    _UpdateGuestResponse value,
    $Res Function(_UpdateGuestResponse) _then,
  ) = __$UpdateGuestResponseCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'invitee_id') String inviteeId,
    @JsonKey(name: 'full_name') String? fullName,
  });
}

class __$UpdateGuestResponseCopyWithImpl<$Res>
    implements _$UpdateGuestResponseCopyWith<$Res> {
  __$UpdateGuestResponseCopyWithImpl(this._self, this._then);

  final _UpdateGuestResponse _self;
  final $Res Function(_UpdateGuestResponse) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? inviteeId = null, Object? fullName = freezed}) {
    return _then(
      _UpdateGuestResponse(
        inviteeId: null == inviteeId ? _self.inviteeId : inviteeId as String,
        fullName: freezed == fullName ? _self.fullName : fullName as String?,
      ),
    );
  }
}
