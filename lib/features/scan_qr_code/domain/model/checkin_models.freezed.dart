// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckinItem {

 String? get invitee; String? get occasion;@JsonKey(name: 'checked_in', fromJson: _checkedInToInt) int? get checkedIn;@JsonKey(name: 'party_size') int? get partySize;
/// Create a copy of CheckinItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckinItemCopyWith<CheckinItem> get copyWith => _$CheckinItemCopyWithImpl<CheckinItem>(this as CheckinItem, _$identity);

  /// Serializes this CheckinItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckinItem&&(identical(other.invitee, invitee) || other.invitee == invitee)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.checkedIn, checkedIn) || other.checkedIn == checkedIn)&&(identical(other.partySize, partySize) || other.partySize == partySize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,invitee,occasion,checkedIn,partySize);

@override
String toString() {
  return 'CheckinItem(invitee: $invitee, occasion: $occasion, checkedIn: $checkedIn, partySize: $partySize)';
}


}

/// @nodoc
abstract mixin class $CheckinItemCopyWith<$Res>  {
  factory $CheckinItemCopyWith(CheckinItem value, $Res Function(CheckinItem) _then) = _$CheckinItemCopyWithImpl;
@useResult
$Res call({
 String? invitee, String? occasion,@JsonKey(name: 'checked_in', fromJson: _checkedInToInt) int? checkedIn,@JsonKey(name: 'party_size') int? partySize
});




}
/// @nodoc
class _$CheckinItemCopyWithImpl<$Res>
    implements $CheckinItemCopyWith<$Res> {
  _$CheckinItemCopyWithImpl(this._self, this._then);

  final CheckinItem _self;
  final $Res Function(CheckinItem) _then;

/// Create a copy of CheckinItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invitee = freezed,Object? occasion = freezed,Object? checkedIn = freezed,Object? partySize = freezed,}) {
  return _then(_self.copyWith(
invitee: freezed == invitee ? _self.invitee : invitee // ignore: cast_nullable_to_non_nullable
as String?,occasion: freezed == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as String?,checkedIn: freezed == checkedIn ? _self.checkedIn : checkedIn // ignore: cast_nullable_to_non_nullable
as int?,partySize: freezed == partySize ? _self.partySize : partySize // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckinItem].
extension CheckinItemPatterns on CheckinItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckinItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckinItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckinItem value)  $default,){
final _that = this;
switch (_that) {
case _CheckinItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckinItem value)?  $default,){
final _that = this;
switch (_that) {
case _CheckinItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? invitee,  String? occasion, @JsonKey(name: 'checked_in', fromJson: _checkedInToInt)  int? checkedIn, @JsonKey(name: 'party_size')  int? partySize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckinItem() when $default != null:
return $default(_that.invitee,_that.occasion,_that.checkedIn,_that.partySize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? invitee,  String? occasion, @JsonKey(name: 'checked_in', fromJson: _checkedInToInt)  int? checkedIn, @JsonKey(name: 'party_size')  int? partySize)  $default,) {final _that = this;
switch (_that) {
case _CheckinItem():
return $default(_that.invitee,_that.occasion,_that.checkedIn,_that.partySize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? invitee,  String? occasion, @JsonKey(name: 'checked_in', fromJson: _checkedInToInt)  int? checkedIn, @JsonKey(name: 'party_size')  int? partySize)?  $default,) {final _that = this;
switch (_that) {
case _CheckinItem() when $default != null:
return $default(_that.invitee,_that.occasion,_that.checkedIn,_that.partySize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckinItem implements CheckinItem {
  const _CheckinItem({this.invitee, this.occasion, @JsonKey(name: 'checked_in', fromJson: _checkedInToInt) this.checkedIn, @JsonKey(name: 'party_size') this.partySize});
  factory _CheckinItem.fromJson(Map<String, dynamic> json) => _$CheckinItemFromJson(json);

@override final  String? invitee;
@override final  String? occasion;
@override@JsonKey(name: 'checked_in', fromJson: _checkedInToInt) final  int? checkedIn;
@override@JsonKey(name: 'party_size') final  int? partySize;

/// Create a copy of CheckinItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckinItemCopyWith<_CheckinItem> get copyWith => __$CheckinItemCopyWithImpl<_CheckinItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckinItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckinItem&&(identical(other.invitee, invitee) || other.invitee == invitee)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.checkedIn, checkedIn) || other.checkedIn == checkedIn)&&(identical(other.partySize, partySize) || other.partySize == partySize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,invitee,occasion,checkedIn,partySize);

@override
String toString() {
  return 'CheckinItem(invitee: $invitee, occasion: $occasion, checkedIn: $checkedIn, partySize: $partySize)';
}


}

/// @nodoc
abstract mixin class _$CheckinItemCopyWith<$Res> implements $CheckinItemCopyWith<$Res> {
  factory _$CheckinItemCopyWith(_CheckinItem value, $Res Function(_CheckinItem) _then) = __$CheckinItemCopyWithImpl;
@override @useResult
$Res call({
 String? invitee, String? occasion,@JsonKey(name: 'checked_in', fromJson: _checkedInToInt) int? checkedIn,@JsonKey(name: 'party_size') int? partySize
});




}
/// @nodoc
class __$CheckinItemCopyWithImpl<$Res>
    implements _$CheckinItemCopyWith<$Res> {
  __$CheckinItemCopyWithImpl(this._self, this._then);

  final _CheckinItem _self;
  final $Res Function(_CheckinItem) _then;

/// Create a copy of CheckinItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invitee = freezed,Object? occasion = freezed,Object? checkedIn = freezed,Object? partySize = freezed,}) {
  return _then(_CheckinItem(
invitee: freezed == invitee ? _self.invitee : invitee // ignore: cast_nullable_to_non_nullable
as String?,occasion: freezed == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as String?,checkedIn: freezed == checkedIn ? _self.checkedIn : checkedIn // ignore: cast_nullable_to_non_nullable
as int?,partySize: freezed == partySize ? _self.partySize : partySize // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$CheckinPayload {

 List<CheckinItem> get items;
/// Create a copy of CheckinPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckinPayloadCopyWith<CheckinPayload> get copyWith => _$CheckinPayloadCopyWithImpl<CheckinPayload>(this as CheckinPayload, _$identity);

  /// Serializes this CheckinPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckinPayload&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CheckinPayload(items: $items)';
}


}

/// @nodoc
abstract mixin class $CheckinPayloadCopyWith<$Res>  {
  factory $CheckinPayloadCopyWith(CheckinPayload value, $Res Function(CheckinPayload) _then) = _$CheckinPayloadCopyWithImpl;
@useResult
$Res call({
 List<CheckinItem> items
});




}
/// @nodoc
class _$CheckinPayloadCopyWithImpl<$Res>
    implements $CheckinPayloadCopyWith<$Res> {
  _$CheckinPayloadCopyWithImpl(this._self, this._then);

  final CheckinPayload _self;
  final $Res Function(CheckinPayload) _then;

/// Create a copy of CheckinPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CheckinItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckinPayload].
extension CheckinPayloadPatterns on CheckinPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckinPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckinPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckinPayload value)  $default,){
final _that = this;
switch (_that) {
case _CheckinPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckinPayload value)?  $default,){
final _that = this;
switch (_that) {
case _CheckinPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CheckinItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckinPayload() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CheckinItem> items)  $default,) {final _that = this;
switch (_that) {
case _CheckinPayload():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CheckinItem> items)?  $default,) {final _that = this;
switch (_that) {
case _CheckinPayload() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckinPayload implements CheckinPayload {
  const _CheckinPayload({final  List<CheckinItem> items = const <CheckinItem>[]}): _items = items;
  factory _CheckinPayload.fromJson(Map<String, dynamic> json) => _$CheckinPayloadFromJson(json);

 final  List<CheckinItem> _items;
@override@JsonKey() List<CheckinItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CheckinPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckinPayloadCopyWith<_CheckinPayload> get copyWith => __$CheckinPayloadCopyWithImpl<_CheckinPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckinPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckinPayload&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CheckinPayload(items: $items)';
}


}

/// @nodoc
abstract mixin class _$CheckinPayloadCopyWith<$Res> implements $CheckinPayloadCopyWith<$Res> {
  factory _$CheckinPayloadCopyWith(_CheckinPayload value, $Res Function(_CheckinPayload) _then) = __$CheckinPayloadCopyWithImpl;
@override @useResult
$Res call({
 List<CheckinItem> items
});




}
/// @nodoc
class __$CheckinPayloadCopyWithImpl<$Res>
    implements _$CheckinPayloadCopyWith<$Res> {
  __$CheckinPayloadCopyWithImpl(this._self, this._then);

  final _CheckinPayload _self;
  final $Res Function(_CheckinPayload) _then;

/// Create a copy of CheckinPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_CheckinPayload(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CheckinItem>,
  ));
}


}

// dart format on
