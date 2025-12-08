// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpeningHoursImpl _$$OpeningHoursImplFromJson(Map<String, dynamic> json) =>
    _$OpeningHoursImpl(
      monday: DayHours.fromJson(json['monday'] as Map<String, dynamic>),
      tuesday: DayHours.fromJson(json['tuesday'] as Map<String, dynamic>),
      wednesday: DayHours.fromJson(json['wednesday'] as Map<String, dynamic>),
      thursday: DayHours.fromJson(json['thursday'] as Map<String, dynamic>),
      friday: DayHours.fromJson(json['friday'] as Map<String, dynamic>),
      saturday: DayHours.fromJson(json['saturday'] as Map<String, dynamic>),
      sunday: DayHours.fromJson(json['sunday'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OpeningHoursImplToJson(_$OpeningHoursImpl instance) =>
    <String, dynamic>{
      'monday': instance.monday.toJson(),
      'tuesday': instance.tuesday.toJson(),
      'wednesday': instance.wednesday.toJson(),
      'thursday': instance.thursday.toJson(),
      'friday': instance.friday.toJson(),
      'saturday': instance.saturday.toJson(),
      'sunday': instance.sunday.toJson(),
    };

_$DayHoursImpl _$$DayHoursImplFromJson(Map<String, dynamic> json) =>
    _$DayHoursImpl(
      openTime: json['openTime'] as String,
      closeTime: json['closeTime'] as String,
      isClosed: json['isClosed'] as bool? ?? false,
    );

Map<String, dynamic> _$$DayHoursImplToJson(_$DayHoursImpl instance) =>
    <String, dynamic>{
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'isClosed': instance.isClosed,
    };
