import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_details.freezed.dart';
part 'shop_details.g.dart';

/// Detailed shop information entity for the shop details screen.
@freezed
class ShopDetails with _$ShopDetails {
  const factory ShopDetails({
    required int id,
    required String name,
    required String category,
    required double rating,
    required int reviewCount,
    required ShopLocation location,
    required String description,
    required String openHours,
    required String minBookingDuration,
    required List<String> images,
    required List<VehicleType> vehicleTypes,
    required List<Service> services,
  }) = _ShopDetails;

  factory ShopDetails.fromJson(Map<String, dynamic> json) =>
      _$ShopDetailsFromJson(json);
}

/// Shop location information.
@freezed
class ShopLocation with _$ShopLocation {
  const factory ShopLocation({
    required String area,
    required double distanceKm,
  }) = _ShopLocation;

  factory ShopLocation.fromJson(Map<String, dynamic> json) =>
      _$ShopLocationFromJson(json);
}

/// Vehicle type for service selection.
@freezed
class VehicleType with _$VehicleType {
  const factory VehicleType({
    required String id,
    required String name,
    required String icon,
  }) = _VehicleType;

  factory VehicleType.fromJson(Map<String, dynamic> json) =>
      _$VehicleTypeFromJson(json);
}

/// Service offered by the shop.
@freezed
class Service with _$Service {
  const factory Service({
    required String id,
    required String name,
    required double price,
    @Default(false) bool isSelected,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
