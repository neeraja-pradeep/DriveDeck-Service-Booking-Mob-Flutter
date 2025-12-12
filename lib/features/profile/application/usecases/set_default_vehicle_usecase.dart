import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/vehicle.dart';
import '../../domain/repositories/garage_repository.dart';

/// Use case to set a vehicle as favourite.
class SetFavouriteVehicleUsecase {
  const SetFavouriteVehicleUsecase(this._repository);

  final GarageRepository _repository;

  /// Set a vehicle as favourite by ID.
  Future<Either<Failure, Vehicle>> call(int vehicleId) {
    return _repository.setFavouriteVehicle(vehicleId);
  }
}
