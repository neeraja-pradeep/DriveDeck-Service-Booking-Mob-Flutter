import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/shop_service.dart';
import '../../domain/entities/shop_tab.dart';
import '../../domain/entities/vehicle_type.dart';
import '../states/services_state.dart';
import '../states/shop_detail_state.dart';
import '../states/shop_state.dart';
import 'shop_providers.dart';

/// Notifier for managing shop detail state.
class ShopDetailNotifier extends StateNotifier<ShopDetailState> {
  final Ref _ref;
  final String _shopId;

  ShopDetailNotifier(this._ref, this._shopId) : super(ShopDetailState.initial());

  /// Initializes the shop detail screen.
  Future<void> initialize() async {
    await _fetchShopDetails();
    await _fetchServices();
  }

  /// Fetches shop details with conditional caching.
  Future<void> _fetchShopDetails() async {
    // Get cached data first
    final localDataSource = _ref.read(shopLocalDataSourceProvider);
    final cached = await localDataSource.getShopDetails(_shopId);

    if (cached != null) {
      state = state.copyWith(
        shopState: ShopState.loaded(cached.data, fromCache: true),
      );
    } else {
      state = state.copyWith(shopState: const ShopState.loading());
    }

    // Fetch from API with conditional request
    final lastModified = cached?.lastModified;
    final usecase = _ref.read(getShopDetailsUsecaseProvider);
    final result = await usecase(_shopId, lastModified);

    result.fold(
      (failure) {
        if (cached == null) {
          state = state.copyWith(shopState: ShopState.error(failure));
        }
        // Keep showing cache on error if available
      },
      (newData) {
        if (newData != null) {
          state = state.copyWith(
            shopState: ShopState.loaded(newData.data, fromCache: false),
          );
          // Update booking flow state with shop
          _ref.read(bookingFlowStateProvider.notifier).setShop(newData.data);
        }
      },
    );
  }

  /// Fetches services for the selected vehicle type.
  Future<void> _fetchServices() async {
    state = state.copyWith(servicesState: const ServicesState.loading());

    final usecase = _ref.read(getShopServicesUsecaseProvider);
    final result = await usecase(_shopId, state.selectedVehicleType);

    result.fold(
      (failure) => state = state.copyWith(
        servicesState: ServicesState.error(failure),
      ),
      (services) => state = state.copyWith(
        servicesState: ServicesState.loaded(services),
      ),
    );
  }

  /// Selects a vehicle type and refetches services.
  void selectVehicleType(VehicleType type) {
    state = state.copyWith(
      selectedVehicleType: type,
      selectedServiceIds: {}, // Clear selections when vehicle changes
    );
    _ref.read(bookingFlowStateProvider.notifier).setVehicleType(type);
    _fetchServices();
  }

  /// Toggles service selection.
  void toggleServiceSelection(String serviceId) {
    final current = Set<String>.from(state.selectedServiceIds);
    if (current.contains(serviceId)) {
      current.remove(serviceId);
    } else {
      current.add(serviceId);
    }
    state = state.copyWith(selectedServiceIds: current);
  }

  /// Selects a tab.
  void selectTab(ShopTab tab) {
    state = state.copyWith(selectedTab: tab);
  }

  /// Prepares data for proceeding to date selection.
  void proceedToDateSelection() {
    final selectedServices = state.servicesState.maybeMap(
      loaded: (s) => s.services
          .where((svc) => state.selectedServiceIds.contains(svc.id))
          .toList(),
      orElse: () => <ShopService>[],
    );
    _ref.read(bookingFlowStateProvider.notifier).setSelectedServices(selectedServices);
  }

  /// Refreshes shop details.
  Future<void> refresh() async {
    await _fetchShopDetails();
    await _fetchServices();
  }
}
