// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_confirmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingConfirmationModel _$BookingConfirmationModelFromJson(
        Map<String, dynamic> json) =>
    BookingConfirmationModel(
      bookingId: (json['booking_id'] as num).toInt(),
      bookingReference: json['booking_reference'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BookingConfirmationModelToJson(
        BookingConfirmationModel instance) =>
    <String, dynamic>{
      'booking_id': instance.bookingId,
      'booking_reference': instance.bookingReference,
      'status': instance.status,
      'created_at': instance.createdAt,
      'message': instance.message,
    };
