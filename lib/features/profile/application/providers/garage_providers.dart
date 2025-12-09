import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/application/providers/auth_providers.dart';
import '../../domain/entities/vehicle.dart';
import '../../domain/repositories/garage_repository.dart';
import '../../infrastructure/data_sources/local/garage_local_ds.dart';
import '../../infrastructure/data_sources/remote/garage_api.dart';
import '../../infrastructure/repositories/garage_repository_impl.dart';
import '../usecases/add_vehicle_usecase.dart';
import '../usecases/delete_vehicle_usecase.dart';
import '../usecases/get_vehicles_usecase.dart';
import '../usecases/set_default_vehicle_usecase.dart';

/// Provider for garage local data source.
final garageLocalDataSourceProvider = Provider<GarageLocalDataSource>((ref) {
  return GarageLocalDataSourceImpl();
});

/// Provider for garage API.
final garageApiProvider = Provider<GarageApi>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return GarageApiImpl(apiClient);
});

/// Provider for garage repository.
final garageRepositoryProvider = Provider<GarageRepository>((ref) {
  final garageApi = ref.watch(garageApiProvider);
  final localDataSource = ref.watch(garageLocalDataSourceProvider);
  return GarageRepositoryImpl(
    garageApi: garageApi,
    localDataSource: localDataSource,
  );
});

/// Provider for get vehicles use case.
final getVehiclesUsecaseProvider = Provider<GetVehiclesUsecase>((ref) {
  final repository = ref.watch(garageRepositoryProvider);
  return GetVehiclesUsecase(repository);
});

/// Provider for add vehicle use case.
final addVehicleUsecaseProvider = Provider<AddVehicleUsecase>((ref) {
  final repository = ref.watch(garageRepositoryProvider);
  return AddVehicleUsecase(repository);
});

/// Provider for delete vehicle use case.
final deleteVehicleUsecaseProvider = Provider<DeleteVehicleUsecase>((ref) {
  final repository = ref.watch(garageRepositoryProvider);
  return DeleteVehicleUsecase(repository);
});

/// Provider for set default vehicle use case.
final setDefaultVehicleUsecaseProvider = Provider<SetDefaultVehicleUsecase>((ref) {
  final repository = ref.watch(garageRepositoryProvider);
  return SetDefaultVehicleUsecase(repository);
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

/// State for add vehicle operation.
sealed class AddVehicleState {
  const AddVehicleState();
}

class AddVehicleInitial extends AddVehicleState {
  const AddVehicleInitial();
}

class AddVehicleLoading extends AddVehicleState {
  const AddVehicleLoading();
}

class AddVehicleSuccess extends AddVehicleState {
  const AddVehicleSuccess(this.vehicle);
  final Vehicle vehicle;
}

class AddVehicleError extends AddVehicleState {
  const AddVehicleError(this.message);
  final String message;
}

/// Notifier for garage state management.
class GarageNotifier extends StateNotifier<GarageState> {
  GarageNotifier(this._ref) : super(const GarageInitial());

  final Ref _ref;

  /// Initialize and load vehicles.
  Future<void> initialize() async {
    state = const GarageLoading();

    final result = await _ref.read(getVehiclesUsecaseProvider).call();
    result.fold(
      (failure) => state = GarageError(failure.message),
      (vehicles) => state = GarageLoaded(vehicles),
    );
  }

  /// Refresh vehicles list.
  Future<void> refresh() async {
    final result = await _ref.read(getVehiclesUsecaseProvider).call();
    result.fold(
      (failure) => state = GarageError(failure.message),
      (vehicles) => state = GarageLoaded(vehicles),
    );
  }

  /// Delete a vehicle.
  Future<bool> deleteVehicle(String vehicleId) async {
    final result = await _ref.read(deleteVehicleUsecaseProvider).call(vehicleId);
    return result.fold(
      (failure) {
        return false;
      },
      (_) {
        // Update local state
        final currentState = state;
        if (currentState is GarageLoaded) {
          final updatedVehicles = currentState.vehicles
              .where((v) => v.id != vehicleId)
              .toList();
          state = GarageLoaded(updatedVehicles);
        }
        return true;
      },
    );
  }

  /// Set a vehicle as default.
  Future<bool> setDefaultVehicle(String vehicleId) async {
    final result = await _ref.read(setDefaultVehicleUsecaseProvider).call(vehicleId);
    return result.fold(
      (failure) {
        return false;
      },
      (updatedVehicle) {
        // Update local state
        final currentState = state;
        if (currentState is GarageLoaded) {
          final updatedVehicles = currentState.vehicles.map((v) {
            if (v.id == vehicleId) {
              return updatedVehicle;
            }
            return v.copyWith(isDefault: false);
          }).toList();
          state = GarageLoaded(updatedVehicles);
        }
        return true;
      },
    );
  }

  /// Add a vehicle to the list.
  void addVehicleToList(Vehicle vehicle) {
    final currentState = state;
    if (currentState is GarageLoaded) {
      List<Vehicle> updatedVehicles;
      if (vehicle.isDefault) {
        updatedVehicles = currentState.vehicles
            .map((v) => v.copyWith(isDefault: false))
            .toList();
      } else {
        updatedVehicles = List.from(currentState.vehicles);
      }
      updatedVehicles.add(vehicle);
      state = GarageLoaded(updatedVehicles);
    } else {
      state = GarageLoaded([vehicle]);
    }
  }
}

/// Notifier for add vehicle operation.
class AddVehicleNotifier extends StateNotifier<AddVehicleState> {
  AddVehicleNotifier(this._ref) : super(const AddVehicleInitial());

  final Ref _ref;

  /// Reset to initial state.
  void reset() {
    state = const AddVehicleInitial();
  }

  /// Add a new vehicle.
  Future<bool> addVehicle(AddVehicleRequest request) async {
    state = const AddVehicleLoading();

    final result = await _ref.read(addVehicleUsecaseProvider).call(request);
    return result.fold(
      (failure) {
        state = AddVehicleError(failure.message);
        return false;
      },
      (vehicle) {
        state = AddVehicleSuccess(vehicle);
        // Add to garage list
        _ref.read(garageStateProvider.notifier).addVehicleToList(vehicle);
        return true;
      },
    );
  }
}

/// Provider for garage state.
final garageStateProvider = StateNotifierProvider<GarageNotifier, GarageState>((
  ref,
) {
  return GarageNotifier(ref);
});

/// Provider for add vehicle state.
final addVehicleStateProvider = StateNotifierProvider<AddVehicleNotifier, AddVehicleState>((
  ref,
) {
  return AddVehicleNotifier(ref);
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

/// Provider for default vehicle.
final defaultVehicleProvider = Provider<Vehicle?>((ref) {
  final garageState = ref.watch(garageStateProvider);
  if (garageState is! GarageLoaded) return null;
  return garageState.vehicles.where((v) => v.isDefault).firstOrNull;
});
