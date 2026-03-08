// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_guest_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateGuestListRespone {
  @JsonKey(name: 'occasion_id')
  String get occasionId;
  @JsonKey(name: 'added_count')
  int get addedCount;
  @JsonKey(name: 'skipped_count')
  int get skippedCount;
  @JsonKey(name: 'added_invitees')
  List<AddedInvitee> get addedInvitees;

  /// Create a copy of UpdateGuestListRespone
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateGuestListResponeCopyWith<UpdateGuestListRespone> get copyWith =>
      _$UpdateGuestListResponeCopyWithImpl<UpdateGuestListRespone>(
          this as UpdateGuestListRespone, _$identity);

  /// Serializes this UpdateGuestListRespone to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateGuestListRespone &&
            (identical(other.occasionId, occasionId) ||
                other.occasionId == occasionId) &&
            (identical(other.addedCount, addedCount) ||
                other.addedCount == addedCount) &&
            (identical(other.skippedCount, skippedCount) ||
                other.skippedCount == skippedCount) &&
            const DeepCollectionEquality()
                .equals(other.addedInvitees, addedInvitees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, occasionId, addedCount,
      skippedCount, const DeepCollectionEquality().hash(addedInvitees));

  @override
  String toString() {
    return 'UpdateGuestListRespone(occasionId: $occasionId, addedCount: $addedCount, skippedCount: $skippedCount, addedInvitees: $addedInvitees)';
  }
}

/// @nodoc
abstract mixin class $UpdateGuestListResponeCopyWith<$Res> {
  factory $UpdateGuestListResponeCopyWith(UpdateGuestListRespone value,
          $Res Function(UpdateGuestListRespone) _then) =
      _$UpdateGuestListResponeCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'occasion_id') String occasionId,
      @JsonKey(name: 'added_count') int addedCount,
      @JsonKey(name: 'skipped_count') int skippedCount,
      @JsonKey(name: 'added_invitees') List<AddedInvitee> addedInvitees});
}

/// @nodoc
class _$UpdateGuestListResponeCopyWithImpl<$Res>
    implements $UpdateGuestListResponeCopyWith<$Res> {
  _$UpdateGuestListResponeCopyWithImpl(this._self, this._then);

  final UpdateGuestListRespone _self;
  final $Res Function(UpdateGuestListRespone) _then;

  /// Create a copy of UpdateGuestListRespone
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? occasionId = null,
    Object? addedCount = null,
    Object? skippedCount = null,
    Object? addedInvitees = null,
  }) {
    return _then(_self.copyWith(
      occasionId: null == occasionId
          ? _self.occasionId
          : occasionId // ignore: cast_nullable_to_non_nullable
              as String,
      addedCount: null == addedCount
          ? _self.addedCount
          : addedCount // ignore: cast_nullable_to_non_nullable
              as int,
      skippedCount: null == skippedCount
          ? _self.skippedCount
          : skippedCount // ignore: cast_nullable_to_non_nullable
              as int,
      addedInvitees: null == addedInvitees
          ? _self.addedInvitees
          : addedInvitees // ignore: cast_nullable_to_non_nullable
              as List<AddedInvitee>,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateGuestListRespone].
extension UpdateGuestListResponePatterns on UpdateGuestListRespone {
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
    TResult Function(_UpdateGuestListRespone value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateGuestListRespone() when $default != null:
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
    TResult Function(_UpdateGuestListRespone value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateGuestListRespone():
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
    TResult? Function(_UpdateGuestListRespone value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateGuestListRespone() when $default != null:
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
            @JsonKey(name: 'added_count') int addedCount,
            @JsonKey(name: 'skipped_count') int skippedCount,
            @JsonKey(name: 'added_invitees') List<AddedInvitee> addedInvitees)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateGuestListRespone() when $default != null:
        return $default(_that.occasionId, _that.addedCount, _that.skippedCount,
            _that.addedInvitees);
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
            @JsonKey(name: 'added_count') int addedCount,
            @JsonKey(name: 'skipped_count') int skippedCount,
            @JsonKey(name: 'added_invitees') List<AddedInvitee> addedInvitees)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateGuestListRespone():
        return $default(_that.occasionId, _that.addedCount, _that.skippedCount,
            _that.addedInvitees);
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
            @JsonKey(name: 'added_count') int addedCount,
            @JsonKey(name: 'skipped_count') int skippedCount,
            @JsonKey(name: 'added_invitees') List<AddedInvitee> addedInvitees)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateGuestListRespone() when $default != null:
        return $default(_that.occasionId, _that.addedCount, _that.skippedCount,
            _that.addedInvitees);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateGuestListRespone implements UpdateGuestListRespone {
  const _UpdateGuestListRespone(
      {@JsonKey(name: 'occasion_id') required this.occasionId,
      @JsonKey(name: 'added_count') required this.addedCount,
      @JsonKey(name: 'skipped_count') required this.skippedCount,
      @JsonKey(name: 'added_invitees')
      required final List<AddedInvitee> addedInvitees})
      : _addedInvitees = addedInvitees;
  factory _UpdateGuestListRespone.fromJson(Map<String, dynamic> json) =>
      _$UpdateGuestListResponeFromJson(json);

  @override
  @JsonKey(name: 'occasion_id')
  final String occasionId;
  @override
  @JsonKey(name: 'added_count')
  final int addedCount;
  @override
  @JsonKey(name: 'skipped_count')
  final int skippedCount;
  final List<AddedInvitee> _addedInvitees;
  @override
  @JsonKey(name: 'added_invitees')
  List<AddedInvitee> get addedInvitees {
    if (_addedInvitees is EqualUnmodifiableListView) return _addedInvitees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addedInvitees);
  }

  /// Create a copy of UpdateGuestListRespone
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateGuestListResponeCopyWith<_UpdateGuestListRespone> get copyWith =>
      __$UpdateGuestListResponeCopyWithImpl<_UpdateGuestListRespone>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateGuestListResponeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateGuestListRespone &&
            (identical(other.occasionId, occasionId) ||
                other.occasionId == occasionId) &&
            (identical(other.addedCount, addedCount) ||
                other.addedCount == addedCount) &&
            (identical(other.skippedCount, skippedCount) ||
                other.skippedCount == skippedCount) &&
            const DeepCollectionEquality()
                .equals(other._addedInvitees, _addedInvitees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, occasionId, addedCount,
      skippedCount, const DeepCollectionEquality().hash(_addedInvitees));

  @override
  String toString() {
    return 'UpdateGuestListRespone(occasionId: $occasionId, addedCount: $addedCount, skippedCount: $skippedCount, addedInvitees: $addedInvitees)';
  }
}

/// @nodoc
abstract mixin class _$UpdateGuestListResponeCopyWith<$Res>
    implements $UpdateGuestListResponeCopyWith<$Res> {
  factory _$UpdateGuestListResponeCopyWith(_UpdateGuestListRespone value,
          $Res Function(_UpdateGuestListRespone) _then) =
      __$UpdateGuestListResponeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'occasion_id') String occasionId,
      @JsonKey(name: 'added_count') int addedCount,
      @JsonKey(name: 'skipped_count') int skippedCount,
      @JsonKey(name: 'added_invitees') List<AddedInvitee> addedInvitees});
}

/// @nodoc
class __$UpdateGuestListResponeCopyWithImpl<$Res>
    implements _$UpdateGuestListResponeCopyWith<$Res> {
  __$UpdateGuestListResponeCopyWithImpl(this._self, this._then);

  final _UpdateGuestListRespone _self;
  final $Res Function(_UpdateGuestListRespone) _then;

  /// Create a copy of UpdateGuestListRespone
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? occasionId = null,
    Object? addedCount = null,
    Object? skippedCount = null,
    Object? addedInvitees = null,
  }) {
    return _then(_UpdateGuestListRespone(
      occasionId: null == occasionId
          ? _self.occasionId
          : occasionId // ignore: cast_nullable_to_non_nullable
              as String,
      addedCount: null == addedCount
          ? _self.addedCount
          : addedCount // ignore: cast_nullable_to_non_nullable
              as int,
      skippedCount: null == skippedCount
          ? _self.skippedCount
          : skippedCount // ignore: cast_nullable_to_non_nullable
              as int,
      addedInvitees: null == addedInvitees
          ? _self._addedInvitees
          : addedInvitees // ignore: cast_nullable_to_non_nullable
              as List<AddedInvitee>,
    ));
  }
}

/// @nodoc
mixin _$AddedInvitee {
  @JsonKey(name: 'invitee_id')
  String get inviteeId;
  @JsonKey(name: 'full_name')
  String get fullName;

  /// Create a copy of AddedInvitee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddedInviteeCopyWith<AddedInvitee> get copyWith =>
      _$AddedInviteeCopyWithImpl<AddedInvitee>(
          this as AddedInvitee, _$identity);

  /// Serializes this AddedInvitee to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddedInvitee &&
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
    return 'AddedInvitee(inviteeId: $inviteeId, fullName: $fullName)';
  }
}

/// @nodoc
abstract mixin class $AddedInviteeCopyWith<$Res> {
  factory $AddedInviteeCopyWith(
          AddedInvitee value, $Res Function(AddedInvitee) _then) =
      _$AddedInviteeCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'invitee_id') String inviteeId,
      @JsonKey(name: 'full_name') String fullName});
}

/// @nodoc
class _$AddedInviteeCopyWithImpl<$Res> implements $AddedInviteeCopyWith<$Res> {
  _$AddedInviteeCopyWithImpl(this._self, this._then);

  final AddedInvitee _self;
  final $Res Function(AddedInvitee) _then;

  /// Create a copy of AddedInvitee
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

/// Adds pattern-matching-related methods to [AddedInvitee].
extension AddedInviteePatterns on AddedInvitee {
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
    TResult Function(_AddedInvitee value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddedInvitee() when $default != null:
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
    TResult Function(_AddedInvitee value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddedInvitee():
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
    TResult? Function(_AddedInvitee value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddedInvitee() when $default != null:
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
      case _AddedInvitee() when $default != null:
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
      case _AddedInvitee():
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
      case _AddedInvitee() when $default != null:
        return $default(_that.inviteeId, _that.fullName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AddedInvitee implements AddedInvitee {
  const _AddedInvitee(
      {@JsonKey(name: 'invitee_id') required this.inviteeId,
      @JsonKey(name: 'full_name') required this.fullName});
  factory _AddedInvitee.fromJson(Map<String, dynamic> json) =>
      _$AddedInviteeFromJson(json);

  @override
  @JsonKey(name: 'invitee_id')
  final String inviteeId;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;

  /// Create a copy of AddedInvitee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddedInviteeCopyWith<_AddedInvitee> get copyWith =>
      __$AddedInviteeCopyWithImpl<_AddedInvitee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddedInviteeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddedInvitee &&
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
    return 'AddedInvitee(inviteeId: $inviteeId, fullName: $fullName)';
  }
}

/// @nodoc
abstract mixin class _$AddedInviteeCopyWith<$Res>
    implements $AddedInviteeCopyWith<$Res> {
  factory _$AddedInviteeCopyWith(
          _AddedInvitee value, $Res Function(_AddedInvitee) _then) =
      __$AddedInviteeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invitee_id') String inviteeId,
      @JsonKey(name: 'full_name') String fullName});
}

/// @nodoc
class __$AddedInviteeCopyWithImpl<$Res>
    implements _$AddedInviteeCopyWith<$Res> {
  __$AddedInviteeCopyWithImpl(this._self, this._then);

  final _AddedInvitee _self;
  final $Res Function(_AddedInvitee) _then;

  /// Create a copy of AddedInvitee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? inviteeId = null,
    Object? fullName = null,
  }) {
    return _then(_AddedInvitee(
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
