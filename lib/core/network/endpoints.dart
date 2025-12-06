/// API endpoints for the application.
class Endpoints {
  Endpoints._();

  // Base paths
  static const String apiBase = '/api';
  static const String shopBase = '$apiBase/shop';

  // Shop endpoints
  static String shopDetails(String shopId) => '$shopBase/shops/$shopId/';
  static String shopServices(String shopId) => '$shopBase/shop-services/';
  static String availableSlots(String shopId) => '$shopBase/shops/$shopId/date-day/';

  // Booking endpoints
  static const String createBooking = '$apiBase/bookings/';
  static const String validatePromo = '$apiBase/promo/validate/';

  // Query parameter keys
  static const String shopQueryParam = 'shop';
  static const String dateQueryParam = 'date';
  static const String vehicleTypeQueryParam = 'vehicle_type';
}
