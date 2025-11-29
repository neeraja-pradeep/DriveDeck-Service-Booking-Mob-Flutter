import '../../app/config/env.dart';

/// API endpoint paths for the application.
class Endpoints {
  Endpoints._();

  /// Base URL for the API (environment-aware).
  static String get baseUrl => Env.apiBaseUrl;

  // Authentication endpoints
  static String sendOtp() => '/api/accounts/send-otp/';
  static String verifyOtp() => '/api/accounts/verify-otp/';
  static String register() => '/api/accounts/register/';
  static String login() => '/api/accounts/login/';
  static String logout() => '/api/accounts/logout/';

  // Profile endpoints
  static String profile() => '/api/accounts/profile/';
}
