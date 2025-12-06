import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/shop_details.dart';
import '../../infrastructure/data_sources/local/shop_details_local_ds.dart';

/// Enum for the different tabs in shop details screen.
enum ShopDetailTab { services, packages, accessories }

/// Provider for shop details data source.
final shopDetailsDataSourceProvider = Provider<ShopDetailsLocalDataSource>((
  ref,
) {
  return ShopDetailsLocalDataSource();
});

/// Provider for fetching shop details.
final shopDetailsProvider = FutureProvider.family<ShopDetails, String>((
  ref,
  shopId,
) async {
  final dataSource = ref.read(shopDetailsDataSourceProvider);
  return dataSource.getShopDetails(shopId);
});

/// Provider for current active tab.
final shopDetailTabProvider = StateProvider<ShopDetailTab>((ref) {
  return ShopDetailTab.services;
});

/// Provider for current image index in carousel.
final shopImageIndexProvider = StateProvider<int>((ref) => 0);

/// State notifier for managing selected services.
class SelectedServicesNotifier extends StateNotifier<Map<String, Service>> {
  SelectedServicesNotifier() : super({});

  void toggleService(Service service) {
    final newState = Map<String, Service>.from(state);
    if (newState.containsKey(service.id)) {
      newState.remove(service.id);
    } else {
      newState[service.id] = service.copyWith(isSelected: true);
    }
    state = newState;
  }

  bool isSelected(String serviceId) {
    return state.containsKey(serviceId);
  }

  void initializeServices(List<Service> services) {
    final initialState = <String, Service>{};
    for (final service in services) {
      if (service.isSelected) {
        initialState[service.id] = service;
      }
    }
    state = initialState;
  }

  void clearSelection() {
    state = {};
  }

  double get totalPrice {
    return state.values.fold(0.0, (sum, service) => sum + service.price);
  }

  int get selectedCount => state.length;

  List<Service> get selectedServices => state.values.toList();
}

/// Provider for selected services state.
final selectedServicesProvider =
    StateNotifierProvider<SelectedServicesNotifier, Map<String, Service>>((
      ref,
    ) {
      return SelectedServicesNotifier();
    });

/// State notifier for managing selected packages.
class SelectedPackagesNotifier extends StateNotifier<Map<String, Package>> {
  SelectedPackagesNotifier() : super({});

  void togglePackage(Package package) {
    final newState = Map<String, Package>.from(state);
    if (newState.containsKey(package.id)) {
      newState.remove(package.id);
    } else {
      newState[package.id] = package.copyWith(isSelected: true);
    }
    state = newState;
  }

  bool isSelected(String packageId) {
    return state.containsKey(packageId);
  }

  void clearSelection() {
    state = {};
  }

  double get totalPrice {
    return state.values.fold(0.0, (sum, package) => sum + package.price);
  }

  int get selectedCount => state.length;
}

/// Provider for selected packages state.
final selectedPackagesProvider =
    StateNotifierProvider<SelectedPackagesNotifier, Map<String, Package>>((
      ref,
    ) {
      return SelectedPackagesNotifier();
    });

/// State notifier for managing selected accessories.
class SelectedAccessoriesNotifier
    extends StateNotifier<Map<String, Accessory>> {
  SelectedAccessoriesNotifier() : super({});

  void toggleAccessory(Accessory accessory) {
    final newState = Map<String, Accessory>.from(state);
    if (newState.containsKey(accessory.id)) {
      newState.remove(accessory.id);
    } else {
      newState[accessory.id] = accessory.copyWith(isSelected: true);
    }
    state = newState;
  }

  bool isSelected(String accessoryId) {
    return state.containsKey(accessoryId);
  }

  void clearSelection() {
    state = {};
  }

  double get totalPrice {
    return state.values.fold(0.0, (sum, accessory) => sum + accessory.price);
  }

  int get selectedCount => state.length;
}

/// Provider for selected accessories state.
final selectedAccessoriesProvider =
    StateNotifierProvider<SelectedAccessoriesNotifier, Map<String, Accessory>>((
      ref,
    ) {
      return SelectedAccessoriesNotifier();
    });

/// State notifier for managing selected vehicle type.
class SelectedVehicleNotifier extends StateNotifier<VehicleType?> {
  SelectedVehicleNotifier() : super(null);

  void selectVehicle(VehicleType vehicle) {
    state = vehicle;
  }

  void clearSelection() {
    state = null;
  }
}

/// Provider for selected vehicle type.
final selectedVehicleProvider =
    StateNotifierProvider<SelectedVehicleNotifier, VehicleType?>((ref) {
      return SelectedVehicleNotifier();
    });

/// Provider for total price calculation.
final totalSelectedPriceProvider = Provider<double>((ref) {
  final services = ref.watch(selectedServicesProvider);
  final packages = ref.watch(selectedPackagesProvider);
  final accessories = ref.watch(selectedAccessoriesProvider);

  final servicesTotal =
      services.values.fold(0.0, (sum, s) => sum + s.price);
  final packagesTotal =
      packages.values.fold(0.0, (sum, p) => sum + p.price);
  final accessoriesTotal =
      accessories.values.fold(0.0, (sum, a) => sum + a.price);

  return servicesTotal + packagesTotal + accessoriesTotal;
});

/// Provider for total selected items count.
final totalSelectedCountProvider = Provider<int>((ref) {
  final services = ref.watch(selectedServicesProvider);
  final packages = ref.watch(selectedPackagesProvider);
  final accessories = ref.watch(selectedAccessoriesProvider);

  return services.length + packages.length + accessories.length;
});
