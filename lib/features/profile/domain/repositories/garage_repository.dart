import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/vehicle.dart';

/// Request to add a new vehicle.
class AddVehicleRequest {
  const AddVehicleRequest({
    required this.make,
    required this.model,
    this.year,
    this.licensePlate,
    this.color,
    required this.vehicleType,
    this.isDefault = false,
  });

  final String make;
  final String model;
  final int? year;
  final String? licensePlate;
  final String? color;
  final String vehicleType;
  final bool isDefault;

  Map<String, dynamic> toJson() => {
    'make': make,
    'model': model,
    if (year != null) 'year': year,
    if (licensePlate != null) 'license_plate': licensePlate,
    if (color != null) 'color': color,
    'car_type': vehicleType,
    'is_default': isDefault,
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
    String vehicleId,
    AddVehicleRequest request,
  );

  /// Delete a vehicle.
  Future<Either<Failure, Unit>> deleteVehicle(String vehicleId);

  /// Set a vehicle as default.
  Future<Either<Failure, Vehicle>> setDefaultVehicle(String vehicleId);
}
