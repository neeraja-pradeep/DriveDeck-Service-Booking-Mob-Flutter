import 'package:equatable/equatable.dart';

/// Represents a time slot for a booking.
///
/// Contains the start and end times for the scheduled service.
class BookingTimeSlot extends Equatable {
  /// Creates a new [BookingTimeSlot] instance.
  const BookingTimeSlot({
    required this.startTime,
    required this.endTime,
  });

  /// The start time of the slot (e.g., "10:00").
  final String startTime;

  /// The end time of the slot (e.g., "11:00").
  final String endTime;

  /// Returns a formatted display string for the time slot.
  ///
  /// Example: "10:00 AM - 11:00 AM"
  String get displayTime {
    final formattedStart = _formatTime(startTime);
    final formattedEnd = _formatTime(endTime);
    return '$formattedStart - $formattedEnd';
  }

  /// Formats a time string to include AM/PM.
  String _formatTime(String time) {
    if (time.contains('AM') || time.contains('PM')) {
      return time;
    }

    final parts = time.split(':');
    if (parts.length < 2) return time;

    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = parts[1];
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

    return '$displayHour:$minute $period';
  }

  /// Creates a copy of this [BookingTimeSlot] with the given fields replaced.
  BookingTimeSlot copyWith({
    String? startTime,
    String? endTime,
  }) {
    return BookingTimeSlot(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  List<Object?> get props => [startTime, endTime];
}
