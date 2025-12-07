// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeSlotImpl _$$TimeSlotImplFromJson(Map<String, dynamic> json) =>
    _$TimeSlotImpl(
      id: json['id'] as String,
      time: json['time'] as String,
      displayTime: json['displayTime'] as String,
      isAvailable: json['isAvailable'] as bool? ?? true,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$TimeSlotImplToJson(_$TimeSlotImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'displayTime': instance.displayTime,
      'isAvailable': instance.isAvailable,
      'isSelected': instance.isSelected,
    };

_$BookingDateImpl _$$BookingDateImplFromJson(Map<String, dynamic> json) =>
    _$BookingDateImpl(
      date: DateTime.parse(json['date'] as String),
      timeSlots: (json['timeSlots'] as List<dynamic>)
          .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      isAvailable: json['isAvailable'] as bool? ?? true,
    );

Map<String, dynamic> _$$BookingDateImplToJson(_$BookingDateImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'timeSlots': instance.timeSlots,
      'isAvailable': instance.isAvailable,
    };
