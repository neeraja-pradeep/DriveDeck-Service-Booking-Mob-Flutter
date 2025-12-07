// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingDataImpl _$$BookingDataImplFromJson(Map<String, dynamic> json) =>
    _$BookingDataImpl(
      shopId: json['shopId'] as String,
      shopName: json['shopName'] as String,
      shopImageUrl: json['shopImageUrl'] as String,
      shopAddress: json['shopAddress'] as String,
      shopRating: (json['shopRating'] as num).toDouble(),
      selectedServices: (json['selectedServices'] as List<dynamic>?)
              ?.map((e) => SelectedItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectedPackages: (json['selectedPackages'] as List<dynamic>?)
              ?.map((e) => SelectedItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectedAccessories: (json['selectedAccessories'] as List<dynamic>?)
              ?.map((e) => SelectedItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      vehicleType: json['vehicleType'] as String?,
      vehicleId: json['vehicleId'] as String?,
      selectedDate: json['selectedDate'] == null
          ? null
          : DateTime.parse(json['selectedDate'] as String),
      selectedTimeSlot: json['selectedTimeSlot'] as String?,
      selectedTimeSlotId: json['selectedTimeSlotId'] as String?,
      pickupAndDelivery: json['pickupAndDelivery'] as bool? ?? false,
      phoneNumber: json['phoneNumber'] as String?,
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0.0,
      adminFee: (json['adminFee'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      promoCode: json['promoCode'] as String?,
    );

Map<String, dynamic> _$$BookingDataImplToJson(_$BookingDataImpl instance) =>
    <String, dynamic>{
      'shopId': instance.shopId,
      'shopName': instance.shopName,
      'shopImageUrl': instance.shopImageUrl,
      'shopAddress': instance.shopAddress,
      'shopRating': instance.shopRating,
      'selectedServices': instance.selectedServices,
      'selectedPackages': instance.selectedPackages,
      'selectedAccessories': instance.selectedAccessories,
      'vehicleType': instance.vehicleType,
      'vehicleId': instance.vehicleId,
      'selectedDate': instance.selectedDate?.toIso8601String(),
      'selectedTimeSlot': instance.selectedTimeSlot,
      'selectedTimeSlotId': instance.selectedTimeSlotId,
      'pickupAndDelivery': instance.pickupAndDelivery,
      'phoneNumber': instance.phoneNumber,
      'subtotal': instance.subtotal,
      'adminFee': instance.adminFee,
      'discount': instance.discount,
      'promoCode': instance.promoCode,
    };

_$SelectedItemImpl _$$SelectedItemImplFromJson(Map<String, dynamic> json) =>
    _$SelectedItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SelectedItemImplToJson(_$SelectedItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
    };
