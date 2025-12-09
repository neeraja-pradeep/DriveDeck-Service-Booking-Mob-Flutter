import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/vehicle.dart';
import '../../domain/repositories/garage_repository.dart';

/// Use case to get all vehicles for the current user.
class GetVehiclesUsecase {
  const GetVehiclesUsecase(this._repository);

  final GarageRepository _repository;

  /// Get all vehicles.
  Future<Either<Failure, List<Vehicle>>> call() {
    return _repository.getVehicles();
  }
}
