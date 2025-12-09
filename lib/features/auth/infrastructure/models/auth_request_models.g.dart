// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpRequestDto _$OtpRequestDtoFromJson(Map<String, dynamic> json) =>
    OtpRequestDto(
      phone: json['phone_number'] as String,
    );

Map<String, dynamic> _$OtpRequestDtoToJson(OtpRequestDto instance) =>
    <String, dynamic>{
      'phone_number': instance.phone,
    };

OtpVerifyDto _$OtpVerifyDtoFromJson(Map<String, dynamic> json) => OtpVerifyDto(
      phone: json['phone_number'] as String,
      otpCode: json['otp_code'] as String,
      newPassword: json['new_password'] as String?,
    );

Map<String, dynamic> _$OtpVerifyDtoToJson(OtpVerifyDto instance) {
  final val = <String, dynamic>{
    'phone_number': instance.phone,
    'otp_code': instance.otpCode,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('new_password', instance.newPassword);
  return val;
}

RegisterRequestDto _$RegisterRequestDtoFromJson(Map<String, dynamic> json) =>
    RegisterRequestDto(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirm: json['password_confirm'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$RegisterRequestDtoToJson(RegisterRequestDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'password_confirm': instance.passwordConfirm,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
    };
