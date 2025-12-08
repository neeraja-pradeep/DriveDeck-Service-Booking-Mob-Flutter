// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingRequestImpl _$$BookingRequestImplFromJson(Map<String, dynamic> json) =>
    _$BookingRequestImpl(
      shopId: (json['shopId'] as num).toInt(),
      selectedServiceIds: (json['selectedServiceIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      selectedPackageIds: (json['selectedPackageIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      selectedAccessoryIds: (json['selectedAccessoryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      date: DateTime.parse(json['date'] as String),
      timeSlotId: (json['timeSlotId'] as num).toInt(),
      vehicleType: $enumDecode(_$VehicleTypeEnumMap, json['vehicleType']),
      pickupAndDelivery: json['pickupAndDelivery'] as bool? ?? false,
      promoCode: json['promoCode'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      vehicleId: json['vehicleId'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$BookingRequestImplToJson(
        _$BookingRequestImpl instance) =>
    <String, dynamic>{
      'shopId': instance.shopId,
      'selectedServiceIds': instance.selectedServiceIds,
      'selectedPackageIds': instance.selectedPackageIds,
      'selectedAccessoryIds': instance.selectedAccessoryIds,
      'date': instance.date.toIso8601String(),
      'timeSlotId': instance.timeSlotId,
      'vehicleType': _$VehicleTypeEnumMap[instance.vehicleType]!,
      'pickupAndDelivery': instance.pickupAndDelivery,
      'promoCode': instance.promoCode,
      'paymentMethod': instance.paymentMethod,
      'vehicleId': instance.vehicleId,
      'notes': instance.notes,
    };

const _$VehicleTypeEnumMap = {
  VehicleType.hatchback: 'hatchback',
  VehicleType.sedan: 'sedan',
  VehicleType.suv: 'suv',
  VehicleType.muv: 'muv',
  VehicleType.luxury: 'luxury',
};

_$BookingDateImpl _$$BookingDateImplFromJson(Map<String, dynamic> json) =>
    _$BookingDateImpl(
      date: DateTime.parse(json['date'] as String),
      slots: (json['slots'] as List<dynamic>)
          .map((e) => TimeSlotInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookingDateImplToJson(_$BookingDateImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'slots': instance.slots.map((e) => e.toJson()).toList(),
    };

_$TimeSlotInfoImpl _$$TimeSlotInfoImplFromJson(Map<String, dynamic> json) =>
    _$TimeSlotInfoImpl(
      id: (json['id'] as num).toInt(),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      isAvailable: json['isAvailable'] as bool,
      availableCapacity: (json['availableCapacity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TimeSlotInfoImplToJson(_$TimeSlotInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'isAvailable': instance.isAvailable,
      'availableCapacity': instance.availableCapacity,
    };
