import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/vehicle.dart';
import '../../infrastructure/data_sources/local/garage_local_ds.dart';

/// Provider for garage local data source.
final garageLocalDataSourceProvider = Provider<GarageLocalDataSource>((ref) {
  return GarageLocalDataSourceImpl();
});

/// State for garage screen.
sealed class GarageState {
  const GarageState();
}

class GarageInitial extends GarageState {
  const GarageInitial();
}

class GarageLoading extends GarageState {
  const GarageLoading();
}

class GarageLoaded extends GarageState {
  const GarageLoaded(this.vehicles);
  final List<Vehicle> vehicles;
}

class GarageError extends GarageState {
  const GarageError(this.message);
  final String message;
}

/// Notifier for garage state management.
class GarageNotifier extends StateNotifier<GarageState> {
  GarageNotifier(this._dataSource) : super(const GarageInitial());

  final GarageLocalDataSource _dataSource;

  /// Initialize and load vehicles.
  Future<void> initialize() async {
    state = const GarageLoading();

    try {
      final vehicles = await _dataSource.getVehicles();
      state = GarageLoaded(vehicles);
    } catch (e) {
      state = GarageError(e.toString());
    }
  }

  /// Refresh vehicles list.
  Future<void> refresh() async {
    try {
      final vehicles = await _dataSource.getVehicles();
      state = GarageLoaded(vehicles);
    } catch (e) {
      state = GarageError(e.toString());
    }
  }

  /// Delete a vehicle.
  Future<void> deleteVehicle(String vehicleId) async {
    final currentState = state;
    if (currentState is GarageLoaded) {
      try {
        await _dataSource.removeVehicle(vehicleId);
        final updatedVehicles =
            currentState.vehicles.where((v) => v.id != vehicleId).toList();
        state = GarageLoaded(updatedVehicles);
      } catch (e) {
        state = GarageError(e.toString());
      }
    }
  }

  /// Set a vehicle as default.
  Future<void> setDefaultVehicle(String vehicleId) async {
    final currentState = state;
    if (currentState is GarageLoaded) {
      final updatedVehicles = currentState.vehicles.map((v) {
        if (v.id == vehicleId) {
          return v.copyWith(isDefault: true);
        }
        return v.copyWith(isDefault: false);
      }).toList();

      await _dataSource.saveVehicles(updatedVehicles);
      state = GarageLoaded(updatedVehicles);
    }
  }

  /// Add a new vehicle.
  Future<void> addVehicle(Vehicle vehicle) async {
    final currentState = state;
    if (currentState is GarageLoaded) {
      // If new vehicle is default, update others
      List<Vehicle> updatedVehicles;
      if (vehicle.isDefault) {
        updatedVehicles = currentState.vehicles
            .map((v) => v.copyWith(isDefault: false))
            .toList();
      } else {
        updatedVehicles = List.from(currentState.vehicles);
      }
      updatedVehicles.add(vehicle);

      await _dataSource.saveVehicles(updatedVehicles);
      state = GarageLoaded(updatedVehicles);
    }
  }
}

/// Provider for garage state.
final garageStateProvider =
    StateNotifierProvider<GarageNotifier, GarageState>((ref) {
  final dataSource = ref.watch(garageLocalDataSourceProvider);
  return GarageNotifier(dataSource);
});

/// Provider for search query in garage.
final garageSearchQueryProvider = StateProvider<String>((ref) => '');

/// Provider for filtered vehicles based on search.
final filteredVehiclesProvider = Provider<List<Vehicle>>((ref) {
  final garageState = ref.watch(garageStateProvider);
  final searchQuery = ref.watch(garageSearchQueryProvider);

  if (garageState is! GarageLoaded) return [];

  if (searchQuery.isEmpty) return garageState.vehicles;

  final query = searchQuery.toLowerCase();
  return garageState.vehicles.where((vehicle) {
    return vehicle.make.toLowerCase().contains(query) ||
        vehicle.model.toLowerCase().contains(query) ||
        (vehicle.licensePlate?.toLowerCase().contains(query) ?? false);
  }).toList();
});
