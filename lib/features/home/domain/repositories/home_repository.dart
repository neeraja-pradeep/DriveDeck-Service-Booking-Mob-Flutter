import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/car_wash_shop.dart';
import '../entities/service_category.dart';
import '../entities/user_location.dart';
import '../entities/user_profile.dart';

/// Abstract repository interface for home screen data.
abstract class HomeRepository {
  /// Fetches the current user's profile.
  Future<Either<Failure, UserProfile>> getUserProfile();

  /// Fetches service categories with conditional caching.
  /// Returns cached data if [ifModifiedSince] results in 304.
  Future<Either<Failure, List<ServiceCategory>>> getServiceCategories({
    DateTime? ifModifiedSince,
  });

  /// Fetches car wash shops near the user's location.
  Future<Either<Failure, List<CarWashShop>>> getShopsNearYou({
    required double latitude,
    required double longitude,
    DateTime? ifModifiedSince,
  });

  /// Searches for car wash shops by query.
  Future<Either<Failure, List<CarWashShop>>> searchShops({
    required String query,
    int page,
    int pageSize,
  });

  /// Toggles wishlist status for a shop.
  Future<Either<Failure, bool>> toggleWishlist({
    required int shopId,
  });

  /// Gets the current user location.
  Future<Either<Failure, UserLocation>> getCurrentLocation();

  /// Gets the cached location if available.
  Future<Either<Failure, UserLocation?>> getCachedLocation();

  /// Saves location to cache.
  Future<Either<Failure, void>> saveLocationToCache(UserLocation location);

  /// Gets cached service categories.
  Future<Either<Failure, List<ServiceCategory>?>> getCachedServiceCategories();

  /// Gets cached car wash shops.
  Future<Either<Failure, List<CarWashShop>?>> getCachedCarWashShops();

  /// Clears all home data cache.
  Future<Either<Failure, void>> clearCache();
}
