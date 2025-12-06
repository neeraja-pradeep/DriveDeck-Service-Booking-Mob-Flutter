import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../../core/storage/hive/boxes.dart';
import '../../../../../core/storage/hive/keys.dart';
import '../../models/car_wash_shop_model.dart';
import '../../models/service_category_model.dart';
import '../../models/user_location_model.dart';

/// Provider for the Home Local data source.
final homeLocalDsProvider = Provider<HomeLocalDataSource>((ref) {
  return HomeLocalDataSource();
});

/// Local data source for home screen caching using Hive.
class HomeLocalDataSource {
  Box<dynamic> get _homeBox => Hive.box<dynamic>(HiveBoxes.homeData);
  Box<dynamic> get _locationBox => Hive.box<dynamic>(HiveBoxes.location);

  // ============ Service Categories Cache ============

  /// Saves service categories to cache.
  Future<void> saveServiceCategories(
    List<ServiceCategoryModel> categories,
  ) async {
    final jsonList = categories.map((c) => c.toJson()).toList();
    await _homeBox.put(HomeBoxKeys.serviceCategories, jsonEncode(jsonList));
    await _homeBox.put(
      HomeBoxKeys.serviceCategoriesTimestamp,
      DateTime.now().toIso8601String(),
    );
  }

  /// Gets cached service categories.
  List<ServiceCategoryModel>? getServiceCategories() {
    final jsonString = _homeBox.get(HomeBoxKeys.serviceCategories) as String?;
    if (jsonString == null) return null;

    final jsonList = jsonDecode(jsonString) as List<dynamic>;
    return jsonList
        .map(
          (json) => ServiceCategoryModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }

  /// Gets the timestamp of cached service categories.
  DateTime? getServiceCategoriesTimestamp() {
    final timestamp =
        _homeBox.get(HomeBoxKeys.serviceCategoriesTimestamp) as String?;
    if (timestamp == null) return null;
    return DateTime.tryParse(timestamp);
  }

  // ============ Car Wash Shops Cache ============

  /// Saves car wash shops to cache.
  Future<void> saveCarWashShops(List<CarWashShopModel> shops) async {
    final jsonList = shops.map((s) => s.toJson()).toList();
    await _homeBox.put(HomeBoxKeys.carWashServices, jsonEncode(jsonList));
    await _homeBox.put(
      HomeBoxKeys.carWashServicesTimestamp,
      DateTime.now().toIso8601String(),
    );
  }

  /// Gets cached car wash shops.
  List<CarWashShopModel>? getCarWashShops() {
    final jsonString = _homeBox.get(HomeBoxKeys.carWashServices) as String?;
    if (jsonString == null) {
      // Return mock data with working image URLs for testing
      return _getMockShops();
    }

    final jsonList = jsonDecode(jsonString) as List<dynamic>;
    return jsonList
        .map((json) => CarWashShopModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Returns mock shop data with working image URLs for testing.
  List<CarWashShopModel> _getMockShops() {
    return [
      const CarWashShopModel(
        id: 1,
        name: 'Ace Car Spa',
        description:
            'Premium car wash and detailing services with eco-friendly products.',
        image:
            'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800&h=600&fit=crop',
        address: '123 Main Street, Downtown Area',
        phone: '+1 (555) 123-4567',
        latitude: 37.7749,
        longitude: -122.4194,
        rating: 4.5,
        reviewCount: 128,
        distance: 0.8,
        openingTime: '08:00',
        closingTime: '18:00',
        isOpen: true,
        isWishlisted: false,
        services: ['Basic Wash', 'Premium Wash', 'Interior Cleaning'],
        priceRange: '\$15 - \$50',
      ),
      const CarWashShopModel(
        id: 2,
        name: 'Quick Clean Auto',
        description:
            'Fast and efficient car washing services for busy professionals.',
        image:
            'https://images.unsplash.com/photo-1607860108855-64acf2078ed9?w=800&h=600&fit=crop',
        address: '456 Oak Avenue, Business District',
        phone: '+1 (555) 234-5678',
        latitude: 37.7849,
        longitude: -122.4094,
        rating: 4.2,
        reviewCount: 89,
        distance: 1.2,
        openingTime: '07:00',
        closingTime: '19:00',
        isOpen: true,
        isWishlisted: true,
        services: ['Express Wash', 'Vacuum Service', 'Tire Shine'],
        priceRange: '\$10 - \$35',
      ),
      const CarWashShopModel(
        id: 3,
        name: 'Elite Auto Detailing',
        description:
            'Luxury car detailing with premium products and expert technicians.',
        image:
            'https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?w=800&h=600&fit=crop',
        address: '789 Pine Street, Uptown',
        phone: '+1 (555) 345-6789',
        latitude: 37.7949,
        longitude: -122.3994,
        rating: 4.8,
        reviewCount: 156,
        distance: 2.1,
        openingTime: '09:00',
        closingTime: '17:00',
        isOpen: false,
        isWishlisted: false,
        services: ['Full Detail', 'Paint Protection', 'Interior Deep Clean'],
        priceRange: '\$50 - \$150',
      ),
    ];
  }

  /// Gets the timestamp of cached car wash shops.
  DateTime? getCarWashShopsTimestamp() {
    final timestamp =
        _homeBox.get(HomeBoxKeys.carWashServicesTimestamp) as String?;
    if (timestamp == null) return null;
    return DateTime.tryParse(timestamp);
  }

  // ============ User Location Cache ============

  /// Saves user location to cache.
  Future<void> saveLocation(UserLocationModel location) async {
    await _locationBox.put(
      LocationBoxKeys.lastLocation,
      jsonEncode(location.toJson()),
    );
    await _locationBox.put(
      LocationBoxKeys.lastLocationTimestamp,
      DateTime.now().toIso8601String(),
    );
  }

  /// Gets cached user location.
  UserLocationModel? getLocation() {
    final jsonString =
        _locationBox.get(LocationBoxKeys.lastLocation) as String?;
    if (jsonString == null) return null;

    return UserLocationModel.fromJson(
      jsonDecode(jsonString) as Map<String, dynamic>,
    );
  }

  /// Gets the timestamp of cached location.
  DateTime? getLocationTimestamp() {
    final timestamp =
        _locationBox.get(LocationBoxKeys.lastLocationTimestamp) as String?;
    if (timestamp == null) return null;
    return DateTime.tryParse(timestamp);
  }

  // ============ Cache Management ============

  /// Clears all home data cache.
  Future<void> clearHomeCache() async {
    await _homeBox.clear();
  }

  /// Clears location cache.
  Future<void> clearLocationCache() async {
    await _locationBox.clear();
  }

  /// Clears all cache.
  Future<void> clearAll() async {
    await Future.wait([_homeBox.clear(), _locationBox.clear()]);
  }
}
