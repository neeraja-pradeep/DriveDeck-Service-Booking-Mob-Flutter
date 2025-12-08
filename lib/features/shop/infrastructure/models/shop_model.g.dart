// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopModel _$ShopModelFromJson(Map<String, dynamic> json) => ShopModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      category: json['category'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['review_count'] as num?)?.toInt(),
      address: json['address'] as String?,
      area: json['area'] as String?,
      distanceKm: (json['distance_km'] as num?)?.toDouble(),
      description: json['description'] as String?,
      openHours: json['open_hours'] as String?,
      operatingDays: json['operating_days'] as String?,
      minBookingDuration: json['min_booking_duration'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      vehicleTypes: (json['vehicle_types'] as List<dynamic>?)
          ?.map((e) => ShopVehicleTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => ShopServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      packages: (json['packages'] as List<dynamic>?)
          ?.map((e) => ShopPackageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessories: (json['accessories'] as List<dynamic>?)
          ?.map((e) => ShopAccessoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['is_favorite'] as bool?,
      phoneNumber: json['phone_number'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShopModelToJson(ShopModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'address': instance.address,
      'area': instance.area,
      'distance_km': instance.distanceKm,
      'description': instance.description,
      'open_hours': instance.openHours,
      'operating_days': instance.operatingDays,
      'min_booking_duration': instance.minBookingDuration,
      'images': instance.images,
      'vehicle_types': instance.vehicleTypes?.map((e) => e.toJson()).toList(),
      'services': instance.services?.map((e) => e.toJson()).toList(),
      'packages': instance.packages?.map((e) => e.toJson()).toList(),
      'accessories': instance.accessories?.map((e) => e.toJson()).toList(),
      'is_favorite': instance.isFavorite,
      'phone_number': instance.phoneNumber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

ShopVehicleTypeModel _$ShopVehicleTypeModelFromJson(
        Map<String, dynamic> json) =>
    ShopVehicleTypeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
      priceMultiplier: (json['price_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShopVehicleTypeModelToJson(
        ShopVehicleTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'price_multiplier': instance.priceMultiplier,
    };

ShopServiceModel _$ShopServiceModelFromJson(Map<String, dynamic> json) =>
    ShopServiceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
      durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
      categoryId: json['category_id'] as String?,
      isPopular: json['is_popular'] as bool?,
    );

Map<String, dynamic> _$ShopServiceModelToJson(ShopServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'duration_minutes': instance.durationMinutes,
      'category_id': instance.categoryId,
      'is_popular': instance.isPopular,
    };

ShopPackageModel _$ShopPackageModelFromJson(Map<String, dynamic> json) =>
    ShopPackageModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      includedServiceIds: (json['included_service_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      discountPercentage: (json['discount_percentage'] as num?)?.toDouble(),
      isPopular: json['is_popular'] as bool?,
    );

Map<String, dynamic> _$ShopPackageModelToJson(ShopPackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'included_service_ids': instance.includedServiceIds,
      'description': instance.description,
      'discount_percentage': instance.discountPercentage,
      'is_popular': instance.isPopular,
    };

ShopAccessoryModel _$ShopAccessoryModelFromJson(Map<String, dynamic> json) =>
    ShopAccessoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      inStock: json['in_stock'] as bool?,
    );

Map<String, dynamic> _$ShopAccessoryModelToJson(ShopAccessoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'in_stock': instance.inStock,
    };

ShopTimeSlotModel _$ShopTimeSlotModelFromJson(Map<String, dynamic> json) =>
    ShopTimeSlotModel(
      slotNumber: (json['slot_number'] as num).toInt(),
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      isAvailable: json['is_available'] as bool,
      availableCapacity: (json['available_capacity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShopTimeSlotModelToJson(ShopTimeSlotModel instance) =>
    <String, dynamic>{
      'slot_number': instance.slotNumber,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_available': instance.isAvailable,
      'available_capacity': instance.availableCapacity,
    };

ShopDateAvailabilityModel _$ShopDateAvailabilityModelFromJson(
        Map<String, dynamic> json) =>
    ShopDateAvailabilityModel(
      date: json['date'] as String,
      slots: (json['slots'] as List<dynamic>)
          .map((e) => ShopTimeSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isOpen: json['is_open'] as bool?,
    );

Map<String, dynamic> _$ShopDateAvailabilityModelToJson(
        ShopDateAvailabilityModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'slots': instance.slots.map((e) => e.toJson()).toList(),
      'is_open': instance.isOpen,
    };
