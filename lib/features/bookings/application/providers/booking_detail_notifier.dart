import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/booking_detail_state.dart';
import '../usecases/cancel_booking_usecase.dart';
import '../usecases/get_booking_details_usecase.dart';
import 'bookings_providers.dart';

/// StateNotifier for managing individual booking detail state.
class BookingDetailNotifier extends StateNotifier<BookingDetailState> {
  /// Creates a new [BookingDetailNotifier].
  BookingDetailNotifier(this._ref, this._bookingId)
      : super(const BookingDetailState.initial());

  final Ref _ref;
  final String _bookingId;

  GetBookingDetailsUsecase get _getBookingDetailsUsecase =>
      _ref.read(getBookingDetailsUsecaseProvider);

  CancelBookingUsecase get _cancelBookingUsecase =>
      _ref.read(cancelBookingUsecaseProvider);

  /// Initializes the booking detail state.
  Future<void> initialize() async {
    state = const BookingDetailState.loading();

    final result = await _getBookingDetailsUsecase(_bookingId);

    result.fold(
      (failure) => state = BookingDetailState.error(failure),
      (booking) => state = BookingDetailState.loaded(booking),
    );
  }

  /// Cancels the current booking.
  Future<void> cancelBooking() async {
    final currentBooking = state.booking;
    if (currentBooking == null) return;

    state = const BookingDetailState.cancelling();

    final result = await _cancelBookingUsecase(_bookingId);

    result.fold(
      (failure) {
        state = BookingDetailState.error(failure);
      },
      (cancelledBooking) {
        state = BookingDetailState.cancelled(cancelledBooking);

        // Update the main bookings list
        _ref
            .read(bookingsStateProvider.notifier)
            .updateBookingInList(cancelledBooking);
      },
    );
  }

  /// Resets the state to loaded with current booking.
  void resetToLoaded() {
    final booking = state.booking;
    if (booking != null) {
      state = BookingDetailState.loaded(booking);
    }
  }
}
