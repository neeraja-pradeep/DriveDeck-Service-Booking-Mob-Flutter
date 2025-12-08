import '../../../domain/entities/vehicle.dart';

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

/// Implementation of GarageLocalDataSource with mock data.
class GarageLocalDataSourceImpl implements GarageLocalDataSource {
  GarageLocalDataSourceImpl();

  // In-memory storage for demo purposes
  List<Vehicle> _vehicles = [];
  bool _initialized = false;

  /// Initialize with mock data.
  void _initializeMockData() {
    if (_initialized) return;
    _initialized = true;

    _vehicles = [
      Vehicle(
        id: '1',
        make: 'BMW',
        model: '3 Series',
        year: 2022,
        licensePlate: 'KL-10-A-2022-BMW 3ari',
        vehicleType: GarageVehicleType.sedan,
        imageUrl: 'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=400',
        isDefault: true,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
      Vehicle(
        id: '2',
        make: 'Ford',
        model: 'Endeavour',
        year: 2021,
        licensePlate: 'KL-51-A-1542-FordEndeavour',
        vehicleType: GarageVehicleType.suv,
        imageUrl: 'https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?w=400',
        isDefault: false,
        createdAt: DateTime.now().subtract(const Duration(days: 60)),
      ),
    ];
  }

  @override
  Future<List<Vehicle>> getVehicles() async {
    _initializeMockData();
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return List.from(_vehicles);
  }

  @override
  Future<void> saveVehicles(List<Vehicle> vehicles) async {
    _vehicles = List.from(vehicles);
  }

  @override
  Future<void> addVehicle(Vehicle vehicle) async {
    _vehicles.add(vehicle);
  }

  @override
  Future<void> removeVehicle(String vehicleId) async {
    _vehicles.removeWhere((v) => v.id == vehicleId);
  }

  @override
  Future<void> clearCache() async {
    _vehicles.clear();
    _initialized = false;
  }
}
