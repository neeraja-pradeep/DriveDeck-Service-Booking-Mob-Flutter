import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/booking_confirmation.dart';
import '../entities/booking_date.dart';
import '../entities/booking_request.dart';
import '../entities/shop.dart';
import '../entities/shop_service.dart';
import '../entities/vehicle_type.dart';

/// Wrapper for cached data with timestamp.
class CachedData<T> {
  final T data;
  final DateTime lastModified;

  const CachedData({
    required this.data,
    required this.lastModified,
  });
}

/// Abstract repository for shop-related operations.
abstract class ShopRepository {
  /// Gets shop details with conditional fetch support.
  /// Returns null if 304 Not Modified (use cached data).
  Future<Either<Failure, CachedData<Shop>?>> getShopDetails(
    String shopId,
    DateTime? lastModified,
  );

  /// Gets services for a shop filtered by vehicle type.
  Future<Either<Failure, List<ShopService>>> getShopServices(
    String shopId,
    VehicleType vehicleType,
  );

  /// Gets available time slots for a specific date.
  Future<Either<Failure, BookingDate>> getAvailableSlots(
    String shopId,
    DateTime date,
  );

  /// Creates a new booking.
  Future<Either<Failure, BookingConfirmation>> createBooking(
    BookingRequest request,
  );

  /// Validates a promo code.
  Future<Either<Failure, double>> validatePromoCode(
    String code,
    String shopId,
  );
}
