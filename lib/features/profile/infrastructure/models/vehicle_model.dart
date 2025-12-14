import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/vehicle.dart';

part 'vehicle_model.g.dart';

/// Vehicle model for API serialization.
/// API Response format:
/// {
///   "id": 0,
///   "user": "string",
///   "make": "string",
///   "model": "string",
///   "year": 2024,
///   "license_plate": "string",
///   "image_url": "string",
///   "is_favourite": true,
///   "created_at": "2025-12-12T18:59:21.218Z",
///   "updated_at": "2025-12-12T18:59:21.218Z"
/// }
@JsonSerializable()
class VehicleModel {
  const VehicleModel({
    required this.id,
    this.user,
    required this.make,
    required this.model,
    this.year,
    this.licensePlate,
    this.imageUrl,
    this.isFavourite = false,
    this.createdAt,
    this.updatedAt,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);

  final int id;
  final String? user;
  final String make;
  final String model;
  final int? year;
  @JsonKey(name: 'license_plate')
  final String? licensePlate;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'is_favourite')
  final bool isFavourite;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);

  /// Convert to domain entity.
  Vehicle toDomain() {
    return Vehicle(
      id: id,
      make: make,
      model: model,
      year: year,
      licensePlate: licensePlate,
      imageUrl: imageUrl,
      isFavourite: isFavourite,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
    );
  }
}
