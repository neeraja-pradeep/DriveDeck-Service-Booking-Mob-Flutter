/// Contains all API endpoint definitions.
///
/// Centralizes endpoint paths for easy maintenance and consistency.
class Endpoints {
  Endpoints._();

  /// Base URL for the API.
  static const String baseUrl = 'http://156.67.104.149:8110';

  /// API version prefix.
  static const String apiPrefix = '/api';

  // ============================================================================
  // Auth Endpoints
  // ============================================================================

  /// Send OTP endpoint.
  static String sendOtp() => '$apiPrefix/accounts/send-otp/';

  /// Verify OTP endpoint.
  static String verifyOtp() => '$apiPrefix/accounts/verify-otp/';

  /// Register endpoint.
  static String register() => '$apiPrefix/accounts/register/';

  /// Login endpoint.
  static String login() => '$apiPrefix/accounts/login/';

  /// Logout endpoint.
  static String logout() => '$apiPrefix/accounts/logout/';

  /// Refresh token endpoint.
  static String refreshToken() => '$apiPrefix/accounts/refresh/';

  /// User profile endpoint.
  static String profile() => '$apiPrefix/accounts/profile/';

  // ============================================================================
  // Shop Endpoints (Additional)
  // ============================================================================

  /// Get shop categories.
  static String shopCategories() => '$apiPrefix/shop/shop-categories/';

  /// Get shops near you.
  static String shopsNearYou() => '$apiPrefix/shop/shops/near-you/';

  // ============================================================================
  // Bookings Endpoints
  // ============================================================================

  /// Get all bookings list.
  ///
  /// Query params:
  /// - status: 'booked' for upcoming (pending/confirmed)
  /// - status: 'history' for past (cancelled/completed)
  static String bookings() => '$apiPrefix/booking/bookings/';

  /// Get booking details by ID.
  static String bookingDetails(String bookingId) =>
      '$apiPrefix/booking/bookings/$bookingId/';

  /// Cancel a booking.
  static String cancelBooking(String bookingId) =>
      '$apiPrefix/booking/bookings/$bookingId/cancel/';

  /// Reschedule a booking.
  static String rescheduleBooking(String bookingId) =>
      '$apiPrefix/booking/bookings/$bookingId/reschedule/';

  // ============================================================================
  // Shop Endpoints
  // ============================================================================

  /// Get all shops.
  static String shops() => '$apiPrefix/shops/';

  /// Get shop details.
  static String shopDetails(String shopId) => '$apiPrefix/shops/$shopId/';

  /// Get shop services.
  static String shopServices(String shopId) =>
      '$apiPrefix/shops/$shopId/services/';

  /// Get shop time slots.
  static String shopTimeSlots(String shopId) =>
      '$apiPrefix/shops/$shopId/slots/';

  // ============================================================================
  // User Endpoints
  // ============================================================================

  /// Get user profile.
  static String userProfile() => '$apiPrefix/accounts/profile/';

  /// Update user profile.
  static String updateProfile() => '$apiPrefix/accounts/profile/';
}
