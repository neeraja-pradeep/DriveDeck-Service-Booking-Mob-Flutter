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
      username: json['username'] as String,
      email: json['email'] as String?,
      password: json['password'] as String,
      passwordConfirm: json['password_confirm'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$RegisterRequestDtoToJson(RegisterRequestDto instance) {
  final val = <String, dynamic>{
    'username': instance.username,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  val['password'] = instance.password;
  val['password_confirm'] = instance.passwordConfirm;
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  val['phone'] = instance.phone;
  return val;
}
