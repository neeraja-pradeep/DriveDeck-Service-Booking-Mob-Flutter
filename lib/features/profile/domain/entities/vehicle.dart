import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

/// Vehicle/Car type enum matching API values.
/// API accepts: sedan, hatchback, suv, convertible
enum CarType {
  sedan,
  hatchback,
  suv,
  convertible,
  muv,
  luxury,
}

/// Extension for CarType display properties.
extension CarTypeX on CarType {
  String get displayName => switch (this) {
        CarType.sedan => 'Sedan',
        CarType.hatchback => 'Hatchback',
        CarType.suv => 'SUV',
        CarType.convertible => 'Convertible',
        CarType.muv => 'MUV',
        CarType.luxury => 'Luxury',
      };

  /// Get the API value for car_type field.
  String get apiValue => switch (this) {
        CarType.sedan => 'sedan',
        CarType.hatchback => 'hatchback',
        CarType.suv => 'suv',
        CarType.convertible => 'convertible',
        CarType.muv => 'muv',
        CarType.luxury => 'luxury',
      };

  /// Parse from API string value.
  static CarType fromApiValue(String? value) {
    switch (value?.toLowerCase()) {
      case 'sedan':
        return CarType.sedan;
      case 'hatchback':
        return CarType.hatchback;
      case 'suv':
        return CarType.suv;
      case 'convertible':
        return CarType.convertible;
      case 'muv':
        return CarType.muv;
      case 'luxury':
        return CarType.luxury;
      default:
        return CarType.sedan;
    }
  }
}

/// Vehicle entity representing a user's car in their garage.
/// Matches API response format from GET /api/accounts/v1/cars/
@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required int id,
    required CarType carType,
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

  /// Get formatted registration or car type display.
  String get subtitle {
    if (registration != null && registration!.isNotEmpty) {
      return registration!;
    }
    return carType.displayName;
  }
}
