/// Contains all Hive box name constants.
///
/// Centralizes box names for consistent access across the app.
class HiveBoxes {
  HiveBoxes._();

  /// Box for storing authentication data.
  static const String authBox = 'auth_box';

  /// Box for storing user profile data.
  static const String userBox = 'user_box';

  /// Box for storing bookings data.
  static const String bookingsBox = 'bookings_box';

  /// Box for storing shop data.
  static const String shopsBox = 'shops_box';

  /// Box for storing app settings.
  static const String settingsBox = 'settings_box';

  /// Box for storing cached images metadata.
  static const String cacheBox = 'cache_box';

  /// List of all box names for initialization.
  static List<String> get allBoxes => [
        authBox,
        userBox,
        bookingsBox,
        shopsBox,
        settingsBox,
        cacheBox,
      ];
}
