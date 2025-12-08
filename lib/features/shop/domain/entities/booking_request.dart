import 'package:freezed_annotation/freezed_annotation.dart';

import 'vehicle_type.dart';

part 'booking_request.freezed.dart';
part 'booking_request.g.dart';

/// Request payload for creating a booking.
@freezed
class BookingRequest with _$BookingRequest {
  const factory BookingRequest({
    required int shopId,
    required List<String> selectedServiceIds,
    required List<String> selectedPackageIds,
    required List<String> selectedAccessoryIds,
    required DateTime date,
    required int timeSlotId,
    required VehicleType vehicleType,
    @Default(false) bool pickupAndDelivery,
    String? promoCode,
    String? paymentMethod,
    String? vehicleId,
    String? notes,
  }) = _BookingRequest;

  factory BookingRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingRequestFromJson(json);
}

/// Booking date with available time slots.
@freezed
class BookingDate with _$BookingDate {
  const BookingDate._();

  const factory BookingDate({
    required DateTime date,
    required List<TimeSlotInfo> slots,
  }) = _BookingDate;

  factory BookingDate.fromJson(Map<String, dynamic> json) =>
      _$BookingDateFromJson(json);

  /// Check if any slots are available.
  bool get hasAvailableSlots => slots.any((slot) => slot.isAvailable);

  /// Get available slots count.
  int get availableSlotsCount =>
      slots.where((slot) => slot.isAvailable).length;
}

/// Time slot information.
@freezed
class TimeSlotInfo with _$TimeSlotInfo {
  const TimeSlotInfo._();

  const factory TimeSlotInfo({
    required int id,
    required String startTime,
    required String endTime,
    required bool isAvailable,
    int? availableCapacity,
  }) = _TimeSlotInfo;

  factory TimeSlotInfo.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotInfoFromJson(json);

  /// Get formatted display time (e.g., "9:00 AM - 10:00 AM").
  String get displayTime => '$startTime - $endTime';
}
