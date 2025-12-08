import '../../domain/entities/shop.dart';
import '../../domain/entities/vehicle_type.dart';
import '../../domain/shop_constants.dart';

/// Service for calculating booking prices.
class PriceCalculator {
  PriceCalculator._();

  /// Calculate subtotal for selected services.
  static double calculateServicesSubtotal(
    List<ShopService> services,
    VehicleType vehicleType,
  ) {
    final baseTotal = services.fold(0.0, (sum, service) => sum + service.price);
    return _applyVehicleMultiplier(baseTotal, vehicleType);
  }

  /// Calculate subtotal for selected packages.
  static double calculatePackagesSubtotal(
    List<ShopPackage> packages,
    VehicleType vehicleType,
  ) {
    final baseTotal = packages.fold(0.0, (sum, package) => sum + package.price);
    return _applyVehicleMultiplier(baseTotal, vehicleType);
  }

  /// Calculate subtotal for selected accessories.
  static double calculateAccessoriesSubtotal(List<ShopAccessory> accessories) {
    return accessories.fold(0.0, (sum, accessory) => sum + accessory.price);
  }

  /// Calculate total subtotal.
  static double calculateSubtotal({
    required List<ShopService> services,
    required List<ShopPackage> packages,
    required List<ShopAccessory> accessories,
    required VehicleType vehicleType,
  }) {
    final servicesTotal = calculateServicesSubtotal(services, vehicleType);
    final packagesTotal = calculatePackagesSubtotal(packages, vehicleType);
    final accessoriesTotal = calculateAccessoriesSubtotal(accessories);

    return servicesTotal + packagesTotal + accessoriesTotal;
  }

  /// Calculate admin fee.
  static double calculateAdminFee(double subtotal) {
    return _roundToNearestTen(subtotal * ShopConstants.kAdminFeePercentage);
  }

  /// Calculate discount from promo code.
  ///
  /// Note: In production, promo code validation should be done via API.
  static double calculateDiscount({
    required double subtotal,
    required String? promoCode,
  }) {
    if (promoCode == null || promoCode.isEmpty) return 0.0;

    return switch (promoCode.toUpperCase()) {
      'FIRST10' => _roundToNearestTen(
          subtotal * ShopConstants.kFirst10DiscountPercentage),
      'SAVE20' => _roundToNearestTen(
          subtotal * ShopConstants.kSave20DiscountPercentage),
      'FLAT100' => ShopConstants.kFlat100DiscountAmount,
      'FLAT200' => ShopConstants.kFlat200DiscountAmount,
      _ => 0.0,
    };
  }

  /// Calculate total price.
  static double calculateTotal({
    required double subtotal,
    required double adminFee,
    required double discount,
    required bool pickupAndDelivery,
  }) {
    final total = subtotal + adminFee - discount;
    if (pickupAndDelivery) {
      return total + ShopConstants.kPickupDeliveryFee;
    }
    return total;
  }

  /// Calculate full price breakdown.
  static PriceBreakdown calculatePriceBreakdown({
    required List<ShopService> services,
    required List<ShopPackage> packages,
    required List<ShopAccessory> accessories,
    required VehicleType vehicleType,
    String? promoCode,
    bool pickupAndDelivery = false,
  }) {
    final subtotal = calculateSubtotal(
      services: services,
      packages: packages,
      accessories: accessories,
      vehicleType: vehicleType,
    );

    final adminFee = calculateAdminFee(subtotal);
    final discount = calculateDiscount(
      subtotal: subtotal,
      promoCode: promoCode,
    );

    final total = calculateTotal(
      subtotal: subtotal,
      adminFee: adminFee,
      discount: discount,
      pickupAndDelivery: pickupAndDelivery,
    );

    return PriceBreakdown(
      subtotal: subtotal,
      adminFee: adminFee,
      discount: discount,
      pickupDeliveryFee:
          pickupAndDelivery ? ShopConstants.kPickupDeliveryFee : 0.0,
      total: total,
    );
  }

  /// Apply vehicle type price multiplier.
  static double _applyVehicleMultiplier(double price, VehicleType vehicleType) {
    return _roundToNearestTen(price * vehicleType.priceMultiplier);
  }

  /// Round to nearest 10.
  static double _roundToNearestTen(double value) {
    return (value / ShopConstants.kPriceRoundingFactor).round() *
        ShopConstants.kPriceRoundingFactor;
  }

  /// Validate promo code.
  ///
  /// Note: In production, this should validate against API.
  static bool isValidPromoCode(String code) {
    const validCodes = ['FIRST10', 'SAVE20', 'FLAT100', 'FLAT200'];
    return validCodes.contains(code.toUpperCase());
  }
}

/// Price breakdown model.
///
/// Contains all price components for a booking.
class PriceBreakdown {
  /// Creates a price breakdown.
  const PriceBreakdown({
    required this.subtotal,
    required this.adminFee,
    required this.discount,
    required this.pickupDeliveryFee,
    required this.total,
  });

  /// Subtotal before fees and discounts.
  final double subtotal;

  /// Admin fee amount.
  final double adminFee;

  /// Discount amount.
  final double discount;

  /// Pickup and delivery fee.
  final double pickupDeliveryFee;

  /// Total amount after all calculations.
  final double total;

  /// Format price with currency symbol.
  String formatPrice(double price) => '₹${price.toStringAsFixed(0)}';

  /// Get formatted subtotal.
  String get formattedSubtotal => formatPrice(subtotal);

  /// Get formatted admin fee.
  String get formattedAdminFee => formatPrice(adminFee);

  /// Get formatted discount.
  String get formattedDiscount =>
      discount > 0 ? '-${formatPrice(discount)}' : '₹0';

  /// Get formatted pickup/delivery fee.
  String get formattedPickupDeliveryFee => formatPrice(pickupDeliveryFee);

  /// Get formatted total.
  String get formattedTotal => formatPrice(total);
}
