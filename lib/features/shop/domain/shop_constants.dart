/// Constants for the Shop feature.
class ShopConstants {
  ShopConstants._();

  /// Default page size for pagination.
  static const int kDefaultPageSize = 10;

  /// Default maximum distance in kilometers for nearby shops.
  static const double kDefaultMaxDistanceKm = 10;

  /// Default number of days for availability check.
  static const int kDefaultAvailabilityDays = 7;

  /// Default limit for nearby shops query.
  static const int kDefaultNearbyShopsLimit = 10;

  /// Admin fee percentage (5%).
  static const double kAdminFeePercentage = 0.05;

  /// Pickup and delivery fee in currency.
  static const double kPickupDeliveryFee = 200.0;

  /// Discount percentage for FIRST10 promo code.
  static const double kFirst10DiscountPercentage = 0.10;

  /// Discount percentage for SAVE20 promo code.
  static const double kSave20DiscountPercentage = 0.20;

  /// Flat discount amount for FLAT100 promo code.
  static const double kFlat100DiscountAmount = 100.0;

  /// Flat discount amount for FLAT200 promo code.
  static const double kFlat200DiscountAmount = 200.0;

  /// Rounding factor for price calculations.
  static const double kPriceRoundingFactor = 10.0;
}
