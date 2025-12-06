import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/checkout_state.dart';
import 'shop_providers.dart';

/// Notifier for managing checkout state.
class CheckoutNotifier extends StateNotifier<CheckoutState> {
  final Ref _ref;

  CheckoutNotifier(this._ref) : super(const CheckoutState.initial());

  /// Initializes the checkout screen.
  void initialize() {
    final summary = _ref.read(bookingFlowStateProvider.notifier).toBookingSummary();
    state = CheckoutState.ready(summary);
  }

  /// Processes the booking.
  Future<void> processBooking() async {
    state = const CheckoutState.processing();

    final request = _ref.read(bookingFlowStateProvider.notifier).toBookingRequest();
    final usecase = _ref.read(createBookingUsecaseProvider);
    final result = await usecase(request);

    result.fold(
      (failure) => state = CheckoutState.error(failure),
      (confirmation) {
        state = CheckoutState.success(confirmation);
        // Clear booking flow after successful booking
        _ref.read(bookingFlowStateProvider.notifier).reset();
      },
    );
  }

  /// Applies a promo code (placeholder).
  void applyPromoCode(String code) {
    _ref.read(bookingFlowStateProvider.notifier).setPromoCode(code);
    // In real implementation: validate and update summary
  }

  /// Selects a payment method.
  void selectPaymentMethod(String method) {
    _ref.read(bookingFlowStateProvider.notifier).setPaymentMethod(method);
  }

  /// Refreshes the summary.
  void refreshSummary() {
    final summary = _ref.read(bookingFlowStateProvider.notifier).toBookingSummary();
    state = CheckoutState.ready(summary);
  }
}
