/// Contains all API endpoint definitions.
///
/// Centralizes endpoint paths for easy maintenance and consistency.
class Endpoints {
  Endpoints._();

  /// Base URL for the API.
  /// Per API documentation: http://156.67.104.149:8110/
  static const String baseUrl = 'http://156.67.104.149:8110';

  /// API version prefix.
  static const String apiPrefix = '/api';

  // ============================================================================
  // Auth Endpoints (per API Integration Document and Postman collection)
  // ============================================================================

  /// Send OTP endpoint.
  /// POST /api/accounts/send-otp/
  /// Payload: { "phone": "1234567890" }
  static String sendOtp() => '$apiPrefix/accounts/send-otp/';

  /// Verify OTP endpoint.
  /// POST /api/accounts/verify-otp/
  /// Payload: { "phone": "9876543210", "otp_code": "123456", "new_password": "..." (optional) }
  static String verifyOtp() => '$apiPrefix/accounts/verify-otp/';

  /// Register/Signup endpoint.
  /// POST /api/accounts/register/
  /// Payload: { "phone": "...", "username": "...", "password": "...", "password_confirm": "..." }
  static String register() => '$apiPrefix/accounts/register/';

  /// Login/Signin endpoint.
  /// POST /api/accounts/login/
  /// Payload: { "email": "...", "password": "..." }
  static String login() => '$apiPrefix/accounts/login/';

  /// Logout endpoint.
  static String logout() => '$apiPrefix/accounts/logout/';

  /// Refresh token endpoint.
  static String refreshToken() => '$apiPrefix/accounts/refresh/';

  /// User profile endpoint.
  /// GET/PUT /api/accounts/profile/
  static String profile() => '$apiPrefix/accounts/profile/';

  // ============================================================================
  // Shop Endpoints (Additional)
  // ============================================================================

  /// Get shop categories.
  static String shopCategories() => '$apiPrefix/shop/shop-categories/';

  /// Get shop reviews (includes shop info).
  static String shopReviews() => '$apiPrefix/shop/shop-reviews/';

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
