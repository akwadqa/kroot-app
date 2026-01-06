part of 'app_notifications_model.dart';

T _$identity<T>(T value) => value;

mixin _$AppNotificationsModel {
  @JsonKey(name: 'app_message_id')
  String get appMessageId;
  @JsonKey(name: 'app_message_title')
  String? get appMessageTitle;
  @JsonKey(name: 'app_message_icon')
  String? get appMessageIcon;
  String get type;
  String? get item;
  @JsonKey(name: "published_on")
  String? get publishedOn;
  @JsonKey(name: "expiry_date")
  String? get expiryDate;
  @JsonKey(name: "content")
  String? get content;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppNotificationsModelCopyWith<AppNotificationsModel> get copyWith =>
      _$AppNotificationsModelCopyWithImpl<AppNotificationsModel>(
        this as AppNotificationsModel,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppNotificationsModel &&
            (identical(other.appMessageId, appMessageId) ||
                other.appMessageId == appMessageId) &&
            (identical(other.appMessageTitle, appMessageTitle) ||
                other.appMessageTitle == appMessageTitle) &&
            (identical(other.appMessageIcon, appMessageIcon) ||
                other.appMessageIcon == appMessageIcon) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.publishedOn, publishedOn) ||
                other.publishedOn == publishedOn) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appMessageId,
    appMessageTitle,
    appMessageIcon,
    type,
    item,
    publishedOn,
    expiryDate,
    content,
  );

  @override
  String toString() {
    return 'AppNotificationsModel(appMessageId: $appMessageId, appMessageTitle: $appMessageTitle, appMessageIcon: $appMessageIcon, type: $type, item: $item, publishedOn: $publishedOn, expiryDate: $expiryDate, content: $content)';
  }
}

abstract mixin class $AppNotificationsModelCopyWith<$Res> {
  factory $AppNotificationsModelCopyWith(
    AppNotificationsModel value,
    $Res Function(AppNotificationsModel) _then,
  ) = _$AppNotificationsModelCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: 'app_message_id') String appMessageId,
    @JsonKey(name: 'app_message_title') String? appMessageTitle,
    @JsonKey(name: 'app_message_icon') String? appMessageIcon,
    String type,
    String? item,
    @JsonKey(name: "published_on") String? publishedOn,
    @JsonKey(name: "expiry_date") String? expiryDate,
    @JsonKey(name: "content") String? content,
  });
}

class _$AppNotificationsModelCopyWithImpl<$Res>
    implements $AppNotificationsModelCopyWith<$Res> {
  _$AppNotificationsModelCopyWithImpl(this._self, this._then);

  final AppNotificationsModel _self;
  final $Res Function(AppNotificationsModel) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appMessageId = null,
    Object? appMessageTitle = freezed,
    Object? appMessageIcon = freezed,
    Object? type = null,
    Object? item = freezed,
    Object? publishedOn = freezed,
    Object? expiryDate = freezed,
    Object? content = freezed,
  }) {
    return _then(
      _self.copyWith(
        appMessageId: null == appMessageId
            ? _self.appMessageId
            : appMessageId as String,
        appMessageTitle: freezed == appMessageTitle
            ? _self.appMessageTitle
            : appMessageTitle as String?,
        appMessageIcon: freezed == appMessageIcon
            ? _self.appMessageIcon
            : appMessageIcon as String?,
        type: null == type ? _self.type : type as String,
        item: freezed == item ? _self.item : item as String?,
        publishedOn: freezed == publishedOn
            ? _self.publishedOn
            : publishedOn as String?,
        expiryDate: freezed == expiryDate
            ? _self.expiryDate
            : expiryDate as String?,
        content: freezed == content ? _self.content : content as String?,
      ),
    );
  }
}

extension AppNotificationsModelPatterns on AppNotificationsModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppNotificationsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppNotificationsModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppNotificationsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppNotificationsModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppNotificationsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppNotificationsModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'app_message_id') String appMessageId,
      @JsonKey(name: 'app_message_title') String? appMessageTitle,
      @JsonKey(name: 'app_message_icon') String? appMessageIcon,
      String type,
      String? item,
      @JsonKey(name: "published_on") String? publishedOn,
      @JsonKey(name: "expiry_date") String? expiryDate,
      @JsonKey(name: "content") String? content,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppNotificationsModel() when $default != null:
        return $default(
          _that.appMessageId,
          _that.appMessageTitle,
          _that.appMessageIcon,
          _that.type,
          _that.item,
          _that.publishedOn,
          _that.expiryDate,
          _that.content,
        );
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'app_message_id') String appMessageId,
      @JsonKey(name: 'app_message_title') String? appMessageTitle,
      @JsonKey(name: 'app_message_icon') String? appMessageIcon,
      String type,
      String? item,
      @JsonKey(name: "published_on") String? publishedOn,
      @JsonKey(name: "expiry_date") String? expiryDate,
      @JsonKey(name: "content") String? content,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppNotificationsModel():
        return $default(
          _that.appMessageId,
          _that.appMessageTitle,
          _that.appMessageIcon,
          _that.type,
          _that.item,
          _that.publishedOn,
          _that.expiryDate,
          _that.content,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      @JsonKey(name: 'app_message_id') String appMessageId,
      @JsonKey(name: 'app_message_title') String? appMessageTitle,
      @JsonKey(name: 'app_message_icon') String? appMessageIcon,
      String type,
      String? item,
      @JsonKey(name: "published_on") String? publishedOn,
      @JsonKey(name: "expiry_date") String? expiryDate,
      @JsonKey(name: "content") String? content,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppNotificationsModel() when $default != null:
        return $default(
          _that.appMessageId,
          _that.appMessageTitle,
          _that.appMessageIcon,
          _that.type,
          _that.item,
          _that.publishedOn,
          _that.expiryDate,
          _that.content,
        );
      case _:
        return null;
    }
  }
}

@JsonSerializable()
class _AppNotificationsModel implements AppNotificationsModel {
  const _AppNotificationsModel({
    @JsonKey(name: 'app_message_id') required this.appMessageId,
    @JsonKey(name: 'app_message_title') required this.appMessageTitle,
    @JsonKey(name: 'app_message_icon') required this.appMessageIcon,
    required this.type,
    required this.item,
    @JsonKey(name: "published_on") required this.publishedOn,
    @JsonKey(name: "expiry_date") required this.expiryDate,
    @JsonKey(name: "content") required this.content,
  });
  factory _AppNotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationsModelFromJson(json);

  @override
  @JsonKey(name: 'app_message_id')
  final String appMessageId;
  @override
  @JsonKey(name: 'app_message_title')
  final String? appMessageTitle;
  @override
  @JsonKey(name: 'app_message_icon')
  final String? appMessageIcon;
  @override
  final String type;
  @override
  final String? item;
  @override
  @JsonKey(name: "published_on")
  final String? publishedOn;
  @override
  @JsonKey(name: "expiry_date")
  final String? expiryDate;
  @override
  @JsonKey(name: "content")
  final String? content;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppNotificationsModelCopyWith<_AppNotificationsModel> get copyWith =>
      __$AppNotificationsModelCopyWithImpl<_AppNotificationsModel>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$AppNotificationsModelToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppNotificationsModel &&
            (identical(other.appMessageId, appMessageId) ||
                other.appMessageId == appMessageId) &&
            (identical(other.appMessageTitle, appMessageTitle) ||
                other.appMessageTitle == appMessageTitle) &&
            (identical(other.appMessageIcon, appMessageIcon) ||
                other.appMessageIcon == appMessageIcon) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.publishedOn, publishedOn) ||
                other.publishedOn == publishedOn) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appMessageId,
    appMessageTitle,
    appMessageIcon,
    type,
    item,
    publishedOn,
    expiryDate,
    content,
  );

  @override
  String toString() {
    return 'AppNotificationsModel(appMessageId: $appMessageId, appMessageTitle: $appMessageTitle, appMessageIcon: $appMessageIcon, type: $type, item: $item, publishedOn: $publishedOn, expiryDate: $expiryDate, content: $content)';
  }
}

abstract mixin class _$AppNotificationsModelCopyWith<$Res>
    implements $AppNotificationsModelCopyWith<$Res> {
  factory _$AppNotificationsModelCopyWith(
    _AppNotificationsModel value,
    $Res Function(_AppNotificationsModel) _then,
  ) = __$AppNotificationsModelCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'app_message_id') String appMessageId,
    @JsonKey(name: 'app_message_title') String? appMessageTitle,
    @JsonKey(name: 'app_message_icon') String? appMessageIcon,
    String type,
    String? item,
    @JsonKey(name: "published_on") String? publishedOn,
    @JsonKey(name: "expiry_date") String? expiryDate,
    @JsonKey(name: "content") String? content,
  });
}

class __$AppNotificationsModelCopyWithImpl<$Res>
    implements _$AppNotificationsModelCopyWith<$Res> {
  __$AppNotificationsModelCopyWithImpl(this._self, this._then);

  final _AppNotificationsModel _self;
  final $Res Function(_AppNotificationsModel) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appMessageId = null,
    Object? appMessageTitle = freezed,
    Object? appMessageIcon = freezed,
    Object? type = null,
    Object? item = freezed,
    Object? publishedOn = freezed,
    Object? expiryDate = freezed,
    Object? content = freezed,
  }) {
    return _then(
      _AppNotificationsModel(
        appMessageId: null == appMessageId
            ? _self.appMessageId
            : appMessageId as String,
        appMessageTitle: freezed == appMessageTitle
            ? _self.appMessageTitle
            : appMessageTitle as String?,
        appMessageIcon: freezed == appMessageIcon
            ? _self.appMessageIcon
            : appMessageIcon as String?,
        type: null == type ? _self.type : type as String,
        item: freezed == item ? _self.item : item as String?,
        publishedOn: freezed == publishedOn
            ? _self.publishedOn
            : publishedOn as String?,
        expiryDate: freezed == expiryDate
            ? _self.expiryDate
            : expiryDate as String?,
        content: freezed == content ? _self.content : content as String?,
      ),
    );
  }
}
