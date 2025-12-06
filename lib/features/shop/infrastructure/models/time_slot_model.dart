import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/time_slot.dart';

part 'time_slot_model.freezed.dart';
part 'time_slot_model.g.dart';

/// Model for time slot API response.
@freezed
class TimeSlotModel with _$TimeSlotModel {
  const TimeSlotModel._();

  const factory TimeSlotModel({
    required String id,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
  }) = _TimeSlotModel;

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotModelFromJson(json);

  /// Converts to domain entity.
  TimeSlot toDomain() => TimeSlot(
        id: id,
        startTime: startTime,
        endTime: endTime,
        isAvailable: isAvailable,
      );
}
