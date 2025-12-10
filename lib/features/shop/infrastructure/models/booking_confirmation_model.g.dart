// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_confirmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingConfirmationModel _$BookingConfirmationModelFromJson(
        Map<String, dynamic> json) =>
    BookingConfirmationModel(
      bookingId: _idFromJson(json['booking_id']),
      bookingReference: _referenceFromJson(json['booking_reference']),
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      message: json['message'] as String?,
      shopName: json['shop_name'] as String?,
      scheduledDate: _dateOrNull(json['appointment_date']),
      scheduledTime: json['start_slot_time'] as String?,
    );

Map<String, dynamic> _$BookingConfirmationModelToJson(
        BookingConfirmationModel instance) =>
    <String, dynamic>{
      'booking_id': instance.bookingId,
      'booking_reference': instance.bookingReference,
      'status': instance.status,
      'created_at': instance.createdAt,
      'message': instance.message,
      'shop_name': instance.shopName,
      'appointment_date': instance.scheduledDate?.toIso8601String(),
      'start_slot_time': instance.scheduledTime,
    };
