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

/// DTO for user registration/signup.
@JsonSerializable()
class RegisterRequestDto {
  const RegisterRequestDto({
    required this.username,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);

  final String username;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirm')
  final String passwordConfirm;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}
