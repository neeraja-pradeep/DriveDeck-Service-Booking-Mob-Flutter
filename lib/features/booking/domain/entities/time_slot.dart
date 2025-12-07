import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_slot.freezed.dart';
part 'time_slot.g.dart';

/// Represents an available time slot for booking.
@freezed
class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    required String id,
    required String time,
    required String displayTime,
    @Default(true) bool isAvailable,
    @Default(false) bool isSelected,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
}

/// Represents a booking date with available slots.
@freezed
class BookingDate with _$BookingDate {
  const factory BookingDate({
    required DateTime date,
    required List<TimeSlot> timeSlots,
    @Default(true) bool isAvailable,
  }) = _BookingDate;

  factory BookingDate.fromJson(Map<String, dynamic> json) =>
      _$BookingDateFromJson(json);
}
