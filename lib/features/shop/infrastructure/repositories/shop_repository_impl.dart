import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/booking_confirmation.dart';
import '../../domain/entities/booking_date.dart';
import '../../domain/entities/booking_request.dart';
import '../../domain/entities/shop.dart';
import '../../domain/entities/shop_service.dart';
import '../../domain/entities/vehicle_type.dart';
import '../../domain/repositories/shop_repository.dart';
import '../data_sources/local/shop_local_ds.dart';
import '../data_sources/remote/shop_api.dart';
import '../models/booking_request_model.dart';

/// Implementation of ShopRepository.
class ShopRepositoryImpl implements ShopRepository {
  final ShopApi _api;
  final ShopLocalDataSource _localDataSource;
  final Connectivity _connectivity;

  ShopRepositoryImpl({
    required ShopApi api,
    required ShopLocalDataSource localDataSource,
    required Connectivity connectivity,
  })  : _api = api,
        _localDataSource = localDataSource,
        _connectivity = connectivity;

  /// Checks if the device has network connectivity.
  Future<bool> _hasNetwork() async {
    final result = await _connectivity.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }

  @override
  Future<Either<Failure, CachedData<Shop>?>> getShopDetails(
    String shopId,
    DateTime? lastModified,
  ) async {
    try {
      // Check for cached data first
      final cached = await _localDataSource.getShopDetails(shopId);

      // Check network connectivity
      final hasNetwork = await _hasNetwork();

      if (!hasNetwork) {
        // Return cached data if available, otherwise return error
        if (cached != null) {
          return Right(cached);
        }
        return const Left(NetworkFailure());
      }

      // Format the If-Modified-Since header
      String? ifModifiedSince;
      if (lastModified != null) {
        ifModifiedSince = DateFormat('EEE, dd MMM yyyy HH:mm:ss').format(lastModified.toUtc());
        ifModifiedSince = '$ifModifiedSince GMT';
      }

      // Fetch from API
      final response = await _api.getShopDetails(shopId, ifModifiedSince);

      if (response.notModified) {
        // Return null to indicate use cached data
        return const Right(null);
      }

      if (response.data == null) {
        return const Left(ShopNotFoundFailure());
      }

      final shop = response.data!.toDomain();

      // Parse Last-Modified header and save to cache
      DateTime newLastModified = DateTime.now();
      if (response.lastModified != null) {
        try {
          newLastModified = DateFormat('EEE, dd MMM yyyy HH:mm:ss')
              .parse(response.lastModified!.replaceAll(' GMT', ''), true);
        } catch (_) {
          // Use current time if parsing fails
        }
      }

      await _localDataSource.saveShopDetails(shop, newLastModified);

      return Right(CachedData(data: shop, lastModified: newLastModified));
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ShopService>>> getShopServices(
    String shopId,
    VehicleType vehicleType,
  ) async {
    try {
      final hasNetwork = await _hasNetwork();
      if (!hasNetwork) {
        return const Left(NetworkFailure());
      }

      final services = await _api.getShopServices(
        shopId,
        vehicleType.apiValue,
      );

      return Right(services.map((s) => s.toDomain()).toList());
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingDate>> getAvailableSlots(
    String shopId,
    DateTime date,
  ) async {
    try {
      final hasNetwork = await _hasNetwork();
      if (!hasNetwork) {
        return const Left(NetworkFailure());
      }

      final formattedDate = DateFormat('yyyy-MM-dd').format(date);
      final bookingDate = await _api.getAvailableSlots(shopId, formattedDate);

      return Right(bookingDate.toDomain());
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingConfirmation>> createBooking(
    BookingRequest request,
  ) async {
    try {
      final hasNetwork = await _hasNetwork();
      if (!hasNetwork) {
        return const Left(NetworkFailure());
      }

      final requestModel = BookingRequestModel.fromDomain(request);
      final confirmation = await _api.createBooking(requestModel);

      return Right(confirmation.toDomain());
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        return const Left(SlotNoLongerAvailableFailure());
      }
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, double>> validatePromoCode(
    String code,
    String shopId,
  ) async {
    // Static placeholder for now
    // Returns discount amount (0 for invalid codes)
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const Right(0.0);
  }

  /// Handles Dio errors and converts them to Failure types.
  Failure _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure(
          message: 'Connection timed out. Please try again.',
        );
      case DioExceptionType.connectionError:
        return const NetworkFailure();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = _extractErrorMessage(e.response?.data);

        if (statusCode == 404) {
          return const ShopNotFoundFailure();
        }
        if (statusCode == 401 || statusCode == 403) {
          return const AuthFailure();
        }

        return ServerFailure(
          message: message ?? 'Server error occurred',
          statusCode: statusCode,
        );
      default:
        return UnknownFailure(message: e.message ?? 'An error occurred');
    }
  }

  /// Extracts error message from API response.
  String? _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] as String? ??
          data['error'] as String? ??
          data['detail'] as String?;
    }
    return null;
  }
}
