// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventsResponse {

 List<Event> get events;@JsonKey(name: 'event_types') List<String> get eventTypes;
/// Create a copy of EventsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventsResponseCopyWith<EventsResponse> get copyWith => _$EventsResponseCopyWithImpl<EventsResponse>(this as EventsResponse, _$identity);

  /// Serializes this EventsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventsResponse&&const DeepCollectionEquality().equals(other.events, events)&&const DeepCollectionEquality().equals(other.eventTypes, eventTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(events),const DeepCollectionEquality().hash(eventTypes));

@override
String toString() {
  return 'EventsResponse(events: $events, eventTypes: $eventTypes)';
}


}

/// @nodoc
abstract mixin class $EventsResponseCopyWith<$Res>  {
  factory $EventsResponseCopyWith(EventsResponse value, $Res Function(EventsResponse) _then) = _$EventsResponseCopyWithImpl;
@useResult
$Res call({
 List<Event> events,@JsonKey(name: 'event_types') List<String> eventTypes
});




}
/// @nodoc
class _$EventsResponseCopyWithImpl<$Res>
    implements $EventsResponseCopyWith<$Res> {
  _$EventsResponseCopyWithImpl(this._self, this._then);

  final EventsResponse _self;
  final $Res Function(EventsResponse) _then;

/// Create a copy of EventsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? events = null,Object? eventTypes = null,}) {
  return _then(_self.copyWith(
events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<Event>,eventTypes: null == eventTypes ? _self.eventTypes : eventTypes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [EventsResponse].
extension EventsResponsePatterns on EventsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventsResponse value)  $default,){
final _that = this;
switch (_that) {
case _EventsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _EventsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Event> events, @JsonKey(name: 'event_types')  List<String> eventTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventsResponse() when $default != null:
return $default(_that.events,_that.eventTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Event> events, @JsonKey(name: 'event_types')  List<String> eventTypes)  $default,) {final _that = this;
switch (_that) {
case _EventsResponse():
return $default(_that.events,_that.eventTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Event> events, @JsonKey(name: 'event_types')  List<String> eventTypes)?  $default,) {final _that = this;
switch (_that) {
case _EventsResponse() when $default != null:
return $default(_that.events,_that.eventTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventsResponse implements EventsResponse {
  const _EventsResponse({final  List<Event> events = const <Event>[], @JsonKey(name: 'event_types') final  List<String> eventTypes = const <String>[]}): _events = events,_eventTypes = eventTypes;
  factory _EventsResponse.fromJson(Map<String, dynamic> json) => _$EventsResponseFromJson(json);

 final  List<Event> _events;
@override@JsonKey() List<Event> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

 final  List<String> _eventTypes;
@override@JsonKey(name: 'event_types') List<String> get eventTypes {
  if (_eventTypes is EqualUnmodifiableListView) return _eventTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eventTypes);
}


/// Create a copy of EventsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventsResponseCopyWith<_EventsResponse> get copyWith => __$EventsResponseCopyWithImpl<_EventsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventsResponse&&const DeepCollectionEquality().equals(other._events, _events)&&const DeepCollectionEquality().equals(other._eventTypes, _eventTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events),const DeepCollectionEquality().hash(_eventTypes));

@override
String toString() {
  return 'EventsResponse(events: $events, eventTypes: $eventTypes)';
}


}

/// @nodoc
abstract mixin class _$EventsResponseCopyWith<$Res> implements $EventsResponseCopyWith<$Res> {
  factory _$EventsResponseCopyWith(_EventsResponse value, $Res Function(_EventsResponse) _then) = __$EventsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Event> events,@JsonKey(name: 'event_types') List<String> eventTypes
});




}
/// @nodoc
class __$EventsResponseCopyWithImpl<$Res>
    implements _$EventsResponseCopyWith<$Res> {
  __$EventsResponseCopyWithImpl(this._self, this._then);

  final _EventsResponse _self;
  final $Res Function(_EventsResponse) _then;

/// Create a copy of EventsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? events = null,Object? eventTypes = null,}) {
  return _then(_EventsResponse(
events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<Event>,eventTypes: null == eventTypes ? _self._eventTypes : eventTypes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$Event {

/// "OCC-2025-029"
 String get name;/// "Birthday"
 String get type;/// "Amine"
 String get title;/// "2025-10-28 00:00:00"
@DateTimeSpaceConverter()@JsonKey(name: 'date') DateTime get date;/// "English" / "test"
 String get language;/// "https://goo.gl/maps/testing"
@JsonKey(name: 'map_link') String get mapLink;/// "Qatar"
@JsonKey(name: 'location_name') String get locationName;/// 1 => true, 0 => false
@JsonKey(name: 'show_qr')@BoolIntConverter() bool get showQr;/// "/files/event_image_20251021165520_,3pei4o3fno4j.jpg"
@JsonKey(name: 'image') String? get imagePath;/// مُستبعد من JSON — مفيد للرفع عبر multipart
@JsonKey(includeFromJson: false, includeToJson: false) File? get image;/// "Test-" أو null
@JsonKey(name: 'invite_template') String? get inviteTemplate;/// null
@JsonKey(name: 'confirmed_template') String? get confirmedTemplate;/// null
@JsonKey(name: 'declined_template') String? get declinedTemplate;/// 0
 int get docstatus;/// "Draft"
 String get status;/// قائمة الضيوف
 List<Guest> get guests;
/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventCopyWith<Event> get copyWith => _$EventCopyWithImpl<Event>(this as Event, _$identity);

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Event&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.language, language) || other.language == language)&&(identical(other.mapLink, mapLink) || other.mapLink == mapLink)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.showQr, showQr) || other.showQr == showQr)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.image, image) || other.image == image)&&(identical(other.inviteTemplate, inviteTemplate) || other.inviteTemplate == inviteTemplate)&&(identical(other.confirmedTemplate, confirmedTemplate) || other.confirmedTemplate == confirmedTemplate)&&(identical(other.declinedTemplate, declinedTemplate) || other.declinedTemplate == declinedTemplate)&&(identical(other.docstatus, docstatus) || other.docstatus == docstatus)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.guests, guests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,title,date,language,mapLink,locationName,showQr,imagePath,image,inviteTemplate,confirmedTemplate,declinedTemplate,docstatus,status,const DeepCollectionEquality().hash(guests));

@override
String toString() {
  return 'Event(name: $name, type: $type, title: $title, date: $date, language: $language, mapLink: $mapLink, locationName: $locationName, showQr: $showQr, imagePath: $imagePath, image: $image, inviteTemplate: $inviteTemplate, confirmedTemplate: $confirmedTemplate, declinedTemplate: $declinedTemplate, docstatus: $docstatus, status: $status, guests: $guests)';
}


}

/// @nodoc
abstract mixin class $EventCopyWith<$Res>  {
  factory $EventCopyWith(Event value, $Res Function(Event) _then) = _$EventCopyWithImpl;
@useResult
$Res call({
 String name, String type, String title,@DateTimeSpaceConverter()@JsonKey(name: 'date') DateTime date, String language,@JsonKey(name: 'map_link') String mapLink,@JsonKey(name: 'location_name') String locationName,@JsonKey(name: 'show_qr')@BoolIntConverter() bool showQr,@JsonKey(name: 'image') String? imagePath,@JsonKey(includeFromJson: false, includeToJson: false) File? image,@JsonKey(name: 'invite_template') String? inviteTemplate,@JsonKey(name: 'confirmed_template') String? confirmedTemplate,@JsonKey(name: 'declined_template') String? declinedTemplate, int docstatus, String status, List<Guest> guests
});




}
/// @nodoc
class _$EventCopyWithImpl<$Res>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._self, this._then);

  final Event _self;
  final $Res Function(Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? title = null,Object? date = null,Object? language = null,Object? mapLink = null,Object? locationName = null,Object? showQr = null,Object? imagePath = freezed,Object? image = freezed,Object? inviteTemplate = freezed,Object? confirmedTemplate = freezed,Object? declinedTemplate = freezed,Object? docstatus = null,Object? status = null,Object? guests = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,mapLink: null == mapLink ? _self.mapLink : mapLink // ignore: cast_nullable_to_non_nullable
as String,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,showQr: null == showQr ? _self.showQr : showQr // ignore: cast_nullable_to_non_nullable
as bool,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,inviteTemplate: freezed == inviteTemplate ? _self.inviteTemplate : inviteTemplate // ignore: cast_nullable_to_non_nullable
as String?,confirmedTemplate: freezed == confirmedTemplate ? _self.confirmedTemplate : confirmedTemplate // ignore: cast_nullable_to_non_nullable
as String?,declinedTemplate: freezed == declinedTemplate ? _self.declinedTemplate : declinedTemplate // ignore: cast_nullable_to_non_nullable
as String?,docstatus: null == docstatus ? _self.docstatus : docstatus // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as List<Guest>,
  ));
}

}


/// Adds pattern-matching-related methods to [Event].
extension EventPatterns on Event {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Event value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Event() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Event value)  $default,){
final _that = this;
switch (_that) {
case _Event():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Event value)?  $default,){
final _that = this;
switch (_that) {
case _Event() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String type,  String title, @DateTimeSpaceConverter()@JsonKey(name: 'date')  DateTime date,  String language, @JsonKey(name: 'map_link')  String mapLink, @JsonKey(name: 'location_name')  String locationName, @JsonKey(name: 'show_qr')@BoolIntConverter()  bool showQr, @JsonKey(name: 'image')  String? imagePath, @JsonKey(includeFromJson: false, includeToJson: false)  File? image, @JsonKey(name: 'invite_template')  String? inviteTemplate, @JsonKey(name: 'confirmed_template')  String? confirmedTemplate, @JsonKey(name: 'declined_template')  String? declinedTemplate,  int docstatus,  String status,  List<Guest> guests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.name,_that.type,_that.title,_that.date,_that.language,_that.mapLink,_that.locationName,_that.showQr,_that.imagePath,_that.image,_that.inviteTemplate,_that.confirmedTemplate,_that.declinedTemplate,_that.docstatus,_that.status,_that.guests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String type,  String title, @DateTimeSpaceConverter()@JsonKey(name: 'date')  DateTime date,  String language, @JsonKey(name: 'map_link')  String mapLink, @JsonKey(name: 'location_name')  String locationName, @JsonKey(name: 'show_qr')@BoolIntConverter()  bool showQr, @JsonKey(name: 'image')  String? imagePath, @JsonKey(includeFromJson: false, includeToJson: false)  File? image, @JsonKey(name: 'invite_template')  String? inviteTemplate, @JsonKey(name: 'confirmed_template')  String? confirmedTemplate, @JsonKey(name: 'declined_template')  String? declinedTemplate,  int docstatus,  String status,  List<Guest> guests)  $default,) {final _that = this;
switch (_that) {
case _Event():
return $default(_that.name,_that.type,_that.title,_that.date,_that.language,_that.mapLink,_that.locationName,_that.showQr,_that.imagePath,_that.image,_that.inviteTemplate,_that.confirmedTemplate,_that.declinedTemplate,_that.docstatus,_that.status,_that.guests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String type,  String title, @DateTimeSpaceConverter()@JsonKey(name: 'date')  DateTime date,  String language, @JsonKey(name: 'map_link')  String mapLink, @JsonKey(name: 'location_name')  String locationName, @JsonKey(name: 'show_qr')@BoolIntConverter()  bool showQr, @JsonKey(name: 'image')  String? imagePath, @JsonKey(includeFromJson: false, includeToJson: false)  File? image, @JsonKey(name: 'invite_template')  String? inviteTemplate, @JsonKey(name: 'confirmed_template')  String? confirmedTemplate, @JsonKey(name: 'declined_template')  String? declinedTemplate,  int docstatus,  String status,  List<Guest> guests)?  $default,) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.name,_that.type,_that.title,_that.date,_that.language,_that.mapLink,_that.locationName,_that.showQr,_that.imagePath,_that.image,_that.inviteTemplate,_that.confirmedTemplate,_that.declinedTemplate,_that.docstatus,_that.status,_that.guests);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Event implements Event {
  const _Event({required this.name, required this.type, required this.title, @DateTimeSpaceConverter()@JsonKey(name: 'date') required this.date, required this.language, @JsonKey(name: 'map_link') required this.mapLink, @JsonKey(name: 'location_name') required this.locationName, @JsonKey(name: 'show_qr')@BoolIntConverter() required this.showQr, @JsonKey(name: 'image') this.imagePath, @JsonKey(includeFromJson: false, includeToJson: false) this.image, @JsonKey(name: 'invite_template') this.inviteTemplate, @JsonKey(name: 'confirmed_template') this.confirmedTemplate, @JsonKey(name: 'declined_template') this.declinedTemplate, required this.docstatus, required this.status, final  List<Guest> guests = const <Guest>[]}): _guests = guests;
  factory _Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

/// "OCC-2025-029"
@override final  String name;
/// "Birthday"
@override final  String type;
/// "Amine"
@override final  String title;
/// "2025-10-28 00:00:00"
@override@DateTimeSpaceConverter()@JsonKey(name: 'date') final  DateTime date;
/// "English" / "test"
@override final  String language;
/// "https://goo.gl/maps/testing"
@override@JsonKey(name: 'map_link') final  String mapLink;
/// "Qatar"
@override@JsonKey(name: 'location_name') final  String locationName;
/// 1 => true, 0 => false
@override@JsonKey(name: 'show_qr')@BoolIntConverter() final  bool showQr;
/// "/files/event_image_20251021165520_,3pei4o3fno4j.jpg"
@override@JsonKey(name: 'image') final  String? imagePath;
/// مُستبعد من JSON — مفيد للرفع عبر multipart
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? image;
/// "Test-" أو null
@override@JsonKey(name: 'invite_template') final  String? inviteTemplate;
/// null
@override@JsonKey(name: 'confirmed_template') final  String? confirmedTemplate;
/// null
@override@JsonKey(name: 'declined_template') final  String? declinedTemplate;
/// 0
@override final  int docstatus;
/// "Draft"
@override final  String status;
/// قائمة الضيوف
 final  List<Guest> _guests;
/// قائمة الضيوف
@override@JsonKey() List<Guest> get guests {
  if (_guests is EqualUnmodifiableListView) return _guests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guests);
}


/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventCopyWith<_Event> get copyWith => __$EventCopyWithImpl<_Event>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Event&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.language, language) || other.language == language)&&(identical(other.mapLink, mapLink) || other.mapLink == mapLink)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.showQr, showQr) || other.showQr == showQr)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.image, image) || other.image == image)&&(identical(other.inviteTemplate, inviteTemplate) || other.inviteTemplate == inviteTemplate)&&(identical(other.confirmedTemplate, confirmedTemplate) || other.confirmedTemplate == confirmedTemplate)&&(identical(other.declinedTemplate, declinedTemplate) || other.declinedTemplate == declinedTemplate)&&(identical(other.docstatus, docstatus) || other.docstatus == docstatus)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._guests, _guests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,title,date,language,mapLink,locationName,showQr,imagePath,image,inviteTemplate,confirmedTemplate,declinedTemplate,docstatus,status,const DeepCollectionEquality().hash(_guests));

@override
String toString() {
  return 'Event(name: $name, type: $type, title: $title, date: $date, language: $language, mapLink: $mapLink, locationName: $locationName, showQr: $showQr, imagePath: $imagePath, image: $image, inviteTemplate: $inviteTemplate, confirmedTemplate: $confirmedTemplate, declinedTemplate: $declinedTemplate, docstatus: $docstatus, status: $status, guests: $guests)';
}


}

/// @nodoc
abstract mixin class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) _then) = __$EventCopyWithImpl;
@override @useResult
$Res call({
 String name, String type, String title,@DateTimeSpaceConverter()@JsonKey(name: 'date') DateTime date, String language,@JsonKey(name: 'map_link') String mapLink,@JsonKey(name: 'location_name') String locationName,@JsonKey(name: 'show_qr')@BoolIntConverter() bool showQr,@JsonKey(name: 'image') String? imagePath,@JsonKey(includeFromJson: false, includeToJson: false) File? image,@JsonKey(name: 'invite_template') String? inviteTemplate,@JsonKey(name: 'confirmed_template') String? confirmedTemplate,@JsonKey(name: 'declined_template') String? declinedTemplate, int docstatus, String status, List<Guest> guests
});




}
/// @nodoc
class __$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(this._self, this._then);

  final _Event _self;
  final $Res Function(_Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? title = null,Object? date = null,Object? language = null,Object? mapLink = null,Object? locationName = null,Object? showQr = null,Object? imagePath = freezed,Object? image = freezed,Object? inviteTemplate = freezed,Object? confirmedTemplate = freezed,Object? declinedTemplate = freezed,Object? docstatus = null,Object? status = null,Object? guests = null,}) {
  return _then(_Event(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,mapLink: null == mapLink ? _self.mapLink : mapLink // ignore: cast_nullable_to_non_nullable
as String,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,showQr: null == showQr ? _self.showQr : showQr // ignore: cast_nullable_to_non_nullable
as bool,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,inviteTemplate: freezed == inviteTemplate ? _self.inviteTemplate : inviteTemplate // ignore: cast_nullable_to_non_nullable
as String?,confirmedTemplate: freezed == confirmedTemplate ? _self.confirmedTemplate : confirmedTemplate // ignore: cast_nullable_to_non_nullable
as String?,declinedTemplate: freezed == declinedTemplate ? _self.declinedTemplate : declinedTemplate // ignore: cast_nullable_to_non_nullable
as String?,docstatus: null == docstatus ? _self.docstatus : docstatus // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,guests: null == guests ? _self._guests : guests // ignore: cast_nullable_to_non_nullable
as List<Guest>,
  ));
}


}


/// @nodoc
mixin _$Guest {

@JsonKey(name: 'invitee_id') String get inviteeId;@JsonKey(name: 'full_name') String get fullName;@JsonKey(name: 'whatsapp_number') String get whatsappNumber;@JsonKey(name: 'party_size') int get partySize;
/// Create a copy of Guest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestCopyWith<Guest> get copyWith => _$GuestCopyWithImpl<Guest>(this as Guest, _$identity);

  /// Serializes this Guest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Guest&&(identical(other.inviteeId, inviteeId) || other.inviteeId == inviteeId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.partySize, partySize) || other.partySize == partySize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inviteeId,fullName,whatsappNumber,partySize);

@override
String toString() {
  return 'Guest(inviteeId: $inviteeId, fullName: $fullName, whatsappNumber: $whatsappNumber, partySize: $partySize)';
}


}

/// @nodoc
abstract mixin class $GuestCopyWith<$Res>  {
  factory $GuestCopyWith(Guest value, $Res Function(Guest) _then) = _$GuestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'invitee_id') String inviteeId,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'whatsapp_number') String whatsappNumber,@JsonKey(name: 'party_size') int partySize
});




}
/// @nodoc
class _$GuestCopyWithImpl<$Res>
    implements $GuestCopyWith<$Res> {
  _$GuestCopyWithImpl(this._self, this._then);

  final Guest _self;
  final $Res Function(Guest) _then;

/// Create a copy of Guest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inviteeId = null,Object? fullName = null,Object? whatsappNumber = null,Object? partySize = null,}) {
  return _then(_self.copyWith(
inviteeId: null == inviteeId ? _self.inviteeId : inviteeId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,whatsappNumber: null == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String,partySize: null == partySize ? _self.partySize : partySize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Guest].
extension GuestPatterns on Guest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Guest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Guest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Guest value)  $default,){
final _that = this;
switch (_that) {
case _Guest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Guest value)?  $default,){
final _that = this;
switch (_that) {
case _Guest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'invitee_id')  String inviteeId, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'whatsapp_number')  String whatsappNumber, @JsonKey(name: 'party_size')  int partySize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Guest() when $default != null:
return $default(_that.inviteeId,_that.fullName,_that.whatsappNumber,_that.partySize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'invitee_id')  String inviteeId, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'whatsapp_number')  String whatsappNumber, @JsonKey(name: 'party_size')  int partySize)  $default,) {final _that = this;
switch (_that) {
case _Guest():
return $default(_that.inviteeId,_that.fullName,_that.whatsappNumber,_that.partySize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'invitee_id')  String inviteeId, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'whatsapp_number')  String whatsappNumber, @JsonKey(name: 'party_size')  int partySize)?  $default,) {final _that = this;
switch (_that) {
case _Guest() when $default != null:
return $default(_that.inviteeId,_that.fullName,_that.whatsappNumber,_that.partySize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Guest implements Guest {
  const _Guest({@JsonKey(name: 'invitee_id') required this.inviteeId, @JsonKey(name: 'full_name') required this.fullName, @JsonKey(name: 'whatsapp_number') required this.whatsappNumber, @JsonKey(name: 'party_size') required this.partySize});
  factory _Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

@override@JsonKey(name: 'invitee_id') final  String inviteeId;
@override@JsonKey(name: 'full_name') final  String fullName;
@override@JsonKey(name: 'whatsapp_number') final  String whatsappNumber;
@override@JsonKey(name: 'party_size') final  int partySize;

/// Create a copy of Guest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuestCopyWith<_Guest> get copyWith => __$GuestCopyWithImpl<_Guest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Guest&&(identical(other.inviteeId, inviteeId) || other.inviteeId == inviteeId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.partySize, partySize) || other.partySize == partySize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inviteeId,fullName,whatsappNumber,partySize);

@override
String toString() {
  return 'Guest(inviteeId: $inviteeId, fullName: $fullName, whatsappNumber: $whatsappNumber, partySize: $partySize)';
}


}

/// @nodoc
abstract mixin class _$GuestCopyWith<$Res> implements $GuestCopyWith<$Res> {
  factory _$GuestCopyWith(_Guest value, $Res Function(_Guest) _then) = __$GuestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'invitee_id') String inviteeId,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'whatsapp_number') String whatsappNumber,@JsonKey(name: 'party_size') int partySize
});




}
/// @nodoc
class __$GuestCopyWithImpl<$Res>
    implements _$GuestCopyWith<$Res> {
  __$GuestCopyWithImpl(this._self, this._then);

  final _Guest _self;
  final $Res Function(_Guest) _then;

/// Create a copy of Guest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inviteeId = null,Object? fullName = null,Object? whatsappNumber = null,Object? partySize = null,}) {
  return _then(_Guest(
inviteeId: null == inviteeId ? _self.inviteeId : inviteeId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,whatsappNumber: null == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String,partySize: null == partySize ? _self.partySize : partySize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
