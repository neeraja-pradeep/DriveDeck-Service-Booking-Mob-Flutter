import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/shop.dart';

part 'shop_model.g.dart';

/// Shop model for API responses and Hive storage.
@JsonSerializable()
@HiveType(typeId: 20)
class ShopModel {
  const ShopModel({
    required this.id,
    required this.name,
    this.category,
    this.rating,
    this.reviewCount,
    this.address,
    this.area,
    this.distanceKm,
    this.description,
    this.openHours,
    this.operatingDays,
    this.minBookingDuration,
    this.images,
    this.vehicleTypes,
    this.services,
    this.packages,
    this.accessories,
    this.isFavorite,
    this.phoneNumber,
    this.latitude,
    this.longitude,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? category;
  @HiveField(3)
  final double? rating;
  @HiveField(4)
  @JsonKey(name: 'review_count')
  final int? reviewCount;
  @HiveField(5)
  final String? address;
  @HiveField(6)
  final String? area;
  @HiveField(7)
  @JsonKey(name: 'distance_km')
  final double? distanceKm;
  @HiveField(8)
  final String? description;
  @HiveField(9)
  @JsonKey(name: 'open_hours')
  final String? openHours;
  @HiveField(10)
  @JsonKey(name: 'operating_days')
  final String? operatingDays;
  @HiveField(11)
  @JsonKey(name: 'min_booking_duration')
  final String? minBookingDuration;
  @HiveField(12)
  final List<String>? images;
  @HiveField(13)
  @JsonKey(name: 'vehicle_types')
  final List<ShopVehicleTypeModel>? vehicleTypes;
  @HiveField(14)
  final List<ShopServiceModel>? services;
  @HiveField(15)
  final List<ShopPackageModel>? packages;
  @HiveField(16)
  final List<ShopAccessoryModel>? accessories;
  @HiveField(17)
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  @HiveField(18)
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @HiveField(19)
  final double? latitude;
  @HiveField(20)
  final double? longitude;

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopModelToJson(this);

  Shop toDomain() => Shop(
        id: id,
        name: name,
        category: category ?? 'Car Wash',
        rating: rating ?? 0.0,
        reviewCount: reviewCount ?? 0,
        address: address ?? '',
        area: area ?? '',
        distanceKm: distanceKm ?? 0.0,
        description: description ?? '',
        openHours: openHours ?? '',
        operatingDays: operatingDays ?? '',
        minBookingDuration: minBookingDuration ?? '',
        images: images ?? [],
        vehicleTypes:
            vehicleTypes?.map((v) => v.toDomain()).toList() ?? [],
        services: services?.map((s) => s.toDomain()).toList() ?? [],
        packages: packages?.map((p) => p.toDomain()).toList() ?? [],
        accessories: accessories?.map((a) => a.toDomain()).toList() ?? [],
        isFavorite: isFavorite ?? false,
        phoneNumber: phoneNumber,
        latitude: latitude,
        longitude: longitude,
      );
}

/// Vehicle type model.
@JsonSerializable()
@HiveType(typeId: 21)
class ShopVehicleTypeModel {
  const ShopVehicleTypeModel({
    required this.id,
    required this.name,
    this.icon,
    this.priceMultiplier,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? icon;
  @HiveField(3)
  @JsonKey(name: 'price_multiplier')
  final double? priceMultiplier;

  factory ShopVehicleTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ShopVehicleTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopVehicleTypeModelToJson(this);

  ShopVehicleType toDomain() => ShopVehicleType(
        id: id,
        name: name,
        icon: icon,
        priceMultiplier: priceMultiplier,
      );
}

/// Service model.
@JsonSerializable()
@HiveType(typeId: 22)
class ShopServiceModel {
  const ShopServiceModel({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.durationMinutes,
    this.categoryId,
    this.isPopular,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  @JsonKey(name: 'duration_minutes')
  final int? durationMinutes;
  @HiveField(5)
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @HiveField(6)
  @JsonKey(name: 'is_popular')
  final bool? isPopular;

  factory ShopServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ShopServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopServiceModelToJson(this);

  ShopService toDomain() => ShopService(
        id: id,
        name: name,
        price: price,
        description: description,
        durationMinutes: durationMinutes,
        categoryId: categoryId,
        isPopular: isPopular ?? false,
      );
}

/// Package model.
@JsonSerializable()
@HiveType(typeId: 23)
class ShopPackageModel {
  const ShopPackageModel({
    required this.id,
    required this.name,
    required this.price,
    required this.includedServiceIds,
    this.description,
    this.discountPercentage,
    this.isPopular,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double price;
  @HiveField(3)
  @JsonKey(name: 'included_service_ids')
  final List<String> includedServiceIds;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  @JsonKey(name: 'discount_percentage')
  final double? discountPercentage;
  @HiveField(6)
  @JsonKey(name: 'is_popular')
  final bool? isPopular;

  factory ShopPackageModel.fromJson(Map<String, dynamic> json) =>
      _$ShopPackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopPackageModelToJson(this);

  ShopPackage toDomain() => ShopPackage(
        id: id,
        name: name,
        price: price,
        includedServiceIds: includedServiceIds,
        description: description,
        discountPercentage: discountPercentage,
        isPopular: isPopular ?? false,
      );
}

/// Accessory model.
@JsonSerializable()
@HiveType(typeId: 24)
class ShopAccessoryModel {
  const ShopAccessoryModel({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.imageUrl,
    this.inStock,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @HiveField(5)
  @JsonKey(name: 'in_stock')
  final bool? inStock;

  factory ShopAccessoryModel.fromJson(Map<String, dynamic> json) =>
      _$ShopAccessoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopAccessoryModelToJson(this);

  ShopAccessory toDomain() => ShopAccessory(
        id: id,
        name: name,
        price: price,
        description: description,
        imageUrl: imageUrl,
        inStock: inStock ?? true,
      );
}

/// Time slot model.
@JsonSerializable()
@HiveType(typeId: 25)
class ShopTimeSlotModel {
  const ShopTimeSlotModel({
    required this.slotNumber,
    required this.startTime,
    required this.endTime,
    required this.isAvailable,
    this.availableCapacity,
  });

  @HiveField(0)
  @JsonKey(name: 'slot_number')
  final int slotNumber;
  @HiveField(1)
  @JsonKey(name: 'start_time')
  final String startTime;
  @HiveField(2)
  @JsonKey(name: 'end_time')
  final String endTime;
  @HiveField(3)
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @HiveField(4)
  @JsonKey(name: 'available_capacity')
  final int? availableCapacity;

  factory ShopTimeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$ShopTimeSlotModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopTimeSlotModelToJson(this);

  ShopTimeSlot toDomain() => ShopTimeSlot(
        slotNumber: slotNumber,
        startTime: startTime,
        endTime: endTime,
        isAvailable: isAvailable,
        availableCapacity: availableCapacity,
      );
}

/// Date availability model.
@JsonSerializable()
@HiveType(typeId: 26)
class ShopDateAvailabilityModel {
  const ShopDateAvailabilityModel({
    required this.date,
    required this.slots,
    this.isOpen,
  });

  @HiveField(0)
  final String date;
  @HiveField(1)
  final List<ShopTimeSlotModel> slots;
  @HiveField(2)
  @JsonKey(name: 'is_open')
  final bool? isOpen;

  factory ShopDateAvailabilityModel.fromJson(Map<String, dynamic> json) =>
      _$ShopDateAvailabilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopDateAvailabilityModelToJson(this);

  ShopDateAvailability toDomain() => ShopDateAvailability(
        date: DateTime.parse(date),
        slots: slots.map((s) => s.toDomain()).toList(),
        isOpen: isOpen ?? true,
      );
}
