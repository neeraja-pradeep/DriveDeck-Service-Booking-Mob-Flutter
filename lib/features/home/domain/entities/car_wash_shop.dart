import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_wash_shop.freezed.dart';

/// Car wash shop entity for displaying shop information.
@freezed
class CarWashShop with _$CarWashShop {
  const factory CarWashShop({
    required int id,
    required String name,
    String? description,
    String? image,
    String? address,
    String? phone,
    double? latitude,
    double? longitude,
    double? rating,
    int? reviewCount,
    double? distance,
    String? openingTime,
    String? closingTime,
    @Default(false) bool isOpen,
    @Default(false) bool isWishlisted,
    List<String>? services,
    String? priceRange,
  }) = _CarWashShop;

  const CarWashShop._();

  /// Formats the distance for display.
  String get formattedDistance {
    if (distance == null) return '';
    if (distance! < 1) {
      return '${(distance! * 1000).toInt()} m';
    }
    return '${distance!.toStringAsFixed(1)} km';
  }

  /// Formats the rating for display.
  String get formattedRating {
    if (rating == null) return 'N/A';
    return rating!.toStringAsFixed(1);
  }

  /// Returns the operating hours string.
  String get operatingHours {
    if (openingTime == null || closingTime == null) return 'Hours not available';
    return '$openingTime - $closingTime';
  }
}
