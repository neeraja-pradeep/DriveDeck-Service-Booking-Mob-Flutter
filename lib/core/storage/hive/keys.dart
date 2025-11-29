/// Keys used for Hive storage.
class HiveKeys {
  HiveKeys._();

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
}
