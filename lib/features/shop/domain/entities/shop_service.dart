import 'package:freezed_annotation/freezed_annotation.dart';

import 'vehicle_type.dart';

part 'shop_service.freezed.dart';

/// Represents a service offered by a car wash shop.
@freezed
class ShopService with _$ShopService {
  const ShopService._();

  const factory ShopService({
    required String id,
    required String name,
    String? description,
    required double price,
    required int duration,
    required VehicleType vehicleType,
    String? imageUrl,
    @Default(false) bool isPopular,
  }) = _ShopService;

  /// Returns formatted price string.
  String get formattedPrice => '\u20B9${price.toStringAsFixed(0)}';

  /// Returns formatted duration string.
  String get formattedDuration {
    if (duration >= 60) {
      final hours = duration ~/ 60;
      final minutes = duration % 60;
      if (minutes == 0) {
        return '$hours hr${hours > 1 ? 's' : ''}';
      }
      return '$hours hr $minutes mins';
    }
    return '$duration mins';
  }
}
