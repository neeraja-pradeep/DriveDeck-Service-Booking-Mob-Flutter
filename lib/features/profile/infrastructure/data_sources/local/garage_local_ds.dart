import '../../../domain/entities/vehicle.dart';

/// Local data source for garage/vehicles (in-memory cache).
abstract class GarageLocalDataSource {
  /// Get cached vehicles.
  Future<List<Vehicle>?> getVehicles();

  /// Save vehicles to cache.
  Future<void> saveVehicles(List<Vehicle> vehicles);

  /// Add vehicle to cache.
  Future<void> addVehicleToCache(Vehicle vehicle);

  /// Update vehicle in cache.
  Future<void> updateVehicleInCache(Vehicle vehicle);

  /// Remove vehicle from cache.
  Future<void> removeVehicleFromCache(String vehicleId);

  /// Clear cache.
  Future<void> clearCache();
}

/// Implementation of GarageLocalDataSource with in-memory cache.
class GarageLocalDataSourceImpl implements GarageLocalDataSource {
  GarageLocalDataSourceImpl();

  List<Vehicle>? _cachedVehicles;

  @override
  Future<List<Vehicle>?> getVehicles() async {
    return _cachedVehicles;
  }

  @override
  Future<void> saveVehicles(List<Vehicle> vehicles) async {
    _cachedVehicles = List.from(vehicles);
  }

  @override
  Future<void> addVehicleToCache(Vehicle vehicle) async {
    _cachedVehicles ??= [];

    // If this is a default vehicle, update others
    if (vehicle.isDefault) {
      _cachedVehicles = _cachedVehicles!
          .map((v) => v.isDefault ? v.copyWith(isDefault: false) : v)
          .toList();
    }

    _cachedVehicles!.add(vehicle);
  }

  @override
  Future<void> updateVehicleInCache(Vehicle vehicle) async {
    if (_cachedVehicles == null) return;

    final index = _cachedVehicles!.indexWhere((v) => v.id == vehicle.id);
    if (index != -1) {
      _cachedVehicles![index] = vehicle;
    }
  }

  @override
  Future<void> removeVehicleFromCache(String vehicleId) async {
    _cachedVehicles?.removeWhere((v) => v.id == vehicleId);
  }

  @override
  Future<void> clearCache() async {
    _cachedVehicles = null;
  }
}
