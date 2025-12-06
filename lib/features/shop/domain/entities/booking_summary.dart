import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import 'shop.dart';
import 'shop_service.dart';
import 'time_slot.dart';
import 'vehicle_type.dart';

part 'booking_summary.freezed.dart';

/// Represents a summary of the booking before confirmation.
@freezed
class BookingSummary with _$BookingSummary {
  const BookingSummary._();

  const factory BookingSummary({
    required Shop shop,
    required List<ShopService> services,
    required DateTime date,
    required TimeSlot timeSlot,
    required VehicleType vehicleType,
    @Default(false) bool pickupAndDelivery,
    required double subtotal,
    required double adminFee,
    @Default(0) double discount,
    required double totalPrice,
  }) = _BookingSummary;

  /// Returns the formatted date (e.g., "14 Nov 2024").
  String get formattedDate => DateFormat('d MMM yyyy').format(date);

  /// Returns the formatted time slot.
  String get formattedTimeSlot => timeSlot.displayTime;

  /// Returns the service names as a comma-separated string.
  String get serviceNames => services.map((s) => s.name).join(', ');

  /// Returns the formatted subtotal.
  String get formattedSubtotal => '\u20B9${subtotal.toStringAsFixed(2)}';

  /// Returns the formatted admin fee.
  String get formattedAdminFee => '\u20B9${adminFee.toStringAsFixed(2)}';

  /// Returns the formatted discount.
  String get formattedDiscount => '-\u20B9${discount.toStringAsFixed(2)}';

  /// Returns the formatted total price.
  String get formattedTotalPrice => '\u20B9${totalPrice.toStringAsFixed(2)}';
}
