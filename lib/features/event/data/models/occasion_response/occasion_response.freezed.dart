// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'occasion_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OccasionModel {

@JsonKey(name: 'occasion_id') String get occasionId; String get type; String get title; String get date; String get language;@JsonKey(name: 'map_link') String get mapLink;@JsonKey(name: 'location_name') String get locationName;@JsonKey(name: 'show_qr') int get showQr; String get image;@JsonKey(name: 'invite_template') String get inviteTemplate;@JsonKey(name: 'confirmed_template') String get confirmedTemplate;@JsonKey(name: 'declined_template') String get declinedTemplate; String get status; List<GuestModel> get guests;
/// Create a copy of OccasionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OccasionModelCopyWith<OccasionModel> get copyWith => _$OccasionModelCopyWithImpl<OccasionModel>(this as OccasionModel, _$identity);

  /// Serializes this OccasionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OccasionModel&&(identical(other.occasionId, occasionId) || other.occasionId == occasionId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.language, language) || other.language == language)&&(identical(other.mapLink, mapLink) || other.mapLink == mapLink)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.showQr, showQr) || other.showQr == showQr)&&(identical(other.image, image) || other.image == image)&&(identical(other.inviteTemplate, inviteTemplate) || other.inviteTemplate == inviteTemplate)&&(identical(other.confirmedTemplate, confirmedTemplate) || other.confirmedTemplate == confirmedTemplate)&&(identical(other.declinedTemplate, declinedTemplate) || other.declinedTemplate == declinedTemplate)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.guests, guests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,occasionId,type,title,date,language,mapLink,locationName,showQr,image,inviteTemplate,confirmedTemplate,declinedTemplate,status,const DeepCollectionEquality().hash(guests));

@override
String toString() {
  return 'OccasionModel(occasionId: $occasionId, type: $type, title: $title, date: $date, language: $language, mapLink: $mapLink, locationName: $locationName, showQr: $showQr, image: $image, inviteTemplate: $inviteTemplate, confirmedTemplate: $confirmedTemplate, declinedTemplate: $declinedTemplate, status: $status, guests: $guests)';
}


}

/// @nodoc
abstract mixin class $OccasionModelCopyWith<$Res>  {
  factory $OccasionModelCopyWith(OccasionModel value, $Res Function(OccasionModel) _then) = _$OccasionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'occasion_id') String occasionId, String type, String title, String date, String language,@JsonKey(name: 'map_link') String mapLink,@JsonKey(name: 'location_name') String locationName,@JsonKey(name: 'show_qr') int showQr, String image,@JsonKey(name: 'invite_template') String inviteTemplate,@JsonKey(name: 'confirmed_template') String confirmedTemplate,@JsonKey(name: 'declined_template') String declinedTemplate, String status, List<GuestModel> guests
});




}
/// @nodoc
class _$OccasionModelCopyWithImpl<$Res>
    implements $OccasionModelCopyWith<$Res> {
  _$OccasionModelCopyWithImpl(this._self, this._then);

  final OccasionModel _self;
  final $Res Function(OccasionModel) _then;

/// Create a copy of OccasionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? occasionId = null,Object? type = null,Object? title = null,Object? date = null,Object? language = null,Object? mapLink = null,Object? locationName = null,Object? showQr = null,Object? image = null,Object? inviteTemplate = null,Object? confirmedTemplate = null,Object? declinedTemplate = null,Object? status = null,Object? guests = null,}) {
  return _then(_self.copyWith(
occasionId: null == occasionId ? _self.occasionId : occasionId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,mapLink: null == mapLink ? _self.mapLink : mapLink // ignore: cast_nullable_to_non_nullable
as String,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,showQr: null == showQr ? _self.showQr : showQr // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,inviteTemplate: null == inviteTemplate ? _self.inviteTemplate : inviteTemplate // ignore: cast_nullable_to_non_nullable
as String,confirmedTemplate: null == confirmedTemplate ? _self.confirmedTemplate : confirmedTemplate // ignore: cast_nullable_to_non_nullable
as String,declinedTemplate: null == declinedTemplate ? _self.declinedTemplate : declinedTemplate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as List<GuestModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [OccasionModel].
extension OccasionModelPatterns on OccasionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OccasionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OccasionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OccasionModel value)  $default,){
final _that = this;
switch (_that) {
case _OccasionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OccasionModel value)?  $default,){
final _that = this;
switch (_that) {
case _OccasionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'occasion_id')  String occasionId,  String type,  String title,  String date,  String language, @JsonKey(name: 'map_link')  String mapLink, @JsonKey(name: 'location_name')  String locationName, @JsonKey(name: 'show_qr')  int showQr,  String image, @JsonKey(name: 'invite_template')  String inviteTemplate, @JsonKey(name: 'confirmed_template')  String confirmedTemplate, @JsonKey(name: 'declined_template')  String declinedTemplate,  String status,  List<GuestModel> guests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OccasionModel() when $default != null:
return $default(_that.occasionId,_that.type,_that.title,_that.date,_that.language,_that.mapLink,_that.locationName,_that.showQr,_that.image,_that.inviteTemplate,_that.confirmedTemplate,_that.declinedTemplate,_that.status,_that.guests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'occasion_id')  String occasionId,  String type,  String title,  String date,  String language, @JsonKey(name: 'map_link')  String mapLink, @JsonKey(name: 'location_name')  String locationName, @JsonKey(name: 'show_qr')  int showQr,  String image, @JsonKey(name: 'invite_template')  String inviteTemplate, @JsonKey(name: 'confirmed_template')  String confirmedTemplate, @JsonKey(name: 'declined_template')  String declinedTemplate,  String status,  List<GuestModel> guests)  $default,) {final _that = this;
switch (_that) {
case _OccasionModel():
return $default(_that.occasionId,_that.type,_that.title,_that.date,_that.language,_that.mapLink,_that.locationName,_that.showQr,_that.image,_that.inviteTemplate,_that.confirmedTemplate,_that.declinedTemplate,_that.status,_that.guests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'occasion_id')  String occasionId,  String type,  String title,  String date,  String language, @JsonKey(name: 'map_link')  String mapLink, @JsonKey(name: 'location_name')  String locationName, @JsonKey(name: 'show_qr')  int showQr,  String image, @JsonKey(name: 'invite_template')  String inviteTemplate, @JsonKey(name: 'confirmed_template')  String confirmedTemplate, @JsonKey(name: 'declined_template')  String declinedTemplate,  String status,  List<GuestModel> guests)?  $default,) {final _that = this;
switch (_that) {
case _OccasionModel() when $default != null:
return $default(_that.occasionId,_that.type,_that.title,_that.date,_that.language,_that.mapLink,_that.locationName,_that.showQr,_that.image,_that.inviteTemplate,_that.confirmedTemplate,_that.declinedTemplate,_that.status,_that.guests);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OccasionModel implements OccasionModel {
  const _OccasionModel({@JsonKey(name: 'occasion_id') required this.occasionId, required this.type, required this.title, required this.date, required this.language, @JsonKey(name: 'map_link') required this.mapLink, @JsonKey(name: 'location_name') required this.locationName, @JsonKey(name: 'show_qr') required this.showQr, required this.image, @JsonKey(name: 'invite_template') required this.inviteTemplate, @JsonKey(name: 'confirmed_template') required this.confirmedTemplate, @JsonKey(name: 'declined_template') required this.declinedTemplate, required this.status, required final  List<GuestModel> guests}): _guests = guests;
  factory _OccasionModel.fromJson(Map<String, dynamic> json) => _$OccasionModelFromJson(json);

@override@JsonKey(name: 'occasion_id') final  String occasionId;
@override final  String type;
@override final  String title;
@override final  String date;
@override final  String language;
@override@JsonKey(name: 'map_link') final  String mapLink;
@override@JsonKey(name: 'location_name') final  String locationName;
@override@JsonKey(name: 'show_qr') final  int showQr;
@override final  String image;
@override@JsonKey(name: 'invite_template') final  String inviteTemplate;
@override@JsonKey(name: 'confirmed_template') final  String confirmedTemplate;
@override@JsonKey(name: 'declined_template') final  String declinedTemplate;
@override final  String status;
 final  List<GuestModel> _guests;
@override List<GuestModel> get guests {
  if (_guests is EqualUnmodifiableListView) return _guests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guests);
}


/// Create a copy of OccasionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OccasionModelCopyWith<_OccasionModel> get copyWith => __$OccasionModelCopyWithImpl<_OccasionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OccasionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OccasionModel&&(identical(other.occasionId, occasionId) || other.occasionId == occasionId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.language, language) || other.language == language)&&(identical(other.mapLink, mapLink) || other.mapLink == mapLink)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.showQr, showQr) || other.showQr == showQr)&&(identical(other.image, image) || other.image == image)&&(identical(other.inviteTemplate, inviteTemplate) || other.inviteTemplate == inviteTemplate)&&(identical(other.confirmedTemplate, confirmedTemplate) || other.confirmedTemplate == confirmedTemplate)&&(identical(other.declinedTemplate, declinedTemplate) || other.declinedTemplate == declinedTemplate)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._guests, _guests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,occasionId,type,title,date,language,mapLink,locationName,showQr,image,inviteTemplate,confirmedTemplate,declinedTemplate,status,const DeepCollectionEquality().hash(_guests));

@override
String toString() {
  return 'OccasionModel(occasionId: $occasionId, type: $type, title: $title, date: $date, language: $language, mapLink: $mapLink, locationName: $locationName, showQr: $showQr, image: $image, inviteTemplate: $inviteTemplate, confirmedTemplate: $confirmedTemplate, declinedTemplate: $declinedTemplate, status: $status, guests: $guests)';
}


}

/// @nodoc
abstract mixin class _$OccasionModelCopyWith<$Res> implements $OccasionModelCopyWith<$Res> {
  factory _$OccasionModelCopyWith(_OccasionModel value, $Res Function(_OccasionModel) _then) = __$OccasionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'occasion_id') String occasionId, String type, String title, String date, String language,@JsonKey(name: 'map_link') String mapLink,@JsonKey(name: 'location_name') String locationName,@JsonKey(name: 'show_qr') int showQr, String image,@JsonKey(name: 'invite_template') String inviteTemplate,@JsonKey(name: 'confirmed_template') String confirmedTemplate,@JsonKey(name: 'declined_template') String declinedTemplate, String status, List<GuestModel> guests
});




}
/// @nodoc
class __$OccasionModelCopyWithImpl<$Res>
    implements _$OccasionModelCopyWith<$Res> {
  __$OccasionModelCopyWithImpl(this._self, this._then);

  final _OccasionModel _self;
  final $Res Function(_OccasionModel) _then;

/// Create a copy of OccasionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? occasionId = null,Object? type = null,Object? title = null,Object? date = null,Object? language = null,Object? mapLink = null,Object? locationName = null,Object? showQr = null,Object? image = null,Object? inviteTemplate = null,Object? confirmedTemplate = null,Object? declinedTemplate = null,Object? status = null,Object? guests = null,}) {
  return _then(_OccasionModel(
occasionId: null == occasionId ? _self.occasionId : occasionId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,mapLink: null == mapLink ? _self.mapLink : mapLink // ignore: cast_nullable_to_non_nullable
as String,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,showQr: null == showQr ? _self.showQr : showQr // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,inviteTemplate: null == inviteTemplate ? _self.inviteTemplate : inviteTemplate // ignore: cast_nullable_to_non_nullable
as String,confirmedTemplate: null == confirmedTemplate ? _self.confirmedTemplate : confirmedTemplate // ignore: cast_nullable_to_non_nullable
as String,declinedTemplate: null == declinedTemplate ? _self.declinedTemplate : declinedTemplate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,guests: null == guests ? _self._guests : guests // ignore: cast_nullable_to_non_nullable
as List<GuestModel>,
  ));
}


}


/// @nodoc
mixin _$GuestModel {

@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName;@JsonKey(name: 'whatsapp_number') String get whatsappNumber;@JsonKey(name: 'party_size') int get partySize;
/// Create a copy of GuestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestModelCopyWith<GuestModel> get copyWith => _$GuestModelCopyWithImpl<GuestModel>(this as GuestModel, _$identity);

  /// Serializes this GuestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.partySize, partySize) || other.partySize == partySize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,whatsappNumber,partySize);

@override
String toString() {
  return 'GuestModel(firstName: $firstName, lastName: $lastName, whatsappNumber: $whatsappNumber, partySize: $partySize)';
}


}

/// @nodoc
abstract mixin class $GuestModelCopyWith<$Res>  {
  factory $GuestModelCopyWith(GuestModel value, $Res Function(GuestModel) _then) = _$GuestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'whatsapp_number') String whatsappNumber,@JsonKey(name: 'party_size') int partySize
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
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? whatsappNumber = null,Object? partySize = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,whatsappNumber: null == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String,partySize: null == partySize ? _self.partySize : partySize // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'whatsapp_number')  String whatsappNumber, @JsonKey(name: 'party_size')  int partySize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuestModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.whatsappNumber,_that.partySize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'whatsapp_number')  String whatsappNumber, @JsonKey(name: 'party_size')  int partySize)  $default,) {final _that = this;
switch (_that) {
case _GuestModel():
return $default(_that.firstName,_that.lastName,_that.whatsappNumber,_that.partySize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'whatsapp_number')  String whatsappNumber, @JsonKey(name: 'party_size')  int partySize)?  $default,) {final _that = this;
switch (_that) {
case _GuestModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.whatsappNumber,_that.partySize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuestModel implements GuestModel {
  const _GuestModel({@JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, @JsonKey(name: 'whatsapp_number') required this.whatsappNumber, @JsonKey(name: 'party_size') required this.partySize});
  factory _GuestModel.fromJson(Map<String, dynamic> json) => _$GuestModelFromJson(json);

@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey(name: 'whatsapp_number') final  String whatsappNumber;
@override@JsonKey(name: 'party_size') final  int partySize;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuestModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.partySize, partySize) || other.partySize == partySize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,whatsappNumber,partySize);

@override
String toString() {
  return 'GuestModel(firstName: $firstName, lastName: $lastName, whatsappNumber: $whatsappNumber, partySize: $partySize)';
}


}

/// @nodoc
abstract mixin class _$GuestModelCopyWith<$Res> implements $GuestModelCopyWith<$Res> {
  factory _$GuestModelCopyWith(_GuestModel value, $Res Function(_GuestModel) _then) = __$GuestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'whatsapp_number') String whatsappNumber,@JsonKey(name: 'party_size') int partySize
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
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? whatsappNumber = null,Object? partySize = null,}) {
  return _then(_GuestModel(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,whatsappNumber: null == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String,partySize: null == partySize ? _self.partySize : partySize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
