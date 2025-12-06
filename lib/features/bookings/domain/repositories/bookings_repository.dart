import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/booking.dart';
import '../entities/bookings_list.dart';
import '../entities/cached_data.dart';

/// Abstract repository interface for bookings operations.
///
/// Defines the contract for fetching and managing bookings data.
/// All methods return [Either] for functional error handling.
abstract class BookingsRepository {
  /// Fetches all bookings for the current user.
  ///
  /// Uses conditional fetching with [lastModified] header to reduce
  /// unnecessary data transfer. Returns `null` in the Right side if
  /// the server returns 304 Not Modified (use cached data).
  ///
  /// [lastModified] - The timestamp of the last successful fetch.
  ///
  /// Returns:
  /// - [Right(CachedData<BookingsList>)] - New data from server
  /// - [Right(null)] - Data not modified (304), use cache
  /// - [Left(Failure)] - Error occurred
  Future<Either<Failure, CachedData<BookingsList>?>> getBookings({
    DateTime? lastModified,
  });

  /// Fetches the details of a specific booking.
  ///
  /// [bookingId] - The unique identifier of the booking.
  ///
  /// Returns:
  /// - [Right(Booking)] - The booking details
  /// - [Left(Failure)] - Error occurred
  Future<Either<Failure, Booking>> getBookingDetails(String bookingId);

  /// Cancels a booking.
  ///
  /// Requires XCSRF token for authentication (handled by interceptor).
  ///
  /// [bookingId] - The unique identifier of the booking to cancel.
  ///
  /// Returns:
  /// - [Right(Booking)] - The updated booking with cancelled status
  /// - [Left(Failure)] - Error occurred
  Future<Either<Failure, Booking>> cancelBooking(String bookingId);

  /// Reschedules a booking to a new date and time slot.
  ///
  /// For future implementation.
  ///
  /// [bookingId] - The unique identifier of the booking.
  /// [newDate] - The new date for the booking.
  /// [newSlotId] - The identifier of the new time slot.
  ///
  /// Returns:
  /// - [Right(Booking)] - The updated booking with new schedule
  /// - [Left(Failure)] - Error occurred
  Future<Either<Failure, Booking>> rescheduleBooking({
    required String bookingId,
    required DateTime newDate,
    required String newSlotId,
  });

  /// Gets bookings from local cache.
  ///
  /// Returns:
  /// - [Right(CachedData<BookingsList>?)] - Cached data if available
  /// - [Left(Failure)] - Error occurred
  Future<Either<Failure, CachedData<BookingsList>?>> getCachedBookings();

  /// Clears the local bookings cache.
  ///
  /// Returns:
  /// - [Right(void)] - Cache cleared successfully
  /// - [Left(Failure)] - Error occurred
  Future<Either<Failure, void>> clearCache();
}
