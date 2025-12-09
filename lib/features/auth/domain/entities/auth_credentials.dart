import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_credentials.freezed.dart';

/// Credentials for requesting an OTP.
@freezed
class OtpRequestCredentials with _$OtpRequestCredentials {
  const factory OtpRequestCredentials({required String phoneNumber}) =
      _OtpRequestCredentials;
}

/// Credentials for verifying an OTP.
@freezed
class OtpVerifyCredentials with _$OtpVerifyCredentials {
  const factory OtpVerifyCredentials({
    required String phoneNumber,
    required String otp,
    @Default(false) bool rememberMe,
    String? newPassword,
  }) = _OtpVerifyCredentials;
}

/// Credentials for user registration/signup.
@freezed
class RegisterCredentials with _$RegisterCredentials {
  const factory RegisterCredentials({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) = _RegisterCredentials;
}
