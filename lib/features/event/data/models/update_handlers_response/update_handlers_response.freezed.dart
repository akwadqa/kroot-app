// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_handlers_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateHandlersResponse {

 List<HandlerModel>? get added; List<String>? get duplicates; List<String>? get handlers;
/// Create a copy of UpdateHandlersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateHandlersResponseCopyWith<UpdateHandlersResponse> get copyWith => _$UpdateHandlersResponseCopyWithImpl<UpdateHandlersResponse>(this as UpdateHandlersResponse, _$identity);

  /// Serializes this UpdateHandlersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateHandlersResponse&&const DeepCollectionEquality().equals(other.added, added)&&const DeepCollectionEquality().equals(other.duplicates, duplicates)&&const DeepCollectionEquality().equals(other.handlers, handlers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(added),const DeepCollectionEquality().hash(duplicates),const DeepCollectionEquality().hash(handlers));

@override
String toString() {
  return 'UpdateHandlersResponse(added: $added, duplicates: $duplicates, handlers: $handlers)';
}


}

/// @nodoc
abstract mixin class $UpdateHandlersResponseCopyWith<$Res>  {
  factory $UpdateHandlersResponseCopyWith(UpdateHandlersResponse value, $Res Function(UpdateHandlersResponse) _then) = _$UpdateHandlersResponseCopyWithImpl;
@useResult
$Res call({
 List<HandlerModel>? added, List<String>? duplicates, List<String>? handlers
});




}
/// @nodoc
class _$UpdateHandlersResponseCopyWithImpl<$Res>
    implements $UpdateHandlersResponseCopyWith<$Res> {
  _$UpdateHandlersResponseCopyWithImpl(this._self, this._then);

  final UpdateHandlersResponse _self;
  final $Res Function(UpdateHandlersResponse) _then;

/// Create a copy of UpdateHandlersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? added = freezed,Object? duplicates = freezed,Object? handlers = freezed,}) {
  return _then(_self.copyWith(
added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as List<HandlerModel>?,duplicates: freezed == duplicates ? _self.duplicates : duplicates // ignore: cast_nullable_to_non_nullable
as List<String>?,handlers: freezed == handlers ? _self.handlers : handlers // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateHandlersResponse].
extension UpdateHandlersResponsePatterns on UpdateHandlersResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateHandlersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateHandlersResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateHandlersResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpdateHandlersResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateHandlersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateHandlersResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HandlerModel>? added,  List<String>? duplicates,  List<String>? handlers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateHandlersResponse() when $default != null:
return $default(_that.added,_that.duplicates,_that.handlers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HandlerModel>? added,  List<String>? duplicates,  List<String>? handlers)  $default,) {final _that = this;
switch (_that) {
case _UpdateHandlersResponse():
return $default(_that.added,_that.duplicates,_that.handlers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HandlerModel>? added,  List<String>? duplicates,  List<String>? handlers)?  $default,) {final _that = this;
switch (_that) {
case _UpdateHandlersResponse() when $default != null:
return $default(_that.added,_that.duplicates,_that.handlers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateHandlersResponse implements UpdateHandlersResponse {
  const _UpdateHandlersResponse({final  List<HandlerModel>? added, final  List<String>? duplicates, final  List<String>? handlers}): _added = added,_duplicates = duplicates,_handlers = handlers;
  factory _UpdateHandlersResponse.fromJson(Map<String, dynamic> json) => _$UpdateHandlersResponseFromJson(json);

 final  List<HandlerModel>? _added;
@override List<HandlerModel>? get added {
  final value = _added;
  if (value == null) return null;
  if (_added is EqualUnmodifiableListView) return _added;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _duplicates;
@override List<String>? get duplicates {
  final value = _duplicates;
  if (value == null) return null;
  if (_duplicates is EqualUnmodifiableListView) return _duplicates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _handlers;
@override List<String>? get handlers {
  final value = _handlers;
  if (value == null) return null;
  if (_handlers is EqualUnmodifiableListView) return _handlers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UpdateHandlersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateHandlersResponseCopyWith<_UpdateHandlersResponse> get copyWith => __$UpdateHandlersResponseCopyWithImpl<_UpdateHandlersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateHandlersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateHandlersResponse&&const DeepCollectionEquality().equals(other._added, _added)&&const DeepCollectionEquality().equals(other._duplicates, _duplicates)&&const DeepCollectionEquality().equals(other._handlers, _handlers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_added),const DeepCollectionEquality().hash(_duplicates),const DeepCollectionEquality().hash(_handlers));

@override
String toString() {
  return 'UpdateHandlersResponse(added: $added, duplicates: $duplicates, handlers: $handlers)';
}


}

/// @nodoc
abstract mixin class _$UpdateHandlersResponseCopyWith<$Res> implements $UpdateHandlersResponseCopyWith<$Res> {
  factory _$UpdateHandlersResponseCopyWith(_UpdateHandlersResponse value, $Res Function(_UpdateHandlersResponse) _then) = __$UpdateHandlersResponseCopyWithImpl;
@override @useResult
$Res call({
 List<HandlerModel>? added, List<String>? duplicates, List<String>? handlers
});




}
/// @nodoc
class __$UpdateHandlersResponseCopyWithImpl<$Res>
    implements _$UpdateHandlersResponseCopyWith<$Res> {
  __$UpdateHandlersResponseCopyWithImpl(this._self, this._then);

  final _UpdateHandlersResponse _self;
  final $Res Function(_UpdateHandlersResponse) _then;

/// Create a copy of UpdateHandlersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? added = freezed,Object? duplicates = freezed,Object? handlers = freezed,}) {
  return _then(_UpdateHandlersResponse(
added: freezed == added ? _self._added : added // ignore: cast_nullable_to_non_nullable
as List<HandlerModel>?,duplicates: freezed == duplicates ? _self._duplicates : duplicates // ignore: cast_nullable_to_non_nullable
as List<String>?,handlers: freezed == handlers ? _self._handlers : handlers // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
