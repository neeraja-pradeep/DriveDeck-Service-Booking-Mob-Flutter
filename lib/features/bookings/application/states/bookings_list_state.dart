import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/bookings_list.dart';

/// State representing the bookings list loading status.
sealed class BookingsListState extends Equatable {
  const BookingsListState();

  /// Initial state before any loading.
  const factory BookingsListState.initial() = BookingsListStateInitial;

  /// Loading state when fetching bookings.
  const factory BookingsListState.loading() = BookingsListStateLoading;

  /// Loaded state with bookings data.
  const factory BookingsListState.loaded(
    BookingsList bookings, {
    bool fromCache,
  }) = BookingsListStateLoaded;

  /// Error state when loading fails.
  const factory BookingsListState.error(Failure failure) =
      BookingsListStateError;

  /// Refreshing state while showing existing data.
  const factory BookingsListState.refreshing(BookingsList currentBookings) =
      BookingsListStateRefreshing;
}

/// Initial state.
class BookingsListStateInitial extends BookingsListState {
  const BookingsListStateInitial();

  @override
  List<Object?> get props => [];
}

/// Loading state.
class BookingsListStateLoading extends BookingsListState {
  const BookingsListStateLoading();

  @override
  List<Object?> get props => [];
}

/// Loaded state with data.
class BookingsListStateLoaded extends BookingsListState {
  const BookingsListStateLoaded(
    this.bookings, {
    this.fromCache = false,
  });

  /// The loaded bookings data.
  final BookingsList bookings;

  /// Whether the data was loaded from cache.
  final bool fromCache;

  @override
  List<Object?> get props => [bookings, fromCache];
}

/// Error state.
class BookingsListStateError extends BookingsListState {
  const BookingsListStateError(this.failure);

  /// The failure that occurred.
  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

/// Refreshing state with current data visible.
class BookingsListStateRefreshing extends BookingsListState {
  const BookingsListStateRefreshing(this.currentBookings);

  /// The current bookings being displayed.
  final BookingsList currentBookings;

  @override
  List<Object?> get props => [currentBookings];
}
