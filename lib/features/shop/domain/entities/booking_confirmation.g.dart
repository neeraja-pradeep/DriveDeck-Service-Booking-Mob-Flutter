// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_confirmation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingConfirmationImpl _$$BookingConfirmationImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingConfirmationImpl(
      bookingId: (json['bookingId'] as num).toInt(),
      bookingReference: json['bookingReference'] as String,
      status: $enumDecode(_$BookingStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      message: json['message'] as String?,
      shopName: json['shopName'] as String?,
      scheduledDate: json['scheduledDate'] == null
          ? null
          : DateTime.parse(json['scheduledDate'] as String),
      scheduledTime: json['scheduledTime'] as String?,
    );

Map<String, dynamic> _$$BookingConfirmationImplToJson(
        _$BookingConfirmationImpl instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'bookingReference': instance.bookingReference,
      'status': _$BookingStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'message': instance.message,
      'shopName': instance.shopName,
      'scheduledDate': instance.scheduledDate?.toIso8601String(),
      'scheduledTime': instance.scheduledTime,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.pending: 'pending',
  BookingStatus.confirmed: 'confirmed',
  BookingStatus.inProgress: 'inProgress',
  BookingStatus.completed: 'completed',
  BookingStatus.cancelled: 'cancelled',
};
