import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/shop.dart';

part 'shop_model.g.dart';

/// Shop model for API responses.
@JsonSerializable()
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

  final int id;
  final String name;
  final String? category;
  final double? rating;
  @JsonKey(name: 'review_count')
  final int? reviewCount;
  final String? address;
  final String? area;
  @JsonKey(name: 'distance_km')
  final double? distanceKm;
  final String? description;
  @JsonKey(name: 'open_hours')
  final String? openHours;
  @JsonKey(name: 'operating_days')
  final String? operatingDays;
  @JsonKey(name: 'min_booking_duration')
  final String? minBookingDuration;
  final List<String>? images;
  @JsonKey(name: 'vehicle_types')
  final List<ShopVehicleTypeModel>? vehicleTypes;
  final List<ShopServiceModel>? services;
  final List<ShopPackageModel>? packages;
  final List<ShopAccessoryModel>? accessories;
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  final double? latitude;
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
class ShopVehicleTypeModel {
  const ShopVehicleTypeModel({
    required this.id,
    required this.name,
    this.icon,
    this.priceMultiplier,
  });

  final String id;
  final String name;
  final String? icon;
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

  final String id;
  final String name;
  final double price;
  final String? description;
  @JsonKey(name: 'duration_minutes')
  final int? durationMinutes;
  @JsonKey(name: 'category_id')
  final String? categoryId;
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

  final String id;
  final String name;
  final double price;
  @JsonKey(name: 'included_service_ids')
  final List<String> includedServiceIds;
  final String? description;
  @JsonKey(name: 'discount_percentage')
  final double? discountPercentage;
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
class ShopAccessoryModel {
  const ShopAccessoryModel({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.imageUrl,
    this.inStock,
  });

  final String id;
  final String name;
  final double price;
  final String? description;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
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
class ShopTimeSlotModel {
  const ShopTimeSlotModel({
    required this.slotNumber,
    required this.startTime,
    required this.endTime,
    required this.isAvailable,
    this.availableCapacity,
  });

  @JsonKey(name: 'slot_number')
  final int slotNumber;
  @JsonKey(name: 'start_time')
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;
  @JsonKey(name: 'is_available')
  final bool isAvailable;
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
class ShopDateAvailabilityModel {
  const ShopDateAvailabilityModel({
    required this.date,
    required this.slots,
    this.isOpen,
  });

  final String date;
  final List<ShopTimeSlotModel> slots;
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
