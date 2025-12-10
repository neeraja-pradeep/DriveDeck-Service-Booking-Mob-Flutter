import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/booking_confirmation.dart';

part 'booking_confirmation_model.g.dart';

/// Model for booking confirmation API response.
@JsonSerializable()
class BookingConfirmationModel {
  const BookingConfirmationModel({
    required this.bookingId,
    required this.bookingReference,
    required this.status,
    required this.createdAt,
    this.message,
    this.shopName,
    this.scheduledDate,
    this.scheduledTime,
  });

  @JsonKey(name: 'booking_id', fromJson: _idFromJson)
  final int bookingId;
  @JsonKey(name: 'booking_reference', fromJson: _referenceFromJson)
  final String bookingReference;
  final String status;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final String? message;
  @JsonKey(name: 'shop_name')
  final String? shopName;
  @JsonKey(name: 'appointment_date', fromJson: _dateOrNull)
  final DateTime? scheduledDate;
  @JsonKey(name: 'start_slot_time')
  final String? scheduledTime;

  factory BookingConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$BookingConfirmationModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingConfirmationModelToJson(this);

  BookingConfirmation toDomain() => BookingConfirmation(
        bookingId: bookingId,
        bookingReference: bookingReference,
        status: BookingStatusExtension.fromString(status),
        createdAt: DateTime.parse(createdAt),
        message: message,
        shopName: shopName,
        scheduledDate: scheduledDate,
        scheduledTime: scheduledTime,
      );
}

int _idFromJson(Object? value) {
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  // Fallback if backend omits booking_id but sends id
  return 0;
}

String _referenceFromJson(Object? value) {
  if (value == null) return '';
  return value.toString();
}

DateTime? _dateOrNull(Object? value) {
  if (value == null) return null;
  return DateTime.tryParse(value.toString());
}
