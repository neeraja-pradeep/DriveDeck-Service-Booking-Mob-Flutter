// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      id: json['id'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      year: (json['year'] as num?)?.toInt(),
      licensePlate: json['licensePlate'] as String?,
      color: json['color'] as String?,
      vehicleType: $enumDecode(_$GarageVehicleTypeEnumMap, json['vehicleType']),
      imageUrl: json['imageUrl'] as String?,
      isDefault: json['isDefault'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'make': instance.make,
      'model': instance.model,
      'year': instance.year,
      'licensePlate': instance.licensePlate,
      'color': instance.color,
      'vehicleType': _$GarageVehicleTypeEnumMap[instance.vehicleType]!,
      'imageUrl': instance.imageUrl,
      'isDefault': instance.isDefault,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$GarageVehicleTypeEnumMap = {
  GarageVehicleType.sedan: 'sedan',
  GarageVehicleType.suv: 'suv',
  GarageVehicleType.hatchback: 'hatchback',
  GarageVehicleType.muv: 'muv',
  GarageVehicleType.luxury: 'luxury',
};
