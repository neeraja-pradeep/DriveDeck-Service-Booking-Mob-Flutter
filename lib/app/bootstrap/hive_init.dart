import 'package:hive_flutter/hive_flutter.dart';
import 'package:newapp/core/storage/hive/boxes.dart';
import 'package:newapp/features/profile/infrastructure/models/user_profile_model.dart';

/// Initialize Hive for local storage.
class HiveInit {
  HiveInit._();

  static Future<void> init() async {
    await Hive.initFlutter();

    // Register adapters
    _registerAdapters();

    // Open boxes
    await _openBoxes();
  }

  static void _registerAdapters() {
    Hive.registerAdapter(UserProfileModelAdapter());
  }

  static Future<void> _openBoxes() async {
    await Future.wait([
      Hive.openBox<dynamic>(HiveBoxes.authBox),
      Hive.openBox<dynamic>(HiveBoxes.profileBox),
      Hive.openBox<dynamic>(HiveBoxes.settingsBox),
    ]);
  }

  /// Clear all boxes on logout.
  static Future<void> clearAllBoxes() async {
    await Future.wait([
      Hive.box<dynamic>(HiveBoxes.authBox).clear(),
      Hive.box<dynamic>(HiveBoxes.profileBox).clear(),
      Hive.box<dynamic>(HiveBoxes.settingsBox).clear(),
    ]);
  }

  /// Close all boxes.
  static Future<void> closeAllBoxes() async {
    await Hive.close();
  }
}
