import 'package:equatable/equatable.dart';

import '../../domain/entities/booking.dart';
import '../../domain/entities/bookings_list.dart';
import '../../domain/entities/bookings_tab.dart';
import 'bookings_list_state.dart';

/// Main state for the bookings feature.
///
/// Contains the list state, selected tab, and search query.
class BookingsState extends Equatable {
  /// Creates a new [BookingsState].
  const BookingsState({
    required this.listState,
    required this.selectedTab,
    required this.searchQuery,
  });

  /// Creates the initial state.
  factory BookingsState.initial() => const BookingsState(
        listState: BookingsListState.initial(),
        selectedTab: BookingsTab.booked,
        searchQuery: '',
      );

  /// The current state of the bookings list.
  final BookingsListState listState;

  /// The currently selected tab.
  final BookingsTab selectedTab;

  /// The current search query (for future search implementation).
  final String searchQuery;

  /// Creates a copy with the given fields replaced.
  BookingsState copyWith({
    BookingsListState? listState,
    BookingsTab? selectedTab,
    String? searchQuery,
  }) {
    return BookingsState(
      listState: listState ?? this.listState,
      selectedTab: selectedTab ?? this.selectedTab,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [listState, selectedTab, searchQuery];
}

/// Extension methods for [BookingsState].
extension BookingsStateX on BookingsState {
  /// Returns the bookings for the currently selected tab.
  List<Booking> get currentTabBookings {
    final state = listState;
    if (state is BookingsListStateLoaded) {
      return selectedTab == BookingsTab.booked
          ? state.bookings.upcomingBookings
          : state.bookings.pastBookings;
    }
    if (state is BookingsListStateRefreshing) {
      return selectedTab == BookingsTab.booked
          ? state.currentBookings.upcomingBookings
          : state.currentBookings.pastBookings;
    }
    return [];
  }

  /// Returns the count of bookings in the current tab.
  int get currentTabCount => currentTabBookings.length;

  /// Returns true if the current tab has no bookings.
  bool get isCurrentTabEmpty => currentTabBookings.isEmpty;

  /// Returns true if the list is loading.
  bool get isLoading => listState is BookingsListStateLoading;

  /// Returns true if the list is refreshing.
  bool get isRefreshing => listState is BookingsListStateRefreshing;

  /// Returns true if there was an error loading.
  bool get hasError => listState is BookingsListStateError;

  /// Returns the error message if there was an error.
  String? get errorMessage {
    final state = listState;
    if (state is BookingsListStateError) {
      return state.failure.userMessage;
    }
    return null;
  }

  /// Returns the full bookings list if loaded.
  BookingsList? get bookingsList {
    final state = listState;
    if (state is BookingsListStateLoaded) {
      return state.bookings;
    }
    if (state is BookingsListStateRefreshing) {
      return state.currentBookings;
    }
    return null;
  }

  /// Returns the upcoming bookings count.
  int get upcomingCount => bookingsList?.upcomingCount ?? 0;

  /// Returns the history bookings count.
  int get historyCount => bookingsList?.historyCount ?? 0;
}
