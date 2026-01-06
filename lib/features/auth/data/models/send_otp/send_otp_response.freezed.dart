// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendOtpResponse {

 String? get mobile_number; int? get remaining_attempts; int? get allow_login_after; ValidationModel? get validation;
/// Create a copy of SendOtpResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendOtpResponseCopyWith<SendOtpResponse> get copyWith => _$SendOtpResponseCopyWithImpl<SendOtpResponse>(this as SendOtpResponse, _$identity);

  /// Serializes this SendOtpResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOtpResponse&&(identical(other.mobile_number, mobile_number) || other.mobile_number == mobile_number)&&(identical(other.remaining_attempts, remaining_attempts) || other.remaining_attempts == remaining_attempts)&&(identical(other.allow_login_after, allow_login_after) || other.allow_login_after == allow_login_after)&&(identical(other.validation, validation) || other.validation == validation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mobile_number,remaining_attempts,allow_login_after,validation);

@override
String toString() {
  return 'SendOtpResponse(mobile_number: $mobile_number, remaining_attempts: $remaining_attempts, allow_login_after: $allow_login_after, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $SendOtpResponseCopyWith<$Res>  {
  factory $SendOtpResponseCopyWith(SendOtpResponse value, $Res Function(SendOtpResponse) _then) = _$SendOtpResponseCopyWithImpl;
@useResult
$Res call({
 String? mobile_number, int? remaining_attempts, int? allow_login_after, ValidationModel? validation
});


$ValidationModelCopyWith<$Res>? get validation;

}
/// @nodoc
class _$SendOtpResponseCopyWithImpl<$Res>
    implements $SendOtpResponseCopyWith<$Res> {
  _$SendOtpResponseCopyWithImpl(this._self, this._then);

  final SendOtpResponse _self;
  final $Res Function(SendOtpResponse) _then;

/// Create a copy of SendOtpResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mobile_number = freezed,Object? remaining_attempts = freezed,Object? allow_login_after = freezed,Object? validation = freezed,}) {
  return _then(_self.copyWith(
mobile_number: freezed == mobile_number ? _self.mobile_number : mobile_number // ignore: cast_nullable_to_non_nullable
as String?,remaining_attempts: freezed == remaining_attempts ? _self.remaining_attempts : remaining_attempts // ignore: cast_nullable_to_non_nullable
as int?,allow_login_after: freezed == allow_login_after ? _self.allow_login_after : allow_login_after // ignore: cast_nullable_to_non_nullable
as int?,validation: freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}
/// Create a copy of SendOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationModelCopyWith<$Res>? get validation {
    if (_self.validation == null) {
    return null;
  }

  return $ValidationModelCopyWith<$Res>(_self.validation!, (value) {
    return _then(_self.copyWith(validation: value));
  });
}
}


/// Adds pattern-matching-related methods to [SendOtpResponse].
extension SendOtpResponsePatterns on SendOtpResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendOtpResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendOtpResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendOtpResponse value)  $default,){
final _that = this;
switch (_that) {
case _SendOtpResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendOtpResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SendOtpResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? mobile_number,  int? remaining_attempts,  int? allow_login_after,  ValidationModel? validation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendOtpResponse() when $default != null:
return $default(_that.mobile_number,_that.remaining_attempts,_that.allow_login_after,_that.validation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? mobile_number,  int? remaining_attempts,  int? allow_login_after,  ValidationModel? validation)  $default,) {final _that = this;
switch (_that) {
case _SendOtpResponse():
return $default(_that.mobile_number,_that.remaining_attempts,_that.allow_login_after,_that.validation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? mobile_number,  int? remaining_attempts,  int? allow_login_after,  ValidationModel? validation)?  $default,) {final _that = this;
switch (_that) {
case _SendOtpResponse() when $default != null:
return $default(_that.mobile_number,_that.remaining_attempts,_that.allow_login_after,_that.validation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendOtpResponse implements SendOtpResponse {
  const _SendOtpResponse({this.mobile_number, this.remaining_attempts, this.allow_login_after, this.validation});
  factory _SendOtpResponse.fromJson(Map<String, dynamic> json) => _$SendOtpResponseFromJson(json);

@override final  String? mobile_number;
@override final  int? remaining_attempts;
@override final  int? allow_login_after;
@override final  ValidationModel? validation;

/// Create a copy of SendOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendOtpResponseCopyWith<_SendOtpResponse> get copyWith => __$SendOtpResponseCopyWithImpl<_SendOtpResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendOtpResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOtpResponse&&(identical(other.mobile_number, mobile_number) || other.mobile_number == mobile_number)&&(identical(other.remaining_attempts, remaining_attempts) || other.remaining_attempts == remaining_attempts)&&(identical(other.allow_login_after, allow_login_after) || other.allow_login_after == allow_login_after)&&(identical(other.validation, validation) || other.validation == validation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mobile_number,remaining_attempts,allow_login_after,validation);

@override
String toString() {
  return 'SendOtpResponse(mobile_number: $mobile_number, remaining_attempts: $remaining_attempts, allow_login_after: $allow_login_after, validation: $validation)';
}


}

/// @nodoc
abstract mixin class _$SendOtpResponseCopyWith<$Res> implements $SendOtpResponseCopyWith<$Res> {
  factory _$SendOtpResponseCopyWith(_SendOtpResponse value, $Res Function(_SendOtpResponse) _then) = __$SendOtpResponseCopyWithImpl;
@override @useResult
$Res call({
 String? mobile_number, int? remaining_attempts, int? allow_login_after, ValidationModel? validation
});


@override $ValidationModelCopyWith<$Res>? get validation;

}
/// @nodoc
class __$SendOtpResponseCopyWithImpl<$Res>
    implements _$SendOtpResponseCopyWith<$Res> {
  __$SendOtpResponseCopyWithImpl(this._self, this._then);

  final _SendOtpResponse _self;
  final $Res Function(_SendOtpResponse) _then;

/// Create a copy of SendOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mobile_number = freezed,Object? remaining_attempts = freezed,Object? allow_login_after = freezed,Object? validation = freezed,}) {
  return _then(_SendOtpResponse(
mobile_number: freezed == mobile_number ? _self.mobile_number : mobile_number // ignore: cast_nullable_to_non_nullable
as String?,remaining_attempts: freezed == remaining_attempts ? _self.remaining_attempts : remaining_attempts // ignore: cast_nullable_to_non_nullable
as int?,allow_login_after: freezed == allow_login_after ? _self.allow_login_after : allow_login_after // ignore: cast_nullable_to_non_nullable
as int?,validation: freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}

/// Create a copy of SendOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationModelCopyWith<$Res>? get validation {
    if (_self.validation == null) {
    return null;
  }

  return $ValidationModelCopyWith<$Res>(_self.validation!, (value) {
    return _then(_self.copyWith(validation: value));
  });
}
}


/// @nodoc
mixin _$ValidationModel {

 String? get mobile_number; bool? get user_exist; bool? get user_enabled; bool? get OTP_valid;
/// Create a copy of ValidationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationModelCopyWith<ValidationModel> get copyWith => _$ValidationModelCopyWithImpl<ValidationModel>(this as ValidationModel, _$identity);

  /// Serializes this ValidationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationModel&&(identical(other.mobile_number, mobile_number) || other.mobile_number == mobile_number)&&(identical(other.user_exist, user_exist) || other.user_exist == user_exist)&&(identical(other.user_enabled, user_enabled) || other.user_enabled == user_enabled)&&(identical(other.OTP_valid, OTP_valid) || other.OTP_valid == OTP_valid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mobile_number,user_exist,user_enabled,OTP_valid);

@override
String toString() {
  return 'ValidationModel(mobile_number: $mobile_number, user_exist: $user_exist, user_enabled: $user_enabled, OTP_valid: $OTP_valid)';
}


}

/// @nodoc
abstract mixin class $ValidationModelCopyWith<$Res>  {
  factory $ValidationModelCopyWith(ValidationModel value, $Res Function(ValidationModel) _then) = _$ValidationModelCopyWithImpl;
@useResult
$Res call({
 String? mobile_number, bool? user_exist, bool? user_enabled, bool? OTP_valid
});




}
/// @nodoc
class _$ValidationModelCopyWithImpl<$Res>
    implements $ValidationModelCopyWith<$Res> {
  _$ValidationModelCopyWithImpl(this._self, this._then);

  final ValidationModel _self;
  final $Res Function(ValidationModel) _then;

/// Create a copy of ValidationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mobile_number = freezed,Object? user_exist = freezed,Object? user_enabled = freezed,Object? OTP_valid = freezed,}) {
  return _then(_self.copyWith(
mobile_number: freezed == mobile_number ? _self.mobile_number : mobile_number // ignore: cast_nullable_to_non_nullable
as String?,user_exist: freezed == user_exist ? _self.user_exist : user_exist // ignore: cast_nullable_to_non_nullable
as bool?,user_enabled: freezed == user_enabled ? _self.user_enabled : user_enabled // ignore: cast_nullable_to_non_nullable
as bool?,OTP_valid: freezed == OTP_valid ? _self.OTP_valid : OTP_valid // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidationModel].
extension ValidationModelPatterns on ValidationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationModel value)  $default,){
final _that = this;
switch (_that) {
case _ValidationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? mobile_number,  bool? user_exist,  bool? user_enabled,  bool? OTP_valid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidationModel() when $default != null:
return $default(_that.mobile_number,_that.user_exist,_that.user_enabled,_that.OTP_valid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? mobile_number,  bool? user_exist,  bool? user_enabled,  bool? OTP_valid)  $default,) {final _that = this;
switch (_that) {
case _ValidationModel():
return $default(_that.mobile_number,_that.user_exist,_that.user_enabled,_that.OTP_valid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? mobile_number,  bool? user_exist,  bool? user_enabled,  bool? OTP_valid)?  $default,) {final _that = this;
switch (_that) {
case _ValidationModel() when $default != null:
return $default(_that.mobile_number,_that.user_exist,_that.user_enabled,_that.OTP_valid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ValidationModel implements ValidationModel {
  const _ValidationModel({this.mobile_number, this.user_exist, this.user_enabled, this.OTP_valid});
  factory _ValidationModel.fromJson(Map<String, dynamic> json) => _$ValidationModelFromJson(json);

@override final  String? mobile_number;
@override final  bool? user_exist;
@override final  bool? user_enabled;
@override final  bool? OTP_valid;

/// Create a copy of ValidationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationModelCopyWith<_ValidationModel> get copyWith => __$ValidationModelCopyWithImpl<_ValidationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValidationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationModel&&(identical(other.mobile_number, mobile_number) || other.mobile_number == mobile_number)&&(identical(other.user_exist, user_exist) || other.user_exist == user_exist)&&(identical(other.user_enabled, user_enabled) || other.user_enabled == user_enabled)&&(identical(other.OTP_valid, OTP_valid) || other.OTP_valid == OTP_valid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mobile_number,user_exist,user_enabled,OTP_valid);

@override
String toString() {
  return 'ValidationModel(mobile_number: $mobile_number, user_exist: $user_exist, user_enabled: $user_enabled, OTP_valid: $OTP_valid)';
}


}

/// @nodoc
abstract mixin class _$ValidationModelCopyWith<$Res> implements $ValidationModelCopyWith<$Res> {
  factory _$ValidationModelCopyWith(_ValidationModel value, $Res Function(_ValidationModel) _then) = __$ValidationModelCopyWithImpl;
@override @useResult
$Res call({
 String? mobile_number, bool? user_exist, bool? user_enabled, bool? OTP_valid
});




}
/// @nodoc
class __$ValidationModelCopyWithImpl<$Res>
    implements _$ValidationModelCopyWith<$Res> {
  __$ValidationModelCopyWithImpl(this._self, this._then);

  final _ValidationModel _self;
  final $Res Function(_ValidationModel) _then;

/// Create a copy of ValidationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mobile_number = freezed,Object? user_exist = freezed,Object? user_enabled = freezed,Object? OTP_valid = freezed,}) {
  return _then(_ValidationModel(
mobile_number: freezed == mobile_number ? _self.mobile_number : mobile_number // ignore: cast_nullable_to_non_nullable
as String?,user_exist: freezed == user_exist ? _self.user_exist : user_exist // ignore: cast_nullable_to_non_nullable
as bool?,user_enabled: freezed == user_enabled ? _self.user_enabled : user_enabled // ignore: cast_nullable_to_non_nullable
as bool?,OTP_valid: freezed == OTP_valid ? _self.OTP_valid : OTP_valid // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
