part of 'scan_qr_response.dart';

T _$identity<T>(T value) => value;

mixin _$ScanQrResponse {
  String get invitee;
  String get occasion;
  @JsonKey(name: 'checked_in')
  int get checkedIn;
  @JsonKey(name: 'party_size')
  int get partySize;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScanQrResponseCopyWith<ScanQrResponse> get copyWith =>
      _$ScanQrResponseCopyWithImpl<ScanQrResponse>(
        this as ScanQrResponse,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScanQrResponse &&
            (identical(other.invitee, invitee) || other.invitee == invitee) &&
            (identical(other.occasion, occasion) ||
                other.occasion == occasion) &&
            (identical(other.checkedIn, checkedIn) ||
                other.checkedIn == checkedIn) &&
            (identical(other.partySize, partySize) ||
                other.partySize == partySize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, invitee, occasion, checkedIn, partySize);

  @override
  String toString() {
    return 'ScanQrResponse(invitee: $invitee, occasion: $occasion, checkedIn: $checkedIn, partySize: $partySize)';
  }
}

abstract mixin class $ScanQrResponseCopyWith<$Res> {
  factory $ScanQrResponseCopyWith(
    ScanQrResponse value,
    $Res Function(ScanQrResponse) _then,
  ) = _$ScanQrResponseCopyWithImpl;
  @useResult
  $Res call({
    String invitee,
    String occasion,
    @JsonKey(name: 'checked_in') int checkedIn,
    @JsonKey(name: 'party_size') int partySize,
  });
}

class _$ScanQrResponseCopyWithImpl<$Res>
    implements $ScanQrResponseCopyWith<$Res> {
  _$ScanQrResponseCopyWithImpl(this._self, this._then);

  final ScanQrResponse _self;
  final $Res Function(ScanQrResponse) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitee = null,
    Object? occasion = null,
    Object? checkedIn = null,
    Object? partySize = null,
  }) {
    return _then(
      _self.copyWith(
        invitee: null == invitee ? _self.invitee : invitee as String,
        occasion: null == occasion ? _self.occasion : occasion as String,
        checkedIn: null == checkedIn ? _self.checkedIn : checkedIn as int,
        partySize: null == partySize ? _self.partySize : partySize as int,
      ),
    );
  }
}

extension ScanQrResponsePatterns on ScanQrResponse {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ScanQrResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScanQrResponse() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ScanQrResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScanQrResponse():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ScanQrResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScanQrResponse() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String invitee,
      String occasion,
      @JsonKey(name: 'checked_in') int checkedIn,
      @JsonKey(name: 'party_size') int partySize,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScanQrResponse() when $default != null:
        return $default(
          _that.invitee,
          _that.occasion,
          _that.checkedIn,
          _that.partySize,
        );
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String invitee,
      String occasion,
      @JsonKey(name: 'checked_in') int checkedIn,
      @JsonKey(name: 'party_size') int partySize,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScanQrResponse():
        return $default(
          _that.invitee,
          _that.occasion,
          _that.checkedIn,
          _that.partySize,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String invitee,
      String occasion,
      @JsonKey(name: 'checked_in') int checkedIn,
      @JsonKey(name: 'party_size') int partySize,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScanQrResponse() when $default != null:
        return $default(
          _that.invitee,
          _that.occasion,
          _that.checkedIn,
          _that.partySize,
        );
      case _:
        return null;
    }
  }
}

@JsonSerializable()
class _ScanQrResponse implements ScanQrResponse {
  const _ScanQrResponse({
    required this.invitee,
    required this.occasion,
    @JsonKey(name: 'checked_in') required this.checkedIn,
    @JsonKey(name: 'party_size') required this.partySize,
  });
  factory _ScanQrResponse.fromJson(Map<String, dynamic> json) =>
      _$ScanQrResponseFromJson(json);

  @override
  final String invitee;

  @override
  final String occasion;

  @override
  @JsonKey(name: 'checked_in')
  final int checkedIn;

  @override
  @JsonKey(name: 'party_size')
  final int partySize;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScanQrResponseCopyWith<_ScanQrResponse> get copyWith =>
      __$ScanQrResponseCopyWithImpl<_ScanQrResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScanQrResponseToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScanQrResponse &&
            (identical(other.invitee, invitee) || other.invitee == invitee) &&
            (identical(other.occasion, occasion) ||
                other.occasion == occasion) &&
            (identical(other.checkedIn, checkedIn) ||
                other.checkedIn == checkedIn) &&
            (identical(other.partySize, partySize) ||
                other.partySize == partySize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, invitee, occasion, checkedIn, partySize);

  @override
  String toString() {
    return 'ScanQrResponse(invitee: $invitee, occasion: $occasion, checkedIn: $checkedIn, partySize: $partySize)';
  }
}

abstract mixin class _$ScanQrResponseCopyWith<$Res>
    implements $ScanQrResponseCopyWith<$Res> {
  factory _$ScanQrResponseCopyWith(
    _ScanQrResponse value,
    $Res Function(_ScanQrResponse) _then,
  ) = __$ScanQrResponseCopyWithImpl;
  @override
  @useResult
  $Res call({
    String invitee,
    String occasion,
    @JsonKey(name: 'checked_in') int checkedIn,
    @JsonKey(name: 'party_size') int partySize,
  });
}

class __$ScanQrResponseCopyWithImpl<$Res>
    implements _$ScanQrResponseCopyWith<$Res> {
  __$ScanQrResponseCopyWithImpl(this._self, this._then);

  final _ScanQrResponse _self;
  final $Res Function(_ScanQrResponse) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? invitee = null,
    Object? occasion = null,
    Object? checkedIn = null,
    Object? partySize = null,
  }) {
    return _then(
      _ScanQrResponse(
        invitee: null == invitee ? _self.invitee : invitee as String,
        occasion: null == occasion ? _self.occasion : occasion as String,
        checkedIn: null == checkedIn ? _self.checkedIn : checkedIn as int,
        partySize: null == partySize ? _self.partySize : partySize as int,
      ),
    );
  }
}
