import 'package:freezed_annotation/freezed_annotation.dart';

import 'opening_hours.dart';

part 'shop.freezed.dart';

/// Represents a car wash shop.
@freezed
class Shop with _$Shop {
  const Shop._();

  const factory Shop({
    required String id,
    required String name,
    required List<String> images,
    required double rating,
    required int totalReviews,
    required String address,
    required String city,
    double? distanceKm,
    required String description,
    required OpeningHours openingHours,
    required double latitude,
    required double longitude,
  }) = _Shop;

  /// Checks if the shop is nearby (within 5km).
  bool get isNearby => (distanceKm ?? double.infinity) < 5.0;

  /// Returns the formatted distance string.
  String get formattedDistance {
    if (distanceKm == null) return '';
    if (distanceKm! < 1) {
      return '${(distanceKm! * 1000).round()} m';
    }
    return '${distanceKm!.toStringAsFixed(1)} km';
  }

  /// Returns the formatted rating with reviews count.
  String get formattedRating => '$rating ($totalReviews reviews)';

  /// Returns the full location string.
  String get fullLocation => '$address, $city';
}
