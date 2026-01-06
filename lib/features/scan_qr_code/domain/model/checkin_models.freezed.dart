part of 'checkin_models.dart';

T _$identity<T>(T value) => value;

mixin _$CheckinItem {
  String? get invitee;
  String? get occasion;
  @JsonKey(name: 'checked_in', fromJson: _checkedInToInt)
  int? get checkedIn;
  @JsonKey(name: 'party_size')
  int? get partySize;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckinItemCopyWith<CheckinItem> get copyWith =>
      _$CheckinItemCopyWithImpl<CheckinItem>(this as CheckinItem, _$identity);

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckinItem &&
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
    return 'CheckinItem(invitee: $invitee, occasion: $occasion, checkedIn: $checkedIn, partySize: $partySize)';
  }
}

abstract mixin class $CheckinItemCopyWith<$Res> {
  factory $CheckinItemCopyWith(
    CheckinItem value,
    $Res Function(CheckinItem) _then,
  ) = _$CheckinItemCopyWithImpl;
  @useResult
  $Res call({
    String? invitee,
    String? occasion,
    @JsonKey(name: 'checked_in', fromJson: _checkedInToInt) int? checkedIn,
    @JsonKey(name: 'party_size') int? partySize,
  });
}

class _$CheckinItemCopyWithImpl<$Res> implements $CheckinItemCopyWith<$Res> {
  _$CheckinItemCopyWithImpl(this._self, this._then);

  final CheckinItem _self;
  final $Res Function(CheckinItem) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitee = freezed,
    Object? occasion = freezed,
    Object? checkedIn = freezed,
    Object? partySize = freezed,
  }) {
    return _then(
      _self.copyWith(
        invitee: freezed == invitee ? _self.invitee : invitee as String?,
        occasion: freezed == occasion ? _self.occasion : occasion as String?,
        checkedIn: freezed == checkedIn ? _self.checkedIn : checkedIn as int?,
        partySize: freezed == partySize ? _self.partySize : partySize as int?,
      ),
    );
  }
}

extension CheckinItemPatterns on CheckinItem {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CheckinItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckinItem() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CheckinItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckinItem():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CheckinItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckinItem() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String? invitee,
      String? occasion,
      @JsonKey(name: 'checked_in', fromJson: _checkedInToInt) int? checkedIn,
      @JsonKey(name: 'party_size') int? partySize,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckinItem() when $default != null:
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
      String? invitee,
      String? occasion,
      @JsonKey(name: 'checked_in', fromJson: _checkedInToInt) int? checkedIn,
      @JsonKey(name: 'party_size') int? partySize,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckinItem():
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
      String? invitee,
      String? occasion,
      @JsonKey(name: 'checked_in', fromJson: _checkedInToInt) int? checkedIn,
      @JsonKey(name: 'party_size') int? partySize,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckinItem() when $default != null:
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
class _CheckinItem implements CheckinItem {
  const _CheckinItem({
    this.invitee,
    this.occasion,
    @JsonKey(name: 'checked_in', fromJson: _checkedInToInt) this.checkedIn,
    @JsonKey(name: 'party_size') this.partySize,
  });
  factory _CheckinItem.fromJson(Map<String, dynamic> json) =>
      _$CheckinItemFromJson(json);

  @override
  final String? invitee;
  @override
  final String? occasion;
  @override
  @JsonKey(name: 'checked_in', fromJson: _checkedInToInt)
  final int? checkedIn;
  @override
  @JsonKey(name: 'party_size')
  final int? partySize;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckinItemCopyWith<_CheckinItem> get copyWith =>
      __$CheckinItemCopyWithImpl<_CheckinItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CheckinItemToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckinItem &&
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
    return 'CheckinItem(invitee: $invitee, occasion: $occasion, checkedIn: $checkedIn, partySize: $partySize)';
  }
}

abstract mixin class _$CheckinItemCopyWith<$Res>
    implements $CheckinItemCopyWith<$Res> {
  factory _$CheckinItemCopyWith(
    _CheckinItem value,
    $Res Function(_CheckinItem) _then,
  ) = __$CheckinItemCopyWithImpl;
  @override
  @useResult
  $Res call({
    String? invitee,
    String? occasion,
    @JsonKey(name: 'checked_in', fromJson: _checkedInToInt) int? checkedIn,
    @JsonKey(name: 'party_size') int? partySize,
  });
}

class __$CheckinItemCopyWithImpl<$Res> implements _$CheckinItemCopyWith<$Res> {
  __$CheckinItemCopyWithImpl(this._self, this._then);

  final _CheckinItem _self;
  final $Res Function(_CheckinItem) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? invitee = freezed,
    Object? occasion = freezed,
    Object? checkedIn = freezed,
    Object? partySize = freezed,
  }) {
    return _then(
      _CheckinItem(
        invitee: freezed == invitee ? _self.invitee : invitee as String?,
        occasion: freezed == occasion ? _self.occasion : occasion as String?,
        checkedIn: freezed == checkedIn ? _self.checkedIn : checkedIn as int?,
        partySize: freezed == partySize ? _self.partySize : partySize as int?,
      ),
    );
  }
}

mixin _$CheckinPayload {
  List<CheckinItem> get items;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckinPayloadCopyWith<CheckinPayload> get copyWith =>
      _$CheckinPayloadCopyWithImpl<CheckinPayload>(
        this as CheckinPayload,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckinPayload &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'CheckinPayload(items: $items)';
  }
}

abstract mixin class $CheckinPayloadCopyWith<$Res> {
  factory $CheckinPayloadCopyWith(
    CheckinPayload value,
    $Res Function(CheckinPayload) _then,
  ) = _$CheckinPayloadCopyWithImpl;
  @useResult
  $Res call({List<CheckinItem> items});
}

class _$CheckinPayloadCopyWithImpl<$Res>
    implements $CheckinPayloadCopyWith<$Res> {
  _$CheckinPayloadCopyWithImpl(this._self, this._then);

  final CheckinPayload _self;
  final $Res Function(CheckinPayload) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _self.copyWith(
        items: null == items ? _self.items : items as List<CheckinItem>,
      ),
    );
  }
}

extension CheckinPayloadPatterns on CheckinPayload {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CheckinPayload value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckinPayload() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CheckinPayload value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckinPayload():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CheckinPayload value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckinPayload() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CheckinItem> items)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckinPayload() when $default != null:
        return $default(_that.items);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CheckinItem> items) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckinPayload():
        return $default(_that.items);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<CheckinItem> items)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckinPayload() when $default != null:
        return $default(_that.items);
      case _:
        return null;
    }
  }
}

@JsonSerializable()
class _CheckinPayload implements CheckinPayload {
  const _CheckinPayload({final List<CheckinItem> items = const <CheckinItem>[]})
    : _items = items;
  factory _CheckinPayload.fromJson(Map<String, dynamic> json) =>
      _$CheckinPayloadFromJson(json);

  final List<CheckinItem> _items;
  @override
  @JsonKey()
  List<CheckinItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;

    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckinPayloadCopyWith<_CheckinPayload> get copyWith =>
      __$CheckinPayloadCopyWithImpl<_CheckinPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CheckinPayloadToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckinPayload &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'CheckinPayload(items: $items)';
  }
}

abstract mixin class _$CheckinPayloadCopyWith<$Res>
    implements $CheckinPayloadCopyWith<$Res> {
  factory _$CheckinPayloadCopyWith(
    _CheckinPayload value,
    $Res Function(_CheckinPayload) _then,
  ) = __$CheckinPayloadCopyWithImpl;
  @override
  @useResult
  $Res call({List<CheckinItem> items});
}

class __$CheckinPayloadCopyWithImpl<$Res>
    implements _$CheckinPayloadCopyWith<$Res> {
  __$CheckinPayloadCopyWithImpl(this._self, this._then);

  final _CheckinPayload _self;
  final $Res Function(_CheckinPayload) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? items = null}) {
    return _then(
      _CheckinPayload(
        items: null == items ? _self._items : items as List<CheckinItem>,
      ),
    );
  }
}
