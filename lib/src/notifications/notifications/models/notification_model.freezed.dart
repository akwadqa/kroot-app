part of 'notification_model.dart';

T _$identity<T>(T value) => value;

mixin _$NotificationModel {
  String get id;
  String get title;
  String get body;
  String get type;
  Map<String, dynamic>? get data;
  DateTime get createdAt;
  bool get isRead;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      _$NotificationModelCopyWithImpl<NotificationModel>(
        this as NotificationModel,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    body,
    type,
    const DeepCollectionEquality().hash(data),
    createdAt,
    isRead,
  );

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, body: $body, type: $type, data: $data, createdAt: $createdAt, isRead: $isRead)';
  }
}

abstract mixin class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
    NotificationModel value,
    $Res Function(NotificationModel) _then,
  ) = _$NotificationModelCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String title,
    String body,
    String type,
    Map<String, dynamic>? data,
    DateTime createdAt,
    bool isRead,
  });
}

class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._self, this._then);

  final NotificationModel _self;
  final $Res Function(NotificationModel) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? type = null,
    Object? data = freezed,
    Object? createdAt = null,
    Object? isRead = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id ? _self.id : id as String,
        title: null == title ? _self.title : title as String,
        body: null == body ? _self.body : body as String,
        type: null == type ? _self.type : type as String,
        data: freezed == data ? _self.data : data as Map<String, dynamic>?,
        createdAt: null == createdAt ? _self.createdAt : createdAt as DateTime,
        isRead: null == isRead ? _self.isRead : isRead as bool,
      ),
    );
  }
}

extension NotificationModelPatterns on NotificationModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NotificationModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NotificationModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NotificationModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String title,
      String body,
      String type,
      Map<String, dynamic>? data,
      DateTime createdAt,
      bool isRead,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationModel() when $default != null:
        return $default(
          _that.id,
          _that.title,
          _that.body,
          _that.type,
          _that.data,
          _that.createdAt,
          _that.isRead,
        );
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String title,
      String body,
      String type,
      Map<String, dynamic>? data,
      DateTime createdAt,
      bool isRead,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationModel():
        return $default(
          _that.id,
          _that.title,
          _that.body,
          _that.type,
          _that.data,
          _that.createdAt,
          _that.isRead,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String title,
      String body,
      String type,
      Map<String, dynamic>? data,
      DateTime createdAt,
      bool isRead,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationModel() when $default != null:
        return $default(
          _that.id,
          _that.title,
          _that.body,
          _that.type,
          _that.data,
          _that.createdAt,
          _that.isRead,
        );
      case _:
        return null;
    }
  }
}

@JsonSerializable()
class _NotificationModel implements NotificationModel {
  const _NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    final Map<String, dynamic>? data,
    required this.createdAt,
    this.isRead = false,
  }) : _data = data;
  factory _NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String body;
  @override
  final String type;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;

    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isRead;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationModelCopyWith<_NotificationModel> get copyWith =>
      __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationModelToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    body,
    type,
    const DeepCollectionEquality().hash(_data),
    createdAt,
    isRead,
  );

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, body: $body, type: $type, data: $data, createdAt: $createdAt, isRead: $isRead)';
  }
}

abstract mixin class _$NotificationModelCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(
    _NotificationModel value,
    $Res Function(_NotificationModel) _then,
  ) = __$NotificationModelCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String body,
    String type,
    Map<String, dynamic>? data,
    DateTime createdAt,
    bool isRead,
  });
}

class __$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(this._self, this._then);

  final _NotificationModel _self;
  final $Res Function(_NotificationModel) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? type = null,
    Object? data = freezed,
    Object? createdAt = null,
    Object? isRead = null,
  }) {
    return _then(
      _NotificationModel(
        id: null == id ? _self.id : id as String,
        title: null == title ? _self.title : title as String,
        body: null == body ? _self.body : body as String,
        type: null == type ? _self.type : type as String,
        data: freezed == data ? _self._data : data as Map<String, dynamic>?,
        createdAt: null == createdAt ? _self.createdAt : createdAt as DateTime,
        isRead: null == isRead ? _self.isRead : isRead as bool,
      ),
    );
  }
}
