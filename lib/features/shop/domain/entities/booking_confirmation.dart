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
  String get displayName {
    switch (this) {
      case BookingStatus.pending:
        return 'Pending';
      case BookingStatus.confirmed:
        return 'Confirmed';
      case BookingStatus.inProgress:
        return 'In Progress';
      case BookingStatus.completed:
        return 'Completed';
      case BookingStatus.cancelled:
        return 'Cancelled';
    }
  }

  /// Get status color hex.
  int get colorHex {
    switch (this) {
      case BookingStatus.pending:
        return 0xFFFFA726; // Orange
      case BookingStatus.confirmed:
        return 0xFF42A5F5; // Blue
      case BookingStatus.inProgress:
        return 0xFF66BB6A; // Green
      case BookingStatus.completed:
        return 0xFF4CAF50; // Green
      case BookingStatus.cancelled:
        return 0xFFEF5350; // Red
    }
  }

  /// Check if booking is active (not cancelled or completed).
  bool get isActive =>
      this != BookingStatus.cancelled && this != BookingStatus.completed;

  /// Parse from string.
  static BookingStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'pending':
        return BookingStatus.pending;
      case 'confirmed':
        return BookingStatus.confirmed;
      case 'in_progress':
      case 'inprogress':
        return BookingStatus.inProgress;
      case 'completed':
        return BookingStatus.completed;
      case 'cancelled':
      case 'canceled':
        return BookingStatus.cancelled;
      default:
        return BookingStatus.pending;
    }
  }
}
