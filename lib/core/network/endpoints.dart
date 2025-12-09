/// Contains all API endpoint definitions.
///
/// Centralizes endpoint paths for easy maintenance and consistency.
class Endpoints {
  Endpoints._();

  /// Base URL for the API.
  static const String baseUrl = 'http://156.67.104.149:8080';

  /// API version prefix.
  static const String apiPrefix = '/api';

  // ============================================================================
  // Auth Endpoints
  // ============================================================================

  /// Send OTP endpoint.
  static String sendOtp() => '$apiPrefix/auth/send-otp/';

  /// Verify OTP endpoint.
  static String verifyOtp() => '$apiPrefix/auth/verify-otp/';

  /// Register/Signup endpoint.
  static String register() => '$apiPrefix/auth/signup/';

  /// Login/Signin endpoint.
  static String login() => '$apiPrefix/auth/signin/';

  /// Logout endpoint.
  static String logout() => '$apiPrefix/auth/logout/';

  /// Refresh token endpoint.
  static String refreshToken() => '$apiPrefix/auth/refresh/';

  /// User profile endpoint.
  static String profile() => '$apiPrefix/auth/profile/';

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
  static String shops() => '$apiPrefix/shop/shops/';

  /// Get nearby shops.
  static String nearbyShops() => '$apiPrefix/shop/shops/near-you/';

  /// Get shop details.
  static String shopDetails(int shopId) => '$apiPrefix/shop/shops/$shopId/';

  /// Get shop services.
  static String shopServices(int shopId) =>
      '$apiPrefix/shop/shops/$shopId/services/';

  /// Get shop packages.
  static String shopPackages(int shopId) =>
      '$apiPrefix/shop/shops/$shopId/packages/';

  /// Get shop accessories.
  static String shopAccessories(int shopId) =>
      '$apiPrefix/shop/shops/$shopId/accessories/';

  /// Get shop availability for date range.
  static String shopAvailability(int shopId) =>
      '$apiPrefix/shop/shops/$shopId/date-day/';

  /// Get shop time slots (legacy).
  static String shopTimeSlots(String shopId) =>
      '$apiPrefix/shop/shops/$shopId/slots/';

  /// Shop favorites.
  static String shopFavorites() => '$apiPrefix/shop/favorites/';

  /// Shop favorite by ID.
  static String shopFavorite(int shopId) =>
      '$apiPrefix/shop/favorites/$shopId/';

  // ============================================================================
  // User Endpoints
  // ============================================================================

  /// Get user profile.
  static String userProfile() => '$apiPrefix/accounts/profile/';

  /// Update user profile.
  static String updateProfile() => '$apiPrefix/accounts/profile/';

  // ============================================================================
  // Vehicle Endpoints
  // ============================================================================

  /// Get all user vehicles.
  static String userVehicles() => '$apiPrefix/vehicles/';

  /// Create a new vehicle.
  static String createVehicle() => '$apiPrefix/vehicles/';

  /// Delete a vehicle.
  static String deleteVehicle(String vehicleId) =>
      '$apiPrefix/vehicles/$vehicleId/';
}
