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
  });

  @JsonKey(name: 'booking_id')
  final int bookingId;
  @JsonKey(name: 'booking_reference')
  final String bookingReference;
  final String status;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final String? message;

  factory BookingConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$BookingConfirmationModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingConfirmationModelToJson(this);

  BookingConfirmation toDomain() => BookingConfirmation(
        bookingId: bookingId,
        bookingReference: bookingReference,
        status: BookingStatusExtension.fromString(status),
        createdAt: DateTime.parse(createdAt),
        message: message,
      );
}
