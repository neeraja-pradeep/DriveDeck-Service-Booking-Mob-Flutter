import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/vehicle.dart';
import '../../domain/repositories/garage_repository.dart';

/// Use case to set a vehicle as the default.
class SetDefaultVehicleUsecase {
  const SetDefaultVehicleUsecase(this._repository);

  final GarageRepository _repository;

  /// Set a vehicle as default by ID.
  Future<Either<Failure, Vehicle>> call(String vehicleId) {
    return _repository.setDefaultVehicle(vehicleId);
  }
}
