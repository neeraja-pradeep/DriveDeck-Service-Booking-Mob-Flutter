import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/day_hours.dart';

part 'day_hours_model.freezed.dart';
part 'day_hours_model.g.dart';

/// Model for day hours API response.
@freezed
class DayHoursModel with _$DayHoursModel {
  const DayHoursModel._();

  const factory DayHoursModel({
    @JsonKey(name: 'open_time') required String openTime,
    @JsonKey(name: 'close_time') required String closeTime,
    @JsonKey(name: 'is_closed') @Default(false) bool isClosed,
  }) = _DayHoursModel;

  factory DayHoursModel.fromJson(Map<String, dynamic> json) =>
      _$DayHoursModelFromJson(json);

  /// Converts to domain entity.
  DayHours toDomain() => DayHours(
        openTime: openTime,
        closeTime: closeTime,
        isClosed: isClosed,
      );

  /// Creates from domain entity.
  factory DayHoursModel.fromDomain(DayHours entity) => DayHoursModel(
        openTime: entity.openTime,
        closeTime: entity.closeTime,
        isClosed: entity.isClosed,
      );
}
