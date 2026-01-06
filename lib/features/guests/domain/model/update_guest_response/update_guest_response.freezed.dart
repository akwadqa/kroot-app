// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_guest_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateGuestResponse {

@JsonKey(name: 'invitee_id') String get inviteeId;@JsonKey(name: 'full_name') String? get fullName;
/// Create a copy of UpdateGuestResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateGuestResponseCopyWith<UpdateGuestResponse> get copyWith => _$UpdateGuestResponseCopyWithImpl<UpdateGuestResponse>(this as UpdateGuestResponse, _$identity);

  /// Serializes this UpdateGuestResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateGuestResponse&&(identical(other.inviteeId, inviteeId) || other.inviteeId == inviteeId)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inviteeId,fullName);

@override
String toString() {
  return 'UpdateGuestResponse(inviteeId: $inviteeId, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $UpdateGuestResponseCopyWith<$Res>  {
  factory $UpdateGuestResponseCopyWith(UpdateGuestResponse value, $Res Function(UpdateGuestResponse) _then) = _$UpdateGuestResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'invitee_id') String inviteeId,@JsonKey(name: 'full_name') String? fullName
});




}
/// @nodoc
class _$UpdateGuestResponseCopyWithImpl<$Res>
    implements $UpdateGuestResponseCopyWith<$Res> {
  _$UpdateGuestResponseCopyWithImpl(this._self, this._then);

  final UpdateGuestResponse _self;
  final $Res Function(UpdateGuestResponse) _then;

/// Create a copy of UpdateGuestResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inviteeId = null,Object? fullName = freezed,}) {
  return _then(_self.copyWith(
inviteeId: null == inviteeId ? _self.inviteeId : inviteeId // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateGuestResponse].
extension UpdateGuestResponsePatterns on UpdateGuestResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateGuestResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateGuestResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateGuestResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpdateGuestResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateGuestResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateGuestResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'invitee_id')  String inviteeId, @JsonKey(name: 'full_name')  String? fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateGuestResponse() when $default != null:
return $default(_that.inviteeId,_that.fullName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'invitee_id')  String inviteeId, @JsonKey(name: 'full_name')  String? fullName)  $default,) {final _that = this;
switch (_that) {
case _UpdateGuestResponse():
return $default(_that.inviteeId,_that.fullName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'invitee_id')  String inviteeId, @JsonKey(name: 'full_name')  String? fullName)?  $default,) {final _that = this;
switch (_that) {
case _UpdateGuestResponse() when $default != null:
return $default(_that.inviteeId,_that.fullName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateGuestResponse implements UpdateGuestResponse {
  const _UpdateGuestResponse({@JsonKey(name: 'invitee_id') required this.inviteeId, @JsonKey(name: 'full_name') this.fullName});
  factory _UpdateGuestResponse.fromJson(Map<String, dynamic> json) => _$UpdateGuestResponseFromJson(json);

@override@JsonKey(name: 'invitee_id') final  String inviteeId;
@override@JsonKey(name: 'full_name') final  String? fullName;

/// Create a copy of UpdateGuestResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateGuestResponseCopyWith<_UpdateGuestResponse> get copyWith => __$UpdateGuestResponseCopyWithImpl<_UpdateGuestResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateGuestResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateGuestResponse&&(identical(other.inviteeId, inviteeId) || other.inviteeId == inviteeId)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inviteeId,fullName);

@override
String toString() {
  return 'UpdateGuestResponse(inviteeId: $inviteeId, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$UpdateGuestResponseCopyWith<$Res> implements $UpdateGuestResponseCopyWith<$Res> {
  factory _$UpdateGuestResponseCopyWith(_UpdateGuestResponse value, $Res Function(_UpdateGuestResponse) _then) = __$UpdateGuestResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'invitee_id') String inviteeId,@JsonKey(name: 'full_name') String? fullName
});




}
/// @nodoc
class __$UpdateGuestResponseCopyWithImpl<$Res>
    implements _$UpdateGuestResponseCopyWith<$Res> {
  __$UpdateGuestResponseCopyWithImpl(this._self, this._then);

  final _UpdateGuestResponse _self;
  final $Res Function(_UpdateGuestResponse) _then;

/// Create a copy of UpdateGuestResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inviteeId = null,Object? fullName = freezed,}) {
  return _then(_UpdateGuestResponse(
inviteeId: null == inviteeId ? _self.inviteeId : inviteeId // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
