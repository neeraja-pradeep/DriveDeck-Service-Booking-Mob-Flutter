import 'package:freezed_annotation/freezed_annotation.dart';

import 'vehicle_type.dart';

part 'booking_request.freezed.dart';

/// Represents a booking request to be sent to the API.
@freezed
class BookingRequest with _$BookingRequest {
  const factory BookingRequest({
    required String shopId,
    required List<String> selectedServices,
    required DateTime date,
    required String timeSlotId,
    required VehicleType vehicleType,
    @Default(false) bool pickupAndDelivery,
    String? promoCode,
    String? paymentMethod,
  }) = _BookingRequest;
}
