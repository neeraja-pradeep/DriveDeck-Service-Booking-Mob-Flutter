import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/shop.dart';

/// Repository interface for shop operations.
abstract class ShopRepository {
  /// Get list of shops with optional filters.
  ///
  /// [page] - Page number for pagination (default: 1)
  /// [pageSize] - Number of items per page (default: 10)
  /// [search] - Optional search query
  Future<Either<Failure, List<Shop>>> getShops({
    int page = 1,
    int pageSize = 10,
    String? search,
  });

  /// Get shops near the user's location.
  ///
  /// [latitude] - User's latitude
  /// [longitude] - User's longitude
  /// [maxKm] - Maximum distance in kilometers (default: 10)
  /// [limit] - Maximum number of results (default: 10)
  Future<Either<Failure, List<Shop>>> getNearbyShops({
    required double latitude,
    required double longitude,
    double maxKm = 10,
    int limit = 10,
  });

  /// Get detailed information about a specific shop.
  ///
  /// [shopId] - The ID of the shop
  Future<Either<Failure, Shop>> getShopDetails(int shopId);

  /// Get services for a specific shop.
  ///
  /// [shopId] - The ID of the shop
  Future<Either<Failure, List<ShopService>>> getShopServices(int shopId);

  /// Get packages for a specific shop.
  ///
  /// [shopId] - The ID of the shop
  Future<Either<Failure, List<ShopPackage>>> getShopPackages(int shopId);

  /// Get accessories for a specific shop.
  ///
  /// [shopId] - The ID of the shop
  Future<Either<Failure, List<ShopAccessory>>> getShopAccessories(int shopId);

  /// Get availability for a shop on a specific date range.
  ///
  /// [shopId] - The ID of the shop
  /// [startDate] - Start date for availability check
  /// [days] - Number of days to check (default: 7)
  Future<Either<Failure, List<ShopDateAvailability>>> getShopAvailability({
    required int shopId,
    required DateTime startDate,
    int days = 7,
  });

  /// Add shop to user's favorites.
  ///
  /// [shopId] - The ID of the shop to favorite
  Future<Either<Failure, Unit>> addToFavorites(int shopId);

  /// Remove shop from user's favorites.
  ///
  /// [shopId] - The ID of the shop to unfavorite
  Future<Either<Failure, Unit>> removeFromFavorites(int shopId);

  /// Get user's favorite shops.
  Future<Either<Failure, List<Shop>>> getFavoriteShops();
}
