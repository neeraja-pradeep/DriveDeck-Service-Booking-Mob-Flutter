// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopDetailsImpl _$$ShopDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ShopDetailsImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      category: json['category'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      location: ShopLocation.fromJson(json['location'] as Map<String, dynamic>),
      description: json['description'] as String,
      openHours: json['openHours'] as String,
      operatingDays: json['operatingDays'] as String,
      minBookingDuration: json['minBookingDuration'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      vehicleTypes: (json['vehicleTypes'] as List<dynamic>)
          .map((e) => VehicleType.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      packages: (json['packages'] as List<dynamic>?)
              ?.map((e) => Package.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      accessories: (json['accessories'] as List<dynamic>?)
              ?.map((e) => Accessory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ShopDetailsImplToJson(_$ShopDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'location': instance.location,
      'description': instance.description,
      'openHours': instance.openHours,
      'operatingDays': instance.operatingDays,
      'minBookingDuration': instance.minBookingDuration,
      'images': instance.images,
      'vehicleTypes': instance.vehicleTypes,
      'services': instance.services,
      'packages': instance.packages,
      'accessories': instance.accessories,
    };

_$ShopLocationImpl _$$ShopLocationImplFromJson(Map<String, dynamic> json) =>
    _$ShopLocationImpl(
      area: json['area'] as String,
      distanceKm: (json['distanceKm'] as num).toDouble(),
    );

Map<String, dynamic> _$$ShopLocationImplToJson(_$ShopLocationImpl instance) =>
    <String, dynamic>{
      'area': instance.area,
      'distanceKm': instance.distanceKm,
    };

_$VehicleTypeImpl _$$VehicleTypeImplFromJson(Map<String, dynamic> json) =>
    _$VehicleTypeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$VehicleTypeImplToJson(_$VehicleTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'isSelected': instance.isSelected,
    };

_$PackageImpl _$$PackageImplFromJson(Map<String, dynamic> json) =>
    _$PackageImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      includedServices: (json['includedServices'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$PackageImplToJson(_$PackageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'includedServices': instance.includedServices,
      'isSelected': instance.isSelected,
    };

_$AccessoryImpl _$$AccessoryImplFromJson(Map<String, dynamic> json) =>
    _$AccessoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$AccessoryImplToJson(_$AccessoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'isSelected': instance.isSelected,
    };
