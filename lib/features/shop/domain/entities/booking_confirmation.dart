import 'package:freezed_annotation/freezed_annotation.dart';

import 'booking_status.dart';

part 'booking_confirmation.freezed.dart';

/// Represents the confirmation of a successful booking.
@freezed
class BookingConfirmation with _$BookingConfirmation {
  const BookingConfirmation._();

  const factory BookingConfirmation({
    required String bookingId,
    required String bookingReference,
    required BookingStatus status,
    required DateTime createdAt,
  }) = _BookingConfirmation;

  /// Returns the formatted created date.
  String get formattedCreatedAt {
    return '${createdAt.day}/${createdAt.month}/${createdAt.year} at ${createdAt.hour}:${createdAt.minute.toString().padLeft(2, '0')}';
  }
}
