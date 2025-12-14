import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/vehicle.dart';

/// Request to add a new vehicle/car.
/// API expects: { "make": "string", "model": "string", "year": 2024, "license_plate": "string" }
class AddVehicleRequest {
  const AddVehicleRequest({
    required this.make,
    required this.model,
    this.year,
    this.licensePlate,
    this.isFavourite = false,
  });

  final String make;
  final String model;
  final int? year;
  final String? licensePlate;
  final bool isFavourite;

  Map<String, dynamic> toJson() => {
        'make': make,
        'model': model,
        if (year != null) 'year': year,
        if (licensePlate != null) 'license_plate': licensePlate,
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
