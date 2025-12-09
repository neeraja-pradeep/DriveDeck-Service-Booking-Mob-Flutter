import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/shop.dart';
import '../../domain/entities/shop_service.dart';
import '../../domain/entities/time_slot.dart';
import '../../domain/entities/vehicle_type.dart';

part 'booking_flow_state.freezed.dart';

/// State that persists across the booking flow screens.
@freezed
class BookingFlowState with _$BookingFlowState {
  const BookingFlowState._();

  const factory BookingFlowState({
    Shop? shop,
    required List<ShopService> selectedServices,
    required VehicleType vehicleType,
    DateTime? selectedDate,
    TimeSlot? selectedSlot,
    required bool pickupAndDelivery,
    String? promoCode,
    String? paymentMethod,
  }) = _BookingFlowState;

  factory BookingFlowState.initial() => const BookingFlowState(
        shop: null,
        selectedServices: [],
        vehicleType: VehicleType.sedan,
        selectedDate: null,
        selectedSlot: null,
        pickupAndDelivery: false,
        promoCode: null,
        paymentMethod: null,
      );

  /// Checks if user can proceed to date/time selection.
  bool get canProceedToDateTime => shop != null && selectedServices.isNotEmpty;

  /// Checks if user can proceed to checkout.
  bool get canProceedToCheckout => selectedDate != null && selectedSlot != null;

  /// Calculates the subtotal of selected services.
  double get subtotal =>
      selectedServices.fold(0, (sum, s) => sum + s.price);

  /// Returns the admin fee (static for now).
  double get adminFee => 25.0;

  /// Calculates the total price.
  double get total => subtotal + adminFee;

  /// Returns the formatted subtotal.
  String get formattedSubtotal => '\u20B9${subtotal.toStringAsFixed(2)}';

  /// Returns the formatted admin fee.
  String get formattedAdminFee => '\u20B9${adminFee.toStringAsFixed(2)}';

  /// Returns the formatted total.
  String get formattedTotal => '\u20B9${total.toStringAsFixed(2)}';
}
