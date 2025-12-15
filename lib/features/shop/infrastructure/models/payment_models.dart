/// Models for Razorpay payment flow.
///
/// Flow:
/// 1. Initiate booking -> returns BookingInitiateResponse with razorpay_order_id
/// 2. User pays via Razorpay SDK
/// 3. Verify payment -> sends PaymentVerifyRequest, returns PaymentVerifyResponse

/// Response from /api/booking/v1/initiate/ endpoint.
class BookingInitiateResponse {
  const BookingInitiateResponse({
    required this.message,
    required this.bookingId,
    required this.razorpayOrderId,
    required this.amount,
    required this.currency,
  });

  final String message;
  final int bookingId;
  final String razorpayOrderId;
  final int amount; // Amount in paise (55000 = ₹550)
  final String currency;

  factory BookingInitiateResponse.fromJson(Map<String, dynamic> json) {
    return BookingInitiateResponse(
      message: json['message'] as String? ?? '',
      bookingId: (json['booking_id'] as num).toInt(),
      razorpayOrderId: json['razorpay_order_id'] as String,
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String? ?? 'INR',
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'booking_id': bookingId,
        'razorpay_order_id': razorpayOrderId,
        'amount': amount,
        'currency': currency,
      };

  /// Get amount in rupees for display.
  double get amountInRupees => amount / 100;
}

/// Request payload for /api/booking/v1/verify_payment/ endpoint.
class PaymentVerifyRequest {
  const PaymentVerifyRequest({
    required this.razorpayPaymentId,
    required this.razorpayOrderId,
    required this.razorpaySignature,
  });

  final String razorpayPaymentId;
  final String razorpayOrderId;
  final String razorpaySignature;

  Map<String, dynamic> toJson() => {
        'razorpay_payment_id': razorpayPaymentId,
        'razorpay_order_id': razorpayOrderId,
        'razorpay_signature': razorpaySignature,
      };
}

/// Response from /api/booking/v1/verify_payment/ endpoint.
class PaymentVerifyResponse {
  const PaymentVerifyResponse({
    required this.success,
    required this.message,
    this.bookingId,
    this.bookingReference,
    this.status,
  });

  final bool success;
  final String message;
  final int? bookingId;
  final String? bookingReference;
  final String? status;

  factory PaymentVerifyResponse.fromJson(Map<String, dynamic> json) {
    return PaymentVerifyResponse(
      success: json['success'] as bool? ??
               json['status'] == 'confirmed' ||
               json['message']?.toString().toLowerCase().contains('success') == true,
      message: json['message'] as String? ?? '',
      bookingId: json['booking_id'] != null
          ? (json['booking_id'] as num).toInt()
          : null,
      bookingReference: json['booking_reference'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'booking_id': bookingId,
        'booking_reference': bookingReference,
        'status': status,
      };
}
