import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/booking.dart';
import '../../domain/repositories/bookings_repository.dart';

/// Use case for cancelling a booking.
///
/// Handles XCSRF token requirement (managed by interceptor).
class CancelBookingUsecase {
  /// Creates a new [CancelBookingUsecase].
  const CancelBookingUsecase({required this.repository});

  /// The bookings repository.
  final BookingsRepository repository;

  /// Executes the use case.
  ///
  /// [bookingId] - The ID of the booking to cancel.
  ///
  /// Returns:
  /// - [Right(Booking)] - The updated booking with cancelled status
  /// - [Left(Failure)] - Error occurred
  Future<Either<Failure, Booking>> call(String bookingId) {
    return repository.cancelBooking(bookingId);
  }
}
