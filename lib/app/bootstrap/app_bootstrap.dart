import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/storage/hive/boxes.dart';
import '../../features/profile/infrastructure/models/user_profile_model.dart';
import '../config/env.dart';
import '../config/env_loader.dart';

/// Handles app initialization and bootstrap operations.
class AppBootstrap {
  AppBootstrap._();

  // Core boxes (shared across features)
  static Box<dynamic>? _authBox;
  static Box<dynamic>? _userBox;
  static Box<dynamic>? _settingsBox;
  static Box<dynamic>? _cacheBox;

  // Feature-specific boxes
  static Box<dynamic>? _bookingsBox;
  static Box<dynamic>? _shopsBox;
  static Box<dynamic>? _homeDataBox;
  static Box<dynamic>? _preferencesBox;
  static Box<dynamic>? _locationBox;

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

    // Register Hive adapters
    await _registerHiveAdapters();

    // Open all required boxes during app initialization
    debugPrint('📦 AppBootstrap: Opening Hive boxes');

    try {
      _authBox = await Hive.openBox(HiveBoxes.authBox);
      debugPrint('✅ AppBootstrap: Auth box opened');

      _userBox = await Hive.openBox(HiveBoxes.userBox);
      debugPrint('✅ AppBootstrap: User box opened');

      _settingsBox = await Hive.openBox(HiveBoxes.settingsBox);
      debugPrint('✅ AppBootstrap: Settings box opened');

      _cacheBox = await Hive.openBox(HiveBoxes.cacheBox);
      debugPrint('✅ AppBootstrap: Cache box opened');

      _bookingsBox = await Hive.openBox(HiveBoxes.bookingsBox);
      debugPrint('✅ AppBootstrap: Bookings box opened');

      _shopsBox = await Hive.openBox(HiveBoxes.shopsBox);
      debugPrint('✅ AppBootstrap: Shops box opened');

      _homeDataBox = await Hive.openBox(HiveBoxes.homeData);
      debugPrint('✅ AppBootstrap: Home data box opened');

      _preferencesBox = await Hive.openBox(HiveBoxes.preferences);
      debugPrint('✅ AppBootstrap: Preferences box opened');

      _locationBox = await Hive.openBox(HiveBoxes.location);
      debugPrint('✅ AppBootstrap: Location box opened');

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

  /// Get the bookings box (must be called after initialization).
  static Box<dynamic> get bookingsBox {
    if (_bookingsBox == null) {
      throw StateError(
        'Bookings box not initialized. Call AppBootstrap.initialize() first.',
      );
    }
    return _bookingsBox!;
  }

  /// Get the shops box (must be called after initialization).
  static Box<dynamic> get shopsBox {
    if (_shopsBox == null) {
      throw StateError(
        'Shops box not initialized. Call AppBootstrap.initialize() first.',
      );
    }
    return _shopsBox!;
  }

  /// Get the home data box (must be called after initialization).
  static Box<dynamic> get homeDataBox {
    if (_homeDataBox == null) {
      throw StateError(
        'Home data box not initialized. Call AppBootstrap.initialize() first.',
      );
    }
    return _homeDataBox!;
  }

  /// Get the preferences box (must be called after initialization).
  static Box<dynamic> get preferencesBox {
    if (_preferencesBox == null) {
      throw StateError(
        'Preferences box not initialized. Call AppBootstrap.initialize() first.',
      );
    }
    return _preferencesBox!;
  }

  /// Get the location box (must be called after initialization).
  static Box<dynamic> get locationBox {
    if (_locationBox == null) {
      throw StateError(
        'Location box not initialized. Call AppBootstrap.initialize() first.',
      );
    }
    return _locationBox!;
  }

  /// Close all Hive boxes (call during app shutdown or logout).
  static Future<void> closeAllBoxes() async {
    debugPrint('📦 AppBootstrap: Closing all Hive boxes');

    await _authBox?.close();
    await _userBox?.close();
    await _settingsBox?.close();
    await _cacheBox?.close();
    await _bookingsBox?.close();
    await _shopsBox?.close();
    await _homeDataBox?.close();
    await _preferencesBox?.close();
    await _locationBox?.close();

    _authBox = null;
    _userBox = null;
    _settingsBox = null;
    _cacheBox = null;
    _bookingsBox = null;
    _shopsBox = null;
    _homeDataBox = null;
    _preferencesBox = null;
    _locationBox = null;

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

  /// Clear all data from bookings box.
  static Future<void> clearBookingsData() async {
    debugPrint('🗑️ AppBootstrap: Clearing bookings data');
    await bookingsBox.clear();
    debugPrint('✅ AppBootstrap: Bookings data cleared');
  }

  /// Clear all data from home data box.
  static Future<void> clearHomeData() async {
    debugPrint('🗑️ AppBootstrap: Clearing home data');
    await homeDataBox.clear();
    debugPrint('✅ AppBootstrap: Home data cleared');
  }

  /// Clear all data from location box.
  static Future<void> clearLocationData() async {
    debugPrint('🗑️ AppBootstrap: Clearing location data');
    await locationBox.clear();
    debugPrint('✅ AppBootstrap: Location data cleared');
  }

  /// Clear all user-related data (useful for logout).
  static Future<void> clearAllUserData() async {
    debugPrint('🗑️ AppBootstrap: Clearing all user data');
    await Future.wait([
      clearAuthData(),
      clearBookingsData(),
      clearHomeData(),
      clearLocationData(),
    ]);
    debugPrint('✅ AppBootstrap: All user data cleared');
  }

  /// Register all Hive adapters.
  static Future<void> _registerHiveAdapters() async {
    debugPrint('📦 AppBootstrap: Registering Hive adapters');

    // Register UserProfileModel adapter
    if (!Hive.isAdapterRegistered(40)) {
      Hive.registerAdapter(UserProfileModelAdapter());
      debugPrint('✅ AppBootstrap: UserProfileModel adapter registered');
    }

    debugPrint('✅ AppBootstrap: All Hive adapters registered');
  }
}
