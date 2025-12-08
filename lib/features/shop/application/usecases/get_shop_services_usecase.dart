import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/shop.dart';
import '../../domain/repositories/shop_repository.dart';

/// Use case for getting shop services.
class GetShopServicesUseCase {
  GetShopServicesUseCase({required this.repository});

  final ShopRepository repository;

  /// Execute the use case.
  Future<Either<Failure, List<ShopService>>> call(int shopId) async {
    return repository.getShopServices(shopId);
  }
}
