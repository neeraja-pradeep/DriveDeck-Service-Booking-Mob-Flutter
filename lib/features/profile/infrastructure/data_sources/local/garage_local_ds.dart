import '../../../domain/entities/vehicle.dart';
import '../../../../../core/network/api_client.dart';
import '../../../../../core/network/endpoints.dart';

/// Local data source for garage/vehicles.
abstract class GarageLocalDataSource {
  /// Get cached vehicles.
  Future<List<Vehicle>> getVehicles();

  /// Save vehicles to cache.
  Future<void> saveVehicles(List<Vehicle> vehicles);

  /// Add vehicle to cache.
  Future<void> addVehicle(Vehicle vehicle);

  /// Remove vehicle from cache.
  Future<void> removeVehicle(String vehicleId);

  /// Clear cache.
  Future<void> clearCache();
}

/// Implementation of GarageLocalDataSource with API calls.
/// Uses actual API endpoints - returns empty list if no vehicles exist.
class GarageLocalDataSourceImpl implements GarageLocalDataSource {
  GarageLocalDataSourceImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<List<Vehicle>> getVehicles() async {
    try {
      final response = await _apiClient.get<List<dynamic>>(
        Endpoints.userVehicles(),
      );

      if (response.statusCode == 200 && response.data != null) {
        final vehicles = (response.data as List)
            .map((v) => Vehicle.fromJson(v as Map<String, dynamic>))
            .toList();
        return vehicles;
      }
      // Return empty list if no data or non-200 status
      return [];
    } catch (e) {
      // Handle 404 gracefully - endpoint not yet implemented on backend
      // Return empty list to show empty state in UI instead of error
      if (e.toString().contains('404')) {
        return [];
      }
      // Rethrow other errors to let the UI handle them
      rethrow;
    }
  }

  @override
  Future<void> saveVehicles(List<Vehicle> vehicles) async {
    // Not used - individual operations handle updates
  }

  @override
  Future<void> addVehicle(Vehicle vehicle) async {
    try {
      await _apiClient.post(Endpoints.createVehicle(), data: vehicle.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeVehicle(String vehicleId) async {
    try {
      await _apiClient.delete(Endpoints.deleteVehicle(vehicleId));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> clearCache() async {
    // Cache clearing not applicable for API calls
  }
}
