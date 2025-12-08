import 'dart:ui';

/// Vehicle types supported for services.
enum VehicleType {
  hatchback,
  sedan,
  suv,
  muv,
  luxury,
}

/// Extension for display names, icons, and colors.
extension VehicleTypeExtension on VehicleType {
  /// Get display name for the vehicle type.
  String get displayName => switch (this) {
        VehicleType.hatchback => 'Hatchback',
        VehicleType.sedan => 'Sedan',
        VehicleType.suv => 'SUV',
        VehicleType.muv => 'MUV',
        VehicleType.luxury => 'Luxury',
      };

  /// Get icon name for the vehicle type.
  String get iconName => switch (this) {
        VehicleType.hatchback => 'hatchback',
        VehicleType.sedan => 'sedan',
        VehicleType.suv => 'suv',
        VehicleType.muv => 'muv',
        VehicleType.luxury => 'luxury',
      };

  /// Get color for the vehicle type.
  Color get color => switch (this) {
        VehicleType.hatchback => const Color(0xFF4CAF50),
        VehicleType.sedan => const Color(0xFF2196F3),
        VehicleType.suv => const Color(0xFFFF9800),
        VehicleType.muv => const Color(0xFF9C27B0),
        VehicleType.luxury => const Color(0xFFFFD700),
      };

  /// Get price multiplier for the vehicle type.
  double get priceMultiplier => switch (this) {
        VehicleType.hatchback => 1.0,
        VehicleType.sedan => 1.2,
        VehicleType.suv => 1.5,
        VehicleType.muv => 1.4,
        VehicleType.luxury => 2.0,
      };

  /// Parse from string.
  static VehicleType fromString(String value) {
    return VehicleType.values.firstWhere(
      (type) => type.name.toLowerCase() == value.toLowerCase(),
      orElse: () => VehicleType.sedan,
    );
  }
}
