part of 'login_response_model.dart';

T _$identity<T>(T value) => value;

mixin _$LoginResponseModel {
  @JsonKey(name: "token")
  String get token;
  @JsonKey(name: "full_name")
  String? get fullName;
  @JsonKey(name: "user")
  String get email;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginResponseModelCopyWith<LoginResponseModel> get copyWith =>
      _$LoginResponseModelCopyWithImpl<LoginResponseModel>(
        this as LoginResponseModel,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginResponseModel &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, fullName, email);

  @override
  String toString() {
    return 'LoginResponseModel(token: $token, fullName: $fullName, email: $email)';
  }
}

abstract mixin class $LoginResponseModelCopyWith<$Res> {
  factory $LoginResponseModelCopyWith(
    LoginResponseModel value,
    $Res Function(LoginResponseModel) _then,
  ) = _$LoginResponseModelCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: "token") String token,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "user") String email,
  });
}

class _$LoginResponseModelCopyWithImpl<$Res>
    implements $LoginResponseModelCopyWith<$Res> {
  _$LoginResponseModelCopyWithImpl(this._self, this._then);

  final LoginResponseModel _self;
  final $Res Function(LoginResponseModel) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? fullName = freezed,
    Object? email = null,
  }) {
    return _then(
      _self.copyWith(
        token: null == token ? _self.token : token as String,
        fullName: freezed == fullName ? _self.fullName : fullName as String?,
        email: null == email ? _self.email : email as String,
      ),
    );
  }
}

extension LoginResponseModelPatterns on LoginResponseModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LoginResponseModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginResponseModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LoginResponseModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginResponseModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LoginResponseModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginResponseModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: "token") String token,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "user") String email,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginResponseModel() when $default != null:
        return $default(_that.token, _that.fullName, _that.email);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: "token") String token,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "user") String email,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginResponseModel():
        return $default(_that.token, _that.fullName, _that.email);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      @JsonKey(name: "token") String token,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "user") String email,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginResponseModel() when $default != null:
        return $default(_that.token, _that.fullName, _that.email);
      case _:
        return null;
    }
  }
}

@JsonSerializable()
class _LoginResponseModel implements LoginResponseModel {
  const _LoginResponseModel({
    @JsonKey(name: "token") required this.token,
    @JsonKey(name: "full_name") required this.fullName,
    @JsonKey(name: "user") required this.email,
  });
  factory _LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  @override
  @JsonKey(name: "token")
  final String token;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey(name: "user")
  final String email;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginResponseModelCopyWith<_LoginResponseModel> get copyWith =>
      __$LoginResponseModelCopyWithImpl<_LoginResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginResponseModel &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, fullName, email);

  @override
  String toString() {
    return 'LoginResponseModel(token: $token, fullName: $fullName, email: $email)';
  }
}

abstract mixin class _$LoginResponseModelCopyWith<$Res>
    implements $LoginResponseModelCopyWith<$Res> {
  factory _$LoginResponseModelCopyWith(
    _LoginResponseModel value,
    $Res Function(_LoginResponseModel) _then,
  ) = __$LoginResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "token") String token,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "user") String email,
  });
}

class __$LoginResponseModelCopyWithImpl<$Res>
    implements _$LoginResponseModelCopyWith<$Res> {
  __$LoginResponseModelCopyWithImpl(this._self, this._then);

  final _LoginResponseModel _self;
  final $Res Function(_LoginResponseModel) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = null,
    Object? fullName = freezed,
    Object? email = null,
  }) {
    return _then(
      _LoginResponseModel(
        token: null == token ? _self.token : token as String,
        fullName: freezed == fullName ? _self.fullName : fullName as String?,
        email: null == email ? _self.email : email as String,
      ),
    );
  }
}
