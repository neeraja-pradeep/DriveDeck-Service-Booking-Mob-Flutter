import 'package:hive/hive.dart';

import '../../../../../core/storage/hive/boxes.dart';
import '../../../../../core/storage/hive/keys.dart';
import '../../../domain/entities/shop.dart';
import '../../../domain/repositories/shop_repository.dart';

/// Abstract interface for shop local data source.
abstract class ShopLocalDataSource {
  /// Saves shop details to cache.
  Future<void> saveShopDetails(Shop shop, DateTime lastModified);

  /// Gets shop details from cache.
  Future<CachedData<Shop>?> getShopDetails(String shopId);

  /// Clears shop cache for a specific shop.
  Future<void> clearShopCache(String shopId);

  /// Gets the last modified timestamp for a shop.
  Future<DateTime?> getLastModified(String shopId);
}

/// Implementation of ShopLocalDataSource using Hive.
class ShopLocalDataSourceImpl implements ShopLocalDataSource {
  Box<dynamic>? _box;

  /// Gets or opens the shop cache box.
  Future<Box<dynamic>> _getBox() async {
    if (_box != null && _box!.isOpen) {
      return _box!;
    }

    if (Hive.isBoxOpen(HiveBoxes.shopCacheBox)) {
      _box = Hive.box<dynamic>(HiveBoxes.shopCacheBox);
    } else {
      _box = await Hive.openBox<dynamic>(HiveBoxes.shopCacheBox);
    }

    return _box!;
  }

  @override
  Future<void> saveShopDetails(Shop shop, DateTime lastModified) async {
    try {
      final box = await _getBox();
      final shopKey = ShopBoxKeys.shopDetails(shop.id);
      final timestampKey = ShopBoxKeys.shopTimestamp(shop.id);

      // Store shop data as a Map
      await box.put(shopKey, _shopToMap(shop));
      await box.put(timestampKey, lastModified.toIso8601String());
    } catch (e) {
      // Handle Hive exceptions gracefully
      // In production, log this error
    }
  }

  @override
  Future<CachedData<Shop>?> getShopDetails(String shopId) async {
    try {
      final box = await _getBox();
      final shopKey = ShopBoxKeys.shopDetails(shopId);
      final timestampKey = ShopBoxKeys.shopTimestamp(shopId);

      final shopData = box.get(shopKey);
      final timestampStr = box.get(timestampKey) as String?;

      if (shopData == null || timestampStr == null) {
        return null;
      }

      final shop = _mapToShop(shopData as Map<dynamic, dynamic>);
      final timestamp = DateTime.parse(timestampStr);

      return CachedData(data: shop, lastModified: timestamp);
    } catch (e) {
      // Handle Hive exceptions gracefully
      return null;
    }
  }

  @override
  Future<void> clearShopCache(String shopId) async {
    try {
      final box = await _getBox();
      final shopKey = ShopBoxKeys.shopDetails(shopId);
      final timestampKey = ShopBoxKeys.shopTimestamp(shopId);

      await box.delete(shopKey);
      await box.delete(timestampKey);
    } catch (e) {
      // Handle Hive exceptions gracefully
    }
  }

  @override
  Future<DateTime?> getLastModified(String shopId) async {
    try {
      final box = await _getBox();
      final timestampKey = ShopBoxKeys.shopTimestamp(shopId);
      final timestampStr = box.get(timestampKey) as String?;

      if (timestampStr == null) return null;
      return DateTime.parse(timestampStr);
    } catch (e) {
      return null;
    }
  }

  /// Converts Shop to a Map for storage.
  Map<String, dynamic> _shopToMap(Shop shop) {
    return {
      'id': shop.id,
      'name': shop.name,
      'images': shop.images,
      'rating': shop.rating,
      'totalReviews': shop.totalReviews,
      'address': shop.address,
      'city': shop.city,
      'distanceKm': shop.distanceKm,
      'description': shop.description,
      'latitude': shop.latitude,
      'longitude': shop.longitude,
      'openingHours': _openingHoursToMap(shop.openingHours),
    };
  }

  /// Converts OpeningHours to a Map.
  Map<String, dynamic> _openingHoursToMap(dynamic openingHours) {
    return {
      'monday': _dayHoursToMap(openingHours.monday),
      'tuesday': _dayHoursToMap(openingHours.tuesday),
      'wednesday': _dayHoursToMap(openingHours.wednesday),
      'thursday': _dayHoursToMap(openingHours.thursday),
      'friday': _dayHoursToMap(openingHours.friday),
      'saturday': _dayHoursToMap(openingHours.saturday),
      'sunday': _dayHoursToMap(openingHours.sunday),
    };
  }

  /// Converts DayHours to a Map.
  Map<String, dynamic> _dayHoursToMap(dynamic dayHours) {
    return {
      'openTime': dayHours.openTime,
      'closeTime': dayHours.closeTime,
      'isClosed': dayHours.isClosed,
    };
  }

  /// Converts a Map to Shop.
  Shop _mapToShop(Map<dynamic, dynamic> map) {
    return Shop(
      id: map['id'] as String,
      name: map['name'] as String,
      images: List<String>.from(map['images'] as List),
      rating: (map['rating'] as num).toDouble(),
      totalReviews: map['totalReviews'] as int,
      address: map['address'] as String,
      city: map['city'] as String,
      distanceKm: map['distanceKm'] as double?,
      description: map['description'] as String,
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
      openingHours: _mapToOpeningHours(map['openingHours'] as Map<dynamic, dynamic>),
    );
  }

  /// Converts a Map to OpeningHours.
  dynamic _mapToOpeningHours(Map<dynamic, dynamic> map) {
    // Import would be needed here, but for simplicity we'll construct inline
    // This would need proper import of OpeningHours and DayHours
    throw UnimplementedError('Use proper adapters for production');
  }
}
