import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_slot.freezed.dart';

/// Represents a time slot for booking.
@freezed
class TimeSlot with _$TimeSlot {
  const TimeSlot._();

  const factory TimeSlot({
    required String id,
    required String startTime,
    required String endTime,
    @Default(true) bool isAvailable,
  }) = _TimeSlot;

  /// Returns the formatted display time (e.g., "10:00 AM").
  String get displayTime {
    return _formatTime(startTime);
  }

  /// Returns the full time range display (e.g., "10:00 AM - 11:00 AM").
  String get displayTimeRange {
    return '${_formatTime(startTime)} - ${_formatTime(endTime)}';
  }

  /// Formats a time string from 24h to 12h format.
  String _formatTime(String time) {
    final parts = time.split(':');
    if (parts.length < 2) return time;

    var hour = int.tryParse(parts[0]) ?? 0;
    final minute = parts[1];
    final period = hour >= 12 ? 'PM' : 'AM';

    if (hour > 12) hour -= 12;
    if (hour == 0) hour = 12;

    return '$hour:$minute $period';
  }
}
