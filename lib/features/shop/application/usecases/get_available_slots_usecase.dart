import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/shop.dart';
import '../../domain/repositories/shop_repository.dart';

/// Use case for getting available time slots.
class GetAvailableSlotsUsecase {
  GetAvailableSlotsUsecase({required this.repository});

  final ShopRepository repository;

  /// Execute the use case.
  ///
  /// [shopId] - The ID of the shop.
  /// [startDate] - The start date for availability check.
  /// [days] - Number of days to check (default: 7).
  Future<Either<Failure, List<ShopDateAvailability>>> call({
    required int shopId,
    required DateTime startDate,
    int days = 7,
  }) async {
    return repository.getShopAvailability(
      shopId: shopId,
      startDate: startDate,
      days: days,
    );
  }
}
