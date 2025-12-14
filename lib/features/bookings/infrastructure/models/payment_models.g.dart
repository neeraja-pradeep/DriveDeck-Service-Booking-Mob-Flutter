// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$InitiateBookingRequestToJson(
        InitiateBookingRequest instance) =>
    <String, dynamic>{
      'shop_id': instance.shopId,
      'service_id': instance.serviceId,
      'appointment_date': instance.appointmentDate,
      'start_slot': instance.startSlot,
    };

InitiateBookingResponse _$InitiateBookingResponseFromJson(
        Map<String, dynamic> json) =>
    InitiateBookingResponse(
      bookingId: (json['booking_id'] as num).toInt(),
      orderId: json['order_id'] as String,
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String,
      razorpayKeyId: json['razorpay_key_id'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$InitiateBookingResponseToJson(
        InitiateBookingResponse instance) =>
    <String, dynamic>{
      'booking_id': instance.bookingId,
      'order_id': instance.orderId,
      'amount': instance.amount,
      'currency': instance.currency,
      'razorpay_key_id': instance.razorpayKeyId,
      'status': instance.status,
    };

Map<String, dynamic> _$VerifyPaymentRequestToJson(
        VerifyPaymentRequest instance) =>
    <String, dynamic>{
      'razorpay_payment_id': instance.razorpayPaymentId,
      'razorpay_order_id': instance.razorpayOrderId,
      'razorpay_signature': instance.razorpaySignature,
    };

VerifyPaymentResponse _$VerifyPaymentResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyPaymentResponse(
      success: json['success'] as bool,
      bookingId: (json['booking_id'] as num?)?.toInt(),
      message: json['message'] as String?,
      paymentStatus: json['payment_status'] as String?,
    );

Map<String, dynamic> _$VerifyPaymentResponseToJson(
        VerifyPaymentResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'booking_id': instance.bookingId,
      'message': instance.message,
      'payment_status': instance.paymentStatus,
    };

Map<String, dynamic> _$InitiateRefundRequestToJson(
        InitiateRefundRequest instance) =>
    <String, dynamic>{
      'booking_id': instance.bookingId,
    };

InitiateRefundResponse _$InitiateRefundResponseFromJson(
        Map<String, dynamic> json) =>
    InitiateRefundResponse(
      success: json['success'] as bool,
      refundId: json['refund_id'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InitiateRefundResponseToJson(
        InitiateRefundResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'refund_id': instance.refundId,
      'amount': instance.amount,
      'status': instance.status,
      'message': instance.message,
    };
