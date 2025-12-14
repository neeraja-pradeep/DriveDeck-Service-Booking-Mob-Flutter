// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      id: (json['id'] as num).toInt(),
      user: json['user'] as String?,
      make: json['make'] as String,
      model: json['model'] as String,
      year: (json['year'] as num?)?.toInt(),
      licensePlate: json['license_plate'] as String?,
      imageUrl: json['image_url'] as String?,
      isFavourite: json['is_favourite'] as bool? ?? false,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'make': instance.make,
      'model': instance.model,
      'year': instance.year,
      'license_plate': instance.licensePlate,
      'image_url': instance.imageUrl,
      'is_favourite': instance.isFavourite,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
