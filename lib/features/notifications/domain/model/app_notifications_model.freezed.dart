// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notifications_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppNotificationsModel {

@JsonKey(name: 'app_message_id') String get appMessageId;@JsonKey(name: 'app_message_title') String? get appMessageTitle;@JsonKey(name: 'app_message_icon') String? get appMessageIcon; String get type; String? get item;@JsonKey(name: "published_on") String? get publishedOn;@JsonKey(name: "expiry_date") String? get expiryDate;@JsonKey(name: "content") String? get content;
/// Create a copy of AppNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationsModelCopyWith<AppNotificationsModel> get copyWith => _$AppNotificationsModelCopyWithImpl<AppNotificationsModel>(this as AppNotificationsModel, _$identity);

  /// Serializes this AppNotificationsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotificationsModel&&(identical(other.appMessageId, appMessageId) || other.appMessageId == appMessageId)&&(identical(other.appMessageTitle, appMessageTitle) || other.appMessageTitle == appMessageTitle)&&(identical(other.appMessageIcon, appMessageIcon) || other.appMessageIcon == appMessageIcon)&&(identical(other.type, type) || other.type == type)&&(identical(other.item, item) || other.item == item)&&(identical(other.publishedOn, publishedOn) || other.publishedOn == publishedOn)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appMessageId,appMessageTitle,appMessageIcon,type,item,publishedOn,expiryDate,content);

@override
String toString() {
  return 'AppNotificationsModel(appMessageId: $appMessageId, appMessageTitle: $appMessageTitle, appMessageIcon: $appMessageIcon, type: $type, item: $item, publishedOn: $publishedOn, expiryDate: $expiryDate, content: $content)';
}


}

/// @nodoc
abstract mixin class $AppNotificationsModelCopyWith<$Res>  {
  factory $AppNotificationsModelCopyWith(AppNotificationsModel value, $Res Function(AppNotificationsModel) _then) = _$AppNotificationsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'app_message_id') String appMessageId,@JsonKey(name: 'app_message_title') String? appMessageTitle,@JsonKey(name: 'app_message_icon') String? appMessageIcon, String type, String? item,@JsonKey(name: "published_on") String? publishedOn,@JsonKey(name: "expiry_date") String? expiryDate,@JsonKey(name: "content") String? content
});




}
/// @nodoc
class _$AppNotificationsModelCopyWithImpl<$Res>
    implements $AppNotificationsModelCopyWith<$Res> {
  _$AppNotificationsModelCopyWithImpl(this._self, this._then);

  final AppNotificationsModel _self;
  final $Res Function(AppNotificationsModel) _then;

/// Create a copy of AppNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appMessageId = null,Object? appMessageTitle = freezed,Object? appMessageIcon = freezed,Object? type = null,Object? item = freezed,Object? publishedOn = freezed,Object? expiryDate = freezed,Object? content = freezed,}) {
  return _then(_self.copyWith(
appMessageId: null == appMessageId ? _self.appMessageId : appMessageId // ignore: cast_nullable_to_non_nullable
as String,appMessageTitle: freezed == appMessageTitle ? _self.appMessageTitle : appMessageTitle // ignore: cast_nullable_to_non_nullable
as String?,appMessageIcon: freezed == appMessageIcon ? _self.appMessageIcon : appMessageIcon // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String?,publishedOn: freezed == publishedOn ? _self.publishedOn : publishedOn // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppNotificationsModel].
extension AppNotificationsModelPatterns on AppNotificationsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotificationsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotificationsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotificationsModel value)  $default,){
final _that = this;
switch (_that) {
case _AppNotificationsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotificationsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotificationsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'app_message_id')  String appMessageId, @JsonKey(name: 'app_message_title')  String? appMessageTitle, @JsonKey(name: 'app_message_icon')  String? appMessageIcon,  String type,  String? item, @JsonKey(name: "published_on")  String? publishedOn, @JsonKey(name: "expiry_date")  String? expiryDate, @JsonKey(name: "content")  String? content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotificationsModel() when $default != null:
return $default(_that.appMessageId,_that.appMessageTitle,_that.appMessageIcon,_that.type,_that.item,_that.publishedOn,_that.expiryDate,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'app_message_id')  String appMessageId, @JsonKey(name: 'app_message_title')  String? appMessageTitle, @JsonKey(name: 'app_message_icon')  String? appMessageIcon,  String type,  String? item, @JsonKey(name: "published_on")  String? publishedOn, @JsonKey(name: "expiry_date")  String? expiryDate, @JsonKey(name: "content")  String? content)  $default,) {final _that = this;
switch (_that) {
case _AppNotificationsModel():
return $default(_that.appMessageId,_that.appMessageTitle,_that.appMessageIcon,_that.type,_that.item,_that.publishedOn,_that.expiryDate,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'app_message_id')  String appMessageId, @JsonKey(name: 'app_message_title')  String? appMessageTitle, @JsonKey(name: 'app_message_icon')  String? appMessageIcon,  String type,  String? item, @JsonKey(name: "published_on")  String? publishedOn, @JsonKey(name: "expiry_date")  String? expiryDate, @JsonKey(name: "content")  String? content)?  $default,) {final _that = this;
switch (_that) {
case _AppNotificationsModel() when $default != null:
return $default(_that.appMessageId,_that.appMessageTitle,_that.appMessageIcon,_that.type,_that.item,_that.publishedOn,_that.expiryDate,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppNotificationsModel implements AppNotificationsModel {
  const _AppNotificationsModel({@JsonKey(name: 'app_message_id') required this.appMessageId, @JsonKey(name: 'app_message_title') required this.appMessageTitle, @JsonKey(name: 'app_message_icon') required this.appMessageIcon, required this.type, required this.item, @JsonKey(name: "published_on") required this.publishedOn, @JsonKey(name: "expiry_date") required this.expiryDate, @JsonKey(name: "content") required this.content});
  factory _AppNotificationsModel.fromJson(Map<String, dynamic> json) => _$AppNotificationsModelFromJson(json);

@override@JsonKey(name: 'app_message_id') final  String appMessageId;
@override@JsonKey(name: 'app_message_title') final  String? appMessageTitle;
@override@JsonKey(name: 'app_message_icon') final  String? appMessageIcon;
@override final  String type;
@override final  String? item;
@override@JsonKey(name: "published_on") final  String? publishedOn;
@override@JsonKey(name: "expiry_date") final  String? expiryDate;
@override@JsonKey(name: "content") final  String? content;

/// Create a copy of AppNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationsModelCopyWith<_AppNotificationsModel> get copyWith => __$AppNotificationsModelCopyWithImpl<_AppNotificationsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppNotificationsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotificationsModel&&(identical(other.appMessageId, appMessageId) || other.appMessageId == appMessageId)&&(identical(other.appMessageTitle, appMessageTitle) || other.appMessageTitle == appMessageTitle)&&(identical(other.appMessageIcon, appMessageIcon) || other.appMessageIcon == appMessageIcon)&&(identical(other.type, type) || other.type == type)&&(identical(other.item, item) || other.item == item)&&(identical(other.publishedOn, publishedOn) || other.publishedOn == publishedOn)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appMessageId,appMessageTitle,appMessageIcon,type,item,publishedOn,expiryDate,content);

@override
String toString() {
  return 'AppNotificationsModel(appMessageId: $appMessageId, appMessageTitle: $appMessageTitle, appMessageIcon: $appMessageIcon, type: $type, item: $item, publishedOn: $publishedOn, expiryDate: $expiryDate, content: $content)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationsModelCopyWith<$Res> implements $AppNotificationsModelCopyWith<$Res> {
  factory _$AppNotificationsModelCopyWith(_AppNotificationsModel value, $Res Function(_AppNotificationsModel) _then) = __$AppNotificationsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'app_message_id') String appMessageId,@JsonKey(name: 'app_message_title') String? appMessageTitle,@JsonKey(name: 'app_message_icon') String? appMessageIcon, String type, String? item,@JsonKey(name: "published_on") String? publishedOn,@JsonKey(name: "expiry_date") String? expiryDate,@JsonKey(name: "content") String? content
});




}
/// @nodoc
class __$AppNotificationsModelCopyWithImpl<$Res>
    implements _$AppNotificationsModelCopyWith<$Res> {
  __$AppNotificationsModelCopyWithImpl(this._self, this._then);

  final _AppNotificationsModel _self;
  final $Res Function(_AppNotificationsModel) _then;

/// Create a copy of AppNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appMessageId = null,Object? appMessageTitle = freezed,Object? appMessageIcon = freezed,Object? type = null,Object? item = freezed,Object? publishedOn = freezed,Object? expiryDate = freezed,Object? content = freezed,}) {
  return _then(_AppNotificationsModel(
appMessageId: null == appMessageId ? _self.appMessageId : appMessageId // ignore: cast_nullable_to_non_nullable
as String,appMessageTitle: freezed == appMessageTitle ? _self.appMessageTitle : appMessageTitle // ignore: cast_nullable_to_non_nullable
as String?,appMessageIcon: freezed == appMessageIcon ? _self.appMessageIcon : appMessageIcon // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String?,publishedOn: freezed == publishedOn ? _self.publishedOn : publishedOn // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
