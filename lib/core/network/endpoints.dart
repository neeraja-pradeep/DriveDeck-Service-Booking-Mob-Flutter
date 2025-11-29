/// API endpoint paths for the application.
class Endpoints {
  Endpoints._();

  /// Base URL for the API.
  static const String baseUrl = 'http://156.67.104.149:8110';

  // Authentication endpoints
  static String sendOtp() => '/api/accounts/send-otp/';
  static String verifyOtp() => '/api/accounts/verify-otp/';
  static String register() => '/api/accounts/register/';
  static String login() => '/api/accounts/login/';
  static String logout() => '/api/accounts/logout/';

  // Profile endpoints
  static String profile() => '/api/accounts/profile/';
}
