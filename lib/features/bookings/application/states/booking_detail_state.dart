import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/booking.dart';

/// State representing a booking detail view.
sealed class BookingDetailState extends Equatable {
  const BookingDetailState();

  /// Initial state before loading.
  const factory BookingDetailState.initial() = BookingDetailStateInitial;

  /// Loading state when fetching details.
  const factory BookingDetailState.loading() = BookingDetailStateLoading;

  /// Loaded state with booking data.
  const factory BookingDetailState.loaded(Booking booking) =
      BookingDetailStateLoaded;

  /// Cancelling state while processing cancellation.
  const factory BookingDetailState.cancelling() = BookingDetailStateCancelling;

  /// Cancelled state after successful cancellation.
  const factory BookingDetailState.cancelled(Booking booking) =
      BookingDetailStateCancelled;

  /// Error state when operation fails.
  const factory BookingDetailState.error(Failure failure) =
      BookingDetailStateError;
}

/// Initial state.
class BookingDetailStateInitial extends BookingDetailState {
  const BookingDetailStateInitial();

  @override
  List<Object?> get props => [];
}

/// Loading state.
class BookingDetailStateLoading extends BookingDetailState {
  const BookingDetailStateLoading();

  @override
  List<Object?> get props => [];
}

/// Loaded state with booking.
class BookingDetailStateLoaded extends BookingDetailState {
  const BookingDetailStateLoaded(this.booking);

  /// The booking data.
  final Booking booking;

  @override
  List<Object?> get props => [booking];
}

/// Cancelling state.
class BookingDetailStateCancelling extends BookingDetailState {
  const BookingDetailStateCancelling();

  @override
  List<Object?> get props => [];
}

/// Cancelled state.
class BookingDetailStateCancelled extends BookingDetailState {
  const BookingDetailStateCancelled(this.booking);

  /// The cancelled booking.
  final Booking booking;

  @override
  List<Object?> get props => [booking];
}

/// Error state.
class BookingDetailStateError extends BookingDetailState {
  const BookingDetailStateError(this.failure);

  /// The failure that occurred.
  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

/// Extension methods for [BookingDetailState].
extension BookingDetailStateX on BookingDetailState {
  /// Returns the booking if available.
  Booking? get booking {
    return switch (this) {
      BookingDetailStateLoaded(booking: final b) => b,
      BookingDetailStateCancelled(booking: final b) => b,
      _ => null,
    };
  }

  /// Returns true if loading or cancelling.
  bool get isProcessing {
    return this is BookingDetailStateLoading ||
        this is BookingDetailStateCancelling;
  }

  /// Returns the error message if there was an error.
  String? get errorMessage {
    return switch (this) {
      BookingDetailStateError(failure: final f) => f.userMessage,
      _ => null,
    };
  }
}
