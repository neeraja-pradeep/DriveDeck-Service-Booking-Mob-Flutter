import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/vehicle.dart';
import '../../domain/repositories/garage_repository.dart';
import '../data_sources/local/garage_local_ds.dart';
import '../data_sources/remote/garage_api.dart';

/// Implementation of GarageRepository.
class GarageRepositoryImpl implements GarageRepository {
  GarageRepositoryImpl({
    required this.garageApi,
    required this.localDataSource,
  });

  final GarageApi garageApi;
  final GarageLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<Vehicle>>> getVehicles() async {
    try {
      debugPrint('🚗 GarageRepository: Getting vehicles...');

      // Try to get from cache first
      final cachedVehicles = await localDataSource.getVehicles();
      if (cachedVehicles != null && cachedVehicles.isNotEmpty) {
        debugPrint('🚗 GarageRepository: Found ${cachedVehicles.length} cached vehicles');
      }

      // Fetch from API
      final vehicleModels = await garageApi.getVehicles();
      final vehicles = vehicleModels.map((m) => m.toDomain()).toList();

      // Cache the results
      await localDataSource.saveVehicles(vehicles);
      debugPrint('🚗 GarageRepository: Fetched and cached ${vehicles.length} vehicles');

      return Right(vehicles);
    } on DioException catch (e) {
      debugPrint('🚗 GarageRepository: DioException: ${e.message}');

      // Try to return cached data on network error
      final cachedVehicles = await localDataSource.getVehicles();
      if (cachedVehicles != null && cachedVehicles.isNotEmpty) {
        debugPrint('🚗 GarageRepository: Returning cached vehicles due to network error');
        return Right(cachedVehicles);
      }

      return Left(Failure.network(message: e.message ?? 'Network error'));
    } catch (e) {
      debugPrint('🚗 GarageRepository: Error: $e');
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Vehicle>> addVehicle(AddVehicleRequest request) async {
    try {
      debugPrint('🚗 GarageRepository: Adding vehicle...');
      final vehicleModel = await garageApi.addVehicle(request.toJson());
      final vehicle = vehicleModel.toDomain();

      // Update cache
      await localDataSource.addVehicleToCache(vehicle);
      debugPrint('🚗 GarageRepository: Vehicle added successfully');

      return Right(vehicle);
    } on DioException catch (e) {
      debugPrint('🚗 GarageRepository: DioException: ${e.message}');
      final message = _extractErrorMessage(e);
      return Left(Failure.server(message: message));
    } catch (e) {
      debugPrint('🚗 GarageRepository: Error: $e');
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Vehicle>> updateVehicle(
    String vehicleId,
    AddVehicleRequest request,
  ) async {
    try {
      debugPrint('🚗 GarageRepository: Updating vehicle $vehicleId...');
      final vehicleModel = await garageApi.updateVehicle(
        vehicleId,
        request.toJson(),
      );
      final vehicle = vehicleModel.toDomain();

      // Update cache
      await localDataSource.updateVehicleInCache(vehicle);
      debugPrint('🚗 GarageRepository: Vehicle updated successfully');

      return Right(vehicle);
    } on DioException catch (e) {
      debugPrint('🚗 GarageRepository: DioException: ${e.message}');
      final message = _extractErrorMessage(e);
      return Left(Failure.server(message: message));
    } catch (e) {
      debugPrint('🚗 GarageRepository: Error: $e');
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteVehicle(String vehicleId) async {
    try {
      debugPrint('🚗 GarageRepository: Deleting vehicle $vehicleId...');
      await garageApi.deleteVehicle(vehicleId);

      // Update cache
      await localDataSource.removeVehicleFromCache(vehicleId);
      debugPrint('🚗 GarageRepository: Vehicle deleted successfully');

      return const Right(unit);
    } on DioException catch (e) {
      debugPrint('🚗 GarageRepository: DioException: ${e.message}');
      final message = _extractErrorMessage(e);
      return Left(Failure.server(message: message));
    } catch (e) {
      debugPrint('🚗 GarageRepository: Error: $e');
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Vehicle>> setDefaultVehicle(String vehicleId) async {
    try {
      debugPrint('🚗 GarageRepository: Setting default vehicle $vehicleId...');
      final vehicleModel = await garageApi.setDefaultVehicle(vehicleId);
      final vehicle = vehicleModel.toDomain();

      // Update cache - set this one as default, others as not default
      final cachedVehicles = await localDataSource.getVehicles();
      if (cachedVehicles != null) {
        final updatedVehicles = cachedVehicles.map((v) {
          if (v.id == vehicleId) {
            return vehicle;
          }
          return v.copyWith(isDefault: false);
        }).toList();
        await localDataSource.saveVehicles(updatedVehicles);
      }

      debugPrint('🚗 GarageRepository: Default vehicle set successfully');
      return Right(vehicle);
    } on DioException catch (e) {
      debugPrint('🚗 GarageRepository: DioException: ${e.message}');
      final message = _extractErrorMessage(e);
      return Left(Failure.server(message: message));
    } catch (e) {
      debugPrint('🚗 GarageRepository: Error: $e');
      return Left(Failure.server(message: e.toString()));
    }
  }

  String _extractErrorMessage(DioException e) {
    if (e.response?.data != null && e.response?.data is Map) {
      final data = e.response?.data as Map;
      if (data.containsKey('message')) {
        return data['message'].toString();
      }
      if (data.containsKey('error')) {
        return data['error'].toString();
      }
    }
    return e.message ?? 'An error occurred';
  }
}
