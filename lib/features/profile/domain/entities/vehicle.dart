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

  /// Get the API value for car_type field.
  String get apiValue => switch (this) {
        GarageVehicleType.sedan => 'sedan',
        GarageVehicleType.suv => 'suv',
        GarageVehicleType.hatchback => 'hatchback',
        GarageVehicleType.muv => 'muv',
        GarageVehicleType.luxury => 'luxury',
      };
}

/// Vehicle entity representing a user's car in their garage.
/// Matches API response format from GET /api/accounts/v1/cars/
@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required int id,
    required GarageVehicleType carType,
    String? registration,
    String? imageUrl,
    @Default(false) bool isFavourite,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}

/// Extension for Vehicle helper methods.
extension VehicleX on Vehicle {
  /// Get display name based on car type.
  String get displayName => carType.displayName;

  /// Get formatted registration or vehicle type display.
  String get subtitle {
    if (registration != null && registration!.isNotEmpty) {
      return registration!;
    }
    return carType.displayName;
  }
}
