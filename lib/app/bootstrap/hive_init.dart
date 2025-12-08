import 'package:hive_flutter/hive_flutter.dart';
import '../../core/storage/hive/boxes.dart';

/// Initializes Hive for local storage.
class HiveInit {
  HiveInit._();

  /// Initializes Hive and opens required boxes.
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register adapters here
    // Example: Hive.registerAdapter(ServiceCategoryAdapter());

    // Open boxes
    await _openBoxes();
  }

  /// Opens all required Hive boxes.
  static Future<void> _openBoxes() async {
    await Future.wait([
      // 'authBox' was correct in boxes.dart
      Hive.openBox<dynamic>(HiveBoxes.authBox),

      // FIXED: 'homeDataBox' -> 'homeData'
      Hive.openBox<dynamic>(HiveBoxes.homeData),

      // FIXED: 'preferencesBox' -> 'preferences'
      Hive.openBox<dynamic>(HiveBoxes.preferences),

      // FIXED: 'locationBox' -> 'location'
      Hive.openBox<dynamic>(HiveBoxes.location),
    ]);
  }

  /// Closes all Hive boxes.
  static Future<void> close() async {
    await Hive.close();
  }

  /// Clears all data from all boxes (for logout).
  static Future<void> clearAll() async {
    await Future.wait([
      Hive.box<dynamic>(HiveBoxes.authBox).clear(),
      // FIXED: 'homeDataBox' -> 'homeData'
      Hive.box<dynamic>(HiveBoxes.homeData).clear(),
      // FIXED: 'locationBox' -> 'location'
      Hive.box<dynamic>(HiveBoxes.location).clear(),
    ]);
  }

  /// Gets a box by name.
  static Box<dynamic> getBox(String boxName) {
    return Hive.box<dynamic>(boxName);
  }
}
