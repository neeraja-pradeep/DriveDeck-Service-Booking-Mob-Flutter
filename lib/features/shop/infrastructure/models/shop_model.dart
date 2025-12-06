import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/opening_hours.dart';
import '../../domain/entities/shop.dart';
import 'opening_hours_model.dart';

part 'shop_model.freezed.dart';
part 'shop_model.g.dart';

/// Model for shop API response.
@freezed
class ShopModel with _$ShopModel {
  const ShopModel._();

  const factory ShopModel({
    required int id,
    required String name,
    @JsonKey(name: 'normal1_image_url') String? normal1ImageUrl,
    @JsonKey(name: 'normal2_image_url') String? normal2ImageUrl,
    @JsonKey(name: 'normal3_image_url') String? normal3ImageUrl,
    @JsonKey(name: 'normal4_image_url') String? normal4ImageUrl,
    @Default(4.5) double rating,
    @JsonKey(name: 'total_reviews') @Default(0) int totalReviews,
    @Default('') String address,
    @Default('') String city,
    @JsonKey(name: 'distance_km') double? distanceKm,
    @Default('') String description,
    @JsonKey(name: 'opening_hours') OpeningHoursModel? openingHours,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
  }) = _ShopModel;

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);

  /// Converts to domain entity.
  Shop toDomain() {
    final images = <String>[
      if (normal1ImageUrl != null && normal1ImageUrl!.isNotEmpty) normal1ImageUrl!,
      if (normal2ImageUrl != null && normal2ImageUrl!.isNotEmpty) normal2ImageUrl!,
      if (normal3ImageUrl != null && normal3ImageUrl!.isNotEmpty) normal3ImageUrl!,
      if (normal4ImageUrl != null && normal4ImageUrl!.isNotEmpty) normal4ImageUrl!,
    ];

    return Shop(
      id: id.toString(),
      name: name,
      images: images,
      rating: rating,
      totalReviews: totalReviews,
      address: address,
      city: city,
      distanceKm: distanceKm,
      description: description,
      openingHours: openingHours?.toDomain() ?? _defaultOpeningHours(),
      latitude: latitude,
      longitude: longitude,
    );
  }

  /// Returns default opening hours if none provided.
  OpeningHours _defaultOpeningHours() {
    return OpeningHoursModel.defaultHours().toDomain();
  }
}
