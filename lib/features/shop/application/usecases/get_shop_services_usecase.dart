import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/shop_service.dart';
import '../../domain/entities/vehicle_type.dart';
import '../../domain/repositories/shop_repository.dart';

/// Use case for getting shop services.
class GetShopServicesUsecase {
  final ShopRepository _repository;

  GetShopServicesUsecase(this._repository);

  /// Executes the use case.
  Future<Either<Failure, List<ShopService>>> call(
    String shopId,
    VehicleType vehicleType,
  ) {
    return _repository.getShopServices(shopId, vehicleType);
  }
}
