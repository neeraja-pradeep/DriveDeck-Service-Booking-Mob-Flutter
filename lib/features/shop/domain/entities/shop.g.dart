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
      reviewCount: (json['reviewCount'] as num).toInt(),
      address: json['address'] as String,
      area: json['area'] as String,
      distanceKm: (json['distanceKm'] as num).toDouble(),
      description: json['description'] as String,
      openHours: json['openHours'] as String,
      operatingDays: json['operatingDays'] as String,
      minBookingDuration: json['minBookingDuration'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      vehicleTypes: (json['vehicleTypes'] as List<dynamic>)
          .map((e) => ShopVehicleType.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>)
          .map((e) => ShopService.fromJson(e as Map<String, dynamic>))
          .toList(),
      packages: (json['packages'] as List<dynamic>?)
              ?.map((e) => ShopPackage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      accessories: (json['accessories'] as List<dynamic>?)
              ?.map((e) => ShopAccessory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isFavorite: json['isFavorite'] as bool? ?? false,
      phoneNumber: json['phoneNumber'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ShopImplToJson(_$ShopImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'address': instance.address,
      'area': instance.area,
      'distanceKm': instance.distanceKm,
      'description': instance.description,
      'openHours': instance.openHours,
      'operatingDays': instance.operatingDays,
      'minBookingDuration': instance.minBookingDuration,
      'images': instance.images,
      'vehicleTypes': instance.vehicleTypes,
      'services': instance.services,
      'packages': instance.packages,
      'accessories': instance.accessories,
      'isFavorite': instance.isFavorite,
      'phoneNumber': instance.phoneNumber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$ShopVehicleTypeImpl _$$ShopVehicleTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$ShopVehicleTypeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
      priceMultiplier: (json['priceMultiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ShopVehicleTypeImplToJson(
        _$ShopVehicleTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'priceMultiplier': instance.priceMultiplier,
    };

_$ShopServiceImpl _$$ShopServiceImplFromJson(Map<String, dynamic> json) =>
    _$ShopServiceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
      durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
      categoryId: json['categoryId'] as String?,
      isPopular: json['isPopular'] as bool? ?? false,
    );

Map<String, dynamic> _$$ShopServiceImplToJson(_$ShopServiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'durationMinutes': instance.durationMinutes,
      'categoryId': instance.categoryId,
      'isPopular': instance.isPopular,
    };

_$ShopPackageImpl _$$ShopPackageImplFromJson(Map<String, dynamic> json) =>
    _$ShopPackageImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      includedServiceIds: (json['includedServiceIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      isPopular: json['isPopular'] as bool? ?? false,
    );

Map<String, dynamic> _$$ShopPackageImplToJson(_$ShopPackageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'includedServiceIds': instance.includedServiceIds,
      'description': instance.description,
      'discountPercentage': instance.discountPercentage,
      'isPopular': instance.isPopular,
    };

_$ShopAccessoryImpl _$$ShopAccessoryImplFromJson(Map<String, dynamic> json) =>
    _$ShopAccessoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      inStock: json['inStock'] as bool? ?? true,
    );

Map<String, dynamic> _$$ShopAccessoryImplToJson(_$ShopAccessoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'inStock': instance.inStock,
    };

_$ShopTimeSlotImpl _$$ShopTimeSlotImplFromJson(Map<String, dynamic> json) =>
    _$ShopTimeSlotImpl(
      slotNumber: (json['slotNumber'] as num).toInt(),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      isAvailable: json['isAvailable'] as bool,
      availableCapacity: (json['availableCapacity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ShopTimeSlotImplToJson(_$ShopTimeSlotImpl instance) =>
    <String, dynamic>{
      'slotNumber': instance.slotNumber,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'isAvailable': instance.isAvailable,
      'availableCapacity': instance.availableCapacity,
    };

_$ShopDateAvailabilityImpl _$$ShopDateAvailabilityImplFromJson(
        Map<String, dynamic> json) =>
    _$ShopDateAvailabilityImpl(
      date: DateTime.parse(json['date'] as String),
      slots: (json['slots'] as List<dynamic>)
          .map((e) => ShopTimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      isOpen: json['isOpen'] as bool? ?? true,
    );

Map<String, dynamic> _$$ShopDateAvailabilityImplToJson(
        _$ShopDateAvailabilityImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'slots': instance.slots,
      'isOpen': instance.isOpen,
    };

_$WeeklyBusinessHoursImpl _$$WeeklyBusinessHoursImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyBusinessHoursImpl(
      id: (json['id'] as num).toInt(),
      shopId: (json['shopId'] as num).toInt(),
      weekday: (json['weekday'] as num).toInt(),
      openTime: json['openTime'] as String?,
      closeTime: json['closeTime'] as String?,
      isClosed: json['isClosed'] as bool? ?? false,
    );

Map<String, dynamic> _$$WeeklyBusinessHoursImplToJson(
        _$WeeklyBusinessHoursImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shopId': instance.shopId,
      'weekday': instance.weekday,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'isClosed': instance.isClosed,
    };
