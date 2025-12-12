// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      id: (json['id'] as num).toInt(),
      carType: $enumDecode(_$GarageVehicleTypeEnumMap, json['carType']),
      registration: json['registration'] as String?,
      imageUrl: json['imageUrl'] as String?,
      isFavourite: json['isFavourite'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carType': _$GarageVehicleTypeEnumMap[instance.carType]!,
      'registration': instance.registration,
      'imageUrl': instance.imageUrl,
      'isFavourite': instance.isFavourite,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$GarageVehicleTypeEnumMap = {
  GarageVehicleType.sedan: 'sedan',
  GarageVehicleType.suv: 'suv',
  GarageVehicleType.hatchback: 'hatchback',
  GarageVehicleType.muv: 'muv',
  GarageVehicleType.luxury: 'luxury',
};
