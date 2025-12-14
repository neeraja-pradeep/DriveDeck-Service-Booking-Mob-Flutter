// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'vehicle_type.dart';

part 'booking_request.freezed.dart';
part 'booking_request.g.dart';

/// Request payload for creating a booking.
@freezed
class BookingRequest with _$BookingRequest {
  const factory BookingRequest({
    /// Shop identifier (snake_case for API).
    @JsonKey(name: 'shop_id') required int shopId,

    /// Authenticated user identifier (must be in body, not just header).
    @JsonKey(name: 'user_id') required int userId,

    /// Selected items.
    @JsonKey(name: 'selected_service_ids')
    required List<String> selectedServiceIds,
    @JsonKey(name: 'selected_package_ids')
    required List<String> selectedPackageIds,
    @JsonKey(name: 'selected_accessory_ids')
    required List<String> selectedAccessoryIds,

    /// Date to book (API expects yyyy-MM-dd) under appointment_date.
    @JsonKey(
      name: 'appointment_date',
      toJson: _dateOnly,
      fromJson: _dateFromJson,
    )
    required DateTime appointmentDate,

    /// Required service reference (backend expects singular service_id).
    @JsonKey(name: 'service_id') required int serviceId,

    /// Slot identifier expected as start_slot by backend.
    @JsonKey(name: 'start_slot') required int timeSlotId,

    @JsonKey(name: 'vehicle_type') required VehicleType vehicleType,
    @JsonKey(name: 'pick_up') @Default(false) bool pickupAndDelivery,
    @JsonKey(name: 'promo_code') String? promoCode,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    @JsonKey(name: 'vehicle_id') String? vehicleId,
    @JsonKey(name: 'notes') String? notes,

    /// Pricing and duration metadata.
    @JsonKey(name: 'duration_in_blocks') required int durationInBlocks,
    @JsonKey(name: 'amount') required double amount,

    /// Booking status (e.g., pending/confirmed).
    @JsonKey(name: 'status') @Default('pending') String status,
  }) = _BookingRequest;

  factory BookingRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingRequestFromJson(json);
}

/// Convert ISO string back to DateTime.
DateTime _dateFromJson(String value) => DateTime.parse(value);

/// API wants only the date portion (yyyy-MM-dd).
String _dateOnly(DateTime date) => date.toIso8601String().split('T').first;

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
