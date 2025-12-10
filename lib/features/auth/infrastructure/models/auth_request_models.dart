import 'package:json_annotation/json_annotation.dart';

part 'auth_request_models.g.dart';

/// DTO for OTP request.
/// API: POST /api/accounts/send-otp/
/// Payload: { "phone": "1234567890" }
@JsonSerializable()
class OtpRequestDto {
  const OtpRequestDto({required this.phone});

  factory OtpRequestDto.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestDtoFromJson(json);

  /// Phone number field - per API documentation uses 'phone' not 'phone_number'
  @JsonKey(name: 'phone')
  final String phone;

  Map<String, dynamic> toJson() => _$OtpRequestDtoToJson(this);
}

/// DTO for OTP verification.
/// API: POST /api/accounts/verify-otp/
/// Payload: { "phone": "9876543210", "otp_code": "123456", "new_password": "..." (optional) }
@JsonSerializable()
class OtpVerifyDto {
  const OtpVerifyDto({
    required this.phone,
    required this.otpCode,
    this.newPassword,
  });

  factory OtpVerifyDto.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyDtoFromJson(json);

  /// Phone number field - per API documentation uses 'phone' not 'phone_number'
  @JsonKey(name: 'phone')
  final String phone;

  /// OTP code field
  @JsonKey(name: 'otp_code')
  final String otpCode;

  /// Optional new password field for password reset flow
  @JsonKey(name: 'new_password', includeIfNull: false)
  final String? newPassword;

  Map<String, dynamic> toJson() => _$OtpVerifyDtoToJson(this);
}

/// DTO for user registration/signup.
/// API: POST /api/accounts/register/
/// Required fields per API doc: { "phone": "...", "username": "...", "password": "...", "password_confirm": "..." }
/// Additional optional fields may be supported by backend
@JsonSerializable()
class RegisterRequestDto {
  const RegisterRequestDto({
    required this.username,
    this.email,
    required this.password,
    required this.passwordConfirm,
    this.firstName,
    this.lastName,
    required this.phone,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);

  /// Required: username
  final String username;

  /// Optional: email address
  @JsonKey(includeIfNull: false)
  final String? email;

  /// Required: password
  final String password;

  /// Required: password confirmation - must match password
  @JsonKey(name: 'password_confirm')
  final String passwordConfirm;

  /// Optional: first name
  @JsonKey(name: 'first_name', includeIfNull: false)
  final String? firstName;

  /// Optional: last name
  @JsonKey(name: 'last_name', includeIfNull: false)
  final String? lastName;

  /// Required: phone number - per API doc uses 'phone'
  @JsonKey(name: 'phone')
  final String phone;

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}
