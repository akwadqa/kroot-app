part of 'verify_otp_response.dart';

T _$identity<T>(T value) => value;

mixin _$VerifyOtpResponse {
  String? get userId;
  String? get firstName;
  String? get lastName;
  String? get email;
  String? get mobileNo;
  String? get token;
  @JsonKey(name: 'validation')
  ValidationData? get validation;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerifyOtpResponseCopyWith<VerifyOtpResponse> get copyWith =>
      _$VerifyOtpResponseCopyWithImpl<VerifyOtpResponse>(
        this as VerifyOtpResponse,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerifyOtpResponse &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.validation, validation) ||
                other.validation == validation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    firstName,
    lastName,
    email,
    mobileNo,
    token,
    validation,
  );

  @override
  String toString() {
    return 'VerifyOtpResponse(userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, mobileNo: $mobileNo, token: $token, validation: $validation)';
  }
}

abstract mixin class $VerifyOtpResponseCopyWith<$Res> {
  factory $VerifyOtpResponseCopyWith(
    VerifyOtpResponse value,
    $Res Function(VerifyOtpResponse) _then,
  ) = _$VerifyOtpResponseCopyWithImpl;
  @useResult
  $Res call({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNo,
    String? token,
    @JsonKey(name: 'validation') ValidationData? validation,
  });

  $ValidationDataCopyWith<$Res>? get validation;
}

class _$VerifyOtpResponseCopyWithImpl<$Res>
    implements $VerifyOtpResponseCopyWith<$Res> {
  _$VerifyOtpResponseCopyWithImpl(this._self, this._then);

  final VerifyOtpResponse _self;
  final $Res Function(VerifyOtpResponse) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? mobileNo = freezed,
    Object? token = freezed,
    Object? validation = freezed,
  }) {
    return _then(
      _self.copyWith(
        userId: freezed == userId ? _self.userId : userId as String?,
        firstName: freezed == firstName
            ? _self.firstName
            : firstName as String?,
        lastName: freezed == lastName ? _self.lastName : lastName as String?,
        email: freezed == email ? _self.email : email as String?,
        mobileNo: freezed == mobileNo ? _self.mobileNo : mobileNo as String?,
        token: freezed == token ? _self.token : token as String?,
        validation: freezed == validation
            ? _self.validation
            : validation as ValidationData?,
      ),
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ValidationDataCopyWith<$Res>? get validation {
    if (_self.validation == null) {
      return null;
    }

    return $ValidationDataCopyWith<$Res>(_self.validation!, (value) {
      return _then(_self.copyWith(validation: value));
    });
  }
}

extension VerifyOtpResponsePatterns on VerifyOtpResponse {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VerifyOtpResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VerifyOtpResponse() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VerifyOtpResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifyOtpResponse():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VerifyOtpResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifyOtpResponse() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String? userId,
      String? firstName,
      String? lastName,
      String? email,
      String? mobileNo,
      String? token,
      @JsonKey(name: 'validation') ValidationData? validation,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VerifyOtpResponse() when $default != null:
        return $default(
          _that.userId,
          _that.firstName,
          _that.lastName,
          _that.email,
          _that.mobileNo,
          _that.token,
          _that.validation,
        );
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String? userId,
      String? firstName,
      String? lastName,
      String? email,
      String? mobileNo,
      String? token,
      @JsonKey(name: 'validation') ValidationData? validation,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifyOtpResponse():
        return $default(
          _that.userId,
          _that.firstName,
          _that.lastName,
          _that.email,
          _that.mobileNo,
          _that.token,
          _that.validation,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String? userId,
      String? firstName,
      String? lastName,
      String? email,
      String? mobileNo,
      String? token,
      @JsonKey(name: 'validation') ValidationData? validation,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifyOtpResponse() when $default != null:
        return $default(
          _that.userId,
          _that.firstName,
          _that.lastName,
          _that.email,
          _that.mobileNo,
          _that.token,
          _that.validation,
        );
      case _:
        return null;
    }
  }
}

@JsonSerializable()
class _VerifyOtpResponse implements VerifyOtpResponse {
  const _VerifyOtpResponse({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNo,
    this.token,
    @JsonKey(name: 'validation') this.validation,
  });
  factory _VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseFromJson(json);

  @override
  final String? userId;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? mobileNo;
  @override
  final String? token;
  @override
  @JsonKey(name: 'validation')
  final ValidationData? validation;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VerifyOtpResponseCopyWith<_VerifyOtpResponse> get copyWith =>
      __$VerifyOtpResponseCopyWithImpl<_VerifyOtpResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VerifyOtpResponseToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerifyOtpResponse &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.validation, validation) ||
                other.validation == validation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    firstName,
    lastName,
    email,
    mobileNo,
    token,
    validation,
  );

  @override
  String toString() {
    return 'VerifyOtpResponse(userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, mobileNo: $mobileNo, token: $token, validation: $validation)';
  }
}

abstract mixin class _$VerifyOtpResponseCopyWith<$Res>
    implements $VerifyOtpResponseCopyWith<$Res> {
  factory _$VerifyOtpResponseCopyWith(
    _VerifyOtpResponse value,
    $Res Function(_VerifyOtpResponse) _then,
  ) = __$VerifyOtpResponseCopyWithImpl;
  @override
  @useResult
  $Res call({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNo,
    String? token,
    @JsonKey(name: 'validation') ValidationData? validation,
  });

  @override
  $ValidationDataCopyWith<$Res>? get validation;
}

class __$VerifyOtpResponseCopyWithImpl<$Res>
    implements _$VerifyOtpResponseCopyWith<$Res> {
  __$VerifyOtpResponseCopyWithImpl(this._self, this._then);

  final _VerifyOtpResponse _self;
  final $Res Function(_VerifyOtpResponse) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? mobileNo = freezed,
    Object? token = freezed,
    Object? validation = freezed,
  }) {
    return _then(
      _VerifyOtpResponse(
        userId: freezed == userId ? _self.userId : userId as String?,
        firstName: freezed == firstName
            ? _self.firstName
            : firstName as String?,
        lastName: freezed == lastName ? _self.lastName : lastName as String?,
        email: freezed == email ? _self.email : email as String?,
        mobileNo: freezed == mobileNo ? _self.mobileNo : mobileNo as String?,
        token: freezed == token ? _self.token : token as String?,
        validation: freezed == validation
            ? _self.validation
            : validation as ValidationData?,
      ),
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ValidationDataCopyWith<$Res>? get validation {
    if (_self.validation == null) {
      return null;
    }

    return $ValidationDataCopyWith<$Res>(_self.validation!, (value) {
      return _then(_self.copyWith(validation: value));
    });
  }
}

mixin _$ValidationData {
  @JsonKey(name: 'mobile_number')
  String? get mobileNumber;
  @JsonKey(name: 'user_exist')
  bool? get userExist;
  @JsonKey(name: 'user_enabled')
  bool? get userEnabled;
  @JsonKey(name: 'OTP_valid')
  bool? get otpValid;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ValidationDataCopyWith<ValidationData> get copyWith =>
      _$ValidationDataCopyWithImpl<ValidationData>(
        this as ValidationData,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValidationData &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.userExist, userExist) ||
                other.userExist == userExist) &&
            (identical(other.userEnabled, userEnabled) ||
                other.userEnabled == userEnabled) &&
            (identical(other.otpValid, otpValid) ||
                other.otpValid == otpValid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mobileNumber, userExist, userEnabled, otpValid);

  @override
  String toString() {
    return 'ValidationData(mobileNumber: $mobileNumber, userExist: $userExist, userEnabled: $userEnabled, otpValid: $otpValid)';
  }
}

abstract mixin class $ValidationDataCopyWith<$Res> {
  factory $ValidationDataCopyWith(
    ValidationData value,
    $Res Function(ValidationData) _then,
  ) = _$ValidationDataCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    @JsonKey(name: 'user_exist') bool? userExist,
    @JsonKey(name: 'user_enabled') bool? userEnabled,
    @JsonKey(name: 'OTP_valid') bool? otpValid,
  });
}

class _$ValidationDataCopyWithImpl<$Res>
    implements $ValidationDataCopyWith<$Res> {
  _$ValidationDataCopyWithImpl(this._self, this._then);

  final ValidationData _self;
  final $Res Function(ValidationData) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileNumber = freezed,
    Object? userExist = freezed,
    Object? userEnabled = freezed,
    Object? otpValid = freezed,
  }) {
    return _then(
      _self.copyWith(
        mobileNumber: freezed == mobileNumber
            ? _self.mobileNumber
            : mobileNumber as String?,
        userExist: freezed == userExist ? _self.userExist : userExist as bool?,
        userEnabled: freezed == userEnabled
            ? _self.userEnabled
            : userEnabled as bool?,
        otpValid: freezed == otpValid ? _self.otpValid : otpValid as bool?,
      ),
    );
  }
}

extension ValidationDataPatterns on ValidationData {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ValidationData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ValidationData() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ValidationData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValidationData():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ValidationData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValidationData() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'mobile_number') String? mobileNumber,
      @JsonKey(name: 'user_exist') bool? userExist,
      @JsonKey(name: 'user_enabled') bool? userEnabled,
      @JsonKey(name: 'OTP_valid') bool? otpValid,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ValidationData() when $default != null:
        return $default(
          _that.mobileNumber,
          _that.userExist,
          _that.userEnabled,
          _that.otpValid,
        );
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'mobile_number') String? mobileNumber,
      @JsonKey(name: 'user_exist') bool? userExist,
      @JsonKey(name: 'user_enabled') bool? userEnabled,
      @JsonKey(name: 'OTP_valid') bool? otpValid,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValidationData():
        return $default(
          _that.mobileNumber,
          _that.userExist,
          _that.userEnabled,
          _that.otpValid,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      @JsonKey(name: 'mobile_number') String? mobileNumber,
      @JsonKey(name: 'user_exist') bool? userExist,
      @JsonKey(name: 'user_enabled') bool? userEnabled,
      @JsonKey(name: 'OTP_valid') bool? otpValid,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValidationData() when $default != null:
        return $default(
          _that.mobileNumber,
          _that.userExist,
          _that.userEnabled,
          _that.otpValid,
        );
      case _:
        return null;
    }
  }
}

@JsonSerializable()
class _ValidationData implements ValidationData {
  const _ValidationData({
    @JsonKey(name: 'mobile_number') this.mobileNumber,
    @JsonKey(name: 'user_exist') this.userExist,
    @JsonKey(name: 'user_enabled') this.userEnabled,
    @JsonKey(name: 'OTP_valid') this.otpValid,
  });
  factory _ValidationData.fromJson(Map<String, dynamic> json) =>
      _$ValidationDataFromJson(json);

  @override
  @JsonKey(name: 'mobile_number')
  final String? mobileNumber;
  @override
  @JsonKey(name: 'user_exist')
  final bool? userExist;
  @override
  @JsonKey(name: 'user_enabled')
  final bool? userEnabled;
  @override
  @JsonKey(name: 'OTP_valid')
  final bool? otpValid;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ValidationDataCopyWith<_ValidationData> get copyWith =>
      __$ValidationDataCopyWithImpl<_ValidationData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ValidationDataToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ValidationData &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.userExist, userExist) ||
                other.userExist == userExist) &&
            (identical(other.userEnabled, userEnabled) ||
                other.userEnabled == userEnabled) &&
            (identical(other.otpValid, otpValid) ||
                other.otpValid == otpValid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mobileNumber, userExist, userEnabled, otpValid);

  @override
  String toString() {
    return 'ValidationData(mobileNumber: $mobileNumber, userExist: $userExist, userEnabled: $userEnabled, otpValid: $otpValid)';
  }
}

abstract mixin class _$ValidationDataCopyWith<$Res>
    implements $ValidationDataCopyWith<$Res> {
  factory _$ValidationDataCopyWith(
    _ValidationData value,
    $Res Function(_ValidationData) _then,
  ) = __$ValidationDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    @JsonKey(name: 'user_exist') bool? userExist,
    @JsonKey(name: 'user_enabled') bool? userEnabled,
    @JsonKey(name: 'OTP_valid') bool? otpValid,
  });
}

class __$ValidationDataCopyWithImpl<$Res>
    implements _$ValidationDataCopyWith<$Res> {
  __$ValidationDataCopyWithImpl(this._self, this._then);

  final _ValidationData _self;
  final $Res Function(_ValidationData) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mobileNumber = freezed,
    Object? userExist = freezed,
    Object? userEnabled = freezed,
    Object? otpValid = freezed,
  }) {
    return _then(
      _ValidationData(
        mobileNumber: freezed == mobileNumber
            ? _self.mobileNumber
            : mobileNumber as String?,
        userExist: freezed == userExist ? _self.userExist : userExist as bool?,
        userEnabled: freezed == userEnabled
            ? _self.userEnabled
            : userEnabled as bool?,
        otpValid: freezed == otpValid ? _self.otpValid : otpValid as bool?,
      ),
    );
  }
}
