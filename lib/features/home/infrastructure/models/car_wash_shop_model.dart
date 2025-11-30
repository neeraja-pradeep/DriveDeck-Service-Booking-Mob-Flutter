import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/car_wash_shop.dart';

part 'car_wash_shop_model.freezed.dart';
part 'car_wash_shop_model.g.dart';

/// Car wash shop model for API response parsing and Hive storage.
@freezed
@HiveType(typeId: 2)
class CarWashShopModel with _$CarWashShopModel {
  const factory CarWashShopModel({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) String? description,
    @HiveField(3) String? image,
    @HiveField(4) String? address,
    @HiveField(5) String? phone,
    @HiveField(6) double? latitude,
    @HiveField(7) double? longitude,
    @HiveField(8) double? rating,
    @HiveField(9) @JsonKey(name: 'review_count') int? reviewCount,
    @HiveField(10) double? distance,
    @HiveField(11) @JsonKey(name: 'opening_time') String? openingTime,
    @HiveField(12) @JsonKey(name: 'closing_time') String? closingTime,
    @HiveField(13) @JsonKey(name: 'is_open') @Default(false) bool isOpen,
    @HiveField(14) @JsonKey(name: 'is_wishlisted') @Default(false) bool isWishlisted,
    @HiveField(15) List<String>? services,
    @HiveField(16) @JsonKey(name: 'price_range') String? priceRange,
  }) = _CarWashShopModel;

  const CarWashShopModel._();

  factory CarWashShopModel.fromJson(Map<String, dynamic> json) =>
      _$CarWashShopModelFromJson(json);

  /// Converts the model to a domain entity.
  CarWashShop toEntity() {
    return CarWashShop(
      id: id,
      name: name,
      description: description,
      image: image,
      address: address,
      phone: phone,
      latitude: latitude,
      longitude: longitude,
      rating: rating,
      reviewCount: reviewCount,
      distance: distance,
      openingTime: openingTime,
      closingTime: closingTime,
      isOpen: isOpen,
      isWishlisted: isWishlisted,
      services: services,
      priceRange: priceRange,
    );
  }

  /// Creates a model from domain entity.
  factory CarWashShopModel.fromEntity(CarWashShop entity) {
    return CarWashShopModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      image: entity.image,
      address: entity.address,
      phone: entity.phone,
      latitude: entity.latitude,
      longitude: entity.longitude,
      rating: entity.rating,
      reviewCount: entity.reviewCount,
      distance: entity.distance,
      openingTime: entity.openingTime,
      closingTime: entity.closingTime,
      isOpen: entity.isOpen,
      isWishlisted: entity.isWishlisted,
      services: entity.services,
      priceRange: entity.priceRange,
    );
  }
}

/// Response wrapper for shops list.
@freezed
class ShopsResponse with _$ShopsResponse {
  const factory ShopsResponse({
    required List<CarWashShopModel> results,
    int? count,
    String? next,
    String? previous,
  }) = _ShopsResponse;

  factory ShopsResponse.fromJson(Map<String, dynamic> json) =>
      _$ShopsResponseFromJson(json);
}
