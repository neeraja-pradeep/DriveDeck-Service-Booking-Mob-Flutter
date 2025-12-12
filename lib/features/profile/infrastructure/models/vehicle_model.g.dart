// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      id: (json['id'] as num).toInt(),
      user: json['user'] as String?,
      carType: json['car_type'] as String,
      registration: json['registration'] as String?,
      imageUrl: json['image_url'] as String?,
      isFavourite: json['is_favourite'] as bool? ?? false,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'car_type': instance.carType,
      'registration': instance.registration,
      'image_url': instance.imageUrl,
      'is_favourite': instance.isFavourite,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
