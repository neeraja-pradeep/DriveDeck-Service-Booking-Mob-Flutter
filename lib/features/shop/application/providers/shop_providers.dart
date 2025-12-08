import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/shop.dart';
import '../../domain/repositories/shop_repository.dart';
import '../../infrastructure/data_sources/local/shop_local_ds.dart';
import '../../infrastructure/data_sources/remote/shop_api.dart';
import '../../infrastructure/repositories/shop_repository_impl.dart';
import '../states/shop_state.dart';

// ============================================================================
// Data Source Providers
// ============================================================================

/// Provider for shop local data source.
final shopLocalDataSourceProvider = Provider<ShopLocalDataSource>((ref) {
  return ShopLocalDataSource();
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
  final localDataSource = ref.watch(shopLocalDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);

  return ShopRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    networkInfo: networkInfo,
  );
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
  Future<void> loadShops({String? search, bool refresh = false}) async {
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

    state = result.fold(
      (failure) => ShopListState.error(failure: failure),
      (shops) {
        _shops = refresh ? shops : [..._shops, ...shops];
        return ShopListState.loaded(
          shops: _shops,
          currentPage: _currentPage,
          hasMore: shops.length >= 10,
        );
      },
    );
  }

  /// Load more shops for pagination.
  Future<void> loadMore({String? search}) async {
    if (state is! ShopListLoaded) return;
    final currentState = state as ShopListLoaded;
    if (!currentState.hasMore) return;

    _currentPage++;
    await loadShops(search: search);
  }

  /// Refresh shop list.
  Future<void> refresh({String? search}) async {
    await loadShops(search: search, refresh: true);
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
final nearbyShopsProvider = FutureProvider.family<List<Shop>, ({
  double latitude,
  double longitude,
  double? maxKm,
})>((ref, params) async {
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
  ShopDetailsNotifier({required this.repository})
      : super(const ShopDetailsState.initial());

  final ShopRepository repository;

  /// Load shop details.
  Future<void> loadShopDetails(int shopId) async {
    state = const ShopDetailsState.loading();

    final result = await repository.getShopDetails(shopId);

    state = result.fold(
      (failure) => ShopDetailsState.error(failure: failure),
      (shop) => ShopDetailsState.loaded(shop: shop),
    );
  }
}

/// Provider for shop details state.
final shopDetailsStateProvider =
    StateNotifierProvider.family<ShopDetailsNotifier, ShopDetailsState, int>((
  ref,
  shopId,
) {
  final repository = ref.watch(shopRepositoryProvider);
  final notifier = ShopDetailsNotifier(repository: repository);
  notifier.loadShopDetails(shopId);
  return notifier;
});

/// Simple future provider for shop details.
final shopDetailsFutureProvider =
    FutureProvider.family<Shop, int>((ref, shopId) async {
  final repository = ref.watch(shopRepositoryProvider);
  final result = await repository.getShopDetails(shopId);

  return result.fold(
    (failure) => throw Exception(failure.userMessage),
    (shop) => shop,
  );
});

// ============================================================================
// Shop Availability Provider
// ============================================================================

/// Provider for shop availability.
final shopAvailabilityProvider = FutureProvider.family<
    List<ShopDateAvailability>,
    ({int shopId, DateTime startDate, int? days})>((ref, params) async {
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

  double get totalPrice =>
      state.values.fold(0.0, (sum, s) => sum + s.price);

  int get count => state.length;
}

/// Provider for selected services.
final selectedShopServicesProvider =
    StateNotifierProvider<SelectedServicesNotifier, Map<String, ShopService>>(
        (ref) {
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

  double get totalPrice =>
      state.values.fold(0.0, (sum, p) => sum + p.price);

  int get count => state.length;
}

/// Provider for selected packages.
final selectedShopPackagesProvider =
    StateNotifierProvider<SelectedPackagesNotifier, Map<String, ShopPackage>>(
        (ref) {
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

  double get totalPrice =>
      state.values.fold(0.0, (sum, a) => sum + a.price);

  int get count => state.length;
}

/// Provider for selected accessories.
final selectedShopAccessoriesProvider = StateNotifierProvider<
    SelectedAccessoriesNotifier, Map<String, ShopAccessory>>((ref) {
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

  final servicesTotal =
      services.values.fold(0.0, (sum, s) => sum + s.price);
  final packagesTotal =
      packages.values.fold(0.0, (sum, p) => sum + p.price);
  final accessoriesTotal =
      accessories.values.fold(0.0, (sum, a) => sum + a.price);

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
  Future<void> loadFavorites() async {
    state = const FavoriteShopsState.loading();

    final result = await repository.getFavoriteShops();

    state = result.fold(
      (failure) => FavoriteShopsState.error(failure: failure),
      (shops) => FavoriteShopsState.loaded(shops: shops),
    );
  }

  /// Add shop to favorites.
  Future<bool> addToFavorites(int shopId) async {
    final result = await repository.addToFavorites(shopId);
    return result.isRight();
  }

  /// Remove shop from favorites.
  Future<bool> removeFromFavorites(int shopId) async {
    final result = await repository.removeFromFavorites(shopId);
    if (result.isRight()) {
      await loadFavorites();
    }
    return result.isRight();
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

/// Enum for shop detail tabs.
enum ShopDetailTabType { services, packages, accessories }

/// Provider for current shop detail tab.
final shopDetailTabTypeProvider = StateProvider<ShopDetailTabType>((ref) {
  return ShopDetailTabType.services;
});

/// Provider for shop search query.
final shopSearchQueryProvider = StateProvider<String>((ref) {
  return '';
});
