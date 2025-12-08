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
      Hive.openBox<dynamic>(HiveBoxes.authBox),
      Hive.openBox<dynamic>(HiveBoxes.homeDataBox),
      Hive.openBox<dynamic>(HiveBoxes.preferencesBox),
      Hive.openBox<dynamic>(HiveBoxes.locationBox),
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
      Hive.box<dynamic>(HiveBoxes.homeDataBox).clear(),
      Hive.box<dynamic>(HiveBoxes.locationBox).clear(),
    ]);
  }

  /// Gets a box by name.
  static Box<dynamic> getBox(String boxName) {
    return Hive.box<dynamic>(boxName);
  }
}
