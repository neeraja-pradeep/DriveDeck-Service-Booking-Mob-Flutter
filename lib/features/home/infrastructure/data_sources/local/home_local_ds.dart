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
  Box<dynamic> get _homeBox => Hive.box<dynamic>(HiveBoxes.homeDataBox);
  Box<dynamic> get _locationBox => Hive.box<dynamic>(HiveBoxes.locationBox);

  // ============ Service Categories Cache ============

  /// Saves service categories to cache.
  Future<void> saveServiceCategories(List<ServiceCategoryModel> categories) async {
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
        .map((json) => ServiceCategoryModel.fromJson(json as Map<String, dynamic>))
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
    if (jsonString == null) return null;

    final jsonList = jsonDecode(jsonString) as List<dynamic>;
    return jsonList
        .map((json) => CarWashShopModel.fromJson(json as Map<String, dynamic>))
        .toList();
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
    await _locationBox.put(LocationBoxKeys.lastLocation, jsonEncode(location.toJson()));
    await _locationBox.put(
      LocationBoxKeys.lastLocationTimestamp,
      DateTime.now().toIso8601String(),
    );
  }

  /// Gets cached user location.
  UserLocationModel? getLocation() {
    final jsonString = _locationBox.get(LocationBoxKeys.lastLocation) as String?;
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
    await Future.wait([
      _homeBox.clear(),
      _locationBox.clear(),
    ]);
  }
}
