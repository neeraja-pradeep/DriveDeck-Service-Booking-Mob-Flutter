/// Keys used for Hive storage organized by feature and box.
class HiveKeys {
  HiveKeys._();

  // ============================================================================
  // FEATURE-AUTH Keys (Single HiveKeys class with mixed keys)
  // ============================================================================

  // Auth-related keys
  static const String sessionId = 'session_id';
  static const String xcsrfToken = 'xcsrf_token';
  static const String userId = 'user_id';
  static const String rememberMe = 'remember_me';
  static const String lastPhoneNumber = 'last_phone_number';
  static const String sessionCreatedAt = 'session_created_at';
  static const String sessionExpiresAt = 'session_expires_at';

  // User-related keys
  static const String userPhone = 'user_phone';
  static const String userName = 'user_name';
  static const String userEmail = 'user_email';
  static const String userProfilePicture = 'user_profile_picture';

  // Bookings-related keys (for backward compatibility)
  static const String bookingsList = 'bookings_list';
  static const String bookingsTimestamp = 'bookings_timestamp';
}

// ============================================================================
// FEATURE-BOOKINGS Keys (Organized by box)
// ============================================================================

/// Keys for AuthBox in bookings feature
class AuthBoxKeys {
  AuthBoxKeys._();

  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String xcsrfToken = 'xcsrf_token';
  static const String userId = 'user_id';
  static const String loginTimestamp = 'login_timestamp';
}

/// Keys for UserBox in bookings feature
class UserBoxKeys {
  UserBoxKeys._();

  static const String profile = 'user_profile';
  static const String preferences = 'user_preferences';
}

/// Keys for BookingsBox
class BookingsBoxKeys {
  BookingsBoxKeys._();

  static const String bookingsList = 'bookings_list';
  static const String bookingsTimestamp = 'bookings_timestamp';
  static const String upcomingBookings = 'upcoming_bookings';
  static const String pastBookings = 'past_bookings';
}

/// Keys for ShopsBox
class ShopsBoxKeys {
  ShopsBoxKeys._();

  static const String shopsList = 'shops_list';
  static const String shopsTimestamp = 'shops_timestamp';
  static const String favoriteShops = 'favorite_shops';
}

/// Keys for SettingsBox in bookings feature
class SettingsBoxKeys {
  SettingsBoxKeys._();

  static const String themeMode = 'theme_mode';
  static const String notifications = 'notifications';
  static const String language = 'language';
  static const String onboardingComplete = 'onboarding_complete';
}

/// Keys for CacheBox in bookings feature
class CacheBoxKeys {
  CacheBoxKeys._();

  static const String expiryTimes = 'expiry_times';
}

// ============================================================================
// FEATURE-HOMEPAGE Keys (Organized by box)
// ============================================================================

/// Keys for AuthBox in homepage feature
class HomeAuthBoxKeys {
  HomeAuthBoxKeys._();

  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String userProfile = 'user_profile';
}

/// Keys for HomeBox
class HomeBoxKeys {
  HomeBoxKeys._();

  static const String serviceCategories = 'service_categories';
  static const String serviceCategoriesTimestamp =
      'service_categories_timestamp';
  static const String carWashServices = 'car_wash_services';
  static const String carWashServicesTimestamp = 'car_wash_services_timestamp';
  static const String promoCards = 'promo_cards';
}

/// Keys for LocationBox
class LocationBoxKeys {
  LocationBoxKeys._();

  static const String lastLocation = 'last_location';
  static const String lastLocationTimestamp = 'last_location_timestamp';
}

/// Keys for PreferencesBox
class PreferencesBoxKeys {
  PreferencesBoxKeys._();

  static const String isDarkMode = 'is_dark_mode';
  static const String language = 'language';
  static const String isFirstLaunch = 'is_first_launch';
}
