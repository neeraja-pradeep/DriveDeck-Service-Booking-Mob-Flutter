import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/booking_request.dart';
import '../../domain/entities/booking_confirmation.dart';

/// Use case for creating a booking.
///
/// Note: This use case currently uses a mock implementation.
/// When the booking API is integrated, update the repository to make
/// the actual API call.
class CreateBookingUsecase {
  CreateBookingUsecase();

  /// Execute the use case.
  Future<Either<Failure, BookingConfirmation>> call(
    BookingRequest request,
  ) async {
    try {
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));

      // Mock success response
      final confirmation = BookingConfirmation(
        bookingId: DateTime.now().millisecondsSinceEpoch,
        bookingReference: 'BK${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
        status: BookingStatus.confirmed,
        createdAt: DateTime.now(),
        message: 'Your booking has been confirmed successfully!',
      );

      return Right(confirmation);
    } catch (e) {
      return Left(Failure.bookingCreationFailed(message: e.toString()));
    }
  }
}
