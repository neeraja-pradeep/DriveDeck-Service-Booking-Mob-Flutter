import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/vehicle.dart';

/// Request to add a new vehicle/car.
/// API expects: { "car_type": "sedan", "registration": "string" }
class AddVehicleRequest {
  const AddVehicleRequest({
    required this.carType,
    this.registration,
    this.isFavourite = false,
  });

  final CarType carType;
  final String? registration;
  final bool isFavourite;

  Map<String, dynamic> toJson() => {
        'car_type': carType.apiValue,
        if (registration != null && registration!.isNotEmpty)
          'registration': registration,
        'is_favourite': isFavourite,
      };
}

/// Abstract repository for garage/vehicle management.
abstract class GarageRepository {
  /// Get all vehicles for the current user.
  Future<Either<Failure, List<Vehicle>>> getVehicles();

  /// Add a new vehicle.
  Future<Either<Failure, Vehicle>> addVehicle(AddVehicleRequest request);

  /// Update an existing vehicle.
  Future<Either<Failure, Vehicle>> updateVehicle(
    int vehicleId,
    AddVehicleRequest request,
  );

  /// Delete a vehicle.
  Future<Either<Failure, Unit>> deleteVehicle(int vehicleId);

  /// Set a vehicle as favourite.
  Future<Either<Failure, Vehicle>> setFavouriteVehicle(int vehicleId);
}
