// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      sessionId: json['session_id'] as String,
      xcsrfToken: json['xcsrf_token'] as String,
      userId: json['user_id'] as String,
      createdAt: json['created_at'] as String?,
      expiresAt: json['expires_at'] as String?,
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'xcsrf_token': instance.xcsrfToken,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'expires_at': instance.expiresAt,
    };
