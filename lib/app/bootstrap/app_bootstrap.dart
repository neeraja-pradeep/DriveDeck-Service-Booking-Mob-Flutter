import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'hive_init.dart';

/// Bootstraps the application with necessary initializations.
class AppBootstrap {
  AppBootstrap._();

  /// Initializes all app dependencies before running.
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Set preferred orientations
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Set system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    // Initialize Hive
    await HiveInit.init();

    // Add other initializations here:
    // - Firebase
    // - Crashlytics
    // - Analytics
    // - Remote Config
  }
}
