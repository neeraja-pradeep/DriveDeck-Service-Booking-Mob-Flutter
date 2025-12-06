import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/shop.dart';
import '../../domain/repositories/shop_repository.dart';

/// Use case for getting shop details.
class GetShopDetailsUsecase {
  final ShopRepository _repository;

  GetShopDetailsUsecase(this._repository);

  /// Executes the use case.
  /// Returns null if 304 Not Modified (use cached data).
  Future<Either<Failure, CachedData<Shop>?>> call(
    String shopId,
    DateTime? lastModified,
  ) {
    return _repository.getShopDetails(shopId, lastModified);
  }
}
