import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/vehicle.dart';

part 'vehicle_model.g.dart';

/// Vehicle model for API serialization.
@JsonSerializable()
class VehicleModel {
  const VehicleModel({
    required this.id,
    required this.make,
    required this.model,
    this.year,
    this.licensePlate,
    this.color,
    required this.vehicleType,
    this.imageUrl,
    this.isDefault = false,
    this.createdAt,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);

  final String id;
  final String make;
  final String model;
  final int? year;
  @JsonKey(name: 'license_plate')
  final String? licensePlate;
  final String? color;
  @JsonKey(name: 'vehicle_type')
  final String vehicleType;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);

  /// Convert to domain entity.
  Vehicle toDomain() {
    return Vehicle(
      id: id,
      make: make,
      model: model,
      year: year,
      licensePlate: licensePlate,
      color: color,
      vehicleType: _parseVehicleType(vehicleType),
      imageUrl: imageUrl,
      isDefault: isDefault,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
    );
  }

  GarageVehicleType _parseVehicleType(String type) {
    switch (type.toLowerCase()) {
      case 'sedan':
        return GarageVehicleType.sedan;
      case 'suv':
        return GarageVehicleType.suv;
      case 'hatchback':
        return GarageVehicleType.hatchback;
      case 'muv':
        return GarageVehicleType.muv;
      case 'luxury':
        return GarageVehicleType.luxury;
      default:
        return GarageVehicleType.sedan;
    }
  }
}
