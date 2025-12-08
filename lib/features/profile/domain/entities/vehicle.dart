import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

/// Vehicle type enum.
enum GarageVehicleType {
  sedan,
  suv,
  hatchback,
  muv,
  luxury,
}

/// Extension for VehicleType display properties.
extension GarageVehicleTypeX on GarageVehicleType {
  String get displayName => switch (this) {
        GarageVehicleType.sedan => 'SEDAN',
        GarageVehicleType.suv => 'SUV',
        GarageVehicleType.hatchback => 'HATCHBACK',
        GarageVehicleType.muv => 'MUV',
        GarageVehicleType.luxury => 'LUXURY',
      };
}

/// Vehicle entity representing a user's vehicle in their garage.
@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required String id,
    required String make,
    required String model,
    int? year,
    String? licensePlate,
    String? color,
    required GarageVehicleType vehicleType,
    String? imageUrl,
    @Default(false) bool isDefault,
    DateTime? createdAt,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}

/// Extension for Vehicle helper methods.
extension VehicleX on Vehicle {
  /// Get display name combining make and model.
  String get displayName {
    if (year != null) {
      return '$year $make $model';
    }
    return '$make $model';
  }

  /// Get formatted license plate or vehicle type display.
  String get subtitle {
    if (licensePlate != null && licensePlate!.isNotEmpty) {
      return licensePlate!;
    }
    return vehicleType.displayName;
  }
}
