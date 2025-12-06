/// Hive box names used in the application.
class HiveBoxes {
  HiveBoxes._();

  // ============================================================================
  // FEATURE-AUTH Boxes
  // ============================================================================

  /// Auth-related data box
  static const String authBox = 'auth_box';

  /// User profile data box
  static const String userBox = 'user_box';

  /// App settings box
  static const String settingsBox = 'settings_box';

  /// Cache box for temporary data
  static const String cacheBox = 'cache_box';

  // ============================================================================
  // FEATURE-BOOKINGS Boxes
  // ============================================================================

  /// Bookings data box
  static const String bookingsBox = 'bookings_box';

  /// Shops data box
  static const String shopsBox = 'shops_box';

  // ============================================================================
  // FEATURE-HOMEPAGE Boxes
  // ============================================================================

  /// Home screen cached data box
  static const String homeData = 'home_data_box';

  /// User preferences box
  static const String preferences = 'preferences_box';

  /// Location data box
  static const String location = 'location_box';

  /// Get all box names as a list
  static List<String> get allBoxes => [
    authBox,
    userBox,
    settingsBox,
    cacheBox,
    bookingsBox,
    shopsBox,
    homeData,
    preferences,
    location,
  ];
}
