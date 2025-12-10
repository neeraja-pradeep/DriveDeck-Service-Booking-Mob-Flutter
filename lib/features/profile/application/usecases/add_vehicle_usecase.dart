import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/vehicle.dart';
import '../../domain/repositories/garage_repository.dart';

/// Use case to add a new vehicle.
class AddVehicleUsecase {
  const AddVehicleUsecase(this._repository);

  final GarageRepository _repository;

  /// Add a new vehicle.
  Future<Either<Failure, Vehicle>> call(AddVehicleRequest request) {
    return _repository.addVehicle(request);
  }
}
