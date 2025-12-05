// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utils_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UtilsResponse {

 SubscriberModel? get subscriber;@JsonKey(name: 'event_types') List<String>? get eventTypes;@JsonKey(name: 'subscriptions') List<SubscriptionModel>? get subscriptions;
/// Create a copy of UtilsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UtilsResponseCopyWith<UtilsResponse> get copyWith => _$UtilsResponseCopyWithImpl<UtilsResponse>(this as UtilsResponse, _$identity);

  /// Serializes this UtilsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UtilsResponse&&(identical(other.subscriber, subscriber) || other.subscriber == subscriber)&&const DeepCollectionEquality().equals(other.eventTypes, eventTypes)&&const DeepCollectionEquality().equals(other.subscriptions, subscriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subscriber,const DeepCollectionEquality().hash(eventTypes),const DeepCollectionEquality().hash(subscriptions));

@override
String toString() {
  return 'UtilsResponse(subscriber: $subscriber, eventTypes: $eventTypes, subscriptions: $subscriptions)';
}


}

/// @nodoc
abstract mixin class $UtilsResponseCopyWith<$Res>  {
  factory $UtilsResponseCopyWith(UtilsResponse value, $Res Function(UtilsResponse) _then) = _$UtilsResponseCopyWithImpl;
@useResult
$Res call({
 SubscriberModel? subscriber,@JsonKey(name: 'event_types') List<String>? eventTypes,@JsonKey(name: 'subscriptions') List<SubscriptionModel>? subscriptions
});


$SubscriberModelCopyWith<$Res>? get subscriber;

}
/// @nodoc
class _$UtilsResponseCopyWithImpl<$Res>
    implements $UtilsResponseCopyWith<$Res> {
  _$UtilsResponseCopyWithImpl(this._self, this._then);

  final UtilsResponse _self;
  final $Res Function(UtilsResponse) _then;

/// Create a copy of UtilsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subscriber = freezed,Object? eventTypes = freezed,Object? subscriptions = freezed,}) {
  return _then(_self.copyWith(
subscriber: freezed == subscriber ? _self.subscriber : subscriber // ignore: cast_nullable_to_non_nullable
as SubscriberModel?,eventTypes: freezed == eventTypes ? _self.eventTypes : eventTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,subscriptions: freezed == subscriptions ? _self.subscriptions : subscriptions // ignore: cast_nullable_to_non_nullable
as List<SubscriptionModel>?,
  ));
}
/// Create a copy of UtilsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriberModelCopyWith<$Res>? get subscriber {
    if (_self.subscriber == null) {
    return null;
  }

  return $SubscriberModelCopyWith<$Res>(_self.subscriber!, (value) {
    return _then(_self.copyWith(subscriber: value));
  });
}
}


/// Adds pattern-matching-related methods to [UtilsResponse].
extension UtilsResponsePatterns on UtilsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UtilsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UtilsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UtilsResponse value)  $default,){
final _that = this;
switch (_that) {
case _UtilsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UtilsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UtilsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SubscriberModel? subscriber, @JsonKey(name: 'event_types')  List<String>? eventTypes, @JsonKey(name: 'subscriptions')  List<SubscriptionModel>? subscriptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UtilsResponse() when $default != null:
return $default(_that.subscriber,_that.eventTypes,_that.subscriptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SubscriberModel? subscriber, @JsonKey(name: 'event_types')  List<String>? eventTypes, @JsonKey(name: 'subscriptions')  List<SubscriptionModel>? subscriptions)  $default,) {final _that = this;
switch (_that) {
case _UtilsResponse():
return $default(_that.subscriber,_that.eventTypes,_that.subscriptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SubscriberModel? subscriber, @JsonKey(name: 'event_types')  List<String>? eventTypes, @JsonKey(name: 'subscriptions')  List<SubscriptionModel>? subscriptions)?  $default,) {final _that = this;
switch (_that) {
case _UtilsResponse() when $default != null:
return $default(_that.subscriber,_that.eventTypes,_that.subscriptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UtilsResponse implements UtilsResponse {
  const _UtilsResponse({this.subscriber, @JsonKey(name: 'event_types') final  List<String>? eventTypes, @JsonKey(name: 'subscriptions') final  List<SubscriptionModel>? subscriptions}): _eventTypes = eventTypes,_subscriptions = subscriptions;
  factory _UtilsResponse.fromJson(Map<String, dynamic> json) => _$UtilsResponseFromJson(json);

@override final  SubscriberModel? subscriber;
 final  List<String>? _eventTypes;
@override@JsonKey(name: 'event_types') List<String>? get eventTypes {
  final value = _eventTypes;
  if (value == null) return null;
  if (_eventTypes is EqualUnmodifiableListView) return _eventTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SubscriptionModel>? _subscriptions;
@override@JsonKey(name: 'subscriptions') List<SubscriptionModel>? get subscriptions {
  final value = _subscriptions;
  if (value == null) return null;
  if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UtilsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UtilsResponseCopyWith<_UtilsResponse> get copyWith => __$UtilsResponseCopyWithImpl<_UtilsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UtilsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UtilsResponse&&(identical(other.subscriber, subscriber) || other.subscriber == subscriber)&&const DeepCollectionEquality().equals(other._eventTypes, _eventTypes)&&const DeepCollectionEquality().equals(other._subscriptions, _subscriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subscriber,const DeepCollectionEquality().hash(_eventTypes),const DeepCollectionEquality().hash(_subscriptions));

@override
String toString() {
  return 'UtilsResponse(subscriber: $subscriber, eventTypes: $eventTypes, subscriptions: $subscriptions)';
}


}

/// @nodoc
abstract mixin class _$UtilsResponseCopyWith<$Res> implements $UtilsResponseCopyWith<$Res> {
  factory _$UtilsResponseCopyWith(_UtilsResponse value, $Res Function(_UtilsResponse) _then) = __$UtilsResponseCopyWithImpl;
@override @useResult
$Res call({
 SubscriberModel? subscriber,@JsonKey(name: 'event_types') List<String>? eventTypes,@JsonKey(name: 'subscriptions') List<SubscriptionModel>? subscriptions
});


@override $SubscriberModelCopyWith<$Res>? get subscriber;

}
/// @nodoc
class __$UtilsResponseCopyWithImpl<$Res>
    implements _$UtilsResponseCopyWith<$Res> {
  __$UtilsResponseCopyWithImpl(this._self, this._then);

  final _UtilsResponse _self;
  final $Res Function(_UtilsResponse) _then;

/// Create a copy of UtilsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subscriber = freezed,Object? eventTypes = freezed,Object? subscriptions = freezed,}) {
  return _then(_UtilsResponse(
subscriber: freezed == subscriber ? _self.subscriber : subscriber // ignore: cast_nullable_to_non_nullable
as SubscriberModel?,eventTypes: freezed == eventTypes ? _self._eventTypes : eventTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,subscriptions: freezed == subscriptions ? _self._subscriptions : subscriptions // ignore: cast_nullable_to_non_nullable
as List<SubscriptionModel>?,
  ));
}

/// Create a copy of UtilsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriberModelCopyWith<$Res>? get subscriber {
    if (_self.subscriber == null) {
    return null;
  }

  return $SubscriberModelCopyWith<$Res>(_self.subscriber!, (value) {
    return _then(_self.copyWith(subscriber: value));
  });
}
}


/// @nodoc
mixin _$SubscriberModel {

 String? get name;@JsonKey(name: 'subscription_type') String? get subscriptionType;@JsonKey(name: 'expiry_date') String? get expiryDate; String? get mobile; String? get email;@JsonKey(name: 'max_kroots') int? get maxKroots;@JsonKey(name: 'remaining_kroots') int? get remainingKroots;@JsonKey(name: 'csv_import') int? get csvImport;@JsonKey(name: 'premium_designs') int? get premiumDesigns; int? get operators;@JsonKey(name: 'sub_account') int? get subAccount; String? get subscriber;
/// Create a copy of SubscriberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriberModelCopyWith<SubscriberModel> get copyWith => _$SubscriberModelCopyWithImpl<SubscriberModel>(this as SubscriberModel, _$identity);

  /// Serializes this SubscriberModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriberModel&&(identical(other.name, name) || other.name == name)&&(identical(other.subscriptionType, subscriptionType) || other.subscriptionType == subscriptionType)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.maxKroots, maxKroots) || other.maxKroots == maxKroots)&&(identical(other.remainingKroots, remainingKroots) || other.remainingKroots == remainingKroots)&&(identical(other.csvImport, csvImport) || other.csvImport == csvImport)&&(identical(other.premiumDesigns, premiumDesigns) || other.premiumDesigns == premiumDesigns)&&(identical(other.operators, operators) || other.operators == operators)&&(identical(other.subAccount, subAccount) || other.subAccount == subAccount)&&(identical(other.subscriber, subscriber) || other.subscriber == subscriber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,subscriptionType,expiryDate,mobile,email,maxKroots,remainingKroots,csvImport,premiumDesigns,operators,subAccount,subscriber);

@override
String toString() {
  return 'SubscriberModel(name: $name, subscriptionType: $subscriptionType, expiryDate: $expiryDate, mobile: $mobile, email: $email, maxKroots: $maxKroots, remainingKroots: $remainingKroots, csvImport: $csvImport, premiumDesigns: $premiumDesigns, operators: $operators, subAccount: $subAccount, subscriber: $subscriber)';
}


}

/// @nodoc
abstract mixin class $SubscriberModelCopyWith<$Res>  {
  factory $SubscriberModelCopyWith(SubscriberModel value, $Res Function(SubscriberModel) _then) = _$SubscriberModelCopyWithImpl;
@useResult
$Res call({
 String? name,@JsonKey(name: 'subscription_type') String? subscriptionType,@JsonKey(name: 'expiry_date') String? expiryDate, String? mobile, String? email,@JsonKey(name: 'max_kroots') int? maxKroots,@JsonKey(name: 'remaining_kroots') int? remainingKroots,@JsonKey(name: 'csv_import') int? csvImport,@JsonKey(name: 'premium_designs') int? premiumDesigns, int? operators,@JsonKey(name: 'sub_account') int? subAccount, String? subscriber
});




}
/// @nodoc
class _$SubscriberModelCopyWithImpl<$Res>
    implements $SubscriberModelCopyWith<$Res> {
  _$SubscriberModelCopyWithImpl(this._self, this._then);

  final SubscriberModel _self;
  final $Res Function(SubscriberModel) _then;

/// Create a copy of SubscriberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? subscriptionType = freezed,Object? expiryDate = freezed,Object? mobile = freezed,Object? email = freezed,Object? maxKroots = freezed,Object? remainingKroots = freezed,Object? csvImport = freezed,Object? premiumDesigns = freezed,Object? operators = freezed,Object? subAccount = freezed,Object? subscriber = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,subscriptionType: freezed == subscriptionType ? _self.subscriptionType : subscriptionType // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,maxKroots: freezed == maxKroots ? _self.maxKroots : maxKroots // ignore: cast_nullable_to_non_nullable
as int?,remainingKroots: freezed == remainingKroots ? _self.remainingKroots : remainingKroots // ignore: cast_nullable_to_non_nullable
as int?,csvImport: freezed == csvImport ? _self.csvImport : csvImport // ignore: cast_nullable_to_non_nullable
as int?,premiumDesigns: freezed == premiumDesigns ? _self.premiumDesigns : premiumDesigns // ignore: cast_nullable_to_non_nullable
as int?,operators: freezed == operators ? _self.operators : operators // ignore: cast_nullable_to_non_nullable
as int?,subAccount: freezed == subAccount ? _self.subAccount : subAccount // ignore: cast_nullable_to_non_nullable
as int?,subscriber: freezed == subscriber ? _self.subscriber : subscriber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriberModel].
extension SubscriberModelPatterns on SubscriberModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriberModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriberModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriberModel value)  $default,){
final _that = this;
switch (_that) {
case _SubscriberModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriberModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriberModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name, @JsonKey(name: 'subscription_type')  String? subscriptionType, @JsonKey(name: 'expiry_date')  String? expiryDate,  String? mobile,  String? email, @JsonKey(name: 'max_kroots')  int? maxKroots, @JsonKey(name: 'remaining_kroots')  int? remainingKroots, @JsonKey(name: 'csv_import')  int? csvImport, @JsonKey(name: 'premium_designs')  int? premiumDesigns,  int? operators, @JsonKey(name: 'sub_account')  int? subAccount,  String? subscriber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriberModel() when $default != null:
return $default(_that.name,_that.subscriptionType,_that.expiryDate,_that.mobile,_that.email,_that.maxKroots,_that.remainingKroots,_that.csvImport,_that.premiumDesigns,_that.operators,_that.subAccount,_that.subscriber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name, @JsonKey(name: 'subscription_type')  String? subscriptionType, @JsonKey(name: 'expiry_date')  String? expiryDate,  String? mobile,  String? email, @JsonKey(name: 'max_kroots')  int? maxKroots, @JsonKey(name: 'remaining_kroots')  int? remainingKroots, @JsonKey(name: 'csv_import')  int? csvImport, @JsonKey(name: 'premium_designs')  int? premiumDesigns,  int? operators, @JsonKey(name: 'sub_account')  int? subAccount,  String? subscriber)  $default,) {final _that = this;
switch (_that) {
case _SubscriberModel():
return $default(_that.name,_that.subscriptionType,_that.expiryDate,_that.mobile,_that.email,_that.maxKroots,_that.remainingKroots,_that.csvImport,_that.premiumDesigns,_that.operators,_that.subAccount,_that.subscriber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name, @JsonKey(name: 'subscription_type')  String? subscriptionType, @JsonKey(name: 'expiry_date')  String? expiryDate,  String? mobile,  String? email, @JsonKey(name: 'max_kroots')  int? maxKroots, @JsonKey(name: 'remaining_kroots')  int? remainingKroots, @JsonKey(name: 'csv_import')  int? csvImport, @JsonKey(name: 'premium_designs')  int? premiumDesigns,  int? operators, @JsonKey(name: 'sub_account')  int? subAccount,  String? subscriber)?  $default,) {final _that = this;
switch (_that) {
case _SubscriberModel() when $default != null:
return $default(_that.name,_that.subscriptionType,_that.expiryDate,_that.mobile,_that.email,_that.maxKroots,_that.remainingKroots,_that.csvImport,_that.premiumDesigns,_that.operators,_that.subAccount,_that.subscriber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriberModel implements SubscriberModel {
  const _SubscriberModel({this.name, @JsonKey(name: 'subscription_type') this.subscriptionType, @JsonKey(name: 'expiry_date') this.expiryDate, this.mobile, this.email, @JsonKey(name: 'max_kroots') this.maxKroots, @JsonKey(name: 'remaining_kroots') this.remainingKroots, @JsonKey(name: 'csv_import') this.csvImport, @JsonKey(name: 'premium_designs') this.premiumDesigns, this.operators, @JsonKey(name: 'sub_account') this.subAccount, this.subscriber});
  factory _SubscriberModel.fromJson(Map<String, dynamic> json) => _$SubscriberModelFromJson(json);

@override final  String? name;
@override@JsonKey(name: 'subscription_type') final  String? subscriptionType;
@override@JsonKey(name: 'expiry_date') final  String? expiryDate;
@override final  String? mobile;
@override final  String? email;
@override@JsonKey(name: 'max_kroots') final  int? maxKroots;
@override@JsonKey(name: 'remaining_kroots') final  int? remainingKroots;
@override@JsonKey(name: 'csv_import') final  int? csvImport;
@override@JsonKey(name: 'premium_designs') final  int? premiumDesigns;
@override final  int? operators;
@override@JsonKey(name: 'sub_account') final  int? subAccount;
@override final  String? subscriber;

/// Create a copy of SubscriberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriberModelCopyWith<_SubscriberModel> get copyWith => __$SubscriberModelCopyWithImpl<_SubscriberModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriberModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriberModel&&(identical(other.name, name) || other.name == name)&&(identical(other.subscriptionType, subscriptionType) || other.subscriptionType == subscriptionType)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.maxKroots, maxKroots) || other.maxKroots == maxKroots)&&(identical(other.remainingKroots, remainingKroots) || other.remainingKroots == remainingKroots)&&(identical(other.csvImport, csvImport) || other.csvImport == csvImport)&&(identical(other.premiumDesigns, premiumDesigns) || other.premiumDesigns == premiumDesigns)&&(identical(other.operators, operators) || other.operators == operators)&&(identical(other.subAccount, subAccount) || other.subAccount == subAccount)&&(identical(other.subscriber, subscriber) || other.subscriber == subscriber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,subscriptionType,expiryDate,mobile,email,maxKroots,remainingKroots,csvImport,premiumDesigns,operators,subAccount,subscriber);

@override
String toString() {
  return 'SubscriberModel(name: $name, subscriptionType: $subscriptionType, expiryDate: $expiryDate, mobile: $mobile, email: $email, maxKroots: $maxKroots, remainingKroots: $remainingKroots, csvImport: $csvImport, premiumDesigns: $premiumDesigns, operators: $operators, subAccount: $subAccount, subscriber: $subscriber)';
}


}

/// @nodoc
abstract mixin class _$SubscriberModelCopyWith<$Res> implements $SubscriberModelCopyWith<$Res> {
  factory _$SubscriberModelCopyWith(_SubscriberModel value, $Res Function(_SubscriberModel) _then) = __$SubscriberModelCopyWithImpl;
@override @useResult
$Res call({
 String? name,@JsonKey(name: 'subscription_type') String? subscriptionType,@JsonKey(name: 'expiry_date') String? expiryDate, String? mobile, String? email,@JsonKey(name: 'max_kroots') int? maxKroots,@JsonKey(name: 'remaining_kroots') int? remainingKroots,@JsonKey(name: 'csv_import') int? csvImport,@JsonKey(name: 'premium_designs') int? premiumDesigns, int? operators,@JsonKey(name: 'sub_account') int? subAccount, String? subscriber
});




}
/// @nodoc
class __$SubscriberModelCopyWithImpl<$Res>
    implements _$SubscriberModelCopyWith<$Res> {
  __$SubscriberModelCopyWithImpl(this._self, this._then);

  final _SubscriberModel _self;
  final $Res Function(_SubscriberModel) _then;

/// Create a copy of SubscriberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? subscriptionType = freezed,Object? expiryDate = freezed,Object? mobile = freezed,Object? email = freezed,Object? maxKroots = freezed,Object? remainingKroots = freezed,Object? csvImport = freezed,Object? premiumDesigns = freezed,Object? operators = freezed,Object? subAccount = freezed,Object? subscriber = freezed,}) {
  return _then(_SubscriberModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,subscriptionType: freezed == subscriptionType ? _self.subscriptionType : subscriptionType // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,maxKroots: freezed == maxKroots ? _self.maxKroots : maxKroots // ignore: cast_nullable_to_non_nullable
as int?,remainingKroots: freezed == remainingKroots ? _self.remainingKroots : remainingKroots // ignore: cast_nullable_to_non_nullable
as int?,csvImport: freezed == csvImport ? _self.csvImport : csvImport // ignore: cast_nullable_to_non_nullable
as int?,premiumDesigns: freezed == premiumDesigns ? _self.premiumDesigns : premiumDesigns // ignore: cast_nullable_to_non_nullable
as int?,operators: freezed == operators ? _self.operators : operators // ignore: cast_nullable_to_non_nullable
as int?,subAccount: freezed == subAccount ? _self.subAccount : subAccount // ignore: cast_nullable_to_non_nullable
as int?,subscriber: freezed == subscriber ? _self.subscriber : subscriber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SubscriptionModel {

 String? get name;@JsonKey(name: 'subscription_name') String? get subscriptionName;@JsonKey(name: 'max_kroots') int? get maxKroots;@JsonKey(name: 'duration_in_days') int? get durationInDays;@JsonKey(name: 'csv_import') int? get csvImport;@JsonKey(name: 'premium_designs') int? get premiumDesigns; int? get operators;@JsonKey(name: 'sub_account') int? get subAccount; double? get price;
/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionModelCopyWith<SubscriptionModel> get copyWith => _$SubscriptionModelCopyWithImpl<SubscriptionModel>(this as SubscriptionModel, _$identity);

  /// Serializes this SubscriptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionModel&&(identical(other.name, name) || other.name == name)&&(identical(other.subscriptionName, subscriptionName) || other.subscriptionName == subscriptionName)&&(identical(other.maxKroots, maxKroots) || other.maxKroots == maxKroots)&&(identical(other.durationInDays, durationInDays) || other.durationInDays == durationInDays)&&(identical(other.csvImport, csvImport) || other.csvImport == csvImport)&&(identical(other.premiumDesigns, premiumDesigns) || other.premiumDesigns == premiumDesigns)&&(identical(other.operators, operators) || other.operators == operators)&&(identical(other.subAccount, subAccount) || other.subAccount == subAccount)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,subscriptionName,maxKroots,durationInDays,csvImport,premiumDesigns,operators,subAccount,price);

@override
String toString() {
  return 'SubscriptionModel(name: $name, subscriptionName: $subscriptionName, maxKroots: $maxKroots, durationInDays: $durationInDays, csvImport: $csvImport, premiumDesigns: $premiumDesigns, operators: $operators, subAccount: $subAccount, price: $price)';
}


}

/// @nodoc
abstract mixin class $SubscriptionModelCopyWith<$Res>  {
  factory $SubscriptionModelCopyWith(SubscriptionModel value, $Res Function(SubscriptionModel) _then) = _$SubscriptionModelCopyWithImpl;
@useResult
$Res call({
 String? name,@JsonKey(name: 'subscription_name') String? subscriptionName,@JsonKey(name: 'max_kroots') int? maxKroots,@JsonKey(name: 'duration_in_days') int? durationInDays,@JsonKey(name: 'csv_import') int? csvImport,@JsonKey(name: 'premium_designs') int? premiumDesigns, int? operators,@JsonKey(name: 'sub_account') int? subAccount, double? price
});




}
/// @nodoc
class _$SubscriptionModelCopyWithImpl<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  _$SubscriptionModelCopyWithImpl(this._self, this._then);

  final SubscriptionModel _self;
  final $Res Function(SubscriptionModel) _then;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? subscriptionName = freezed,Object? maxKroots = freezed,Object? durationInDays = freezed,Object? csvImport = freezed,Object? premiumDesigns = freezed,Object? operators = freezed,Object? subAccount = freezed,Object? price = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,subscriptionName: freezed == subscriptionName ? _self.subscriptionName : subscriptionName // ignore: cast_nullable_to_non_nullable
as String?,maxKroots: freezed == maxKroots ? _self.maxKroots : maxKroots // ignore: cast_nullable_to_non_nullable
as int?,durationInDays: freezed == durationInDays ? _self.durationInDays : durationInDays // ignore: cast_nullable_to_non_nullable
as int?,csvImport: freezed == csvImport ? _self.csvImport : csvImport // ignore: cast_nullable_to_non_nullable
as int?,premiumDesigns: freezed == premiumDesigns ? _self.premiumDesigns : premiumDesigns // ignore: cast_nullable_to_non_nullable
as int?,operators: freezed == operators ? _self.operators : operators // ignore: cast_nullable_to_non_nullable
as int?,subAccount: freezed == subAccount ? _self.subAccount : subAccount // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionModel].
extension SubscriptionModelPatterns on SubscriptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionModel value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name, @JsonKey(name: 'subscription_name')  String? subscriptionName, @JsonKey(name: 'max_kroots')  int? maxKroots, @JsonKey(name: 'duration_in_days')  int? durationInDays, @JsonKey(name: 'csv_import')  int? csvImport, @JsonKey(name: 'premium_designs')  int? premiumDesigns,  int? operators, @JsonKey(name: 'sub_account')  int? subAccount,  double? price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
return $default(_that.name,_that.subscriptionName,_that.maxKroots,_that.durationInDays,_that.csvImport,_that.premiumDesigns,_that.operators,_that.subAccount,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name, @JsonKey(name: 'subscription_name')  String? subscriptionName, @JsonKey(name: 'max_kroots')  int? maxKroots, @JsonKey(name: 'duration_in_days')  int? durationInDays, @JsonKey(name: 'csv_import')  int? csvImport, @JsonKey(name: 'premium_designs')  int? premiumDesigns,  int? operators, @JsonKey(name: 'sub_account')  int? subAccount,  double? price)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionModel():
return $default(_that.name,_that.subscriptionName,_that.maxKroots,_that.durationInDays,_that.csvImport,_that.premiumDesigns,_that.operators,_that.subAccount,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name, @JsonKey(name: 'subscription_name')  String? subscriptionName, @JsonKey(name: 'max_kroots')  int? maxKroots, @JsonKey(name: 'duration_in_days')  int? durationInDays, @JsonKey(name: 'csv_import')  int? csvImport, @JsonKey(name: 'premium_designs')  int? premiumDesigns,  int? operators, @JsonKey(name: 'sub_account')  int? subAccount,  double? price)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
return $default(_that.name,_that.subscriptionName,_that.maxKroots,_that.durationInDays,_that.csvImport,_that.premiumDesigns,_that.operators,_that.subAccount,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionModel implements SubscriptionModel {
  const _SubscriptionModel({this.name, @JsonKey(name: 'subscription_name') this.subscriptionName, @JsonKey(name: 'max_kroots') this.maxKroots, @JsonKey(name: 'duration_in_days') this.durationInDays, @JsonKey(name: 'csv_import') this.csvImport, @JsonKey(name: 'premium_designs') this.premiumDesigns, this.operators, @JsonKey(name: 'sub_account') this.subAccount, this.price});
  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);

@override final  String? name;
@override@JsonKey(name: 'subscription_name') final  String? subscriptionName;
@override@JsonKey(name: 'max_kroots') final  int? maxKroots;
@override@JsonKey(name: 'duration_in_days') final  int? durationInDays;
@override@JsonKey(name: 'csv_import') final  int? csvImport;
@override@JsonKey(name: 'premium_designs') final  int? premiumDesigns;
@override final  int? operators;
@override@JsonKey(name: 'sub_account') final  int? subAccount;
@override final  double? price;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionModelCopyWith<_SubscriptionModel> get copyWith => __$SubscriptionModelCopyWithImpl<_SubscriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionModel&&(identical(other.name, name) || other.name == name)&&(identical(other.subscriptionName, subscriptionName) || other.subscriptionName == subscriptionName)&&(identical(other.maxKroots, maxKroots) || other.maxKroots == maxKroots)&&(identical(other.durationInDays, durationInDays) || other.durationInDays == durationInDays)&&(identical(other.csvImport, csvImport) || other.csvImport == csvImport)&&(identical(other.premiumDesigns, premiumDesigns) || other.premiumDesigns == premiumDesigns)&&(identical(other.operators, operators) || other.operators == operators)&&(identical(other.subAccount, subAccount) || other.subAccount == subAccount)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,subscriptionName,maxKroots,durationInDays,csvImport,premiumDesigns,operators,subAccount,price);

@override
String toString() {
  return 'SubscriptionModel(name: $name, subscriptionName: $subscriptionName, maxKroots: $maxKroots, durationInDays: $durationInDays, csvImport: $csvImport, premiumDesigns: $premiumDesigns, operators: $operators, subAccount: $subAccount, price: $price)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionModelCopyWith<$Res> implements $SubscriptionModelCopyWith<$Res> {
  factory _$SubscriptionModelCopyWith(_SubscriptionModel value, $Res Function(_SubscriptionModel) _then) = __$SubscriptionModelCopyWithImpl;
@override @useResult
$Res call({
 String? name,@JsonKey(name: 'subscription_name') String? subscriptionName,@JsonKey(name: 'max_kroots') int? maxKroots,@JsonKey(name: 'duration_in_days') int? durationInDays,@JsonKey(name: 'csv_import') int? csvImport,@JsonKey(name: 'premium_designs') int? premiumDesigns, int? operators,@JsonKey(name: 'sub_account') int? subAccount, double? price
});




}
/// @nodoc
class __$SubscriptionModelCopyWithImpl<$Res>
    implements _$SubscriptionModelCopyWith<$Res> {
  __$SubscriptionModelCopyWithImpl(this._self, this._then);

  final _SubscriptionModel _self;
  final $Res Function(_SubscriptionModel) _then;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? subscriptionName = freezed,Object? maxKroots = freezed,Object? durationInDays = freezed,Object? csvImport = freezed,Object? premiumDesigns = freezed,Object? operators = freezed,Object? subAccount = freezed,Object? price = freezed,}) {
  return _then(_SubscriptionModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,subscriptionName: freezed == subscriptionName ? _self.subscriptionName : subscriptionName // ignore: cast_nullable_to_non_nullable
as String?,maxKroots: freezed == maxKroots ? _self.maxKroots : maxKroots // ignore: cast_nullable_to_non_nullable
as int?,durationInDays: freezed == durationInDays ? _self.durationInDays : durationInDays // ignore: cast_nullable_to_non_nullable
as int?,csvImport: freezed == csvImport ? _self.csvImport : csvImport // ignore: cast_nullable_to_non_nullable
as int?,premiumDesigns: freezed == premiumDesigns ? _self.premiumDesigns : premiumDesigns // ignore: cast_nullable_to_non_nullable
as int?,operators: freezed == operators ? _self.operators : operators // ignore: cast_nullable_to_non_nullable
as int?,subAccount: freezed == subAccount ? _self.subAccount : subAccount // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
