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

/// Weekly business hours model.
/// Represents which weekdays (0=Monday to 6=Sunday) a shop is open.
@JsonSerializable()
class WeeklyBusinessHoursModel {
  const WeeklyBusinessHoursModel({
    required this.id,
    required this.shop,
    required this.weekday,
    this.openTime,
    this.closeTime,
    this.isClosed,
  });

  final int id;
  final int shop;
  /// Weekday number: 0=Monday, 1=Tuesday, ..., 6=Sunday
  final int weekday;
  @JsonKey(name: 'open_time')
  final String? openTime;
  @JsonKey(name: 'close_time')
  final String? closeTime;
  @JsonKey(name: 'is_closed')
  final bool? isClosed;

  factory WeeklyBusinessHoursModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyBusinessHoursModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeeklyBusinessHoursModelToJson(this);

  WeeklyBusinessHours toDomain() => WeeklyBusinessHours(
        id: id,
        shopId: shop,
        weekday: weekday,
        openTime: openTime,
        closeTime: closeTime,
        isClosed: isClosed ?? false,
      );
}

/// Schedule slot model for a specific date.
/// Returned by /api/shop/schedule/ endpoint.
@JsonSerializable()
class ScheduleSlotModel {
  const ScheduleSlotModel({
    required this.slotNumber,
    required this.startTime,
    required this.endTime,
    this.isBooked,
  });

  @JsonKey(name: 'slot_number')
  final int slotNumber;
  @JsonKey(name: 'start_time')
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;
  @JsonKey(name: 'is_booked')
  final bool? isBooked;

  factory ScheduleSlotModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleSlotModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleSlotModelToJson(this);

  ShopTimeSlot toDomain() => ShopTimeSlot(
        slotNumber: slotNumber,
        startTime: startTime,
        endTime: endTime,
        isAvailable: !(isBooked ?? false),
      );
}

/// Business hours window model.
/// Represents opening and closing times for a day.
class BusinessWindowModel {
  const BusinessWindowModel({
    required this.opening,
    required this.closing,
  });

  final String opening;
  final String closing;

  factory BusinessWindowModel.fromJson(Map<String, dynamic> json) =>
      BusinessWindowModel(
        opening: json['opening'] as String,
        closing: json['closing'] as String,
      );

  Map<String, dynamic> toJson() => {
        'opening': opening,
        'closing': closing,
      };
}

/// Date day model from /api/shop/v1/shops/{id}/date-day/ endpoint.
/// Represents availability for a specific date.
class DateDayModel {
  const DateDayModel({
    required this.date,
    required this.day,
    required this.closed,
    this.window,
  });

  final String date;
  final String day;
  final bool closed;
  final BusinessWindowModel? window;

  factory DateDayModel.fromJson(Map<String, dynamic> json) => DateDayModel(
        date: json['date'] as String,
        day: json['day'] as String,
        closed: json['closed'] as bool,
        window: json['window'] != null
            ? BusinessWindowModel.fromJson(json['window'] as Map<String, dynamic>)
            : null,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'day': day,
        'closed': closed,
        'window': window?.toJson(),
      };

  /// Generate time slots from the business window.
  /// Creates hourly slots from opening to closing time.
  List<ShopTimeSlot> toTimeSlots() {
    if (closed || window == null) {
      return [];
    }

    final slots = <ShopTimeSlot>[];
    try {
      final openParts = window!.opening.split(':');
      final closeParts = window!.closing.split(':');
      final openHour = int.parse(openParts[0]);
      final closeHour = int.parse(closeParts[0]);

      // Generate hourly slots
      int slotNumber = 1;
      for (int hour = openHour; hour < closeHour; hour++) {
        final startTime = '${hour.toString().padLeft(2, '0')}:00:00';
        final endTime = '${(hour + 1).toString().padLeft(2, '0')}:00:00';
        slots.add(ShopTimeSlot(
          slotNumber: slotNumber++,
          startTime: startTime,
          endTime: endTime,
          isAvailable: true,
        ));
      }
    } catch (_) {
      // Return empty if parsing fails
    }
    return slots;
  }
}
