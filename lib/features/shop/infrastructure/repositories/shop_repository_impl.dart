import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/booking_confirmation.dart';
import '../../domain/entities/booking_request.dart';
import '../../domain/entities/shop.dart';
import '../../domain/repositories/shop_repository.dart';
import '../data_sources/local/shop_local_ds.dart';
import '../data_sources/remote/shop_api.dart';

/// Implementation of ShopRepository.
class ShopRepositoryImpl implements ShopRepository {
  ShopRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  final ShopApi remoteDataSource;
  final ShopLocalDs localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<Shop>>> getShops({
    int page = 1,
    int pageSize = 10,
    String? search,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final shops = await remoteDataSource.getShops(
          page: page,
          pageSize: pageSize,
          search: search,
        );
        return Right(shops.map((s) => s.toDomain()).toList());
      } else {
        // Use local data when offline
        final shops = await localDataSource.getShops(
          page: page,
          pageSize: pageSize,
          search: search,
        );
        return Right(shops.map((s) => s.toDomain()).toList());
      }
    } catch (e) {
      // Fallback to local data on error
      try {
        final shops = await localDataSource.getShops(
          page: page,
          pageSize: pageSize,
          search: search,
        );
        return Right(shops.map((s) => s.toDomain()).toList());
      } catch (_) {
        return Left(Failure.server(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Shop>>> getNearbyShops({
    required double latitude,
    required double longitude,
    double maxKm = 10,
    int limit = 10,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final shops = await remoteDataSource.getNearbyShops(
          latitude: latitude,
          longitude: longitude,
          maxKm: maxKm,
          limit: limit,
        );
        return Right(shops.map((s) => s.toDomain()).toList());
      } else {
        final shops = await localDataSource.getNearbyShops(
          latitude: latitude,
          longitude: longitude,
          maxKm: maxKm,
          limit: limit,
        );
        return Right(shops.map((s) => s.toDomain()).toList());
      }
    } catch (e) {
      try {
        final shops = await localDataSource.getNearbyShops(
          latitude: latitude,
          longitude: longitude,
          maxKm: maxKm,
          limit: limit,
        );
        return Right(shops.map((s) => s.toDomain()).toList());
      } catch (_) {
        return Left(Failure.server(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Shop>> getShopDetails(int shopId) async {
    try {
      if (await networkInfo.isConnected) {
        final shop = await remoteDataSource.getShopDetails(shopId);
        return Right(shop.toDomain());
      } else {
        final shop = await localDataSource.getShopDetails(shopId);
        return Right(shop.toDomain());
      }
    } catch (e) {
      try {
        final shop = await localDataSource.getShopDetails(shopId);
        return Right(shop.toDomain());
      } catch (_) {
        return Left(Failure.server(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ShopService>>> getShopServices(int shopId) async {
    try {
      if (await networkInfo.isConnected) {
        final services = await remoteDataSource.getShopServices(shopId);
        return Right(services.map((s) => s.toDomain()).toList());
      } else {
        final shop = await localDataSource.getShopDetails(shopId);
        return Right(shop.services?.map((s) => s.toDomain()).toList() ?? []);
      }
    } catch (e) {
      try {
        final shop = await localDataSource.getShopDetails(shopId);
        return Right(shop.services?.map((s) => s.toDomain()).toList() ?? []);
      } catch (_) {
        return Left(Failure.server(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ShopPackage>>> getShopPackages(int shopId) async {
    try {
      if (await networkInfo.isConnected) {
        final packages = await remoteDataSource.getShopPackages(shopId);
        return Right(packages.map((p) => p.toDomain()).toList());
      } else {
        final shop = await localDataSource.getShopDetails(shopId);
        return Right(shop.packages?.map((p) => p.toDomain()).toList() ?? []);
      }
    } catch (e) {
      try {
        final shop = await localDataSource.getShopDetails(shopId);
        return Right(shop.packages?.map((p) => p.toDomain()).toList() ?? []);
      } catch (_) {
        return Left(Failure.server(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ShopAccessory>>> getShopAccessories(
    int shopId,
  ) async {
    try {
      if (await networkInfo.isConnected) {
        final accessories = await remoteDataSource.getShopAccessories(shopId);
        return Right(accessories.map((a) => a.toDomain()).toList());
      } else {
        final shop = await localDataSource.getShopDetails(shopId);
        return Right(shop.accessories?.map((a) => a.toDomain()).toList() ?? []);
      }
    } catch (e) {
      try {
        final shop = await localDataSource.getShopDetails(shopId);
        return Right(shop.accessories?.map((a) => a.toDomain()).toList() ?? []);
      } catch (_) {
        return Left(Failure.server(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ShopDateAvailability>>> getShopAvailability({
    required int shopId,
    required DateTime startDate,
    int days = 7,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final availability = await remoteDataSource.getShopAvailability(
          shopId: shopId,
          startDate: startDate,
          days: days,
        );
        return Right(availability.map((a) => a.toDomain()).toList());
      } else {
        final availability = await localDataSource.getShopAvailability(
          shopId: shopId,
          startDate: startDate,
          days: days,
        );
        return Right(availability.map((a) => a.toDomain()).toList());
      }
    } catch (e) {
      try {
        final availability = await localDataSource.getShopAvailability(
          shopId: shopId,
          startDate: startDate,
          days: days,
        );
        return Right(availability.map((a) => a.toDomain()).toList());
      } catch (_) {
        return Left(Failure.server(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addToFavorites(int shopId) async {
    try {
      if (await networkInfo.isConnected) {
        await remoteDataSource.addToFavorites(shopId);
        return const Right(unit);
      } else {
        return const Left(
          Failure.noConnection(message: 'No internet connection'),
        );
      }
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromFavorites(int shopId) async {
    try {
      if (await networkInfo.isConnected) {
        await remoteDataSource.removeFromFavorites(shopId);
        return const Right(unit);
      } else {
        return const Left(
          Failure.noConnection(message: 'No internet connection'),
        );
      }
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Shop>>> getFavoriteShops() async {
    try {
      if (await networkInfo.isConnected) {
        final shops = await remoteDataSource.getFavoriteShops();
        return Right(shops.map((s) => s.toDomain()).toList());
      } else {
        return const Left(
          Failure.noConnection(message: 'No internet connection'),
        );
      }
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Shop>>> getShopReviews({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final shops =
            await remoteDataSource.getShopReviews(page: page, pageSize: pageSize);
        return Right(shops.map((s) => s.toDomain()).toList());
      } else {
        return const Left(
          Failure.noConnection(message: 'No internet connection'),
        );
      }
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingConfirmation>> createBooking(
    BookingRequest request,
  ) async {
    try {
      if (await networkInfo.isConnected) {
        final confirmation = await remoteDataSource.createBooking(request);
        return Right(confirmation.toDomain());
      } else {
        return const Left(
          Failure.noConnection(message: 'No internet connection'),
        );
      }
    } catch (e) {
      return Left(Failure.bookingCreationFailed(message: e.toString()));
    }
  }
}
