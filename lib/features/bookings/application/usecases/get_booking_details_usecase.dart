import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/booking.dart';
import '../../domain/repositories/bookings_repository.dart';

/// Use case for fetching booking details.
class GetBookingDetailsUsecase {
  /// Creates a new [GetBookingDetailsUsecase].
  const GetBookingDetailsUsecase({required this.repository});

  /// The bookings repository.
  final BookingsRepository repository;

  /// Executes the use case.
  ///
  /// [bookingId] - The ID of the booking to fetch.
  ///
  /// Returns:
  /// - [Right(Booking)] - The booking details
  /// - [Left(Failure)] - Error occurred
  Future<Either<Failure, Booking>> call(String bookingId) {
    return repository.getBookingDetails(bookingId);
  }
}
