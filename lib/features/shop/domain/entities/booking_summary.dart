import 'package:freezed_annotation/freezed_annotation.dart';

import 'shop.dart';
import 'vehicle_type.dart';
import 'booking_request.dart';

part 'booking_summary.freezed.dart';
part 'booking_summary.g.dart';

/// Summary of a booking before confirmation.
@freezed
class BookingSummary with _$BookingSummary {
  const BookingSummary._();

  const factory BookingSummary({
    required int shopId,
    required String shopName,
    required String shopAddress,
    String? shopImageUrl,
    required List<SelectedServiceItem> services,
    required List<SelectedServiceItem> packages,
    required List<SelectedServiceItem> accessories,
    required DateTime date,
    required TimeSlotInfo timeSlot,
    required VehicleType vehicleType,
    @Default(false) bool pickupAndDelivery,
    @Default(0) double subtotal,
    @Default(0) double adminFee,
    @Default(0) double discount,
    String? promoCode,
    String? paymentMethod,
  }) = _BookingSummary;

  factory BookingSummary.fromJson(Map<String, dynamic> json) =>
      _$BookingSummaryFromJson(json);

  /// Calculate total price.
  double get totalPrice => subtotal + adminFee - discount;

  /// Get all selected items count.
  int get totalItemsCount =>
      services.length + packages.length + accessories.length;

  /// Check if pickup and delivery fee applies.
  double get pickupDeliveryFee => pickupAndDelivery ? 200.0 : 0.0;

  /// Get final total including pickup/delivery.
  double get finalTotal => totalPrice + pickupDeliveryFee;

  /// Format price with currency.
  String formatPrice(double price) => '₹${price.toStringAsFixed(0)}';

  /// Get formatted date.
  String get formattedDate {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}

/// Selected service/package/accessory item.
@freezed
class SelectedServiceItem with _$SelectedServiceItem {
  const factory SelectedServiceItem({
    required String id,
    required String name,
    required double price,
    String? description,
  }) = _SelectedServiceItem;

  factory SelectedServiceItem.fromJson(Map<String, dynamic> json) =>
      _$SelectedServiceItemFromJson(json);
}
