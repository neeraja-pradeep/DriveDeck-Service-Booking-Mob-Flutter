import '../../domain/entities/booking_time_slot.dart';

/// JSON-serializable model for [BookingTimeSlot].
///
/// Used for API communication and local storage.
class BookingTimeSlotModel {
  /// Creates a new [BookingTimeSlotModel] instance.
  const BookingTimeSlotModel({
    required this.startTime,
    required this.endTime,
  });

  /// Creates a [BookingTimeSlotModel] from JSON map.
  factory BookingTimeSlotModel.fromJson(Map<String, dynamic> json) {
    return BookingTimeSlotModel(
      startTime: json['start_time'] as String? ?? '',
      endTime: json['end_time'] as String? ?? '',
    );
  }

  /// Creates a [BookingTimeSlotModel] from domain entity.
  factory BookingTimeSlotModel.fromDomain(BookingTimeSlot entity) {
    return BookingTimeSlotModel(
      startTime: entity.startTime,
      endTime: entity.endTime,
    );
  }

  /// The start time of the slot.
  final String startTime;

  /// The end time of the slot.
  final String endTime;

  /// Converts this model to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'start_time': startTime,
      'end_time': endTime,
    };
  }

  /// Converts this model to a domain entity.
  BookingTimeSlot toDomain() {
    return BookingTimeSlot(
      startTime: startTime,
      endTime: endTime,
    );
  }

  /// Creates a copy of this model with the given fields replaced.
  BookingTimeSlotModel copyWith({
    String? startTime,
    String? endTime,
  }) {
    return BookingTimeSlotModel(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
