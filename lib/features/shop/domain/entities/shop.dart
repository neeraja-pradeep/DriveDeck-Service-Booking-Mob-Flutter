import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop.freezed.dart';
part 'shop.g.dart';

/// Shop entity representing a car wash shop.
@freezed
class Shop with _$Shop {
  const factory Shop({
    required int id,
    required String name,
    required String category,
    required double rating,
    required int reviewCount,
    required String address,
    required String area,
    required double distanceKm,
    required String description,
    required String openHours,
    required String operatingDays,
    required String minBookingDuration,
    required List<String> images,
    required List<ShopVehicleType> vehicleTypes,
    required List<ShopService> services,
    @Default([]) List<ShopPackage> packages,
    @Default([]) List<ShopAccessory> accessories,
    @Default(false) bool isFavorite,
    String? phoneNumber,
    double? latitude,
    double? longitude,
  }) = _Shop;

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
}

/// Vehicle type supported by a shop.
@freezed
class ShopVehicleType with _$ShopVehicleType {
  const factory ShopVehicleType({
    required String id,
    required String name,
    String? icon,
    double? priceMultiplier,
  }) = _ShopVehicleType;

  factory ShopVehicleType.fromJson(Map<String, dynamic> json) =>
      _$ShopVehicleTypeFromJson(json);
}

/// Service offered by a shop.
@freezed
class ShopService with _$ShopService {
  const factory ShopService({
    required String id,
    required String name,
    required double price,
    String? description,
    int? durationMinutes,
    String? categoryId,
    @Default(false) bool isPopular,
  }) = _ShopService;

  factory ShopService.fromJson(Map<String, dynamic> json) =>
      _$ShopServiceFromJson(json);
}

/// Package (bundle of services) offered by a shop.
@freezed
class ShopPackage with _$ShopPackage {
  const factory ShopPackage({
    required String id,
    required String name,
    required double price,
    required List<String> includedServiceIds,
    String? description,
    double? discountPercentage,
    @Default(false) bool isPopular,
  }) = _ShopPackage;

  factory ShopPackage.fromJson(Map<String, dynamic> json) =>
      _$ShopPackageFromJson(json);
}

/// Accessory available at a shop.
@freezed
class ShopAccessory with _$ShopAccessory {
  const factory ShopAccessory({
    required String id,
    required String name,
    required double price,
    String? description,
    String? imageUrl,
    @Default(true) bool inStock,
  }) = _ShopAccessory;

  factory ShopAccessory.fromJson(Map<String, dynamic> json) =>
      _$ShopAccessoryFromJson(json);
}

/// Time slot availability for a shop.
@freezed
class ShopTimeSlot with _$ShopTimeSlot {
  const factory ShopTimeSlot({
    required int slotNumber,
    required String startTime,
    required String endTime,
    required bool isAvailable,
    int? availableCapacity,
  }) = _ShopTimeSlot;

  factory ShopTimeSlot.fromJson(Map<String, dynamic> json) =>
      _$ShopTimeSlotFromJson(json);
}

/// Date availability with time slots.
@freezed
class ShopDateAvailability with _$ShopDateAvailability {
  const factory ShopDateAvailability({
    required DateTime date,
    required List<ShopTimeSlot> slots,
    @Default(true) bool isOpen,
  }) = _ShopDateAvailability;

  factory ShopDateAvailability.fromJson(Map<String, dynamic> json) =>
      _$ShopDateAvailabilityFromJson(json);
}
