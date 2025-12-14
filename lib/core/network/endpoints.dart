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
  static String sendOtp() => '$apiPrefix/accounts/v1/send-otp/';

  /// Verify OTP endpoint.
  /// POST /api/accounts/verify-otp/
  /// Payload: { "phone": "9876543210", "otp_code": "123456", "new_password": "..." (optional) }
  static String verifyOtp() => '$apiPrefix/accounts/v1/verify-otp/';

  /// Register/Signup endpoint.
  /// POST /api/accounts/register/
  /// Payload: { "phone": "...", "username": "...", "password": "...", "password_confirm": "..." }
  static String register() => '$apiPrefix/accounts/v1/register/';

  /// Login/Signin endpoint.
  /// POST /api/accounts/login/
  /// Payload: { "email": "...", "password": "..." }
  static String login() => '$apiPrefix/accounts/v1/login/';

  /// Logout endpoint.
  static String logout() => '$apiPrefix/accounts/logout/';

  /// Refresh token endpoint.
  static String refreshToken() => '$apiPrefix/accounts/refresh/';

  /// User profile endpoint.
  /// GET/PUT /api/accounts/profile/
  static String profile() => '$apiPrefix/accounts/v1/profile/';

  // ============================================================================
  // Shop Endpoints (Additional)
  // ============================================================================

  /// Get shop categories.
  static String shopCategories() => '$apiPrefix/shop/v1/shop-categories/';

  /// Get shop reviews (includes shop info).
  static String shopReviews() => '$apiPrefix/shop/v1/shop-reviews/';

  /// Get shops near you.
  static String shopsNearYou() => '$apiPrefix/shop/v1/shops/near-you/';

  // ============================================================================
  // Bookings Endpoints
  // ============================================================================

  /// Get all bookings list.
  ///
  /// Query params:
  /// - status: 'booked' for upcoming (pending/confirmed)
  /// - status: 'history' for past (cancelled/completed)
  static String bookings() => '$apiPrefix/booking/v1/bookings/';

  /// Get booking details by ID.
  static String bookingDetails(String bookingId) =>
      '$apiPrefix/booking/v1/bookings/$bookingId/';

  /// Cancel a booking.
  static String cancelBooking(String bookingId) =>
      '$apiPrefix/booking/bookings/v1/$bookingId/cancel/';

  /// Reschedule a booking.
  static String rescheduleBooking(String bookingId) =>
      '$apiPrefix/booking/v1/bookings/$bookingId/reschedule/';

  // ============================================================================
  // Shop Endpoints
  // ============================================================================

  /// Get all shops.
  static String shops() => '$apiPrefix/shop/v1/shops/';

  /// Get nearby shops.
  static String nearbyShops() => '$apiPrefix/shop/v1/shops/near-you/';

  /// Get shop details.
  static String shopDetails(int shopId) => '$apiPrefix/shop/v1/shops/$shopId/';

  /// Get shop services.
  /// GET /api/shop/shop-services/?shop={shopId}
  static String shopServices(int shopId) =>
      '$apiPrefix/shop/v1/shop-services/?shop=$shopId';

  /// Get shop packages.
  static String shopPackages(int shopId) =>
      '$apiPrefix/shop/v1/shops/$shopId/packages/';

  /// Get shop accessories.
  static String shopAccessories(int shopId) =>
      '$apiPrefix/shop/v1/shops/$shopId/accessories/';

  /// Get shop availability/schedule.
  /// GET /api/shop/shop_schedule
  static String shopAvailability(int shopId) =>
      '$apiPrefix/shop/shop_schedule/';

  /// Get shop time slots (legacy).
  static String shopTimeSlots(String shopId) =>
      '$apiPrefix/shop/v1/shops/$shopId/slots/';

  /// Shop favorites.
  /// GET/POST /api/shop/v1/favorites/
  static String shopFavorites() => '$apiPrefix/shop/v1/favorites/';

  /// Shop favorite by ID.
  /// DELETE /api/shop/v1/favorites/{id}/
  static String shopFavorite(int shopId) =>
      '$apiPrefix/shop/v1/favorites/$shopId/';

  // ============================================================================
  // User Endpoints
  // ============================================================================

  /// Get user profile.
  static String userProfile() => '$apiPrefix/accounts/v1/profile/';

  /// Update user profile.
  static String updateProfile() => '$apiPrefix/accounts/v1/profile/';

  // ============================================================================
  // Vehicle/Cars Endpoints
  // ============================================================================

  /// Get all user cars.
  /// GET /api/accounts/v1/cars/
  static String userVehicles() => '$apiPrefix/accounts/v1/cars/';

  /// Create a new car.
  /// POST /api/accounts/v1/cars/
  static String createVehicle() => '$apiPrefix/accounts/v1/cars/';

  /// Get/Update/Delete a car.
  /// GET/PUT/PATCH/DELETE /api/accounts/v1/cars/{id}/
  static String vehicleById(int vehicleId) =>
      '$apiPrefix/accounts/v1/cars/$vehicleId/';
}
