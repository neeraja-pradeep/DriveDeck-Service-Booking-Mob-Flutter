/// Enum representing the status of a booking.
enum BookingStatus {
  pending,
  confirmed,
  inProgress,
  completed,
  cancelled,
}

/// Extension providing display names and utility methods for BookingStatus.
extension BookingStatusX on BookingStatus {
  /// Returns the display name for the booking status.
  String get displayName => switch (this) {
        BookingStatus.pending => 'Pending',
        BookingStatus.confirmed => 'Confirmed',
        BookingStatus.inProgress => 'In Progress',
        BookingStatus.completed => 'Completed',
        BookingStatus.cancelled => 'Cancelled',
      };

  /// Returns the API string value for the booking status.
  String get apiValue => switch (this) {
        BookingStatus.pending => 'pending',
        BookingStatus.confirmed => 'confirmed',
        BookingStatus.inProgress => 'in_progress',
        BookingStatus.completed => 'completed',
        BookingStatus.cancelled => 'cancelled',
      };

  /// Creates a BookingStatus from an API string value.
  static BookingStatus fromApiValue(String value) {
    return BookingStatus.values.firstWhere(
      (status) => status.apiValue == value.toLowerCase(),
      orElse: () => BookingStatus.pending,
    );
  }
}
