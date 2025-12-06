import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/booking_request.dart';
import '../../domain/entities/vehicle_type.dart';

part 'booking_request_model.freezed.dart';
part 'booking_request_model.g.dart';

/// Model for booking request to API.
@freezed
class BookingRequestModel with _$BookingRequestModel {
  const factory BookingRequestModel({
    @JsonKey(name: 'shop_id') required String shopId,
    @JsonKey(name: 'service_ids') required List<String> serviceIds,
    required String date,
    @JsonKey(name: 'time_slot_id') required String timeSlotId,
    @JsonKey(name: 'vehicle_type') required String vehicleType,
    @JsonKey(name: 'pickup_delivery') @Default(false) bool pickupDelivery,
    @JsonKey(name: 'promo_code') String? promoCode,
    @JsonKey(name: 'payment_method') String? paymentMethod,
  }) = _BookingRequestModel;

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BookingRequestModelFromJson(json);

  /// Creates from domain entity.
  factory BookingRequestModel.fromDomain(BookingRequest entity) =>
      BookingRequestModel(
        shopId: entity.shopId,
        serviceIds: entity.selectedServices,
        date: DateFormat('yyyy-MM-dd').format(entity.date),
        timeSlotId: entity.timeSlotId,
        vehicleType: entity.vehicleType.apiValue,
        pickupDelivery: entity.pickupAndDelivery,
        promoCode: entity.promoCode,
        paymentMethod: entity.paymentMethod,
      );
}
