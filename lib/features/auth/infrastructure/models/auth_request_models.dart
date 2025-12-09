import 'package:json_annotation/json_annotation.dart';

part 'auth_request_models.g.dart';

/// DTO for OTP request.
@JsonSerializable()
class OtpRequestDto {
  const OtpRequestDto({required this.phone});

  factory OtpRequestDto.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestDtoFromJson(json);

  @JsonKey(name: 'phone_number')
  final String phone;

  Map<String, dynamic> toJson() => _$OtpRequestDtoToJson(this);
}

/// DTO for OTP verification.
@JsonSerializable()
class OtpVerifyDto {
  const OtpVerifyDto({
    required this.phone,
    required this.otpCode,
    this.newPassword,
  });

  factory OtpVerifyDto.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyDtoFromJson(json);

  @JsonKey(name: 'phone_number')
  final String phone;
  @JsonKey(name: 'otp_code')
  final String otpCode;
  @JsonKey(name: 'new_password', includeIfNull: false)
  final String? newPassword;

  Map<String, dynamic> toJson() => _$OtpVerifyDtoToJson(this);
}

/// DTO for user registration.
@JsonSerializable()
class RegisterRequestDto {
  const RegisterRequestDto({
    required this.phone,
    required this.username,
    required this.password,
    required this.passwordConfirm,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);

  final String phone;
  final String username;
  final String password;
  @JsonKey(name: 'password_confirm')
  final String passwordConfirm;

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}
