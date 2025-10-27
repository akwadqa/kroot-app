// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_event_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateEventRequest {

 String? get type; String? get title; String? get date; String? get language; String? get map_link; String? get location_name; String? get show_qr;@JsonKey(includeFromJson: false, includeToJson: false) File? get image; String? get invite_template; String? get confirmed_template; String? get declined_template; List<Map<String, dynamic>>? get guest_list;
/// Create a copy of CreateEventRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateEventRequestCopyWith<CreateEventRequest> get copyWith => _$CreateEventRequestCopyWithImpl<CreateEventRequest>(this as CreateEventRequest, _$identity);

  /// Serializes this CreateEventRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateEventRequest&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.language, language) || other.language == language)&&(identical(other.map_link, map_link) || other.map_link == map_link)&&(identical(other.location_name, location_name) || other.location_name == location_name)&&(identical(other.show_qr, show_qr) || other.show_qr == show_qr)&&(identical(other.image, image) || other.image == image)&&(identical(other.invite_template, invite_template) || other.invite_template == invite_template)&&(identical(other.confirmed_template, confirmed_template) || other.confirmed_template == confirmed_template)&&(identical(other.declined_template, declined_template) || other.declined_template == declined_template)&&const DeepCollectionEquality().equals(other.guest_list, guest_list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,title,date,language,map_link,location_name,show_qr,image,invite_template,confirmed_template,declined_template,const DeepCollectionEquality().hash(guest_list));

@override
String toString() {
  return 'CreateEventRequest(type: $type, title: $title, date: $date, language: $language, map_link: $map_link, location_name: $location_name, show_qr: $show_qr, image: $image, invite_template: $invite_template, confirmed_template: $confirmed_template, declined_template: $declined_template, guest_list: $guest_list)';
}


}

/// @nodoc
abstract mixin class $CreateEventRequestCopyWith<$Res>  {
  factory $CreateEventRequestCopyWith(CreateEventRequest value, $Res Function(CreateEventRequest) _then) = _$CreateEventRequestCopyWithImpl;
@useResult
$Res call({
 String? type, String? title, String? date, String? language, String? map_link, String? location_name, String? show_qr,@JsonKey(includeFromJson: false, includeToJson: false) File? image, String? invite_template, String? confirmed_template, String? declined_template, List<Map<String, dynamic>>? guest_list
});




}
/// @nodoc
class _$CreateEventRequestCopyWithImpl<$Res>
    implements $CreateEventRequestCopyWith<$Res> {
  _$CreateEventRequestCopyWithImpl(this._self, this._then);

  final CreateEventRequest _self;
  final $Res Function(CreateEventRequest) _then;

/// Create a copy of CreateEventRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? title = freezed,Object? date = freezed,Object? language = freezed,Object? map_link = freezed,Object? location_name = freezed,Object? show_qr = freezed,Object? image = freezed,Object? invite_template = freezed,Object? confirmed_template = freezed,Object? declined_template = freezed,Object? guest_list = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,map_link: freezed == map_link ? _self.map_link : map_link // ignore: cast_nullable_to_non_nullable
as String?,location_name: freezed == location_name ? _self.location_name : location_name // ignore: cast_nullable_to_non_nullable
as String?,show_qr: freezed == show_qr ? _self.show_qr : show_qr // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,invite_template: freezed == invite_template ? _self.invite_template : invite_template // ignore: cast_nullable_to_non_nullable
as String?,confirmed_template: freezed == confirmed_template ? _self.confirmed_template : confirmed_template // ignore: cast_nullable_to_non_nullable
as String?,declined_template: freezed == declined_template ? _self.declined_template : declined_template // ignore: cast_nullable_to_non_nullable
as String?,guest_list: freezed == guest_list ? _self.guest_list : guest_list // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateEventRequest].
extension CreateEventRequestPatterns on CreateEventRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateEventRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateEventRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateEventRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateEventRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateEventRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateEventRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? type,  String? title,  String? date,  String? language,  String? map_link,  String? location_name,  String? show_qr, @JsonKey(includeFromJson: false, includeToJson: false)  File? image,  String? invite_template,  String? confirmed_template,  String? declined_template,  List<Map<String, dynamic>>? guest_list)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateEventRequest() when $default != null:
return $default(_that.type,_that.title,_that.date,_that.language,_that.map_link,_that.location_name,_that.show_qr,_that.image,_that.invite_template,_that.confirmed_template,_that.declined_template,_that.guest_list);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? type,  String? title,  String? date,  String? language,  String? map_link,  String? location_name,  String? show_qr, @JsonKey(includeFromJson: false, includeToJson: false)  File? image,  String? invite_template,  String? confirmed_template,  String? declined_template,  List<Map<String, dynamic>>? guest_list)  $default,) {final _that = this;
switch (_that) {
case _CreateEventRequest():
return $default(_that.type,_that.title,_that.date,_that.language,_that.map_link,_that.location_name,_that.show_qr,_that.image,_that.invite_template,_that.confirmed_template,_that.declined_template,_that.guest_list);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? type,  String? title,  String? date,  String? language,  String? map_link,  String? location_name,  String? show_qr, @JsonKey(includeFromJson: false, includeToJson: false)  File? image,  String? invite_template,  String? confirmed_template,  String? declined_template,  List<Map<String, dynamic>>? guest_list)?  $default,) {final _that = this;
switch (_that) {
case _CreateEventRequest() when $default != null:
return $default(_that.type,_that.title,_that.date,_that.language,_that.map_link,_that.location_name,_that.show_qr,_that.image,_that.invite_template,_that.confirmed_template,_that.declined_template,_that.guest_list);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateEventRequest implements CreateEventRequest {
  const _CreateEventRequest({this.type, this.title, this.date, this.language, this.map_link, this.location_name, this.show_qr, @JsonKey(includeFromJson: false, includeToJson: false) this.image, this.invite_template, this.confirmed_template, this.declined_template, final  List<Map<String, dynamic>>? guest_list}): _guest_list = guest_list;
  factory _CreateEventRequest.fromJson(Map<String, dynamic> json) => _$CreateEventRequestFromJson(json);

@override final  String? type;
@override final  String? title;
@override final  String? date;
@override final  String? language;
@override final  String? map_link;
@override final  String? location_name;
@override final  String? show_qr;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? image;
@override final  String? invite_template;
@override final  String? confirmed_template;
@override final  String? declined_template;
 final  List<Map<String, dynamic>>? _guest_list;
@override List<Map<String, dynamic>>? get guest_list {
  final value = _guest_list;
  if (value == null) return null;
  if (_guest_list is EqualUnmodifiableListView) return _guest_list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreateEventRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateEventRequestCopyWith<_CreateEventRequest> get copyWith => __$CreateEventRequestCopyWithImpl<_CreateEventRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateEventRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateEventRequest&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.language, language) || other.language == language)&&(identical(other.map_link, map_link) || other.map_link == map_link)&&(identical(other.location_name, location_name) || other.location_name == location_name)&&(identical(other.show_qr, show_qr) || other.show_qr == show_qr)&&(identical(other.image, image) || other.image == image)&&(identical(other.invite_template, invite_template) || other.invite_template == invite_template)&&(identical(other.confirmed_template, confirmed_template) || other.confirmed_template == confirmed_template)&&(identical(other.declined_template, declined_template) || other.declined_template == declined_template)&&const DeepCollectionEquality().equals(other._guest_list, _guest_list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,title,date,language,map_link,location_name,show_qr,image,invite_template,confirmed_template,declined_template,const DeepCollectionEquality().hash(_guest_list));

@override
String toString() {
  return 'CreateEventRequest(type: $type, title: $title, date: $date, language: $language, map_link: $map_link, location_name: $location_name, show_qr: $show_qr, image: $image, invite_template: $invite_template, confirmed_template: $confirmed_template, declined_template: $declined_template, guest_list: $guest_list)';
}


}

/// @nodoc
abstract mixin class _$CreateEventRequestCopyWith<$Res> implements $CreateEventRequestCopyWith<$Res> {
  factory _$CreateEventRequestCopyWith(_CreateEventRequest value, $Res Function(_CreateEventRequest) _then) = __$CreateEventRequestCopyWithImpl;
@override @useResult
$Res call({
 String? type, String? title, String? date, String? language, String? map_link, String? location_name, String? show_qr,@JsonKey(includeFromJson: false, includeToJson: false) File? image, String? invite_template, String? confirmed_template, String? declined_template, List<Map<String, dynamic>>? guest_list
});




}
/// @nodoc
class __$CreateEventRequestCopyWithImpl<$Res>
    implements _$CreateEventRequestCopyWith<$Res> {
  __$CreateEventRequestCopyWithImpl(this._self, this._then);

  final _CreateEventRequest _self;
  final $Res Function(_CreateEventRequest) _then;

/// Create a copy of CreateEventRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? title = freezed,Object? date = freezed,Object? language = freezed,Object? map_link = freezed,Object? location_name = freezed,Object? show_qr = freezed,Object? image = freezed,Object? invite_template = freezed,Object? confirmed_template = freezed,Object? declined_template = freezed,Object? guest_list = freezed,}) {
  return _then(_CreateEventRequest(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,map_link: freezed == map_link ? _self.map_link : map_link // ignore: cast_nullable_to_non_nullable
as String?,location_name: freezed == location_name ? _self.location_name : location_name // ignore: cast_nullable_to_non_nullable
as String?,show_qr: freezed == show_qr ? _self.show_qr : show_qr // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,invite_template: freezed == invite_template ? _self.invite_template : invite_template // ignore: cast_nullable_to_non_nullable
as String?,confirmed_template: freezed == confirmed_template ? _self.confirmed_template : confirmed_template // ignore: cast_nullable_to_non_nullable
as String?,declined_template: freezed == declined_template ? _self.declined_template : declined_template // ignore: cast_nullable_to_non_nullable
as String?,guest_list: freezed == guest_list ? _self._guest_list : guest_list // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}


}


/// @nodoc
mixin _$GuestModel {

 String? get first_name; String? get last_name; String? get whatsapp_number; int? get party_size;
/// Create a copy of GuestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestModelCopyWith<GuestModel> get copyWith => _$GuestModelCopyWithImpl<GuestModel>(this as GuestModel, _$identity);

  /// Serializes this GuestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestModel&&(identical(other.first_name, first_name) || other.first_name == first_name)&&(identical(other.last_name, last_name) || other.last_name == last_name)&&(identical(other.whatsapp_number, whatsapp_number) || other.whatsapp_number == whatsapp_number)&&(identical(other.party_size, party_size) || other.party_size == party_size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first_name,last_name,whatsapp_number,party_size);

@override
String toString() {
  return 'GuestModel(first_name: $first_name, last_name: $last_name, whatsapp_number: $whatsapp_number, party_size: $party_size)';
}


}

/// @nodoc
abstract mixin class $GuestModelCopyWith<$Res>  {
  factory $GuestModelCopyWith(GuestModel value, $Res Function(GuestModel) _then) = _$GuestModelCopyWithImpl;
@useResult
$Res call({
 String? first_name, String? last_name, String? whatsapp_number, int? party_size
});




}
/// @nodoc
class _$GuestModelCopyWithImpl<$Res>
    implements $GuestModelCopyWith<$Res> {
  _$GuestModelCopyWithImpl(this._self, this._then);

  final GuestModel _self;
  final $Res Function(GuestModel) _then;

/// Create a copy of GuestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? first_name = freezed,Object? last_name = freezed,Object? whatsapp_number = freezed,Object? party_size = freezed,}) {
  return _then(_self.copyWith(
first_name: freezed == first_name ? _self.first_name : first_name // ignore: cast_nullable_to_non_nullable
as String?,last_name: freezed == last_name ? _self.last_name : last_name // ignore: cast_nullable_to_non_nullable
as String?,whatsapp_number: freezed == whatsapp_number ? _self.whatsapp_number : whatsapp_number // ignore: cast_nullable_to_non_nullable
as String?,party_size: freezed == party_size ? _self.party_size : party_size // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GuestModel].
extension GuestModelPatterns on GuestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuestModel value)  $default,){
final _that = this;
switch (_that) {
case _GuestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuestModel value)?  $default,){
final _that = this;
switch (_that) {
case _GuestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? first_name,  String? last_name,  String? whatsapp_number,  int? party_size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuestModel() when $default != null:
return $default(_that.first_name,_that.last_name,_that.whatsapp_number,_that.party_size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? first_name,  String? last_name,  String? whatsapp_number,  int? party_size)  $default,) {final _that = this;
switch (_that) {
case _GuestModel():
return $default(_that.first_name,_that.last_name,_that.whatsapp_number,_that.party_size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? first_name,  String? last_name,  String? whatsapp_number,  int? party_size)?  $default,) {final _that = this;
switch (_that) {
case _GuestModel() when $default != null:
return $default(_that.first_name,_that.last_name,_that.whatsapp_number,_that.party_size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuestModel implements GuestModel {
  const _GuestModel({this.first_name, this.last_name, this.whatsapp_number, this.party_size});
  factory _GuestModel.fromJson(Map<String, dynamic> json) => _$GuestModelFromJson(json);

@override final  String? first_name;
@override final  String? last_name;
@override final  String? whatsapp_number;
@override final  int? party_size;

/// Create a copy of GuestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuestModelCopyWith<_GuestModel> get copyWith => __$GuestModelCopyWithImpl<_GuestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuestModel&&(identical(other.first_name, first_name) || other.first_name == first_name)&&(identical(other.last_name, last_name) || other.last_name == last_name)&&(identical(other.whatsapp_number, whatsapp_number) || other.whatsapp_number == whatsapp_number)&&(identical(other.party_size, party_size) || other.party_size == party_size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first_name,last_name,whatsapp_number,party_size);

@override
String toString() {
  return 'GuestModel(first_name: $first_name, last_name: $last_name, whatsapp_number: $whatsapp_number, party_size: $party_size)';
}


}

/// @nodoc
abstract mixin class _$GuestModelCopyWith<$Res> implements $GuestModelCopyWith<$Res> {
  factory _$GuestModelCopyWith(_GuestModel value, $Res Function(_GuestModel) _then) = __$GuestModelCopyWithImpl;
@override @useResult
$Res call({
 String? first_name, String? last_name, String? whatsapp_number, int? party_size
});




}
/// @nodoc
class __$GuestModelCopyWithImpl<$Res>
    implements _$GuestModelCopyWith<$Res> {
  __$GuestModelCopyWithImpl(this._self, this._then);

  final _GuestModel _self;
  final $Res Function(_GuestModel) _then;

/// Create a copy of GuestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? first_name = freezed,Object? last_name = freezed,Object? whatsapp_number = freezed,Object? party_size = freezed,}) {
  return _then(_GuestModel(
first_name: freezed == first_name ? _self.first_name : first_name // ignore: cast_nullable_to_non_nullable
as String?,last_name: freezed == last_name ? _self.last_name : last_name // ignore: cast_nullable_to_non_nullable
as String?,whatsapp_number: freezed == whatsapp_number ? _self.whatsapp_number : whatsapp_number // ignore: cast_nullable_to_non_nullable
as String?,party_size: freezed == party_size ? _self.party_size : party_size // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
