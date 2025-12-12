// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      id: (json['id'] as num).toInt(),
      make: json['make'] as String,
      model: json['model'] as String,
      year: (json['year'] as num?)?.toInt(),
      licensePlate: json['license_plate'] as String?,
      color: json['color'] as String?,
      vehicleType: json['vehicle_type'] as String,
      imageUrl: json['image_url'] as String?,
      isDefault: json['is_default'] as bool? ?? false,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'make': instance.make,
      'model': instance.model,
      'year': instance.year,
      'license_plate': instance.licensePlate,
      'color': instance.color,
      'vehicle_type': instance.vehicleType,
      'image_url': instance.imageUrl,
      'is_default': instance.isDefault,
      'created_at': instance.createdAt,
    };
