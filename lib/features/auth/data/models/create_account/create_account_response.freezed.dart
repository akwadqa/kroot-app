// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateAccountResponse {

 String? get user_id; String? get first_name; String? get last_name; String? get email; String? get mobile_no;
/// Create a copy of CreateAccountResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAccountResponseCopyWith<CreateAccountResponse> get copyWith => _$CreateAccountResponseCopyWithImpl<CreateAccountResponse>(this as CreateAccountResponse, _$identity);

  /// Serializes this CreateAccountResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAccountResponse&&(identical(other.user_id, user_id) || other.user_id == user_id)&&(identical(other.first_name, first_name) || other.first_name == first_name)&&(identical(other.last_name, last_name) || other.last_name == last_name)&&(identical(other.email, email) || other.email == email)&&(identical(other.mobile_no, mobile_no) || other.mobile_no == mobile_no));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user_id,first_name,last_name,email,mobile_no);

@override
String toString() {
  return 'CreateAccountResponse(user_id: $user_id, first_name: $first_name, last_name: $last_name, email: $email, mobile_no: $mobile_no)';
}


}

/// @nodoc
abstract mixin class $CreateAccountResponseCopyWith<$Res>  {
  factory $CreateAccountResponseCopyWith(CreateAccountResponse value, $Res Function(CreateAccountResponse) _then) = _$CreateAccountResponseCopyWithImpl;
@useResult
$Res call({
 String? user_id, String? first_name, String? last_name, String? email, String? mobile_no
});




}
/// @nodoc
class _$CreateAccountResponseCopyWithImpl<$Res>
    implements $CreateAccountResponseCopyWith<$Res> {
  _$CreateAccountResponseCopyWithImpl(this._self, this._then);

  final CreateAccountResponse _self;
  final $Res Function(CreateAccountResponse) _then;

/// Create a copy of CreateAccountResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user_id = freezed,Object? first_name = freezed,Object? last_name = freezed,Object? email = freezed,Object? mobile_no = freezed,}) {
  return _then(_self.copyWith(
user_id: freezed == user_id ? _self.user_id : user_id // ignore: cast_nullable_to_non_nullable
as String?,first_name: freezed == first_name ? _self.first_name : first_name // ignore: cast_nullable_to_non_nullable
as String?,last_name: freezed == last_name ? _self.last_name : last_name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,mobile_no: freezed == mobile_no ? _self.mobile_no : mobile_no // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateAccountResponse].
extension CreateAccountResponsePatterns on CreateAccountResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAccountResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAccountResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAccountResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateAccountResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAccountResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAccountResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? user_id,  String? first_name,  String? last_name,  String? email,  String? mobile_no)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAccountResponse() when $default != null:
return $default(_that.user_id,_that.first_name,_that.last_name,_that.email,_that.mobile_no);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? user_id,  String? first_name,  String? last_name,  String? email,  String? mobile_no)  $default,) {final _that = this;
switch (_that) {
case _CreateAccountResponse():
return $default(_that.user_id,_that.first_name,_that.last_name,_that.email,_that.mobile_no);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? user_id,  String? first_name,  String? last_name,  String? email,  String? mobile_no)?  $default,) {final _that = this;
switch (_that) {
case _CreateAccountResponse() when $default != null:
return $default(_that.user_id,_that.first_name,_that.last_name,_that.email,_that.mobile_no);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateAccountResponse implements CreateAccountResponse {
  const _CreateAccountResponse({this.user_id, this.first_name, this.last_name, this.email, this.mobile_no});
  factory _CreateAccountResponse.fromJson(Map<String, dynamic> json) => _$CreateAccountResponseFromJson(json);

@override final  String? user_id;
@override final  String? first_name;
@override final  String? last_name;
@override final  String? email;
@override final  String? mobile_no;

/// Create a copy of CreateAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAccountResponseCopyWith<_CreateAccountResponse> get copyWith => __$CreateAccountResponseCopyWithImpl<_CreateAccountResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateAccountResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAccountResponse&&(identical(other.user_id, user_id) || other.user_id == user_id)&&(identical(other.first_name, first_name) || other.first_name == first_name)&&(identical(other.last_name, last_name) || other.last_name == last_name)&&(identical(other.email, email) || other.email == email)&&(identical(other.mobile_no, mobile_no) || other.mobile_no == mobile_no));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user_id,first_name,last_name,email,mobile_no);

@override
String toString() {
  return 'CreateAccountResponse(user_id: $user_id, first_name: $first_name, last_name: $last_name, email: $email, mobile_no: $mobile_no)';
}


}

/// @nodoc
abstract mixin class _$CreateAccountResponseCopyWith<$Res> implements $CreateAccountResponseCopyWith<$Res> {
  factory _$CreateAccountResponseCopyWith(_CreateAccountResponse value, $Res Function(_CreateAccountResponse) _then) = __$CreateAccountResponseCopyWithImpl;
@override @useResult
$Res call({
 String? user_id, String? first_name, String? last_name, String? email, String? mobile_no
});




}
/// @nodoc
class __$CreateAccountResponseCopyWithImpl<$Res>
    implements _$CreateAccountResponseCopyWith<$Res> {
  __$CreateAccountResponseCopyWithImpl(this._self, this._then);

  final _CreateAccountResponse _self;
  final $Res Function(_CreateAccountResponse) _then;

/// Create a copy of CreateAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user_id = freezed,Object? first_name = freezed,Object? last_name = freezed,Object? email = freezed,Object? mobile_no = freezed,}) {
  return _then(_CreateAccountResponse(
user_id: freezed == user_id ? _self.user_id : user_id // ignore: cast_nullable_to_non_nullable
as String?,first_name: freezed == first_name ? _self.first_name : first_name // ignore: cast_nullable_to_non_nullable
as String?,last_name: freezed == last_name ? _self.last_name : last_name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,mobile_no: freezed == mobile_no ? _self.mobile_no : mobile_no // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
