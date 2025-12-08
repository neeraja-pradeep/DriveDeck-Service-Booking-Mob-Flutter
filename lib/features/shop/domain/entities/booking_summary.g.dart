// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingSummaryImpl _$$BookingSummaryImplFromJson(Map<String, dynamic> json) =>
    _$BookingSummaryImpl(
      shopId: (json['shopId'] as num).toInt(),
      shopName: json['shopName'] as String,
      shopAddress: json['shopAddress'] as String,
      shopImageUrl: json['shopImageUrl'] as String?,
      services: (json['services'] as List<dynamic>)
          .map((e) => SelectedServiceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      packages: (json['packages'] as List<dynamic>)
          .map((e) => SelectedServiceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessories: (json['accessories'] as List<dynamic>)
          .map((e) => SelectedServiceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: DateTime.parse(json['date'] as String),
      timeSlot: TimeSlotInfo.fromJson(json['timeSlot'] as Map<String, dynamic>),
      vehicleType: $enumDecode(_$VehicleTypeEnumMap, json['vehicleType']),
      pickupAndDelivery: json['pickupAndDelivery'] as bool? ?? false,
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
      adminFee: (json['adminFee'] as num?)?.toDouble() ?? 0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      promoCode: json['promoCode'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
    );

Map<String, dynamic> _$$BookingSummaryImplToJson(
        _$BookingSummaryImpl instance) =>
    <String, dynamic>{
      'shopId': instance.shopId,
      'shopName': instance.shopName,
      'shopAddress': instance.shopAddress,
      'shopImageUrl': instance.shopImageUrl,
      'services': instance.services.map((e) => e.toJson()).toList(),
      'packages': instance.packages.map((e) => e.toJson()).toList(),
      'accessories': instance.accessories.map((e) => e.toJson()).toList(),
      'date': instance.date.toIso8601String(),
      'timeSlot': instance.timeSlot.toJson(),
      'vehicleType': _$VehicleTypeEnumMap[instance.vehicleType]!,
      'pickupAndDelivery': instance.pickupAndDelivery,
      'subtotal': instance.subtotal,
      'adminFee': instance.adminFee,
      'discount': instance.discount,
      'promoCode': instance.promoCode,
      'paymentMethod': instance.paymentMethod,
    };

const _$VehicleTypeEnumMap = {
  VehicleType.hatchback: 'hatchback',
  VehicleType.sedan: 'sedan',
  VehicleType.suv: 'suv',
  VehicleType.muv: 'muv',
  VehicleType.luxury: 'luxury',
};

_$SelectedServiceItemImpl _$$SelectedServiceItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectedServiceItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SelectedServiceItemImplToJson(
        _$SelectedServiceItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
    };
