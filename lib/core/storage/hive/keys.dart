/// Contains all Hive key constants organized by box.
///
/// Centralizes key names for consistent access across the app.

/// Keys for the auth box.
class AuthBoxKeys {
  AuthBoxKeys._();

  /// Key for storing the access token.
  static const String accessToken = 'access_token';

  /// Key for storing the refresh token.
  static const String refreshToken = 'refresh_token';

  /// Key for storing the XCSRF token.
  static const String xcsrfToken = 'xcsrf_token';

  /// Key for storing the user ID.
  static const String userId = 'user_id';

  /// Key for storing login timestamp.
  static const String loginTimestamp = 'login_timestamp';
}

/// Keys for the user box.
class UserBoxKeys {
  UserBoxKeys._();

  /// Key for storing user profile data.
  static const String profile = 'user_profile';

  /// Key for storing user preferences.
  static const String preferences = 'user_preferences';
}

/// Keys for the bookings box.
class BookingsBoxKeys {
  BookingsBoxKeys._();

  /// Key for storing the bookings list.
  static const String bookingsList = 'bookings_list';

  /// Key for storing the bookings timestamp.
  static const String bookingsTimestamp = 'bookings_timestamp';

  /// Key for storing upcoming bookings.
  static const String upcomingBookings = 'upcoming_bookings';

  /// Key for storing past bookings.
  static const String pastBookings = 'past_bookings';
}

/// Keys for the shops box.
class ShopsBoxKeys {
  ShopsBoxKeys._();

  /// Key for storing the shops list.
  static const String shopsList = 'shops_list';

  /// Key for storing the shops timestamp.
  static const String shopsTimestamp = 'shops_timestamp';

  /// Key for storing favorite shops.
  static const String favoriteShops = 'favorite_shops';
}

/// Keys for the settings box.
class SettingsBoxKeys {
  SettingsBoxKeys._();

  /// Key for storing the app theme mode.
  static const String themeMode = 'theme_mode';

  /// Key for storing notification settings.
  static const String notifications = 'notifications';

  /// Key for storing language preference.
  static const String language = 'language';

  /// Key for storing onboarding completion status.
  static const String onboardingComplete = 'onboarding_complete';
}

/// Keys for the cache box.
class CacheBoxKeys {
  CacheBoxKeys._();

  /// Key for storing cache expiry timestamps.
  static const String expiryTimes = 'expiry_times';
}
