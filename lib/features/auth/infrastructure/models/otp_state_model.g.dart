// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpStateModel _$OtpStateModelFromJson(Map<String, dynamic> json) =>
    OtpStateModel(
      otpSentTo: json['phone'] as String,
      expiresAt: json['expires_at'] as String?,
      attemptsRemaining: (json['attempts_remaining'] as num?)?.toInt(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$OtpStateModelToJson(OtpStateModel instance) =>
    <String, dynamic>{
      'phone': instance.otpSentTo,
      'expires_at': instance.expiresAt,
      'attempts_remaining': instance.attemptsRemaining,
      'message': instance.message,
      'status': instance.status,
    };
