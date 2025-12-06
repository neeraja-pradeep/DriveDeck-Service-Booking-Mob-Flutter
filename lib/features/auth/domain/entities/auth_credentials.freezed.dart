// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OtpRequestCredentials {
  String get phoneNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpRequestCredentialsCopyWith<OtpRequestCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpRequestCredentialsCopyWith<$Res> {
  factory $OtpRequestCredentialsCopyWith(OtpRequestCredentials value,
          $Res Function(OtpRequestCredentials) then) =
      _$OtpRequestCredentialsCopyWithImpl<$Res, OtpRequestCredentials>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class _$OtpRequestCredentialsCopyWithImpl<$Res,
        $Val extends OtpRequestCredentials>
    implements $OtpRequestCredentialsCopyWith<$Res> {
  _$OtpRequestCredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpRequestCredentialsImplCopyWith<$Res>
    implements $OtpRequestCredentialsCopyWith<$Res> {
  factory _$$OtpRequestCredentialsImplCopyWith(
          _$OtpRequestCredentialsImpl value,
          $Res Function(_$OtpRequestCredentialsImpl) then) =
      __$$OtpRequestCredentialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$OtpRequestCredentialsImplCopyWithImpl<$Res>
    extends _$OtpRequestCredentialsCopyWithImpl<$Res,
        _$OtpRequestCredentialsImpl>
    implements _$$OtpRequestCredentialsImplCopyWith<$Res> {
  __$$OtpRequestCredentialsImplCopyWithImpl(_$OtpRequestCredentialsImpl _value,
      $Res Function(_$OtpRequestCredentialsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$OtpRequestCredentialsImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtpRequestCredentialsImpl implements _OtpRequestCredentials {
  const _$OtpRequestCredentialsImpl({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'OtpRequestCredentials(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpRequestCredentialsImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpRequestCredentialsImplCopyWith<_$OtpRequestCredentialsImpl>
      get copyWith => __$$OtpRequestCredentialsImplCopyWithImpl<
          _$OtpRequestCredentialsImpl>(this, _$identity);
}

abstract class _OtpRequestCredentials implements OtpRequestCredentials {
  const factory _OtpRequestCredentials({required final String phoneNumber}) =
      _$OtpRequestCredentialsImpl;

  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$OtpRequestCredentialsImplCopyWith<_$OtpRequestCredentialsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OtpVerifyCredentials {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  bool get rememberMe => throw _privateConstructorUsedError;
  String? get newPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpVerifyCredentialsCopyWith<OtpVerifyCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerifyCredentialsCopyWith<$Res> {
  factory $OtpVerifyCredentialsCopyWith(OtpVerifyCredentials value,
          $Res Function(OtpVerifyCredentials) then) =
      _$OtpVerifyCredentialsCopyWithImpl<$Res, OtpVerifyCredentials>;
  @useResult
  $Res call(
      {String phoneNumber, String otp, bool rememberMe, String? newPassword});
}

/// @nodoc
class _$OtpVerifyCredentialsCopyWithImpl<$Res,
        $Val extends OtpVerifyCredentials>
    implements $OtpVerifyCredentialsCopyWith<$Res> {
  _$OtpVerifyCredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? otp = null,
    Object? rememberMe = null,
    Object? newPassword = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpVerifyCredentialsImplCopyWith<$Res>
    implements $OtpVerifyCredentialsCopyWith<$Res> {
  factory _$$OtpVerifyCredentialsImplCopyWith(_$OtpVerifyCredentialsImpl value,
          $Res Function(_$OtpVerifyCredentialsImpl) then) =
      __$$OtpVerifyCredentialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String phoneNumber, String otp, bool rememberMe, String? newPassword});
}

/// @nodoc
class __$$OtpVerifyCredentialsImplCopyWithImpl<$Res>
    extends _$OtpVerifyCredentialsCopyWithImpl<$Res, _$OtpVerifyCredentialsImpl>
    implements _$$OtpVerifyCredentialsImplCopyWith<$Res> {
  __$$OtpVerifyCredentialsImplCopyWithImpl(_$OtpVerifyCredentialsImpl _value,
      $Res Function(_$OtpVerifyCredentialsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? otp = null,
    Object? rememberMe = null,
    Object? newPassword = freezed,
  }) {
    return _then(_$OtpVerifyCredentialsImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OtpVerifyCredentialsImpl implements _OtpVerifyCredentials {
  const _$OtpVerifyCredentialsImpl(
      {required this.phoneNumber,
      required this.otp,
      this.rememberMe = false,
      this.newPassword});

  @override
  final String phoneNumber;
  @override
  final String otp;
  @override
  @JsonKey()
  final bool rememberMe;
  @override
  final String? newPassword;

  @override
  String toString() {
    return 'OtpVerifyCredentials(phoneNumber: $phoneNumber, otp: $otp, rememberMe: $rememberMe, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerifyCredentialsImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, phoneNumber, otp, rememberMe, newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerifyCredentialsImplCopyWith<_$OtpVerifyCredentialsImpl>
      get copyWith =>
          __$$OtpVerifyCredentialsImplCopyWithImpl<_$OtpVerifyCredentialsImpl>(
              this, _$identity);
}

abstract class _OtpVerifyCredentials implements OtpVerifyCredentials {
  const factory _OtpVerifyCredentials(
      {required final String phoneNumber,
      required final String otp,
      final bool rememberMe,
      final String? newPassword}) = _$OtpVerifyCredentialsImpl;

  @override
  String get phoneNumber;
  @override
  String get otp;
  @override
  bool get rememberMe;
  @override
  String? get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$OtpVerifyCredentialsImplCopyWith<_$OtpVerifyCredentialsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterCredentials {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterCredentialsCopyWith<RegisterCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterCredentialsCopyWith<$Res> {
  factory $RegisterCredentialsCopyWith(
          RegisterCredentials value, $Res Function(RegisterCredentials) then) =
      _$RegisterCredentialsCopyWithImpl<$Res, RegisterCredentials>;
  @useResult
  $Res call(
      {String phoneNumber,
      String username,
      String password,
      String confirmPassword});
}

/// @nodoc
class _$RegisterCredentialsCopyWithImpl<$Res, $Val extends RegisterCredentials>
    implements $RegisterCredentialsCopyWith<$Res> {
  _$RegisterCredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? username = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterCredentialsImplCopyWith<$Res>
    implements $RegisterCredentialsCopyWith<$Res> {
  factory _$$RegisterCredentialsImplCopyWith(_$RegisterCredentialsImpl value,
          $Res Function(_$RegisterCredentialsImpl) then) =
      __$$RegisterCredentialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String phoneNumber,
      String username,
      String password,
      String confirmPassword});
}

/// @nodoc
class __$$RegisterCredentialsImplCopyWithImpl<$Res>
    extends _$RegisterCredentialsCopyWithImpl<$Res, _$RegisterCredentialsImpl>
    implements _$$RegisterCredentialsImplCopyWith<$Res> {
  __$$RegisterCredentialsImplCopyWithImpl(_$RegisterCredentialsImpl _value,
      $Res Function(_$RegisterCredentialsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? username = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$RegisterCredentialsImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterCredentialsImpl implements _RegisterCredentials {
  const _$RegisterCredentialsImpl(
      {required this.phoneNumber,
      required this.username,
      required this.password,
      required this.confirmPassword});

  @override
  final String phoneNumber;
  @override
  final String username;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'RegisterCredentials(phoneNumber: $phoneNumber, username: $username, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterCredentialsImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, phoneNumber, username, password, confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterCredentialsImplCopyWith<_$RegisterCredentialsImpl> get copyWith =>
      __$$RegisterCredentialsImplCopyWithImpl<_$RegisterCredentialsImpl>(
          this, _$identity);
}

abstract class _RegisterCredentials implements RegisterCredentials {
  const factory _RegisterCredentials(
      {required final String phoneNumber,
      required final String username,
      required final String password,
      required final String confirmPassword}) = _$RegisterCredentialsImpl;

  @override
  String get phoneNumber;
  @override
  String get username;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$RegisterCredentialsImplCopyWith<_$RegisterCredentialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
