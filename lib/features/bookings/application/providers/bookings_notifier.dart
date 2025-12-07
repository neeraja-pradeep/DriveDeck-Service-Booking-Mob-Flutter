import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/booking.dart';
import '../../domain/entities/bookings_list.dart';
import '../../domain/entities/bookings_tab.dart';
import '../../infrastructure/data_sources/local/bookings_local_ds.dart';
import '../states/bookings_list_state.dart';
import '../states/bookings_state.dart';
import '../usecases/get_bookings_usecase.dart';
import '../usecases/get_cached_bookings_usecase.dart';
import 'bookings_providers.dart';

/// StateNotifier for managing bookings state.
///
/// Handles fetching, caching, and updating bookings data.
class BookingsNotifier extends StateNotifier<BookingsState> {
  /// Creates a new [BookingsNotifier].
  BookingsNotifier(this._ref) : super(BookingsState.initial());

  final Ref _ref;

  GetBookingsUsecase get _getBookingsUsecase =>
      _ref.read(getBookingsUsecaseProvider);

  GetCachedBookingsUsecase get _getCachedBookingsUsecase =>
      _ref.read(getCachedBookingsUsecaseProvider);

  BookingsLocalDataSource get _localDataSource =>
      _ref.read(bookingsLocalDataSourceProvider);

  /// Initializes the bookings state.
  ///
  /// Loads cached data first, then fetches fresh data from API.
  Future<void> initialize() async {
    await _fetchBookings();
  }

  /// Fetches bookings from cache and/or API.
  Future<void> _fetchBookings() async {
    // 1. Try to show cached data first
    final cachedResult = await _getCachedBookingsUsecase();

    cachedResult.fold(
      (failure) {
        // No cache available, show loading
        state = state.copyWith(listState: const BookingsListState.loading());
      },
      (cached) {
        if (cached != null) {
          // Show cached data immediately
          state = state.copyWith(
            listState: BookingsListState.loaded(cached.data, fromCache: true),
          );
        } else {
          state = state.copyWith(listState: const BookingsListState.loading());
        }
      },
    );

    // 2. Fetch fresh data with conditional request
    final lastModified = state.bookingsList != null
        ? await _localDataSource.getLastModified()
        : null;

    final result = await _getBookingsUsecase(lastModified: lastModified);

    result.fold(
      (failure) {
        // If we have cached data, keep showing it
        if (state.bookingsList == null) {
          state = state.copyWith(listState: BookingsListState.error(failure));
        }
        // Otherwise keep current state (cached data is still visible)
      },
      (newData) {
        if (newData != null) {
          // 200 OK - new data received
          state = state.copyWith(
            listState: BookingsListState.loaded(newData.data, fromCache: false),
          );
        }
        // null means 304 Not Modified - keep current state
      },
    );
  }

  /// Refreshes the bookings list.
  ///
  /// Shows refreshing state while keeping current data visible.
  Future<void> refresh() async {
    final currentBookings = state.bookingsList;

    if (currentBookings != null) {
      state = state.copyWith(
        listState: BookingsListState.refreshing(currentBookings),
      );
    } else {
      state = state.copyWith(listState: const BookingsListState.loading());
    }

    // Force fresh fetch (ignore cache timestamp)
    final result = await _getBookingsUsecase(lastModified: null);

    result.fold(
      (failure) {
        // Revert to previous loaded state on error
        if (currentBookings != null) {
          state = state.copyWith(
            listState: BookingsListState.loaded(currentBookings, fromCache: true),
          );
        } else {
          state = state.copyWith(listState: BookingsListState.error(failure));
        }
      },
      (newData) {
        if (newData != null) {
          state = state.copyWith(
            listState: BookingsListState.loaded(newData.data, fromCache: false),
          );
        } else if (currentBookings != null) {
          // 304 - keep current data
          state = state.copyWith(
            listState: BookingsListState.loaded(currentBookings, fromCache: true),
          );
        }
      },
    );
  }

  /// Selects a tab.
  void selectTab(BookingsTab tab) {
    state = state.copyWith(selectedTab: tab);
  }

  /// Updates the search query.
  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
    // Search filtering to be implemented later
  }

  /// Updates a booking in the list after modification.
  void updateBookingInList(Booking updatedBooking) {
    final currentState = state.listState;
    if (currentState is! BookingsListStateLoaded) return;

    final currentBookings = currentState.bookings;

    // Update in upcoming bookings
    final updatedUpcoming = currentBookings.upcomingBookings
        .map((b) => b.id == updatedBooking.id ? updatedBooking : b)
        .where((b) => b.isUpcoming)
        .toList();

    // Update in past bookings
    var updatedPast = currentBookings.pastBookings
        .map((b) => b.id == updatedBooking.id ? updatedBooking : b)
        .toList();

    // Add to past if newly cancelled and not already there
    if (updatedBooking.isPast &&
        !currentBookings.pastBookings.any((b) => b.id == updatedBooking.id)) {
      updatedPast = [updatedBooking, ...updatedPast];
    }

    final updatedList = BookingsList(
      upcomingBookings: updatedUpcoming,
      pastBookings: updatedPast,
    );

    state = state.copyWith(
      listState: BookingsListState.loaded(updatedList, fromCache: false),
    );

    // Update local cache
    _localDataSource.saveBookings(updatedList, DateTime.now());
  }

  /// Clears all state and cache.
  Future<void> clearAll() async {
    await _localDataSource.clearCache();
    state = BookingsState.initial();
  }
}
