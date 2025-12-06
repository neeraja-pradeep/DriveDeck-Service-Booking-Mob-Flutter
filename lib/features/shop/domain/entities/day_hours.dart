import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_hours.freezed.dart';

/// Represents the opening and closing hours for a specific day.
@freezed
class DayHours with _$DayHours {
  const DayHours._();

  const factory DayHours({
    required String openTime,
    required String closeTime,
    @Default(false) bool isClosed,
  }) = _DayHours;

  /// Returns formatted hours string (e.g., "9:00 AM - 6:00 PM" or "Closed").
  String get formatted {
    if (isClosed) return 'Closed';

    final openFormatted = _formatTime(openTime);
    final closeFormatted = _formatTime(closeTime);

    return '$openFormatted - $closeFormatted';
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
