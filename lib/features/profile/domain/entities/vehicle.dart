import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

/// Vehicle entity representing a user's car in their garage.
/// Matches API response format from GET /api/accounts/v1/cars/
@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required int id,
    required String make,
    required String model,
    int? year,
    String? licensePlate,
    String? imageUrl,
    @Default(false) bool isFavourite,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}

/// Extension for Vehicle helper methods.
extension VehicleX on Vehicle {
  /// Get display name based on make and model.
  String get displayName {
    if (year != null) {
      return '$year $make $model';
    }
    return '$make $model';
  }

  /// Get formatted license plate or make/model display.
  String get subtitle {
    if (licensePlate != null && licensePlate!.isNotEmpty) {
      return licensePlate!;
    }
    return '$make $model';
  }
}
