import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../features/shop/infrastructure/models/payment_models.dart';

/// Result of a Razorpay payment attempt.
class PaymentResult {
  const PaymentResult({
    required this.success,
    this.paymentId,
    this.orderId,
    this.signature,
    this.errorCode,
    this.errorMessage,
  });

  final bool success;
  final String? paymentId;
  final String? orderId;
  final String? signature;
  final int? errorCode;
  final String? errorMessage;

  /// Create a successful payment result.
  factory PaymentResult.success({
    required String paymentId,
    required String orderId,
    required String signature,
  }) {
    return PaymentResult(
      success: true,
      paymentId: paymentId,
      orderId: orderId,
      signature: signature,
    );
  }

  /// Create a failed payment result.
  factory PaymentResult.failure({
    required int errorCode,
    required String errorMessage,
  }) {
    return PaymentResult(
      success: false,
      errorCode: errorCode,
      errorMessage: errorMessage,
    );
  }

  /// Convert to PaymentVerifyRequest for API verification.
  PaymentVerifyRequest? toVerifyRequest() {
    if (!success || paymentId == null || orderId == null || signature == null) {
      return null;
    }
    return PaymentVerifyRequest(
      razorpayPaymentId: paymentId!,
      razorpayOrderId: orderId!,
      razorpaySignature: signature!,
    );
  }
}

/// Service for handling Razorpay payments.
class PaymentService {
  PaymentService() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  late final Razorpay _razorpay;
  Completer<PaymentResult>? _paymentCompleter;

  /// Get the Razorpay key from environment.
  String get razorpayKey => dotenv.env['RAZORPAY_KEY_ID'] ?? '';

  /// Open Razorpay payment sheet.
  ///
  /// [initiateResponse] - Response from booking initiate API
  /// [userEmail] - User's email for receipt
  /// [userPhone] - User's phone number
  /// [userName] - User's name for display
  Future<PaymentResult> openPaymentSheet({
    required BookingInitiateResponse initiateResponse,
    required String userEmail,
    required String userPhone,
    String? userName,
  }) async {
    if (razorpayKey.isEmpty) {
      return PaymentResult.failure(
        errorCode: -1,
        errorMessage: 'Razorpay key not configured. Please check .env file.',
      );
    }

    _paymentCompleter = Completer<PaymentResult>();

    final options = {
      'key': razorpayKey,
      'amount': initiateResponse.amount,
      'currency': initiateResponse.currency,
      'name': 'DriveDeck',
      'description': 'Booking #${initiateResponse.bookingId}',
      'order_id': initiateResponse.razorpayOrderId,
      'prefill': {
        'contact': userPhone,
        'email': userEmail,
        if (userName != null) 'name': userName,
      },
      'theme': {
        'color': '#2196F3',
      },
      'retry': {
        'enabled': true,
        'max_count': 3,
      },
    };

    try {
      _razorpay.open(options);
      return await _paymentCompleter!.future;
    } catch (e) {
      return PaymentResult.failure(
        errorCode: -1,
        errorMessage: 'Failed to open payment sheet: $e',
      );
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    debugPrint('Payment Success: ${response.paymentId}');
    _paymentCompleter?.complete(PaymentResult.success(
      paymentId: response.paymentId ?? '',
      orderId: response.orderId ?? '',
      signature: response.signature ?? '',
    ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint('Payment Error: ${response.code} - ${response.message}');
    _paymentCompleter?.complete(PaymentResult.failure(
      errorCode: response.code ?? -1,
      errorMessage: response.message ?? 'Payment failed',
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint('External Wallet: ${response.walletName}');
    // External wallet selected - treat as pending
    _paymentCompleter?.complete(PaymentResult.failure(
      errorCode: 0,
      errorMessage: 'External wallet selected: ${response.walletName}',
    ));
  }

  /// Clean up resources.
  void dispose() {
    _razorpay.clear();
  }
}

/// Provider for PaymentService.
final paymentServiceProvider = Provider<PaymentService>((ref) {
  final service = PaymentService();
  ref.onDispose(() => service.dispose());
  return service;
});
