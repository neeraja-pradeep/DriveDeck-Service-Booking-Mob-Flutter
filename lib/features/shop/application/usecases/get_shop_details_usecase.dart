import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/shop.dart';
import '../../domain/repositories/shop_repository.dart';

/// Use case for getting shop details.
class GetShopDetailsUsecase {
  GetShopDetailsUsecase({required this.repository});

  final ShopRepository repository;

  /// Execute the use case.
  Future<Either<Failure, Shop>> call(int shopId) async {
    return repository.getShopDetails(shopId);
  }
}
