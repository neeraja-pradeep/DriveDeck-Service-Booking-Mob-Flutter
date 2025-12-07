import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/bookings_list.dart';
import '../../domain/entities/cached_data.dart';
import '../../domain/repositories/bookings_repository.dart';

/// Use case for fetching cached bookings.
class GetCachedBookingsUsecase {
  /// Creates a new [GetCachedBookingsUsecase].
  const GetCachedBookingsUsecase({required this.repository});

  /// The bookings repository.
  final BookingsRepository repository;

  /// Executes the use case.
  ///
  /// Returns:
  /// - [Right(CachedData<BookingsList>?)] - Cached data if available
  /// - [Left(Failure)] - Error occurred
  Future<Either<Failure, CachedData<BookingsList>?>> call() {
    return repository.getCachedBookings();
  }
}
