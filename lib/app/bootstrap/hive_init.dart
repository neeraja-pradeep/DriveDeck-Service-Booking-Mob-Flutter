import 'package:hive_flutter/hive_flutter.dart';

import '../../core/storage/hive/adapters/day_hours_adapter.dart';
import '../../core/storage/hive/adapters/opening_hours_adapter.dart';
import '../../core/storage/hive/adapters/shop_adapter.dart';
import '../../core/storage/hive/boxes.dart';

/// Initializes Hive with all required adapters and boxes.
class HiveInit {
  HiveInit._();

  /// Initializes Hive for the application.
  static Future<void> init() async {
    // Initialize Hive for Flutter
    await Hive.initFlutter();

    // Register type adapters in dependency order
    // DayHours must be registered before OpeningHours
    // OpeningHours must be registered before Shop
    _registerAdapters();

    // Open required boxes
    await _openBoxes();
  }

  /// Registers all Hive type adapters.
  static void _registerAdapters() {
    // Register DayHours adapter (TypeId: 22)
    if (!Hive.isAdapterRegistered(22)) {
      Hive.registerAdapter(DayHoursAdapter());
    }

    // Register OpeningHours adapter (TypeId: 21)
    if (!Hive.isAdapterRegistered(21)) {
      Hive.registerAdapter(OpeningHoursAdapter());
    }

    // Register Shop adapter (TypeId: 20)
    if (!Hive.isAdapterRegistered(20)) {
      Hive.registerAdapter(ShopAdapter());
    }
  }

  /// Opens all required Hive boxes.
  static Future<void> _openBoxes() async {
    // Open shop cache box
    if (!Hive.isBoxOpen(HiveBoxes.shopCacheBox)) {
      await Hive.openBox<dynamic>(HiveBoxes.shopCacheBox);
    }
  }

  /// Clears all Hive data (for logout or reset).
  static Future<void> clearAll() async {
    await Hive.deleteFromDisk();
  }

  /// Closes all boxes gracefully.
  static Future<void> close() async {
    await Hive.close();
  }
}
