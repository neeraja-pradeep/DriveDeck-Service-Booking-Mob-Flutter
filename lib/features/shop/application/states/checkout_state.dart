import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/booking_confirmation.dart';
import '../../domain/entities/booking_summary.dart';

part 'checkout_state.freezed.dart';

/// State for checkout screen.
@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = CheckoutStateInitial;
  const factory CheckoutState.loading() = CheckoutStateLoading;
  const factory CheckoutState.ready(BookingSummary summary) = CheckoutStateReady;
  const factory CheckoutState.processing() = CheckoutStateProcessing;
  const factory CheckoutState.success(BookingConfirmation confirmation) = CheckoutStateSuccess;
  const factory CheckoutState.error(Failure failure) = CheckoutStateError;
}
