import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/shop_details.dart';
import '../../infrastructure/data_sources/local/shop_details_local_ds.dart';

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

/// State notifier for managing selected services.
class SelectedServicesNotifier extends StateNotifier<List<Service>> {
  SelectedServicesNotifier() : super([]);

  void toggleService(Service service) {
    final updatedService = service.copyWith(isSelected: !service.isSelected);

    if (state.any((s) => s.id == service.id)) {
      // Update existing service
      state = state
          .map((s) => s.id == service.id ? updatedService : s)
          .toList();
    } else {
      // Add new service
      state = [...state, updatedService];
    }
  }

  void initializeServices(List<Service> services) {
    state = services.where((service) => service.isSelected).toList();
  }

  double get totalPrice {
    return state.fold(0.0, (sum, service) => sum + service.price);
  }

  int get selectedCount => state.length;
}

/// Provider for selected services state.
final selectedServicesProvider =
    StateNotifierProvider<SelectedServicesNotifier, List<Service>>((ref) {
      return SelectedServicesNotifier();
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
