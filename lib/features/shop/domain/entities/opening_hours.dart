import 'package:freezed_annotation/freezed_annotation.dart';

part 'opening_hours.freezed.dart';
part 'opening_hours.g.dart';

/// Opening hours for a shop across the week.
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

  factory OpeningHours.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursFromJson(json);

  /// Get hours for today.
  DayHours getTodayHours() {
    final now = DateTime.now();
    switch (now.weekday) {
      case DateTime.monday:
        return monday;
      case DateTime.tuesday:
        return tuesday;
      case DateTime.wednesday:
        return wednesday;
      case DateTime.thursday:
        return thursday;
      case DateTime.friday:
        return friday;
      case DateTime.saturday:
        return saturday;
      case DateTime.sunday:
        return sunday;
      default:
        return monday;
    }
  }

  /// Check if shop is currently open.
  bool isOpenNow() {
    final todayHours = getTodayHours();
    if (todayHours.isClosed) return false;

    final now = DateTime.now();
    final currentMinutes = now.hour * 60 + now.minute;

    final openParts = todayHours.openTime.split(':');
    final closeParts = todayHours.closeTime.split(':');

    final openMinutes =
        int.parse(openParts[0]) * 60 + int.parse(openParts[1]);
    final closeMinutes =
        int.parse(closeParts[0]) * 60 + int.parse(closeParts[1]);

    return currentMinutes >= openMinutes && currentMinutes <= closeMinutes;
  }

  /// Get hours for a specific day of week (1=Monday, 7=Sunday).
  DayHours getHoursForDay(int dayOfWeek) {
    switch (dayOfWeek) {
      case DateTime.monday:
        return monday;
      case DateTime.tuesday:
        return tuesday;
      case DateTime.wednesday:
        return wednesday;
      case DateTime.thursday:
        return thursday;
      case DateTime.friday:
        return friday;
      case DateTime.saturday:
        return saturday;
      case DateTime.sunday:
        return sunday;
      default:
        return monday;
    }
  }
}

/// Hours for a single day.
@freezed
class DayHours with _$DayHours {
  const DayHours._();

  const factory DayHours({
    required String openTime,
    required String closeTime,
    @Default(false) bool isClosed,
  }) = _DayHours;

  factory DayHours.fromJson(Map<String, dynamic> json) =>
      _$DayHoursFromJson(json);

  /// Get formatted hours string (e.g., "9:00 AM - 6:00 PM").
  String get formatted {
    if (isClosed) return 'Closed';
    return '$openTime - $closeTime';
  }

  /// Create closed day hours.
  factory DayHours.closed() => const DayHours(
        openTime: '',
        closeTime: '',
        isClosed: true,
      );
}
