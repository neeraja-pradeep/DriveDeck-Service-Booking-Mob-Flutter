/// Represents the status of a booking in the car wash application.
///
/// This enum defines all possible states a booking can be in throughout
/// its lifecycle.
enum BookingStatus {
  /// Booking is awaiting confirmation from the shop.
  pending,

  /// Booking has been confirmed by the shop.
  confirmed,

  /// Service is currently being performed.
  inProgress,

  /// Service has been completed successfully.
  completed,

  /// Booking was cancelled by user or shop.
  cancelled,

  /// Customer did not show up for the appointment.
  noShow,
}

/// Extension methods for [BookingStatus] enum.
extension BookingStatusX on BookingStatus {
  /// Returns a human-readable display name for the status.
  String get displayName => switch (this) {
        BookingStatus.pending => 'Pending',
        BookingStatus.confirmed => 'Confirmed',
        BookingStatus.inProgress => 'In Progress',
        BookingStatus.completed => 'Completed',
        BookingStatus.cancelled => 'Cancelled',
        BookingStatus.noShow => 'No Show',
      };

  /// Returns true if this status represents an upcoming booking.
  bool get isUpcoming =>
      this == BookingStatus.pending || this == BookingStatus.confirmed;

  /// Returns true if this status represents a past/historical booking.
  bool get isPast =>
      this == BookingStatus.completed ||
      this == BookingStatus.cancelled ||
      this == BookingStatus.noShow;

  /// Converts a string value from API to [BookingStatus].
  static BookingStatus fromString(String value) {
    return switch (value.toLowerCase()) {
      'pending' => BookingStatus.pending,
      'confirmed' => BookingStatus.confirmed,
      'in_progress' || 'inprogress' => BookingStatus.inProgress,
      'completed' => BookingStatus.completed,
      'cancelled' || 'canceled' => BookingStatus.cancelled,
      'no_show' || 'noshow' => BookingStatus.noShow,
      _ => BookingStatus.pending,
    };
  }

  /// Converts the status to a string value for API.
  String toApiString() => switch (this) {
        BookingStatus.pending => 'pending',
        BookingStatus.confirmed => 'confirmed',
        BookingStatus.inProgress => 'in_progress',
        BookingStatus.completed => 'completed',
        BookingStatus.cancelled => 'cancelled',
        BookingStatus.noShow => 'no_show',
      };
}
