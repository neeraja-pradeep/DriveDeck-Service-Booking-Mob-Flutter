import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/day_hours.dart';
import '../../domain/entities/opening_hours.dart';
import 'day_hours_model.dart';

part 'opening_hours_model.freezed.dart';
part 'opening_hours_model.g.dart';

/// Model for opening hours API response.
@freezed
class OpeningHoursModel with _$OpeningHoursModel {
  const OpeningHoursModel._();

  const factory OpeningHoursModel({
    required DayHoursModel monday,
    required DayHoursModel tuesday,
    required DayHoursModel wednesday,
    required DayHoursModel thursday,
    required DayHoursModel friday,
    required DayHoursModel saturday,
    required DayHoursModel sunday,
  }) = _OpeningHoursModel;

  factory OpeningHoursModel.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursModelFromJson(json);

  /// Converts to domain entity.
  OpeningHours toDomain() => OpeningHours(
        monday: monday.toDomain(),
        tuesday: tuesday.toDomain(),
        wednesday: wednesday.toDomain(),
        thursday: thursday.toDomain(),
        friday: friday.toDomain(),
        saturday: saturday.toDomain(),
        sunday: sunday.toDomain(),
      );

  /// Creates from domain entity.
  factory OpeningHoursModel.fromDomain(OpeningHours entity) => OpeningHoursModel(
        monday: DayHoursModel.fromDomain(entity.monday),
        tuesday: DayHoursModel.fromDomain(entity.tuesday),
        wednesday: DayHoursModel.fromDomain(entity.wednesday),
        thursday: DayHoursModel.fromDomain(entity.thursday),
        friday: DayHoursModel.fromDomain(entity.friday),
        saturday: DayHoursModel.fromDomain(entity.saturday),
        sunday: DayHoursModel.fromDomain(entity.sunday),
      );

  /// Creates a default model with all days open from 9 AM to 6 PM.
  factory OpeningHoursModel.defaultHours() {
    const defaultDay = DayHoursModel(
      openTime: '09:00',
      closeTime: '18:00',
      isClosed: false,
    );
    return OpeningHoursModel(
      monday: defaultDay,
      tuesday: defaultDay,
      wednesday: defaultDay,
      thursday: defaultDay,
      friday: defaultDay,
      saturday: defaultDay,
      sunday: const DayHoursModel(
        openTime: '09:00',
        closeTime: '18:00',
        isClosed: true,
      ),
    );
  }
}
