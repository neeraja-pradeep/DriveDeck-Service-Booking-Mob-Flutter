/// Hive keys used for storing data in boxes.
/// All keys should be defined here for centralized management.
class HiveKeys {
  HiveKeys._();
}

/// Keys for auth box.
class AuthBoxKeys {
  AuthBoxKeys._();

  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String userProfile = 'user_profile';
}

/// Keys for home data box.
class HomeBoxKeys {
  HomeBoxKeys._();

  static const String serviceCategories = 'service_categories';
  static const String serviceCategoriesTimestamp = 'service_categories_timestamp';
  static const String carWashServices = 'car_wash_services';
  static const String carWashServicesTimestamp = 'car_wash_services_timestamp';
  static const String promoCards = 'promo_cards';
}

/// Keys for location box.
class LocationBoxKeys {
  LocationBoxKeys._();

  static const String lastLocation = 'last_location';
  static const String lastLocationTimestamp = 'last_location_timestamp';
}

/// Keys for preferences box.
class PreferencesBoxKeys {
  PreferencesBoxKeys._();

  static const String isDarkMode = 'is_dark_mode';
  static const String language = 'language';
  static const String isFirstLaunch = 'is_first_launch';
}
