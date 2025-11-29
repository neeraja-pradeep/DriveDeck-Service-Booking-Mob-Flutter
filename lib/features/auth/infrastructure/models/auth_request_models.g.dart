// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpRequestDto _$OtpRequestDtoFromJson(Map<String, dynamic> json) =>
    OtpRequestDto(
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$OtpRequestDtoToJson(OtpRequestDto instance) =>
    <String, dynamic>{
      'phone': instance.phone,
    };

OtpVerifyDto _$OtpVerifyDtoFromJson(Map<String, dynamic> json) => OtpVerifyDto(
      phone: json['phone'] as String,
      otpCode: json['otp_code'] as String,
      newPassword: json['new_password'] as String?,
    );

Map<String, dynamic> _$OtpVerifyDtoToJson(OtpVerifyDto instance) {
  final val = <String, dynamic>{
    'phone': instance.phone,
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
      phone: json['phone'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      passwordConfirm: json['password_confirm'] as String,
    );

Map<String, dynamic> _$RegisterRequestDtoToJson(RegisterRequestDto instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
      'password_confirm': instance.passwordConfirm,
    };
