import 'package:freezed_annotation/freezed_annotation.dart';

import 'day_hours.dart';

part 'opening_hours.freezed.dart';

/// Represents the opening hours for all days of the week.
@freezed
class OpeningHours with _$OpeningHours {
  const OpeningHours._();

  const factory OpeningHours({
    required DayHours monday,
    required DayHours tuesday,
    required DayHours wednesday,
    required DayHours thursday,
    required DayHours friday,
    required DayHours saturday,
    required DayHours sunday,
  }) = _OpeningHours;

  /// Gets today's opening hours.
  String getTodayHours() {
    final today = DateTime.now().weekday;
    final hours = _getHoursForDay(today);
    return hours.formatted;
  }

  /// Checks if the shop is currently open.
  bool isOpenNow() {
    final now = DateTime.now();
    final hours = _getHoursForDay(now.weekday);

    if (hours.isClosed) return false;

    final currentTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    return currentTime.compareTo(hours.openTime) >= 0 &&
        currentTime.compareTo(hours.closeTime) <= 0;
  }

  /// Gets the hours for a specific day of the week.
  DayHours _getHoursForDay(int weekday) {
    return switch (weekday) {
      1 => monday,
      2 => tuesday,
      3 => wednesday,
      4 => thursday,
      5 => friday,
      6 => saturday,
      7 => sunday,
      _ => monday,
    };
  }

  /// Returns a list of all days with their hours.
  List<MapEntry<String, DayHours>> get allDays => [
        MapEntry('Monday', monday),
        MapEntry('Tuesday', tuesday),
        MapEntry('Wednesday', wednesday),
        MapEntry('Thursday', thursday),
        MapEntry('Friday', friday),
        MapEntry('Saturday', saturday),
        MapEntry('Sunday', sunday),
      ];
}
