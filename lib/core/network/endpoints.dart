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

  /// Login endpoint.
  static String login() => '$apiPrefix/auth/login/';

  /// Logout endpoint.
  static String logout() => '$apiPrefix/auth/logout/';

  /// Refresh token endpoint.
  static String refreshToken() => '$apiPrefix/auth/refresh/';

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
  static String userProfile() => '$apiPrefix/auth/profile/';

  /// Update user profile.
  static String updateProfile() => '$apiPrefix/auth/profile/';
}
