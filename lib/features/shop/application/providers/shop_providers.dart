import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../domain/repositories/shop_repository.dart';
import '../../infrastructure/data_sources/local/shop_local_ds.dart';
import '../../infrastructure/data_sources/remote/shop_api.dart';
import '../../infrastructure/repositories/shop_repository_impl.dart';
import '../states/booking_date_state.dart';
import '../states/booking_flow_state.dart';
import '../states/checkout_state.dart';
import '../states/shop_detail_state.dart';
import '../usecases/create_booking_usecase.dart';
import '../usecases/get_available_slots_usecase.dart';
import '../usecases/get_shop_details_usecase.dart';
import '../usecases/get_shop_services_usecase.dart';
import 'booking_date_notifier.dart';
import 'booking_flow_notifier.dart';
import 'checkout_notifier.dart';
import 'shop_detail_notifier.dart';

// Core providers

/// API Client provider.
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

/// Connectivity provider.
final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

// Data source providers

/// Shop API provider.
final shopApiProvider = Provider<ShopApi>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ShopApiImpl(apiClient);
});

/// Shop local data source provider.
final shopLocalDataSourceProvider = Provider<ShopLocalDataSource>((ref) {
  return ShopLocalDataSourceImpl();
});

// Repository provider

/// Shop repository provider.
final shopRepositoryProvider = Provider<ShopRepository>((ref) {
  final api = ref.watch(shopApiProvider);
  final localDataSource = ref.watch(shopLocalDataSourceProvider);
  final connectivity = ref.watch(connectivityProvider);

  return ShopRepositoryImpl(
    api: api,
    localDataSource: localDataSource,
    connectivity: connectivity,
  );
});

// Use case providers

/// Get shop details use case provider.
final getShopDetailsUsecaseProvider = Provider<GetShopDetailsUsecase>((ref) {
  return GetShopDetailsUsecase(ref.watch(shopRepositoryProvider));
});

/// Get shop services use case provider.
final getShopServicesUsecaseProvider = Provider<GetShopServicesUsecase>((ref) {
  return GetShopServicesUsecase(ref.watch(shopRepositoryProvider));
});

/// Get available slots use case provider.
final getAvailableSlotsUsecaseProvider = Provider<GetAvailableSlotsUsecase>((ref) {
  return GetAvailableSlotsUsecase(ref.watch(shopRepositoryProvider));
});

/// Create booking use case provider.
final createBookingUsecaseProvider = Provider<CreateBookingUsecase>((ref) {
  return CreateBookingUsecase(ref.watch(shopRepositoryProvider));
});

// State providers

/// Current shop ID being viewed.
final currentShopIdProvider = StateProvider<String?>((ref) => null);

/// Shop detail state provider (scoped to shopId).
final shopDetailStateProvider = StateNotifierProvider.family<
    ShopDetailNotifier, ShopDetailState, String>(
  (ref, shopId) => ShopDetailNotifier(ref, shopId),
);

/// Booking date state provider.
final bookingDateStateProvider =
    StateNotifierProvider<BookingDateNotifier, BookingDateState>(
  (ref) => BookingDateNotifier(ref),
);

/// Booking flow state provider (persists across screens).
final bookingFlowStateProvider =
    StateNotifierProvider<BookingFlowNotifier, BookingFlowState>(
  (ref) => BookingFlowNotifier(),
);

/// Checkout state provider.
final checkoutStateProvider =
    StateNotifierProvider<CheckoutNotifier, CheckoutState>(
  (ref) => CheckoutNotifier(ref),
);

// Derived providers

/// Selected services provider.
final selectedServicesProvider = Provider((ref) {
  final shopId = ref.watch(currentShopIdProvider);
  if (shopId == null) return <String>{};

  final state = ref.watch(shopDetailStateProvider(shopId));
  return state.selectedServiceIds;
});

/// Can proceed to next step provider.
final canProceedProvider = Provider((ref) {
  final shopId = ref.watch(currentShopIdProvider);
  if (shopId == null) return false;

  final state = ref.watch(shopDetailStateProvider(shopId));
  return state.canProceed;
});
