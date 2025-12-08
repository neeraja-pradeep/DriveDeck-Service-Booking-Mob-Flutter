/// Vehicle types supported for services.
enum VehicleType {
  hatchback,
  sedan,
  suv,
  muv,
  luxury,
}

/// Extension for display names and icons.
extension VehicleTypeExtension on VehicleType {
  /// Get display name for the vehicle type.
  String get displayName {
    switch (this) {
      case VehicleType.hatchback:
        return 'Hatchback';
      case VehicleType.sedan:
        return 'Sedan';
      case VehicleType.suv:
        return 'SUV';
      case VehicleType.muv:
        return 'MUV';
      case VehicleType.luxury:
        return 'Luxury';
    }
  }

  /// Get icon name for the vehicle type.
  String get iconName {
    switch (this) {
      case VehicleType.hatchback:
        return 'hatchback';
      case VehicleType.sedan:
        return 'sedan';
      case VehicleType.suv:
        return 'suv';
      case VehicleType.muv:
        return 'muv';
      case VehicleType.luxury:
        return 'luxury';
    }
  }

  /// Get price multiplier for the vehicle type.
  double get priceMultiplier {
    switch (this) {
      case VehicleType.hatchback:
        return 1.0;
      case VehicleType.sedan:
        return 1.2;
      case VehicleType.suv:
        return 1.5;
      case VehicleType.muv:
        return 1.4;
      case VehicleType.luxury:
        return 2.0;
    }
  }

  /// Parse from string.
  static VehicleType fromString(String value) {
    return VehicleType.values.firstWhere(
      (type) => type.name.toLowerCase() == value.toLowerCase(),
      orElse: () => VehicleType.sedan,
    );
  }
}
