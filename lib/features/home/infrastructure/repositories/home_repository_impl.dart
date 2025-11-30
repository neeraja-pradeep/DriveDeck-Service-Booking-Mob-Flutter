import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/car_wash_shop.dart';
import '../../domain/entities/service_category.dart';
import '../../domain/entities/user_location.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/local/home_local_ds.dart';
import '../data_sources/remote/home_api.dart';
import '../models/user_location_model.dart';

/// Provider for the Home Repository implementation.
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(
    homeApi: ref.read(homeApiProvider),
    localDs: ref.read(homeLocalDsProvider),
  );
});

/// Implementation of HomeRepository.
class HomeRepositoryImpl implements HomeRepository {
  final HomeApi _homeApi;
  final HomeLocalDataSource _localDs;

  HomeRepositoryImpl({
    required HomeApi homeApi,
    required HomeLocalDataSource localDs,
  })  : _homeApi = homeApi,
        _localDs = localDs;

  @override
  Future<Either<Failure, UserProfile>> getUserProfile() async {
    try {
      final model = await _homeApi.getUserProfile();
      return Right(model.toEntity());
    } on NetworkException catch (e) {
      AppLogger.e('Failed to get user profile', e);
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    } catch (e, stackTrace) {
      AppLogger.e('Unexpected error getting user profile', e, stackTrace);
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ServiceCategory>>> getServiceCategories({
    DateTime? ifModifiedSince,
  }) async {
    try {
      // Try to get from cache first if we have a timestamp
      final cachedTimestamp = _localDs.getServiceCategoriesTimestamp();

      final response = await _homeApi.getServiceCategories(
        ifModifiedSince: ifModifiedSince ?? cachedTimestamp,
      );

      if (!response.isModified) {
        // Return cached data
        final cached = _localDs.getServiceCategories();
        if (cached != null) {
          return Right(cached.map((m) => m.toEntity()).toList());
        }
      }

      // Save to cache and return new data
      if (response.data != null) {
        await _localDs.saveServiceCategories(response.data!);
        return Right(response.data!.map((m) => m.toEntity()).toList());
      }

      // If no new data and no cache, return empty list
      return const Right([]);
    } on NetworkException catch (e) {
      AppLogger.e('Failed to get service categories', e);

      // Try to return cached data on network error
      final cached = _localDs.getServiceCategories();
      if (cached != null) {
        return Right(cached.map((m) => m.toEntity()).toList());
      }

      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    } catch (e, stackTrace) {
      AppLogger.e('Unexpected error getting service categories', e, stackTrace);

      // Try to return cached data
      final cached = _localDs.getServiceCategories();
      if (cached != null) {
        return Right(cached.map((m) => m.toEntity()).toList());
      }

      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CarWashShop>>> getShopsNearYou({
    required double latitude,
    required double longitude,
    DateTime? ifModifiedSince,
  }) async {
    try {
      final cachedTimestamp = _localDs.getCarWashShopsTimestamp();

      final response = await _homeApi.getShopsNearYou(
        latitude: latitude,
        longitude: longitude,
        ifModifiedSince: ifModifiedSince ?? cachedTimestamp,
      );

      if (!response.isModified) {
        final cached = _localDs.getCarWashShops();
        if (cached != null) {
          return Right(cached.map((m) => m.toEntity()).toList());
        }
      }

      if (response.data != null) {
        await _localDs.saveCarWashShops(response.data!);
        return Right(response.data!.map((m) => m.toEntity()).toList());
      }

      return const Right([]);
    } on NetworkException catch (e) {
      AppLogger.e('Failed to get shops near you', e);

      final cached = _localDs.getCarWashShops();
      if (cached != null) {
        return Right(cached.map((m) => m.toEntity()).toList());
      }

      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    } catch (e, stackTrace) {
      AppLogger.e('Unexpected error getting shops near you', e, stackTrace);

      final cached = _localDs.getCarWashShops();
      if (cached != null) {
        return Right(cached.map((m) => m.toEntity()).toList());
      }

      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CarWashShop>>> searchShops({
    required String query,
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await _homeApi.searchShops(
        query: query,
        page: page,
        pageSize: pageSize,
      );

      return Right(response.results.map((m) => m.toEntity()).toList());
    } on NetworkException catch (e) {
      AppLogger.e('Failed to search shops', e);
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    } catch (e, stackTrace) {
      AppLogger.e('Unexpected error searching shops', e, stackTrace);
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> toggleWishlist({required int shopId}) async {
    try {
      final result = await _homeApi.toggleWishlist(shopId: shopId);
      return Right(result);
    } on NetworkException catch (e) {
      AppLogger.e('Failed to toggle wishlist', e);
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    } catch (e, stackTrace) {
      AppLogger.e('Unexpected error toggling wishlist', e, stackTrace);
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserLocation>> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return const Left(
          LocationServiceDisabledFailure(
            message: 'Location services are disabled',
          ),
        );
      }

      // Check location permission
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return const Left(
            LocationPermissionDeniedFailure(
              status: LocationPermissionStatus.denied,
              message: 'Location permission denied',
            ),
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return const Left(
          LocationPermissionDeniedFailure(
            status: LocationPermissionStatus.deniedForever,
            message: 'Location permission permanently denied',
          ),
        );
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );

      // Try to get address from coordinates
      String? address;
      String? city;
      String? state;
      String? country;
      String? postalCode;

      try {
        final placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          final place = placemarks.first;
          address = [
            place.street,
            place.subLocality,
            place.locality,
          ].where((s) => s != null && s.isNotEmpty).join(', ');
          city = place.locality;
          state = place.administrativeArea;
          country = place.country;
          postalCode = place.postalCode;
        }
      } catch (e) {
        AppLogger.w('Failed to get address from coordinates', e);
      }

      final location = UserLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
        city: city,
        state: state,
        country: country,
        postalCode: postalCode,
        timestamp: DateTime.now(),
      );

      // Save to cache
      await _localDs.saveLocation(UserLocationModel.fromEntity(location));

      return Right(location);
    } catch (e, stackTrace) {
      AppLogger.e('Failed to get current location', e, stackTrace);
      return Left(LocationFetchFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserLocation?>> getCachedLocation() async {
    try {
      final cached = _localDs.getLocation();
      return Right(cached?.toEntity());
    } catch (e, stackTrace) {
      AppLogger.e('Failed to get cached location', e, stackTrace);
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveLocationToCache(
    UserLocation location,
  ) async {
    try {
      await _localDs.saveLocation(UserLocationModel.fromEntity(location));
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.e('Failed to save location to cache', e, stackTrace);
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ServiceCategory>?>> getCachedServiceCategories() async {
    try {
      final cached = _localDs.getServiceCategories();
      if (cached == null) return const Right(null);
      return Right(cached.map((m) => m.toEntity()).toList());
    } catch (e, stackTrace) {
      AppLogger.e('Failed to get cached service categories', e, stackTrace);
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CarWashShop>?>> getCachedCarWashShops() async {
    try {
      final cached = _localDs.getCarWashShops();
      if (cached == null) return const Right(null);
      return Right(cached.map((m) => m.toEntity()).toList());
    } catch (e, stackTrace) {
      AppLogger.e('Failed to get cached car wash shops', e, stackTrace);
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _localDs.clearAll();
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.e('Failed to clear cache', e, stackTrace);
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
