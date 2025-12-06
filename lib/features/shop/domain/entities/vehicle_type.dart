/// Enum representing vehicle types for car wash services.
enum VehicleType {
  hatchback,
  sedan,
  suv,
  muv,
  luxury,
}

/// Extension providing display names and utility methods for VehicleType.
extension VehicleTypeX on VehicleType {
  /// Returns the display name for the vehicle type.
  String get displayName => switch (this) {
        VehicleType.hatchback => 'Hatchback',
        VehicleType.sedan => 'Sedan',
        VehicleType.suv => 'SUV',
        VehicleType.muv => 'MUV',
        VehicleType.luxury => 'Luxury',
      };

  /// Returns the API string value for the vehicle type.
  String get apiValue => switch (this) {
        VehicleType.hatchback => 'hatchback',
        VehicleType.sedan => 'sedan',
        VehicleType.suv => 'suv',
        VehicleType.muv => 'muv',
        VehicleType.luxury => 'luxury',
      };

  /// Creates a VehicleType from an API string value.
  static VehicleType fromApiValue(String value) {
    return VehicleType.values.firstWhere(
      (type) => type.apiValue == value.toLowerCase(),
      orElse: () => VehicleType.sedan,
    );
  }
}
