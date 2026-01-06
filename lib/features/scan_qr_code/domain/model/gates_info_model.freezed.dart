// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gates_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GatesInfoModel {

@JsonKey(name: "name") String? get nameId;@JsonKey(name: "gate_name") String? get gateName;@JsonKey(name: "active") int get active; double? get rating;
/// Create a copy of GatesInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatesInfoModelCopyWith<GatesInfoModel> get copyWith => _$GatesInfoModelCopyWithImpl<GatesInfoModel>(this as GatesInfoModel, _$identity);

  /// Serializes this GatesInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatesInfoModel&&(identical(other.nameId, nameId) || other.nameId == nameId)&&(identical(other.gateName, gateName) || other.gateName == gateName)&&(identical(other.active, active) || other.active == active)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nameId,gateName,active,rating);

@override
String toString() {
  return 'GatesInfoModel(nameId: $nameId, gateName: $gateName, active: $active, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $GatesInfoModelCopyWith<$Res>  {
  factory $GatesInfoModelCopyWith(GatesInfoModel value, $Res Function(GatesInfoModel) _then) = _$GatesInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "name") String? nameId,@JsonKey(name: "gate_name") String? gateName,@JsonKey(name: "active") int active, double? rating
});




}
/// @nodoc
class _$GatesInfoModelCopyWithImpl<$Res>
    implements $GatesInfoModelCopyWith<$Res> {
  _$GatesInfoModelCopyWithImpl(this._self, this._then);

  final GatesInfoModel _self;
  final $Res Function(GatesInfoModel) _then;

/// Create a copy of GatesInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nameId = freezed,Object? gateName = freezed,Object? active = null,Object? rating = freezed,}) {
  return _then(_self.copyWith(
nameId: freezed == nameId ? _self.nameId : nameId // ignore: cast_nullable_to_non_nullable
as String?,gateName: freezed == gateName ? _self.gateName : gateName // ignore: cast_nullable_to_non_nullable
as String?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [GatesInfoModel].
extension GatesInfoModelPatterns on GatesInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GatesInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GatesInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GatesInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _GatesInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GatesInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _GatesInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "name")  String? nameId, @JsonKey(name: "gate_name")  String? gateName, @JsonKey(name: "active")  int active,  double? rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GatesInfoModel() when $default != null:
return $default(_that.nameId,_that.gateName,_that.active,_that.rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "name")  String? nameId, @JsonKey(name: "gate_name")  String? gateName, @JsonKey(name: "active")  int active,  double? rating)  $default,) {final _that = this;
switch (_that) {
case _GatesInfoModel():
return $default(_that.nameId,_that.gateName,_that.active,_that.rating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "name")  String? nameId, @JsonKey(name: "gate_name")  String? gateName, @JsonKey(name: "active")  int active,  double? rating)?  $default,) {final _that = this;
switch (_that) {
case _GatesInfoModel() when $default != null:
return $default(_that.nameId,_that.gateName,_that.active,_that.rating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GatesInfoModel implements GatesInfoModel {
  const _GatesInfoModel({@JsonKey(name: "name") required this.nameId, @JsonKey(name: "gate_name") required this.gateName, @JsonKey(name: "active") required this.active, required this.rating});
  factory _GatesInfoModel.fromJson(Map<String, dynamic> json) => _$GatesInfoModelFromJson(json);

@override@JsonKey(name: "name") final  String? nameId;
@override@JsonKey(name: "gate_name") final  String? gateName;
@override@JsonKey(name: "active") final  int active;
@override final  double? rating;

/// Create a copy of GatesInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatesInfoModelCopyWith<_GatesInfoModel> get copyWith => __$GatesInfoModelCopyWithImpl<_GatesInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GatesInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GatesInfoModel&&(identical(other.nameId, nameId) || other.nameId == nameId)&&(identical(other.gateName, gateName) || other.gateName == gateName)&&(identical(other.active, active) || other.active == active)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nameId,gateName,active,rating);

@override
String toString() {
  return 'GatesInfoModel(nameId: $nameId, gateName: $gateName, active: $active, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$GatesInfoModelCopyWith<$Res> implements $GatesInfoModelCopyWith<$Res> {
  factory _$GatesInfoModelCopyWith(_GatesInfoModel value, $Res Function(_GatesInfoModel) _then) = __$GatesInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "name") String? nameId,@JsonKey(name: "gate_name") String? gateName,@JsonKey(name: "active") int active, double? rating
});




}
/// @nodoc
class __$GatesInfoModelCopyWithImpl<$Res>
    implements _$GatesInfoModelCopyWith<$Res> {
  __$GatesInfoModelCopyWithImpl(this._self, this._then);

  final _GatesInfoModel _self;
  final $Res Function(_GatesInfoModel) _then;

/// Create a copy of GatesInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nameId = freezed,Object? gateName = freezed,Object? active = null,Object? rating = freezed,}) {
  return _then(_GatesInfoModel(
nameId: freezed == nameId ? _self.nameId : nameId // ignore: cast_nullable_to_non_nullable
as String?,gateName: freezed == gateName ? _self.gateName : gateName // ignore: cast_nullable_to_non_nullable
as String?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
