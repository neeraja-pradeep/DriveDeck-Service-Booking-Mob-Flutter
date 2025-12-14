import 'package:json_annotation/json_annotation.dart';

part 'payment_models.g.dart';

/// Request to initiate a booking with payment.
/// POST /api/booking/v1/initiate/
@JsonSerializable()
class InitiateBookingRequest {
  const InitiateBookingRequest({
    required this.shopId,
    required this.serviceId,
    required this.appointmentDate,
    required this.startSlot,
  });

  @JsonKey(name: 'shop_id')
  final int shopId;

  @JsonKey(name: 'service_id')
  final int serviceId;

  @JsonKey(name: 'appointment_date')
  final String appointmentDate;

  @JsonKey(name: 'start_slot')
  final String startSlot;

  Map<String, dynamic> toJson() => _$InitiateBookingRequestToJson(this);
}

/// Response from initiate booking endpoint.
/// Contains Razorpay order details for payment.
@JsonSerializable()
class InitiateBookingResponse {
  const InitiateBookingResponse({
    required this.bookingId,
    required this.orderId,
    required this.amount,
    required this.currency,
    this.razorpayKeyId,
    this.status,
  });

  factory InitiateBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$InitiateBookingResponseFromJson(json);

  @JsonKey(name: 'booking_id')
  final int bookingId;

  @JsonKey(name: 'order_id')
  final String orderId;

  final int amount;

  final String currency;

  @JsonKey(name: 'razorpay_key_id')
  final String? razorpayKeyId;

  final String? status;

  Map<String, dynamic> toJson() => _$InitiateBookingResponseToJson(this);
}

/// Request to verify payment after Razorpay callback.
/// POST /api/booking/v1/verify-payment/
@JsonSerializable()
class VerifyPaymentRequest {
  const VerifyPaymentRequest({
    required this.razorpayPaymentId,
    required this.razorpayOrderId,
    required this.razorpaySignature,
  });

  @JsonKey(name: 'razorpay_payment_id')
  final String razorpayPaymentId;

  @JsonKey(name: 'razorpay_order_id')
  final String razorpayOrderId;

  @JsonKey(name: 'razorpay_signature')
  final String razorpaySignature;

  Map<String, dynamic> toJson() => _$VerifyPaymentRequestToJson(this);
}

/// Response from verify payment endpoint.
@JsonSerializable()
class VerifyPaymentResponse {
  const VerifyPaymentResponse({
    required this.success,
    this.bookingId,
    this.message,
    this.paymentStatus,
  });

  factory VerifyPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyPaymentResponseFromJson(json);

  final bool success;

  @JsonKey(name: 'booking_id')
  final int? bookingId;

  final String? message;

  @JsonKey(name: 'payment_status')
  final String? paymentStatus;

  Map<String, dynamic> toJson() => _$VerifyPaymentResponseToJson(this);
}

/// Request to initiate a refund.
/// POST /api/booking/v1/initiate-refund/
@JsonSerializable()
class InitiateRefundRequest {
  const InitiateRefundRequest({
    required this.bookingId,
  });

  @JsonKey(name: 'booking_id')
  final int bookingId;

  Map<String, dynamic> toJson() => _$InitiateRefundRequestToJson(this);
}

/// Response from initiate refund endpoint.
@JsonSerializable()
class InitiateRefundResponse {
  const InitiateRefundResponse({
    required this.success,
    this.refundId,
    this.amount,
    this.status,
    this.message,
  });

  factory InitiateRefundResponse.fromJson(Map<String, dynamic> json) =>
      _$InitiateRefundResponseFromJson(json);

  final bool success;

  @JsonKey(name: 'refund_id')
  final String? refundId;

  final int? amount;

  final String? status;

  final String? message;

  Map<String, dynamic> toJson() => _$InitiateRefundResponseToJson(this);
}
