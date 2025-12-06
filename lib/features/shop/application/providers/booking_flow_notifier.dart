import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/booking_request.dart';
import '../../domain/entities/booking_summary.dart';
import '../../domain/entities/shop.dart';
import '../../domain/entities/shop_service.dart';
import '../../domain/entities/time_slot.dart';
import '../../domain/entities/vehicle_type.dart';
import '../states/booking_flow_state.dart';

/// Notifier for managing the booking flow state across screens.
class BookingFlowNotifier extends StateNotifier<BookingFlowState> {
  BookingFlowNotifier() : super(BookingFlowState.initial());

  /// Sets the shop.
  void setShop(Shop shop) {
    state = state.copyWith(shop: shop);
  }

  /// Sets the vehicle type.
  void setVehicleType(VehicleType type) {
    state = state.copyWith(vehicleType: type);
  }

  /// Sets the selected services.
  void setSelectedServices(List<ShopService> services) {
    state = state.copyWith(selectedServices: services);
  }

  /// Sets the date and time slot.
  void setDateAndSlot(DateTime date, TimeSlot slot) {
    state = state.copyWith(selectedDate: date, selectedSlot: slot);
  }

  /// Sets the pickup and delivery option.
  void setPickupAndDelivery(bool value) {
    state = state.copyWith(pickupAndDelivery: value);
  }

  /// Sets the promo code.
  void setPromoCode(String? code) {
    state = state.copyWith(promoCode: code);
  }

  /// Sets the payment method.
  void setPaymentMethod(String? method) {
    state = state.copyWith(paymentMethod: method);
  }

  /// Resets the booking flow.
  void reset() {
    state = BookingFlowState.initial();
  }

  /// Converts state to a booking request.
  BookingRequest toBookingRequest() {
    return BookingRequest(
      shopId: state.shop!.id,
      selectedServices: state.selectedServices.map((s) => s.id).toList(),
      date: state.selectedDate!,
      timeSlotId: state.selectedSlot!.id,
      vehicleType: state.vehicleType,
      pickupAndDelivery: state.pickupAndDelivery,
      promoCode: state.promoCode,
      paymentMethod: state.paymentMethod,
    );
  }

  /// Converts state to a booking summary.
  BookingSummary toBookingSummary() {
    return BookingSummary(
      shop: state.shop!,
      services: state.selectedServices,
      date: state.selectedDate!,
      timeSlot: state.selectedSlot!,
      vehicleType: state.vehicleType,
      pickupAndDelivery: state.pickupAndDelivery,
      subtotal: state.subtotal,
      adminFee: state.adminFee,
      discount: 0, // Static for now
      totalPrice: state.total,
    );
  }
}
