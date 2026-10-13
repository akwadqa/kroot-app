// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VersionUpdate {
  @JsonKey(name: 'android_version')
  String get appAndroidVersion;
  @JsonKey(name: 'ios_version')
  String get appIosVersion;
  @JsonKey(name: 'app_update_required')
  bool? get appUpdateRequired; // @JsonKey(name: 'app_update_required_message')
//     String? appUpdateRequiredMessage,
  @JsonKey(name: 'app_update_message')
  String?
      get appUpdateMessage; // @JsonKey(name: 'app_new_update_title') String? appNewUpdateTitle,
  @JsonKey(name: 'app_ios_url')
  String? get appIosUrl;
  @JsonKey(name: 'app_android_url')
  String? get appAndroidUrl;

  /// Create a copy of VersionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VersionUpdateCopyWith<VersionUpdate> get copyWith =>
      _$VersionUpdateCopyWithImpl<VersionUpdate>(
          this as VersionUpdate, _$identity);

  /// Serializes this VersionUpdate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VersionUpdate &&
            (identical(other.appAndroidVersion, appAndroidVersion) ||
                other.appAndroidVersion == appAndroidVersion) &&
            (identical(other.appIosVersion, appIosVersion) ||
                other.appIosVersion == appIosVersion) &&
            (identical(other.appUpdateRequired, appUpdateRequired) ||
                other.appUpdateRequired == appUpdateRequired) &&
            (identical(other.appUpdateMessage, appUpdateMessage) ||
                other.appUpdateMessage == appUpdateMessage) &&
            (identical(other.appIosUrl, appIosUrl) ||
                other.appIosUrl == appIosUrl) &&
            (identical(other.appAndroidUrl, appAndroidUrl) ||
                other.appAndroidUrl == appAndroidUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appAndroidVersion, appIosVersion,
      appUpdateRequired, appUpdateMessage, appIosUrl, appAndroidUrl);

  @override
  String toString() {
    return 'VersionUpdate(appAndroidVersion: $appAndroidVersion, appIosVersion: $appIosVersion, appUpdateRequired: $appUpdateRequired, appUpdateMessage: $appUpdateMessage, appIosUrl: $appIosUrl, appAndroidUrl: $appAndroidUrl)';
  }
}

/// @nodoc
abstract mixin class $VersionUpdateCopyWith<$Res> {
  factory $VersionUpdateCopyWith(
          VersionUpdate value, $Res Function(VersionUpdate) _then) =
      _$VersionUpdateCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'android_version') String appAndroidVersion,
      @JsonKey(name: 'ios_version') String appIosVersion,
      @JsonKey(name: 'app_update_required') bool? appUpdateRequired,
      @JsonKey(name: 'app_update_message') String? appUpdateMessage,
      @JsonKey(name: 'app_ios_url') String? appIosUrl,
      @JsonKey(name: 'app_android_url') String? appAndroidUrl});
}

/// @nodoc
class _$VersionUpdateCopyWithImpl<$Res>
    implements $VersionUpdateCopyWith<$Res> {
  _$VersionUpdateCopyWithImpl(this._self, this._then);

  final VersionUpdate _self;
  final $Res Function(VersionUpdate) _then;

  /// Create a copy of VersionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appAndroidVersion = null,
    Object? appIosVersion = null,
    Object? appUpdateRequired = freezed,
    Object? appUpdateMessage = freezed,
    Object? appIosUrl = freezed,
    Object? appAndroidUrl = freezed,
  }) {
    return _then(_self.copyWith(
      appAndroidVersion: null == appAndroidVersion
          ? _self.appAndroidVersion
          : appAndroidVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appIosVersion: null == appIosVersion
          ? _self.appIosVersion
          : appIosVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appUpdateRequired: freezed == appUpdateRequired
          ? _self.appUpdateRequired
          : appUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      appUpdateMessage: freezed == appUpdateMessage
          ? _self.appUpdateMessage
          : appUpdateMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      appIosUrl: freezed == appIosUrl
          ? _self.appIosUrl
          : appIosUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      appAndroidUrl: freezed == appAndroidUrl
          ? _self.appAndroidUrl
          : appAndroidUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [VersionUpdate].
extension VersionUpdatePatterns on VersionUpdate {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VersionUpdate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VersionUpdate() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VersionUpdate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VersionUpdate():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VersionUpdate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VersionUpdate() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'android_version') String appAndroidVersion,
            @JsonKey(name: 'ios_version') String appIosVersion,
            @JsonKey(name: 'app_update_required') bool? appUpdateRequired,
            @JsonKey(name: 'app_update_message') String? appUpdateMessage,
            @JsonKey(name: 'app_ios_url') String? appIosUrl,
            @JsonKey(name: 'app_android_url') String? appAndroidUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VersionUpdate() when $default != null:
        return $default(
            _that.appAndroidVersion,
            _that.appIosVersion,
            _that.appUpdateRequired,
            _that.appUpdateMessage,
            _that.appIosUrl,
            _that.appAndroidUrl);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'android_version') String appAndroidVersion,
            @JsonKey(name: 'ios_version') String appIosVersion,
            @JsonKey(name: 'app_update_required') bool? appUpdateRequired,
            @JsonKey(name: 'app_update_message') String? appUpdateMessage,
            @JsonKey(name: 'app_ios_url') String? appIosUrl,
            @JsonKey(name: 'app_android_url') String? appAndroidUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VersionUpdate():
        return $default(
            _that.appAndroidVersion,
            _that.appIosVersion,
            _that.appUpdateRequired,
            _that.appUpdateMessage,
            _that.appIosUrl,
            _that.appAndroidUrl);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'android_version') String appAndroidVersion,
            @JsonKey(name: 'ios_version') String appIosVersion,
            @JsonKey(name: 'app_update_required') bool? appUpdateRequired,
            @JsonKey(name: 'app_update_message') String? appUpdateMessage,
            @JsonKey(name: 'app_ios_url') String? appIosUrl,
            @JsonKey(name: 'app_android_url') String? appAndroidUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VersionUpdate() when $default != null:
        return $default(
            _that.appAndroidVersion,
            _that.appIosVersion,
            _that.appUpdateRequired,
            _that.appUpdateMessage,
            _that.appIosUrl,
            _that.appAndroidUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VersionUpdate implements VersionUpdate {
  _VersionUpdate(
      {@JsonKey(name: 'android_version') required this.appAndroidVersion,
      @JsonKey(name: 'ios_version') required this.appIosVersion,
      @JsonKey(name: 'app_update_required') required this.appUpdateRequired,
      @JsonKey(name: 'app_update_message') this.appUpdateMessage,
      @JsonKey(name: 'app_ios_url') this.appIosUrl,
      @JsonKey(name: 'app_android_url') this.appAndroidUrl});
  factory _VersionUpdate.fromJson(Map<String, dynamic> json) =>
      _$VersionUpdateFromJson(json);

  @override
  @JsonKey(name: 'android_version')
  final String appAndroidVersion;
  @override
  @JsonKey(name: 'ios_version')
  final String appIosVersion;
  @override
  @JsonKey(name: 'app_update_required')
  final bool? appUpdateRequired;
// @JsonKey(name: 'app_update_required_message')
//     String? appUpdateRequiredMessage,
  @override
  @JsonKey(name: 'app_update_message')
  final String? appUpdateMessage;
// @JsonKey(name: 'app_new_update_title') String? appNewUpdateTitle,
  @override
  @JsonKey(name: 'app_ios_url')
  final String? appIosUrl;
  @override
  @JsonKey(name: 'app_android_url')
  final String? appAndroidUrl;

  /// Create a copy of VersionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VersionUpdateCopyWith<_VersionUpdate> get copyWith =>
      __$VersionUpdateCopyWithImpl<_VersionUpdate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VersionUpdateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VersionUpdate &&
            (identical(other.appAndroidVersion, appAndroidVersion) ||
                other.appAndroidVersion == appAndroidVersion) &&
            (identical(other.appIosVersion, appIosVersion) ||
                other.appIosVersion == appIosVersion) &&
            (identical(other.appUpdateRequired, appUpdateRequired) ||
                other.appUpdateRequired == appUpdateRequired) &&
            (identical(other.appUpdateMessage, appUpdateMessage) ||
                other.appUpdateMessage == appUpdateMessage) &&
            (identical(other.appIosUrl, appIosUrl) ||
                other.appIosUrl == appIosUrl) &&
            (identical(other.appAndroidUrl, appAndroidUrl) ||
                other.appAndroidUrl == appAndroidUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appAndroidVersion, appIosVersion,
      appUpdateRequired, appUpdateMessage, appIosUrl, appAndroidUrl);

  @override
  String toString() {
    return 'VersionUpdate(appAndroidVersion: $appAndroidVersion, appIosVersion: $appIosVersion, appUpdateRequired: $appUpdateRequired, appUpdateMessage: $appUpdateMessage, appIosUrl: $appIosUrl, appAndroidUrl: $appAndroidUrl)';
  }
}

/// @nodoc
abstract mixin class _$VersionUpdateCopyWith<$Res>
    implements $VersionUpdateCopyWith<$Res> {
  factory _$VersionUpdateCopyWith(
          _VersionUpdate value, $Res Function(_VersionUpdate) _then) =
      __$VersionUpdateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'android_version') String appAndroidVersion,
      @JsonKey(name: 'ios_version') String appIosVersion,
      @JsonKey(name: 'app_update_required') bool? appUpdateRequired,
      @JsonKey(name: 'app_update_message') String? appUpdateMessage,
      @JsonKey(name: 'app_ios_url') String? appIosUrl,
      @JsonKey(name: 'app_android_url') String? appAndroidUrl});
}

/// @nodoc
class __$VersionUpdateCopyWithImpl<$Res>
    implements _$VersionUpdateCopyWith<$Res> {
  __$VersionUpdateCopyWithImpl(this._self, this._then);

  final _VersionUpdate _self;
  final $Res Function(_VersionUpdate) _then;

  /// Create a copy of VersionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appAndroidVersion = null,
    Object? appIosVersion = null,
    Object? appUpdateRequired = freezed,
    Object? appUpdateMessage = freezed,
    Object? appIosUrl = freezed,
    Object? appAndroidUrl = freezed,
  }) {
    return _then(_VersionUpdate(
      appAndroidVersion: null == appAndroidVersion
          ? _self.appAndroidVersion
          : appAndroidVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appIosVersion: null == appIosVersion
          ? _self.appIosVersion
          : appIosVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appUpdateRequired: freezed == appUpdateRequired
          ? _self.appUpdateRequired
          : appUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      appUpdateMessage: freezed == appUpdateMessage
          ? _self.appUpdateMessage
          : appUpdateMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      appIosUrl: freezed == appIosUrl
          ? _self.appIosUrl
          : appIosUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      appAndroidUrl: freezed == appAndroidUrl
          ? _self.appAndroidUrl
          : appAndroidUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
