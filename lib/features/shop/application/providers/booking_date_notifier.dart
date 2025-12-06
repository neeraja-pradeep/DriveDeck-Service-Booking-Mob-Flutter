import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/time_slot.dart';
import '../states/booking_date_state.dart';
import 'shop_providers.dart';

/// Notifier for managing booking date and time selection state.
class BookingDateNotifier extends StateNotifier<BookingDateState> {
  final Ref _ref;
  String? _shopId;

  BookingDateNotifier(this._ref) : super(const BookingDateState.initial());

  /// Initializes the booking date selection.
  Future<void> initialize(String shopId) async {
    _shopId = shopId;
    // Load slots for today
    await fetchSlotsForDate(DateTime.now());
  }

  /// Fetches available slots for a specific date.
  Future<void> fetchSlotsForDate(DateTime date) async {
    if (_shopId == null) return;

    state = const BookingDateState.loading();

    final usecase = _ref.read(getAvailableSlotsUsecaseProvider);
    final result = await usecase(_shopId!, date);

    result.fold(
      (failure) => state = BookingDateState.error(failure),
      (bookingDate) => state = BookingDateState.loaded(
        availableDates: [bookingDate],
        selectedDate: date,
        selectedSlot: null,
      ),
    );
  }

  /// Selects a date and fetches its slots.
  void selectDate(DateTime date) {
    fetchSlotsForDate(date);
  }

  /// Selects a time slot.
  void selectTimeSlot(TimeSlot slot) {
    state = state.maybeMap(
      loaded: (s) {
        // Update booking flow with selected date and slot
        _ref.read(bookingFlowStateProvider.notifier).setDateAndSlot(
              s.selectedDate,
              slot,
            );
        return s.copyWith(selectedSlot: slot);
      },
      orElse: () => state,
    );
  }

  /// Toggles pickup and delivery option.
  void togglePickupDelivery(bool value) {
    _ref.read(bookingFlowStateProvider.notifier).setPickupAndDelivery(value);
  }

  /// Clears the selected slot.
  void clearSlot() {
    state = state.maybeMap(
      loaded: (s) => s.copyWith(selectedSlot: null),
      orElse: () => state,
    );
  }
}
