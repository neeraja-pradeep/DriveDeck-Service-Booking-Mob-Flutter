/// Hive box keys used throughout the application.
class HiveKeys {
  HiveKeys._();

  /// Authentication keys.
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
}

/// Shop-specific Hive keys.
class ShopBoxKeys {
  ShopBoxKeys._();

  /// Returns the key for storing shop details.
  static String shopDetails(String shopId) => 'shop_$shopId';

  /// Returns the key for storing shop timestamp.
  static String shopTimestamp(String shopId) => 'shop_timestamp_$shopId';
}
