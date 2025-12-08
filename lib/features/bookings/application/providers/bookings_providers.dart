import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/application/providers/auth_providers.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/bookings_tab.dart';
import '../../domain/repositories/bookings_repository.dart';
import '../../infrastructure/data_sources/local/bookings_local_ds.dart';
import '../../infrastructure/data_sources/remote/bookings_api.dart';
import '../../infrastructure/repositories/bookings_repository_impl.dart';
import '../states/booking_detail_state.dart';
import '../states/bookings_state.dart';
import '../usecases/cancel_booking_usecase.dart';
import '../usecases/get_booking_details_usecase.dart';
import '../usecases/get_bookings_usecase.dart';
import '../usecases/get_cached_bookings_usecase.dart';
import 'booking_detail_notifier.dart';
import 'bookings_notifier.dart';

// =============================================================================
// Core Providers
// =============================================================================

/// Provider for connectivity.
final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

// =============================================================================
// Data Source Providers
// =============================================================================

/// Provider for the bookings API.
final bookingsApiProvider = Provider<BookingsApi>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return BookingsApiImpl(apiClient: apiClient);
});

/// Provider for the bookings local data source.
final bookingsLocalDataSourceProvider = Provider<BookingsLocalDataSource>((ref) {
  return BookingsLocalDataSourceImpl();
});

// =============================================================================
// Repository Provider
// =============================================================================

/// Provider for the bookings repository.
final bookingsRepositoryProvider = Provider<BookingsRepository>((ref) {
  final api = ref.watch(bookingsApiProvider);
  final localDs = ref.watch(bookingsLocalDataSourceProvider);
  final connectivity = ref.watch(connectivityProvider);

  return BookingsRepositoryImpl(
    bookingsApi: api,
    localDataSource: localDs,
    connectivity: connectivity,
  );
});

// =============================================================================
// Usecase Providers
// =============================================================================

/// Provider for get bookings usecase.
final getBookingsUsecaseProvider = Provider<GetBookingsUsecase>((ref) {
  final repository = ref.watch(bookingsRepositoryProvider);
  return GetBookingsUsecase(repository: repository);
});

/// Provider for get booking details usecase.
final getBookingDetailsUsecaseProvider = Provider<GetBookingDetailsUsecase>((ref) {
  final repository = ref.watch(bookingsRepositoryProvider);
  return GetBookingDetailsUsecase(repository: repository);
});

/// Provider for cancel booking usecase.
final cancelBookingUsecaseProvider = Provider<CancelBookingUsecase>((ref) {
  final repository = ref.watch(bookingsRepositoryProvider);
  return CancelBookingUsecase(repository: repository);
});

/// Provider for get cached bookings usecase.
final getCachedBookingsUsecaseProvider = Provider<GetCachedBookingsUsecase>((ref) {
  final repository = ref.watch(bookingsRepositoryProvider);
  return GetCachedBookingsUsecase(repository: repository);
});

// =============================================================================
// State Providers
// =============================================================================

/// Main bookings state provider.
final bookingsStateProvider =
    StateNotifierProvider<BookingsNotifier, BookingsState>((ref) {
  return BookingsNotifier(ref);
});

/// Booking detail state provider (family by bookingId).
final bookingDetailStateProvider = StateNotifierProvider.family<
    BookingDetailNotifier, BookingDetailState, String>((ref, bookingId) {
  return BookingDetailNotifier(ref, bookingId);
});

// =============================================================================
// Derived Providers
// =============================================================================

/// Provider for upcoming bookings list.
final upcomingBookingsProvider = Provider<List<Booking>>((ref) {
  final state = ref.watch(bookingsStateProvider);
  return state.bookingsList?.upcomingBookings ?? [];
});

/// Provider for past bookings list.
final pastBookingsProvider = Provider<List<Booking>>((ref) {
  final state = ref.watch(bookingsStateProvider);
  return state.bookingsList?.pastBookings ?? [];
});

/// Provider for the selected tab.
final selectedBookingsTabProvider = Provider<BookingsTab>((ref) {
  return ref.watch(bookingsStateProvider).selectedTab;
});

/// Provider for upcoming bookings count (for badge).
final upcomingBookingsCountProvider = Provider<int>((ref) {
  return ref.watch(upcomingBookingsProvider).length;
});

/// Provider for history bookings count.
final historyBookingsCountProvider = Provider<int>((ref) {
  return ref.watch(pastBookingsProvider).length;
});

/// Provider for checking if bookings are loading.
final isBookingsLoadingProvider = Provider<bool>((ref) {
  return ref.watch(bookingsStateProvider).isLoading;
});

/// Provider for checking if bookings are refreshing.
final isBookingsRefreshingProvider = Provider<bool>((ref) {
  return ref.watch(bookingsStateProvider).isRefreshing;
});

/// Provider for current tab bookings.
final currentTabBookingsProvider = Provider<List<Booking>>((ref) {
  return ref.watch(bookingsStateProvider).currentTabBookings;
});

/// Provider for checking if current tab is empty.
final isCurrentTabEmptyProvider = Provider<bool>((ref) {
  return ref.watch(bookingsStateProvider).isCurrentTabEmpty;
});
