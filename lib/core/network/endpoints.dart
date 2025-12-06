/// API endpoint path builders.
class Endpoints {
  Endpoints._();

  // Base URL
  static const String baseUrl = 'http://156.67.104.149:8110';

  // Auth endpoints
  static String login() => '/api/auth/send-otp/';
  static String verifyOtp() => '/api/auth/verify-otp/';
  static String logout() => '/api/auth/logout/';

  // Profile endpoints
  static String profile() => '/api/accounts/profile/';
  static String updateProfile() => '/api/accounts/profile/';

  // Address endpoints
  static String addresses() => '/api/auth/address/';
  static String address(String id) => '/api/auth/address/$id/';
}
