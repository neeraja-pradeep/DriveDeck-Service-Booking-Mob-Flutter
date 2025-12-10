// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingRequestImpl _$$BookingRequestImplFromJson(Map<String, dynamic> json) =>
    _$BookingRequestImpl(
      shopId: (json['shop_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      selectedServiceIds: (json['selected_service_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      selectedPackageIds: (json['selected_package_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      selectedAccessoryIds: (json['selected_accessory_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      appointmentDate: _dateFromJson(json['appointment_date'] as String),
      serviceId: (json['service_id'] as num).toInt(),
      timeSlotId: (json['start_slot'] as num).toInt(),
      vehicleType: $enumDecode(_$VehicleTypeEnumMap, json['vehicle_type']),
      pickupAndDelivery: json['pickup_and_delivery'] as bool? ?? false,
      promoCode: json['promo_code'] as String?,
      paymentMethod: json['payment_method'] as String?,
      vehicleId: json['vehicle_id'] as String?,
      notes: json['notes'] as String?,
      durationInBlocks: (json['duration_in_blocks'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String? ?? 'pending',
    );

Map<String, dynamic> _$$BookingRequestImplToJson(
        _$BookingRequestImpl instance) =>
    <String, dynamic>{
      'shop_id': instance.shopId,
      'user_id': instance.userId,
      'selected_service_ids': instance.selectedServiceIds,
      'selected_package_ids': instance.selectedPackageIds,
      'selected_accessory_ids': instance.selectedAccessoryIds,
      'appointment_date': _dateOnly(instance.appointmentDate),
      'service_id': instance.serviceId,
      'start_slot': instance.timeSlotId,
      'vehicle_type': _$VehicleTypeEnumMap[instance.vehicleType]!,
      'pickup_and_delivery': instance.pickupAndDelivery,
      'promo_code': instance.promoCode,
      'payment_method': instance.paymentMethod,
      'vehicle_id': instance.vehicleId,
      'notes': instance.notes,
      'duration_in_blocks': instance.durationInBlocks,
      'amount': instance.amount,
      'status': instance.status,
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
      'slots': instance.slots,
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
