import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/booking_date.dart';
import '../../domain/repositories/shop_repository.dart';

/// Use case for getting available time slots.
class GetAvailableSlotsUsecase {
  final ShopRepository _repository;

  GetAvailableSlotsUsecase(this._repository);

  /// Executes the use case.
  Future<Either<Failure, BookingDate>> call(
    String shopId,
    DateTime date,
  ) {
    return _repository.getAvailableSlots(shopId, date);
  }
}
