/// Contains all route path definitions.
///
/// Centralizes route paths for easy maintenance.
class Routes {
  Routes._();

  // ==========================================================================
  // Main Routes
  // ==========================================================================

  /// Root path.
  static const String root = '/';

  /// Home/Dashboard path.
  static const String home = '/home';

  /// Bookings path.
  static const String bookings = '/bookings';

  /// Booking detail path.
  static const String bookingDetail = '/bookings/:bookingId';

  /// Profile path.
  static const String profile = '/profile';

  // ==========================================================================
  // Auth Routes
  // ==========================================================================

  /// Login path.
  static const String login = '/login';

  /// Register path.
  static const String register = '/register';

  // ==========================================================================
  // Shop Routes
  // ==========================================================================

  /// Shops listing path.
  static const String shops = '/shops';

  /// Shop detail path.
  static const String shopDetail = '/shops/:shopId';

  // ==========================================================================
  // Path Builders
  // ==========================================================================

  /// Builds the booking detail path with the given ID.
  static String bookingDetailPath(String bookingId) => '/bookings/$bookingId';

  /// Builds the shop detail path with the given ID.
  static String shopDetailPath(String shopId) => '/shops/$shopId';
}
