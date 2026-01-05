// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_scan_event_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserScanEventResponse {

// @JsonKey(name: 'owned_events') List<EventModel>? ownedEvents,
// @JsonKey(name: 'participant_events') List<EventModel>? participantEvents,
@JsonKey(name: 'events') List<EventModel> get events;
/// Create a copy of UserScanEventResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserScanEventResponseCopyWith<UserScanEventResponse> get copyWith => _$UserScanEventResponseCopyWithImpl<UserScanEventResponse>(this as UserScanEventResponse, _$identity);

  /// Serializes this UserScanEventResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserScanEventResponse&&const DeepCollectionEquality().equals(other.events, events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(events));

@override
String toString() {
  return 'UserScanEventResponse(events: $events)';
}


}

/// @nodoc
abstract mixin class $UserScanEventResponseCopyWith<$Res>  {
  factory $UserScanEventResponseCopyWith(UserScanEventResponse value, $Res Function(UserScanEventResponse) _then) = _$UserScanEventResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'events') List<EventModel> events
});




}
/// @nodoc
class _$UserScanEventResponseCopyWithImpl<$Res>
    implements $UserScanEventResponseCopyWith<$Res> {
  _$UserScanEventResponseCopyWithImpl(this._self, this._then);

  final UserScanEventResponse _self;
  final $Res Function(UserScanEventResponse) _then;

/// Create a copy of UserScanEventResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? events = null,}) {
  return _then(_self.copyWith(
events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<EventModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserScanEventResponse].
extension UserScanEventResponsePatterns on UserScanEventResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserScanEventResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserScanEventResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserScanEventResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserScanEventResponse():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserScanEventResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserScanEventResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'events')  List<EventModel> events)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserScanEventResponse() when $default != null:
return $default(_that.events);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'events')  List<EventModel> events)  $default,) {final _that = this;
switch (_that) {
case _UserScanEventResponse():
return $default(_that.events);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'events')  List<EventModel> events)?  $default,) {final _that = this;
switch (_that) {
case _UserScanEventResponse() when $default != null:
return $default(_that.events);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserScanEventResponse implements UserScanEventResponse {
  const _UserScanEventResponse({@JsonKey(name: 'events') required final  List<EventModel> events}): _events = events;
  factory _UserScanEventResponse.fromJson(Map<String, dynamic> json) => _$UserScanEventResponseFromJson(json);

// @JsonKey(name: 'owned_events') List<EventModel>? ownedEvents,
// @JsonKey(name: 'participant_events') List<EventModel>? participantEvents,
 final  List<EventModel> _events;
// @JsonKey(name: 'owned_events') List<EventModel>? ownedEvents,
// @JsonKey(name: 'participant_events') List<EventModel>? participantEvents,
@override@JsonKey(name: 'events') List<EventModel> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}


/// Create a copy of UserScanEventResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserScanEventResponseCopyWith<_UserScanEventResponse> get copyWith => __$UserScanEventResponseCopyWithImpl<_UserScanEventResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserScanEventResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserScanEventResponse&&const DeepCollectionEquality().equals(other._events, _events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events));

@override
String toString() {
  return 'UserScanEventResponse(events: $events)';
}


}

/// @nodoc
abstract mixin class _$UserScanEventResponseCopyWith<$Res> implements $UserScanEventResponseCopyWith<$Res> {
  factory _$UserScanEventResponseCopyWith(_UserScanEventResponse value, $Res Function(_UserScanEventResponse) _then) = __$UserScanEventResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'events') List<EventModel> events
});




}
/// @nodoc
class __$UserScanEventResponseCopyWithImpl<$Res>
    implements _$UserScanEventResponseCopyWith<$Res> {
  __$UserScanEventResponseCopyWithImpl(this._self, this._then);

  final _UserScanEventResponse _self;
  final $Res Function(_UserScanEventResponse) _then;

/// Create a copy of UserScanEventResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? events = null,}) {
  return _then(_UserScanEventResponse(
events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<EventModel>,
  ));
}


}

// dart format on
