// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpVerifyDto _$OtpVerifyDtoFromJson(Map<String, dynamic> json) => OtpVerifyDto(
      phoneNumber: json['phone_number'] as String,
      otpCode: json['otp_code'] as String,
    );

Map<String, dynamic> _$OtpVerifyDtoToJson(OtpVerifyDto instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'otp_code': instance.otpCode,
    };
