/// API endpoints for the application.
/// All endpoint paths are defined here for centralized management.
class Endpoints {
  Endpoints._();

  /// Base URL for the API.
  static const String baseUrl = 'http://156.67.104.149:8110';

  /// API version prefix.
  static const String apiPrefix = '/api';

  // ============ Auth Endpoints ============

  /// Send OTP endpoint.
  static String sendOtp() => '$apiPrefix/auth/send-otp/';

  /// Verify OTP endpoint.
  static String verifyOtp() => '$apiPrefix/auth/verify-otp/';

  /// User profile endpoint.
  static String profile() => '$apiPrefix/accounts/profile/';

  // ============ Home/Shop Endpoints ============

  /// Service categories endpoint.
  static String shopCategories() => '$apiPrefix/shop/shop-categories/';

  /// Shops list endpoint with optional search.
  static String shops({String? search, int page = 1, int pageSize = 10}) {
    final queryParams = <String, String>{
      'page': page.toString(),
      'page_size': pageSize.toString(),
    };
    if (search != null && search.isNotEmpty) {
      queryParams['search'] = search;
    }
    final queryString = Uri(queryParameters: queryParams).query;
    return '$apiPrefix/shop/shops/?$queryString';
  }

  /// Shops near user endpoint.
  static String shopsNearYou() => '$apiPrefix/shop/shops/near-you/';

  /// Toggle wishlist endpoint.
  static String toggleWishlist(String shopId) =>
      '$apiPrefix/shop/shops/$shopId/wishlist/';

  // ============ Future Endpoints (Placeholders) ============

  /// Accessories services endpoint.
  static String accessoriesServices() => '$apiPrefix/services/accessories/';

  /// Marketplace services endpoint.
  static String marketplaceServices() => '$apiPrefix/services/marketplace/';

  /// Promo cards endpoint.
  static String promoCards() => '$apiPrefix/home/promo-cards/';
}
