import 'package:flutter/foundation.dart';

import '../../../../../core/network/api_client.dart';
import '../../../../../core/network/endpoints.dart';
import '../../models/vehicle_model.dart';

/// Abstract class for garage API operations.
abstract class GarageApi {
  /// Get all vehicles for the current user.
  Future<List<VehicleModel>> getVehicles();

  /// Add a new vehicle.
  Future<VehicleModel> addVehicle(Map<String, dynamic> request);

  /// Update an existing vehicle.
  Future<VehicleModel> updateVehicle(
    int vehicleId,
    Map<String, dynamic> request,
  );

  /// Delete a vehicle.
  Future<void> deleteVehicle(int vehicleId);

  /// Set a vehicle as favourite.
  Future<VehicleModel> setFavouriteVehicle(int vehicleId);
}

/// Implementation of garage API.
class GarageApiImpl implements GarageApi {
  GarageApiImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<List<VehicleModel>> getVehicles() async {
    debugPrint('🚗 GarageApi: Fetching vehicles...');
    final response = await _apiClient.get(Endpoints.userVehicles());

    final List<dynamic> data = response.data is List
        ? response.data
        : (response.data['results'] as List<dynamic>? ?? []);
    debugPrint('🚗 GarageApi: Received ${data.length} vehicles');

    return data
        .map((json) => VehicleModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<VehicleModel> addVehicle(Map<String, dynamic> request) async {
    debugPrint('🚗 GarageApi: Adding vehicle: $request');
    final response = await _apiClient.post(
      Endpoints.createVehicle(),
      data: request,
    );

    debugPrint('🚗 GarageApi: Vehicle added successfully');
    return VehicleModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<VehicleModel> updateVehicle(
    int vehicleId,
    Map<String, dynamic> request,
  ) async {
    debugPrint('🚗 GarageApi: Updating vehicle $vehicleId: $request');
    final response = await _apiClient.put(
      Endpoints.vehicleById(vehicleId),
      data: request,
    );

    debugPrint('🚗 GarageApi: Vehicle updated successfully');
    return VehicleModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> deleteVehicle(int vehicleId) async {
    debugPrint('🚗 GarageApi: Deleting vehicle $vehicleId');
    await _apiClient.delete(Endpoints.vehicleById(vehicleId));
    debugPrint('🚗 GarageApi: Vehicle deleted successfully');
  }

  @override
  Future<VehicleModel> setFavouriteVehicle(int vehicleId) async {
    debugPrint('🚗 GarageApi: Setting vehicle $vehicleId as favourite');
    final response = await _apiClient.patch(
      '${Endpoints.vehicleById(vehicleId)}set-favourite/',
    );

    debugPrint('🚗 GarageApi: Favourite vehicle set successfully');
    return VehicleModel.fromJson(response.data as Map<String, dynamic>);
  }
}
