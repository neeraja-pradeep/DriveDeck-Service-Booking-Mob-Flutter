/// Represents the type of vehicle for a car wash booking.
///
/// Different vehicle types may have different pricing and service options.
enum VehicleType {
  /// Standard sedan or hatchback car.
  car,

  /// Sport utility vehicle.
  suv,

  /// Pickup truck or commercial truck.
  truck,

  /// Motorcycle or scooter.
  motorcycle,

  /// Van or minivan.
  van,

  /// Other vehicle types not categorized above.
  other,
}

/// Extension methods for [VehicleType] enum.
extension VehicleTypeX on VehicleType {
  /// Returns a human-readable display name for the vehicle type.
  String get displayName => switch (this) {
        VehicleType.car => 'Car',
        VehicleType.suv => 'SUV',
        VehicleType.truck => 'Truck',
        VehicleType.motorcycle => 'Motorcycle',
        VehicleType.van => 'Van',
        VehicleType.other => 'Other',
      };

  /// Returns the icon name associated with this vehicle type.
  String get iconName => switch (this) {
        VehicleType.car => 'directions_car',
        VehicleType.suv => 'airport_shuttle',
        VehicleType.truck => 'local_shipping',
        VehicleType.motorcycle => 'two_wheeler',
        VehicleType.van => 'airport_shuttle',
        VehicleType.other => 'directions_car',
      };

  /// Converts a string value from API to [VehicleType].
  static VehicleType fromString(String value) {
    return switch (value.toLowerCase()) {
      'car' || 'sedan' || 'hatchback' => VehicleType.car,
      'suv' => VehicleType.suv,
      'truck' || 'pickup' => VehicleType.truck,
      'motorcycle' || 'bike' || 'scooter' => VehicleType.motorcycle,
      'van' || 'minivan' => VehicleType.van,
      _ => VehicleType.other,
    };
  }

  /// Converts the vehicle type to a string value for API.
  String toApiString() => switch (this) {
        VehicleType.car => 'car',
        VehicleType.suv => 'suv',
        VehicleType.truck => 'truck',
        VehicleType.motorcycle => 'motorcycle',
        VehicleType.van => 'van',
        VehicleType.other => 'other',
      };
}
