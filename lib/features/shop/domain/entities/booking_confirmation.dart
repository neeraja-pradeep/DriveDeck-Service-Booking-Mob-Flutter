import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_confirmation.freezed.dart';
part 'booking_confirmation.g.dart';

/// Booking confirmation response after successful booking.
@freezed
class BookingConfirmation with _$BookingConfirmation {
  const factory BookingConfirmation({
    required int bookingId,
    required String bookingReference,
    required BookingStatus status,
    required DateTime createdAt,
    String? message,
  }) = _BookingConfirmation;

  factory BookingConfirmation.fromJson(Map<String, dynamic> json) =>
      _$BookingConfirmationFromJson(json);
}

/// Status of a booking.
enum BookingStatus {
  pending,
  confirmed,
  inProgress,
  completed,
  cancelled,
}

/// Extension for booking status.
extension BookingStatusExtension on BookingStatus {
  /// Get display name.
  String get displayName => switch (this) {
        BookingStatus.pending => 'Pending',
        BookingStatus.confirmed => 'Confirmed',
        BookingStatus.inProgress => 'In Progress',
        BookingStatus.completed => 'Completed',
        BookingStatus.cancelled => 'Cancelled',
      };

  /// Get status color.
  Color get color => switch (this) {
        BookingStatus.pending => const Color(0xFFFFA726),
        BookingStatus.confirmed => const Color(0xFF42A5F5),
        BookingStatus.inProgress => const Color(0xFF66BB6A),
        BookingStatus.completed => const Color(0xFF4CAF50),
        BookingStatus.cancelled => const Color(0xFFEF5350),
      };

  /// Check if booking is active (not cancelled or completed).
  bool get isActive =>
      this != BookingStatus.cancelled && this != BookingStatus.completed;

  /// Parse from string.
  static BookingStatus fromString(String value) => switch (value.toLowerCase()) {
        'pending' => BookingStatus.pending,
        'confirmed' => BookingStatus.confirmed,
        'in_progress' || 'inprogress' => BookingStatus.inProgress,
        'completed' => BookingStatus.completed,
        'cancelled' || 'canceled' => BookingStatus.cancelled,
        _ => BookingStatus.pending,
      };
}
