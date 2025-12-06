import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/booking_date.dart';
import 'time_slot_model.dart';

part 'booking_date_model.freezed.dart';
part 'booking_date_model.g.dart';

/// Model for booking date API response.
@freezed
class BookingDateModel with _$BookingDateModel {
  const BookingDateModel._();

  const factory BookingDateModel({
    required String date,
    @Default([]) List<TimeSlotModel> slots,
  }) = _BookingDateModel;

  factory BookingDateModel.fromJson(Map<String, dynamic> json) =>
      _$BookingDateModelFromJson(json);

  /// Converts to domain entity.
  BookingDate toDomain() => BookingDate(
        date: DateTime.parse(date),
        slots: slots.map((s) => s.toDomain()).toList(),
      );
}
