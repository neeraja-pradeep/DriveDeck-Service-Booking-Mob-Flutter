import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/booking_confirmation.dart';
import '../../domain/entities/booking_request.dart';
import '../../domain/repositories/shop_repository.dart';

/// Use case for creating a booking.
class CreateBookingUsecase {
  final ShopRepository _repository;

  CreateBookingUsecase(this._repository);

  /// Executes the use case.
  Future<Either<Failure, BookingConfirmation>> call(
    BookingRequest request,
  ) {
    return _repository.createBooking(request);
  }
}
