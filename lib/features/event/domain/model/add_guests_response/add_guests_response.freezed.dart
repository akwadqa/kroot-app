// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_guests_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddGuestsResponse {
  @JsonKey(name: 'occasion_id')
  String get occasionId;
  @JsonKey(name: 'created_invitees')
  List<Invitee> get createdInvitees;
  List<dynamic> get duplicates;

  /// Create a copy of AddGuestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddGuestsResponseCopyWith<AddGuestsResponse> get copyWith =>
      _$AddGuestsResponseCopyWithImpl<AddGuestsResponse>(
          this as AddGuestsResponse, _$identity);

  /// Serializes this AddGuestsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddGuestsResponse &&
            (identical(other.occasionId, occasionId) ||
                other.occasionId == occasionId) &&
            const DeepCollectionEquality()
                .equals(other.createdInvitees, createdInvitees) &&
            const DeepCollectionEquality()
                .equals(other.duplicates, duplicates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      occasionId,
      const DeepCollectionEquality().hash(createdInvitees),
      const DeepCollectionEquality().hash(duplicates));

  @override
  String toString() {
    return 'AddGuestsResponse(occasionId: $occasionId, createdInvitees: $createdInvitees, duplicates: $duplicates)';
  }
}

/// @nodoc
abstract mixin class $AddGuestsResponseCopyWith<$Res> {
  factory $AddGuestsResponseCopyWith(
          AddGuestsResponse value, $Res Function(AddGuestsResponse) _then) =
      _$AddGuestsResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'occasion_id') String occasionId,
      @JsonKey(name: 'created_invitees') List<Invitee> createdInvitees,
      List<dynamic> duplicates});
}

/// @nodoc
class _$AddGuestsResponseCopyWithImpl<$Res>
    implements $AddGuestsResponseCopyWith<$Res> {
  _$AddGuestsResponseCopyWithImpl(this._self, this._then);

  final AddGuestsResponse _self;
  final $Res Function(AddGuestsResponse) _then;

  /// Create a copy of AddGuestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? occasionId = null,
    Object? createdInvitees = null,
    Object? duplicates = null,
  }) {
    return _then(_self.copyWith(
      occasionId: null == occasionId
          ? _self.occasionId
          : occasionId // ignore: cast_nullable_to_non_nullable
              as String,
      createdInvitees: null == createdInvitees
          ? _self.createdInvitees
          : createdInvitees // ignore: cast_nullable_to_non_nullable
              as List<Invitee>,
      duplicates: null == duplicates
          ? _self.duplicates
          : duplicates // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AddGuestsResponse].
extension AddGuestsResponsePatterns on AddGuestsResponse {
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
    TResult Function(_AddGuestsResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddGuestsResponse() when $default != null:
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
    TResult Function(_AddGuestsResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddGuestsResponse():
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
    TResult? Function(_AddGuestsResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddGuestsResponse() when $default != null:
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
            @JsonKey(name: 'created_invitees') List<Invitee> createdInvitees,
            List<dynamic> duplicates)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddGuestsResponse() when $default != null:
        return $default(
            _that.occasionId, _that.createdInvitees, _that.duplicates);
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
            @JsonKey(name: 'created_invitees') List<Invitee> createdInvitees,
            List<dynamic> duplicates)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddGuestsResponse():
        return $default(
            _that.occasionId, _that.createdInvitees, _that.duplicates);
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
            @JsonKey(name: 'created_invitees') List<Invitee> createdInvitees,
            List<dynamic> duplicates)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddGuestsResponse() when $default != null:
        return $default(
            _that.occasionId, _that.createdInvitees, _that.duplicates);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AddGuestsResponse implements AddGuestsResponse {
  const _AddGuestsResponse(
      {@JsonKey(name: 'occasion_id') required this.occasionId,
      @JsonKey(name: 'created_invitees')
      required final List<Invitee> createdInvitees,
      required final List<dynamic> duplicates})
      : _createdInvitees = createdInvitees,
        _duplicates = duplicates;
  factory _AddGuestsResponse.fromJson(Map<String, dynamic> json) =>
      _$AddGuestsResponseFromJson(json);

  @override
  @JsonKey(name: 'occasion_id')
  final String occasionId;
  final List<Invitee> _createdInvitees;
  @override
  @JsonKey(name: 'created_invitees')
  List<Invitee> get createdInvitees {
    if (_createdInvitees is EqualUnmodifiableListView) return _createdInvitees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_createdInvitees);
  }

  final List<dynamic> _duplicates;
  @override
  List<dynamic> get duplicates {
    if (_duplicates is EqualUnmodifiableListView) return _duplicates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_duplicates);
  }

  /// Create a copy of AddGuestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddGuestsResponseCopyWith<_AddGuestsResponse> get copyWith =>
      __$AddGuestsResponseCopyWithImpl<_AddGuestsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddGuestsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddGuestsResponse &&
            (identical(other.occasionId, occasionId) ||
                other.occasionId == occasionId) &&
            const DeepCollectionEquality()
                .equals(other._createdInvitees, _createdInvitees) &&
            const DeepCollectionEquality()
                .equals(other._duplicates, _duplicates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      occasionId,
      const DeepCollectionEquality().hash(_createdInvitees),
      const DeepCollectionEquality().hash(_duplicates));

  @override
  String toString() {
    return 'AddGuestsResponse(occasionId: $occasionId, createdInvitees: $createdInvitees, duplicates: $duplicates)';
  }
}

/// @nodoc
abstract mixin class _$AddGuestsResponseCopyWith<$Res>
    implements $AddGuestsResponseCopyWith<$Res> {
  factory _$AddGuestsResponseCopyWith(
          _AddGuestsResponse value, $Res Function(_AddGuestsResponse) _then) =
      __$AddGuestsResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'occasion_id') String occasionId,
      @JsonKey(name: 'created_invitees') List<Invitee> createdInvitees,
      List<dynamic> duplicates});
}

/// @nodoc
class __$AddGuestsResponseCopyWithImpl<$Res>
    implements _$AddGuestsResponseCopyWith<$Res> {
  __$AddGuestsResponseCopyWithImpl(this._self, this._then);

  final _AddGuestsResponse _self;
  final $Res Function(_AddGuestsResponse) _then;

  /// Create a copy of AddGuestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? occasionId = null,
    Object? createdInvitees = null,
    Object? duplicates = null,
  }) {
    return _then(_AddGuestsResponse(
      occasionId: null == occasionId
          ? _self.occasionId
          : occasionId // ignore: cast_nullable_to_non_nullable
              as String,
      createdInvitees: null == createdInvitees
          ? _self._createdInvitees
          : createdInvitees // ignore: cast_nullable_to_non_nullable
              as List<Invitee>,
      duplicates: null == duplicates
          ? _self._duplicates
          : duplicates // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
mixin _$Invitee {
  @JsonKey(name: 'invitee_id')
  String get inviteeId;
  @JsonKey(name: 'full_name')
  String get fullName;

  /// Create a copy of Invitee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InviteeCopyWith<Invitee> get copyWith =>
      _$InviteeCopyWithImpl<Invitee>(this as Invitee, _$identity);

  /// Serializes this Invitee to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Invitee &&
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
    return 'Invitee(inviteeId: $inviteeId, fullName: $fullName)';
  }
}

/// @nodoc
abstract mixin class $InviteeCopyWith<$Res> {
  factory $InviteeCopyWith(Invitee value, $Res Function(Invitee) _then) =
      _$InviteeCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'invitee_id') String inviteeId,
      @JsonKey(name: 'full_name') String fullName});
}

/// @nodoc
class _$InviteeCopyWithImpl<$Res> implements $InviteeCopyWith<$Res> {
  _$InviteeCopyWithImpl(this._self, this._then);

  final Invitee _self;
  final $Res Function(Invitee) _then;

  /// Create a copy of Invitee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inviteeId = null,
    Object? fullName = null,
  }) {
    return _then(_self.copyWith(
      inviteeId: null == inviteeId
          ? _self.inviteeId
          : inviteeId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Invitee].
extension InviteePatterns on Invitee {
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
    TResult Function(_Invitee value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Invitee() when $default != null:
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
    TResult Function(_Invitee value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Invitee():
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
    TResult? Function(_Invitee value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Invitee() when $default != null:
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
    TResult Function(@JsonKey(name: 'invitee_id') String inviteeId,
            @JsonKey(name: 'full_name') String fullName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Invitee() when $default != null:
        return $default(_that.inviteeId, _that.fullName);
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
    TResult Function(@JsonKey(name: 'invitee_id') String inviteeId,
            @JsonKey(name: 'full_name') String fullName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Invitee():
        return $default(_that.inviteeId, _that.fullName);
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
    TResult? Function(@JsonKey(name: 'invitee_id') String inviteeId,
            @JsonKey(name: 'full_name') String fullName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Invitee() when $default != null:
        return $default(_that.inviteeId, _that.fullName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Invitee implements Invitee {
  const _Invitee(
      {@JsonKey(name: 'invitee_id') required this.inviteeId,
      @JsonKey(name: 'full_name') required this.fullName});
  factory _Invitee.fromJson(Map<String, dynamic> json) =>
      _$InviteeFromJson(json);

  @override
  @JsonKey(name: 'invitee_id')
  final String inviteeId;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;

  /// Create a copy of Invitee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InviteeCopyWith<_Invitee> get copyWith =>
      __$InviteeCopyWithImpl<_Invitee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InviteeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Invitee &&
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
    return 'Invitee(inviteeId: $inviteeId, fullName: $fullName)';
  }
}

/// @nodoc
abstract mixin class _$InviteeCopyWith<$Res> implements $InviteeCopyWith<$Res> {
  factory _$InviteeCopyWith(_Invitee value, $Res Function(_Invitee) _then) =
      __$InviteeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invitee_id') String inviteeId,
      @JsonKey(name: 'full_name') String fullName});
}

/// @nodoc
class __$InviteeCopyWithImpl<$Res> implements _$InviteeCopyWith<$Res> {
  __$InviteeCopyWithImpl(this._self, this._then);

  final _Invitee _self;
  final $Res Function(_Invitee) _then;

  /// Create a copy of Invitee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? inviteeId = null,
    Object? fullName = null,
  }) {
    return _then(_Invitee(
      inviteeId: null == inviteeId
          ? _self.inviteeId
          : inviteeId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
