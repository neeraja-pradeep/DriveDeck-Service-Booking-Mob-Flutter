import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/booking_date.dart';
import '../../domain/entities/time_slot.dart';

part 'booking_date_state.freezed.dart';

/// State for booking date and time selection.
@freezed
class BookingDateState with _$BookingDateState {
  const BookingDateState._();

  const factory BookingDateState.initial() = BookingDateStateInitial;
  const factory BookingDateState.loading() = BookingDateStateLoading;
  const factory BookingDateState.loaded({
    required List<BookingDate> availableDates,
    required DateTime selectedDate,
    TimeSlot? selectedSlot,
  }) = BookingDateStateLoaded;
  const factory BookingDateState.error(Failure failure) = BookingDateStateError;

  /// Checks if a date and slot are selected.
  bool get canProceed => maybeMap(
        loaded: (s) => s.selectedSlot != null,
        orElse: () => false,
      );
}
