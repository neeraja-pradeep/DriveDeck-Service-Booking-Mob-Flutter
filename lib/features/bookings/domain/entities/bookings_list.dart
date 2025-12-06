import 'package:equatable/equatable.dart';

import 'booking.dart';

/// Wrapper class for categorized bookings.
///
/// Separates bookings into upcoming and past categories for easy access.
class BookingsList extends Equatable {
  /// Creates a new [BookingsList] instance.
  const BookingsList({
    required this.upcomingBookings,
    required this.pastBookings,
  });

  /// Creates an empty [BookingsList].
  const BookingsList.empty()
      : upcomingBookings = const [],
        pastBookings = const [];

  /// List of upcoming/active bookings.
  final List<Booking> upcomingBookings;

  /// List of past/historical bookings.
  final List<Booking> pastBookings;

  /// Returns the count of upcoming bookings.
  int get upcomingCount => upcomingBookings.length;

  /// Returns the count of past bookings.
  int get historyCount => pastBookings.length;

  /// Returns true if both lists are empty.
  bool get isEmpty => upcomingBookings.isEmpty && pastBookings.isEmpty;

  /// Returns true if there are any bookings.
  bool get isNotEmpty => !isEmpty;

  /// Returns the total count of all bookings.
  int get totalCount => upcomingCount + historyCount;

  /// Creates a copy of this [BookingsList] with the given fields replaced.
  BookingsList copyWith({
    List<Booking>? upcomingBookings,
    List<Booking>? pastBookings,
  }) {
    return BookingsList(
      upcomingBookings: upcomingBookings ?? this.upcomingBookings,
      pastBookings: pastBookings ?? this.pastBookings,
    );
  }

  @override
  List<Object?> get props => [upcomingBookings, pastBookings];
}
