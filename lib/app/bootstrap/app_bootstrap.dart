import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/storage/hive/boxes.dart';
import '../config/env.dart';
import '../config/env_loader.dart';

/// Handles app initialization and bootstrap operations.
class AppBootstrap {
  AppBootstrap._();

  static Box<dynamic>? _authBox;
  static Box<dynamic>? _userBox;
  static Box<dynamic>? _settingsBox;
  static Box<dynamic>? _cacheBox;

  /// Initialize the app with all required services.
  static Future<void> initialize({Environment? environment}) async {
    debugPrint('🚀 AppBootstrap: Starting app initialization');

    // Initialize environment configuration
    await _initializeEnvironment(environment);

    // Initialize Hive
    await _initializeHive();

    debugPrint('✅ AppBootstrap: App initialization completed');
  }

  /// Initialize environment configuration.
  static Future<void> _initializeEnvironment(Environment? environment) async {
    debugPrint('🌍 AppBootstrap: Initializing environment');

    // Load environment from various sources if not explicitly provided
    final env = environment ?? EnvLoader.loadEnvironment();

    // Validate environment configuration
    if (!EnvLoader.validateEnvironment(env)) {
      debugPrint(
        '⚠️ AppBootstrap: Environment validation failed, using development',
      );
    }

    Env.initialize(env: env);

    debugPrint(
      '✅ AppBootstrap: Environment initialized as ${Env.environment.displayName}',
    );
    debugPrint('🌐 AppBootstrap: API Base URL: ${Env.apiBaseUrl}');

    // Log security warning for HTTP in production
    if (Env.isProduction && Env.apiBaseUrl.startsWith('http://')) {
      debugPrint(
        '🚨 AppBootstrap: WARNING - Using HTTP in production environment!',
      );
    }
  }

  /// Initialize Hive and open all required boxes.
  static Future<void> _initializeHive() async {
    debugPrint('📦 AppBootstrap: Initializing Hive');

    // Initialize Hive Flutter
    await Hive.initFlutter();

    // Open all required boxes during app initialization
    debugPrint('📦 AppBootstrap: Opening Hive boxes');

    try {
      _authBox = await Hive.openBox(HiveBoxes.auth);
      debugPrint('✅ AppBootstrap: Auth box opened');

      _userBox = await Hive.openBox(HiveBoxes.user);
      debugPrint('✅ AppBootstrap: User box opened');

      _settingsBox = await Hive.openBox(HiveBoxes.settings);
      debugPrint('✅ AppBootstrap: Settings box opened');

      _cacheBox = await Hive.openBox(HiveBoxes.cache);
      debugPrint('✅ AppBootstrap: Cache box opened');

      debugPrint('✅ AppBootstrap: All Hive boxes opened successfully');
    } catch (e) {
      debugPrint('❌ AppBootstrap: Error opening Hive boxes: $e');
      rethrow;
    }
  }

  /// Get the auth box (must be called after initialization).
  static Box<dynamic> get authBox {
    if (_authBox == null) {
      throw StateError(
        'Auth box not initialized. Call AppBootstrap.initialize() first.',
      );
    }
    return _authBox!;
  }

  /// Get the user box (must be called after initialization).
  static Box<dynamic> get userBox {
    if (_userBox == null) {
      throw StateError(
        'User box not initialized. Call AppBootstrap.initialize() first.',
      );
    }
    return _userBox!;
  }

  /// Get the settings box (must be called after initialization).
  static Box<dynamic> get settingsBox {
    if (_settingsBox == null) {
      throw StateError(
        'Settings box not initialized. Call AppBootstrap.initialize() first.',
      );
    }
    return _settingsBox!;
  }

  /// Get the cache box (must be called after initialization).
  static Box<dynamic> get cacheBox {
    if (_cacheBox == null) {
      throw StateError(
        'Cache box not initialized. Call AppBootstrap.initialize() first.',
      );
    }
    return _cacheBox!;
  }

  /// Close all Hive boxes (call during app shutdown or logout).
  static Future<void> closeAllBoxes() async {
    debugPrint('📦 AppBootstrap: Closing all Hive boxes');

    await _authBox?.close();
    await _userBox?.close();
    await _settingsBox?.close();
    await _cacheBox?.close();

    _authBox = null;
    _userBox = null;
    _settingsBox = null;
    _cacheBox = null;

    debugPrint('✅ AppBootstrap: All Hive boxes closed');
  }

  /// Clear all data from auth box (useful for logout).
  static Future<void> clearAuthData() async {
    debugPrint('🗑️ AppBootstrap: Clearing auth data');
    await authBox.clear();
    debugPrint('✅ AppBootstrap: Auth data cleared');
  }

  /// Clear all data from cache box.
  static Future<void> clearCacheData() async {
    debugPrint('🗑️ AppBootstrap: Clearing cache data');
    await cacheBox.clear();
    debugPrint('✅ AppBootstrap: Cache data cleared');
  }
}
