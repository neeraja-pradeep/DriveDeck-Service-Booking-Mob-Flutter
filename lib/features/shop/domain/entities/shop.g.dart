// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopImpl _$$ShopImplFromJson(Map<String, dynamic> json) => _$ShopImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      category: json['category'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['review_count'] as num?)?.toInt() ?? (json['reviewCount'] as num?)?.toInt() ?? 0,
      address: json['address'] as String? ?? '',
      area: json['area'] as String? ?? '',
      distanceKm: (json['distance_km'] as num?)?.toDouble() ?? (json['distanceKm'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? '',
      openHours: json['open_hours'] as String? ?? json['openHours'] as String? ?? '',
      operatingDays: json['operating_days'] as String? ?? json['operatingDays'] as String? ?? '',
      minBookingDuration: json['min_booking_duration'] as String? ?? json['minBookingDuration'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      vehicleTypes: (json['vehicle_types'] as List<dynamic>?)
              ?.map((e) => ShopVehicleType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          (json['vehicleTypes'] as List<dynamic>?)
              ?.map((e) => ShopVehicleType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      services: (json['services'] as List<dynamic>?)
              ?.map((e) => ShopService.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      packages: (json['packages'] as List<dynamic>?)
              ?.map((e) => ShopPackage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      accessories: (json['accessories'] as List<dynamic>?)
              ?.map((e) => ShopAccessory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isFavorite: json['is_favorite'] as bool? ?? json['isFavorite'] as bool? ?? false,
      phoneNumber: json['phone_number'] as String? ?? json['phoneNumber'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ShopImplToJson(_$ShopImpl instance) =>
    <String, dynamic>{
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
      'vehicle_types': instance.vehicleTypes.map((e) => e.toJson()).toList(),
      'services': instance.services.map((e) => e.toJson()).toList(),
      'packages': instance.packages.map((e) => e.toJson()).toList(),
      'accessories': instance.accessories.map((e) => e.toJson()).toList(),
      'is_favorite': instance.isFavorite,
      'phone_number': instance.phoneNumber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$ShopVehicleTypeImpl _$$ShopVehicleTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$ShopVehicleTypeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
      priceMultiplier: (json['price_multiplier'] as num?)?.toDouble() ??
          (json['priceMultiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ShopVehicleTypeImplToJson(
        _$ShopVehicleTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'price_multiplier': instance.priceMultiplier,
    };

_$ShopServiceImpl _$$ShopServiceImplFromJson(Map<String, dynamic> json) =>
    _$ShopServiceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
      durationMinutes: (json['duration_minutes'] as num?)?.toInt() ??
          (json['durationMinutes'] as num?)?.toInt(),
      categoryId: json['category_id'] as String? ?? json['categoryId'] as String?,
      isPopular: json['is_popular'] as bool? ?? json['isPopular'] as bool? ?? false,
    );

Map<String, dynamic> _$$ShopServiceImplToJson(_$ShopServiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'duration_minutes': instance.durationMinutes,
      'category_id': instance.categoryId,
      'is_popular': instance.isPopular,
    };

_$ShopPackageImpl _$$ShopPackageImplFromJson(Map<String, dynamic> json) =>
    _$ShopPackageImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      includedServiceIds: (json['included_service_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          (json['includedServiceIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      description: json['description'] as String?,
      discountPercentage: (json['discount_percentage'] as num?)?.toDouble() ??
          (json['discountPercentage'] as num?)?.toDouble(),
      isPopular: json['is_popular'] as bool? ?? json['isPopular'] as bool? ?? false,
    );

Map<String, dynamic> _$$ShopPackageImplToJson(_$ShopPackageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'included_service_ids': instance.includedServiceIds,
      'description': instance.description,
      'discount_percentage': instance.discountPercentage,
      'is_popular': instance.isPopular,
    };

_$ShopAccessoryImpl _$$ShopAccessoryImplFromJson(Map<String, dynamic> json) =>
    _$ShopAccessoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String? ?? json['imageUrl'] as String?,
      inStock: json['in_stock'] as bool? ?? json['inStock'] as bool? ?? true,
    );

Map<String, dynamic> _$$ShopAccessoryImplToJson(_$ShopAccessoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'in_stock': instance.inStock,
    };

_$ShopTimeSlotImpl _$$ShopTimeSlotImplFromJson(Map<String, dynamic> json) =>
    _$ShopTimeSlotImpl(
      slotNumber: (json['slot_number'] as num?)?.toInt() ??
          (json['slotNumber'] as num).toInt(),
      startTime: json['start_time'] as String? ?? json['startTime'] as String,
      endTime: json['end_time'] as String? ?? json['endTime'] as String,
      isAvailable: json['is_available'] as bool? ?? json['isAvailable'] as bool,
      availableCapacity: (json['available_capacity'] as num?)?.toInt() ??
          (json['availableCapacity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ShopTimeSlotImplToJson(_$ShopTimeSlotImpl instance) =>
    <String, dynamic>{
      'slot_number': instance.slotNumber,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_available': instance.isAvailable,
      'available_capacity': instance.availableCapacity,
    };

_$ShopDateAvailabilityImpl _$$ShopDateAvailabilityImplFromJson(
        Map<String, dynamic> json) =>
    _$ShopDateAvailabilityImpl(
      date: DateTime.parse(json['date'] as String),
      slots: (json['slots'] as List<dynamic>)
          .map((e) => ShopTimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      isOpen: json['is_open'] as bool? ?? json['isOpen'] as bool? ?? true,
    );

Map<String, dynamic> _$$ShopDateAvailabilityImplToJson(
        _$ShopDateAvailabilityImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'slots': instance.slots.map((e) => e.toJson()).toList(),
      'is_open': instance.isOpen,
    };
