import 'package:freezed_annotation/freezed_annotation.dart';

import 'time_slot.dart';

part 'booking_date.freezed.dart';

/// Represents available time slots for a specific date.
@freezed
class BookingDate with _$BookingDate {
  const BookingDate._();

  const factory BookingDate({
    required DateTime date,
    required List<TimeSlot> slots,
  }) = _BookingDate;

  /// Checks if there are any available slots.
  bool get hasAvailableSlots => slots.any((slot) => slot.isAvailable);

  /// Returns only the available slots.
  List<TimeSlot> get availableSlots =>
      slots.where((slot) => slot.isAvailable).toList();

  /// Returns the count of available slots.
  int get availableSlotsCount => availableSlots.length;
}
