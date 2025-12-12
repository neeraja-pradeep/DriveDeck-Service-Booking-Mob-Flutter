import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/garage_repository.dart';

/// Use case to delete a vehicle.
class DeleteVehicleUsecase {
  const DeleteVehicleUsecase(this._repository);

  final GarageRepository _repository;

  /// Delete a vehicle by ID.
  Future<Either<Failure, Unit>> call(int vehicleId) {
    return _repository.deleteVehicle(vehicleId);
  }
}
