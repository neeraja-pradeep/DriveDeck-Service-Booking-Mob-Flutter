import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/shop.dart';
import '../../domain/repositories/shop_repository.dart';

/// Use case for getting shop details.
class GetShopDetailsUseCase {
  GetShopDetailsUseCase({required this.repository});

  final ShopRepository repository;

  /// Execute the use case.
  Future<Either<Failure, Shop>> call(int shopId) async {
    return repository.getShopDetails(shopId);
  }
}
