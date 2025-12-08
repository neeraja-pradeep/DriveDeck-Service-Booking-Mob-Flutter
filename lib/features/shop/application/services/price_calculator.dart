import '../../domain/entities/shop.dart';
import '../../domain/entities/vehicle_type.dart';

/// Service for calculating booking prices.
class PriceCalculator {
  /// Admin fee percentage.
  static const double adminFeePercentage = 0.05; // 5%

  /// Pickup and delivery fee.
  static const double pickupDeliveryFee = 200.0;

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
    // Accessories don't have vehicle multiplier
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
    return _roundToNearestTen(subtotal * adminFeePercentage);
  }

  /// Calculate discount from promo code.
  static double calculateDiscount({
    required double subtotal,
    required String? promoCode,
  }) {
    if (promoCode == null || promoCode.isEmpty) return 0.0;

    // Mock promo code discounts
    switch (promoCode.toUpperCase()) {
      case 'FIRST10':
        return _roundToNearestTen(subtotal * 0.10); // 10% off
      case 'SAVE20':
        return _roundToNearestTen(subtotal * 0.20); // 20% off
      case 'FLAT100':
        return 100.0; // Flat ₹100 off
      case 'FLAT200':
        return 200.0; // Flat ₹200 off
      default:
        return 0.0;
    }
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
      return total + pickupDeliveryFee;
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
      pickupDeliveryFee: pickupAndDelivery ? pickupDeliveryFee : 0.0,
      total: total,
    );
  }

  /// Apply vehicle type price multiplier.
  static double _applyVehicleMultiplier(double price, VehicleType vehicleType) {
    return _roundToNearestTen(price * vehicleType.priceMultiplier);
  }

  /// Round to nearest 10.
  static double _roundToNearestTen(double value) {
    return (value / 10).round() * 10.0;
  }

  /// Validate promo code.
  static bool isValidPromoCode(String code) {
    final validCodes = ['FIRST10', 'SAVE20', 'FLAT100', 'FLAT200'];
    return validCodes.contains(code.toUpperCase());
  }
}

/// Price breakdown model.
class PriceBreakdown {
  const PriceBreakdown({
    required this.subtotal,
    required this.adminFee,
    required this.discount,
    required this.pickupDeliveryFee,
    required this.total,
  });

  final double subtotal;
  final double adminFee;
  final double discount;
  final double pickupDeliveryFee;
  final double total;

  /// Format price with currency symbol.
  String formatPrice(double price) => '₹${price.toStringAsFixed(0)}';

  /// Get formatted subtotal.
  String get formattedSubtotal => formatPrice(subtotal);

  /// Get formatted admin fee.
  String get formattedAdminFee => formatPrice(adminFee);

  /// Get formatted discount.
  String get formattedDiscount => discount > 0 ? '-${formatPrice(discount)}' : '₹0';

  /// Get formatted pickup/delivery fee.
  String get formattedPickupDeliveryFee => formatPrice(pickupDeliveryFee);

  /// Get formatted total.
  String get formattedTotal => formatPrice(total);
}
