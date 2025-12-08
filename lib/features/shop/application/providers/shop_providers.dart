import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../auth/application/providers/auth_providers.dart';
import '../../domain/entities/shop.dart';
import '../../domain/entities/shop_tab.dart';
import '../../domain/repositories/shop_repository.dart';
import '../../infrastructure/data_sources/local/shop_local_ds.dart';
import '../../infrastructure/data_sources/remote/shop_api.dart';
import '../../infrastructure/repositories/shop_repository_impl.dart';
import '../states/shop_state.dart';
import '../usecases/create_booking_usecase.dart';
import '../usecases/get_available_slots_usecase.dart';
import '../usecases/get_shop_details_usecase.dart';
import '../usecases/get_shop_services_usecase.dart';

// ============================================================================
// Data Source Providers
// ============================================================================

/// Provider for shop local data source.
final shopLocalDsProvider = Provider<ShopLocalDs>((ref) {
  return ShopLocalDs();
});

/// Provider for shop remote API.
final shopApiProvider = Provider<ShopApi>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ShopApiImpl(apiClient: apiClient);
});

// ============================================================================
// Repository Provider
// ============================================================================

/// Provider for shop repository.
final shopRepositoryProvider = Provider<ShopRepository>((ref) {
  final remoteDataSource = ref.watch(shopApiProvider);
  final localDataSource = ref.watch(shopLocalDsProvider);
  final networkInfo = ref.watch(networkInfoProvider);

  return ShopRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    networkInfo: networkInfo,
  );
});

// ============================================================================
// UseCase Providers
// ============================================================================

/// Provider for GetShopDetailsUseCase.
final getShopDetailsUseCaseProvider = Provider<GetShopDetailsUseCase>((ref) {
  final repository = ref.watch(shopRepositoryProvider);
  return GetShopDetailsUseCase(repository: repository);
});

/// Provider for GetShopServicesUseCase.
final getShopServicesUseCaseProvider = Provider<GetShopServicesUseCase>((ref) {
  final repository = ref.watch(shopRepositoryProvider);
  return GetShopServicesUseCase(repository: repository);
});

/// Provider for GetAvailableSlotsUseCase.
final getAvailableSlotsUseCaseProvider = Provider<GetAvailableSlotsUseCase>((
  ref,
) {
  final repository = ref.watch(shopRepositoryProvider);
  return GetAvailableSlotsUseCase(repository: repository);
});

/// Provider for CreateBookingUseCase.
final createBookingUseCaseProvider = Provider<CreateBookingUseCase>((ref) {
  final repository = ref.watch(shopRepositoryProvider);
  return CreateBookingUseCase(repository: repository);
});

// ============================================================================
// Shop List Providers
// ============================================================================

/// Notifier for shop list state.
class ShopListNotifier extends StateNotifier<ShopListState> {
  ShopListNotifier({required this.repository})
    : super(const ShopListState.initial());

  final ShopRepository repository;
  int _currentPage = 1;
  List<Shop> _shops = [];

  /// Load shops with optional search query.
  Future<void> loadShopsAsync({String? search, bool refresh = false}) async {
    try {
      if (refresh) {
        _currentPage = 1;
        _shops = [];
      }

      state = _currentPage == 1
          ? const ShopListState.loading()
          : ShopListState.loaded(
              shops: _shops,
              currentPage: _currentPage,
              hasMore: true,
            );

      final result = await repository.getShops(
        page: _currentPage,
        search: search,
      );

      state = result.fold((failure) => ShopListState.error(failure: failure), (
        shops,
      ) {
        _shops = refresh ? shops : [..._shops, ...shops];
        return ShopListState.loaded(
          shops: _shops,
          currentPage: _currentPage,
          hasMore: shops.length >= 10,
        );
      });
    } catch (e) {
      state = ShopListState.error(
        failure: Failure.unknown(message: e.toString()),
      );
    }
  }

  /// Load more shops for pagination.
  Future<void> loadMoreAsync({String? search}) async {
    if (state is! ShopListLoaded) return;
    final currentState = state as ShopListLoaded;
    if (!currentState.hasMore) return;

    _currentPage++;
    await loadShopsAsync(search: search);
  }

  /// Refresh shop list.
  Future<void> refreshAsync({String? search}) async {
    await loadShopsAsync(search: search, refresh: true);
  }
}

/// Provider for shop list state.
final shopListStateProvider =
    StateNotifierProvider<ShopListNotifier, ShopListState>((ref) {
      final repository = ref.watch(shopRepositoryProvider);
      return ShopListNotifier(repository: repository);
    });

// ============================================================================
// Nearby Shops Provider
// ============================================================================

/// Provider for nearby shops.
final nearbyShopsProvider =
    FutureProvider.family<
      List<Shop>,
      ({double latitude, double longitude, double? maxKm})
    >((ref, params) async {
      final repository = ref.watch(shopRepositoryProvider);
      final result = await repository.getNearbyShops(
        latitude: params.latitude,
        longitude: params.longitude,
        maxKm: params.maxKm ?? 10,
      );

      return result.fold(
        (failure) => throw Exception(failure.userMessage),
        (shops) => shops,
      );
    });

// ============================================================================
// Shop Details Provider
// ============================================================================

/// Notifier for shop details state.
class ShopDetailsNotifier extends StateNotifier<ShopDetailsState> {
  ShopDetailsNotifier({required this.useCase})
    : super(const ShopDetailsState.initial());

  final GetShopDetailsUseCase useCase;

  /// Load shop details.
  Future<void> loadShopDetailsAsync(int shopId) async {
    try {
      state = const ShopDetailsState.loading();

      final result = await useCase(shopId);

      state = result.fold(
        (failure) => ShopDetailsState.error(failure: failure),
        (shop) => ShopDetailsState.loaded(shop: shop),
      );
    } catch (e) {
      state = ShopDetailsState.error(
        failure: Failure.unknown(message: e.toString()),
      );
    }
  }
}

/// Provider for shop details state.
final shopDetailsStateProvider =
    StateNotifierProvider.family<ShopDetailsNotifier, ShopDetailsState, int>((
      ref,
      shopId,
    ) {
      final useCase = ref.watch(getShopDetailsUseCaseProvider);
      final notifier = ShopDetailsNotifier(useCase: useCase);
      notifier.loadShopDetailsAsync(shopId);
      return notifier;
    });

/// Simple future provider for shop details.
final shopDetailsFutureProvider = FutureProvider.family<Shop, int>((
  ref,
  shopId,
) async {
  final useCase = ref.watch(getShopDetailsUseCaseProvider);
  final result = await useCase(shopId);

  return result.fold((failure) {
    throw failure;
  }, (shop) => shop);
});

// ============================================================================
// Shop Availability Provider
// ============================================================================

/// Provider for shop availability.
final shopAvailabilityProvider =
    FutureProvider.family<
      List<ShopDateAvailability>,
      ({int shopId, DateTime startDate, int? days})
    >((ref, params) async {
      final repository = ref.watch(shopRepositoryProvider);
      final result = await repository.getShopAvailability(
        shopId: params.shopId,
        startDate: params.startDate,
        days: params.days ?? 7,
      );

      return result.fold(
        (failure) => throw Exception(failure.userMessage),
        (availability) => availability,
      );
    });

// ============================================================================
// Selection State Providers
// ============================================================================

/// Notifier for selected services.
class SelectedServicesNotifier extends StateNotifier<Map<String, ShopService>> {
  SelectedServicesNotifier() : super({});

  void toggle(ShopService service) {
    final newState = Map<String, ShopService>.from(state);
    if (newState.containsKey(service.id)) {
      newState.remove(service.id);
    } else {
      newState[service.id] = service;
    }
    state = newState;
  }

  void clear() {
    state = {};
  }

  double get totalPrice => state.values.fold(0.0, (sum, s) => sum + s.price);

  int get count => state.length;
}

/// Provider for selected services.
final selectedShopServicesProvider =
    StateNotifierProvider<SelectedServicesNotifier, Map<String, ShopService>>((
      ref,
    ) {
      return SelectedServicesNotifier();
    });

/// Notifier for selected packages.
class SelectedPackagesNotifier extends StateNotifier<Map<String, ShopPackage>> {
  SelectedPackagesNotifier() : super({});

  void toggle(ShopPackage package) {
    final newState = Map<String, ShopPackage>.from(state);
    if (newState.containsKey(package.id)) {
      newState.remove(package.id);
    } else {
      newState[package.id] = package;
    }
    state = newState;
  }

  void clear() {
    state = {};
  }

  double get totalPrice => state.values.fold(0.0, (sum, p) => sum + p.price);

  int get count => state.length;
}

/// Provider for selected packages.
final selectedShopPackagesProvider =
    StateNotifierProvider<SelectedPackagesNotifier, Map<String, ShopPackage>>((
      ref,
    ) {
      return SelectedPackagesNotifier();
    });

/// Notifier for selected accessories.
class SelectedAccessoriesNotifier
    extends StateNotifier<Map<String, ShopAccessory>> {
  SelectedAccessoriesNotifier() : super({});

  void toggle(ShopAccessory accessory) {
    final newState = Map<String, ShopAccessory>.from(state);
    if (newState.containsKey(accessory.id)) {
      newState.remove(accessory.id);
    } else {
      newState[accessory.id] = accessory;
    }
    state = newState;
  }

  void clear() {
    state = {};
  }

  double get totalPrice => state.values.fold(0.0, (sum, a) => sum + a.price);

  int get count => state.length;
}

/// Provider for selected accessories.
final selectedShopAccessoriesProvider =
    StateNotifierProvider<
      SelectedAccessoriesNotifier,
      Map<String, ShopAccessory>
    >((ref) {
      return SelectedAccessoriesNotifier();
    });

/// Provider for selected vehicle type.
final selectedShopVehicleProvider = StateProvider<ShopVehicleType?>((ref) {
  return null;
});

/// Provider for total selected price.
final totalShopSelectionPriceProvider = Provider<double>((ref) {
  final services = ref.watch(selectedShopServicesProvider);
  final packages = ref.watch(selectedShopPackagesProvider);
  final accessories = ref.watch(selectedShopAccessoriesProvider);

  final servicesTotal = services.values.fold(0.0, (sum, s) => sum + s.price);
  final packagesTotal = packages.values.fold(0.0, (sum, p) => sum + p.price);
  final accessoriesTotal = accessories.values.fold(
    0.0,
    (sum, a) => sum + a.price,
  );

  return servicesTotal + packagesTotal + accessoriesTotal;
});

/// Provider for total selected items count.
final totalShopSelectionCountProvider = Provider<int>((ref) {
  final services = ref.watch(selectedShopServicesProvider);
  final packages = ref.watch(selectedShopPackagesProvider);
  final accessories = ref.watch(selectedShopAccessoriesProvider);

  return services.length + packages.length + accessories.length;
});

// ============================================================================
// Favorites Providers
// ============================================================================

/// Notifier for favorite shops.
class FavoriteShopsNotifier extends StateNotifier<FavoriteShopsState> {
  FavoriteShopsNotifier({required this.repository})
    : super(const FavoriteShopsState.initial());

  final ShopRepository repository;

  /// Load favorite shops.
  Future<void> loadFavoritesAsync() async {
    try {
      state = const FavoriteShopsState.loading();

      final result = await repository.getFavoriteShops();

      state = result.fold(
        (failure) => FavoriteShopsState.error(failure: failure),
        (shops) => FavoriteShopsState.loaded(shops: shops),
      );
    } catch (e) {
      state = FavoriteShopsState.error(
        failure: Failure.unknown(message: e.toString()),
      );
    }
  }

  /// Add shop to favorites.
  Future<bool> addToFavoritesAsync(int shopId) async {
    try {
      final result = await repository.addToFavorites(shopId);
      return result.isRight();
    } catch (_) {
      return false;
    }
  }

  /// Remove shop from favorites.
  Future<bool> removeFromFavoritesAsync(int shopId) async {
    try {
      final result = await repository.removeFromFavorites(shopId);
      if (result.isRight()) {
        await loadFavoritesAsync();
      }
      return result.isRight();
    } catch (_) {
      return false;
    }
  }
}

/// Provider for favorite shops state.
final favoriteShopsStateProvider =
    StateNotifierProvider<FavoriteShopsNotifier, FavoriteShopsState>((ref) {
      final repository = ref.watch(shopRepositoryProvider);
      return FavoriteShopsNotifier(repository: repository);
    });

// ============================================================================
// UI State Providers
// ============================================================================

/// Provider for current shop detail tab.
/// Uses ShopTab enum from domain layer.
final shopDetailTabProvider = StateProvider<ShopTab>((ref) {
  return ShopTab.services;
});

/// Provider for shop search query.
final shopSearchQueryProvider = StateProvider<String>((ref) {
  return '';
});
