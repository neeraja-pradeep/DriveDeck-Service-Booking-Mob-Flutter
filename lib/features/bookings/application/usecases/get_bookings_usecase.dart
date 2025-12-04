import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/bookings_list.dart';
import '../../domain/entities/cached_data.dart';
import '../../domain/repositories/bookings_repository.dart';

/// Use case for fetching bookings list.
///
/// Implements conditional fetching with if-modified-since header.
class GetBookingsUsecase {
  /// Creates a new [GetBookingsUsecase].
  const GetBookingsUsecase({required this.repository});

  /// The bookings repository.
  final BookingsRepository repository;

  /// Executes the use case.
  ///
  /// [lastModified] - Optional timestamp for conditional request.
  ///
  /// Returns:
  /// - [Right(CachedData<BookingsList>)] - New data from server
  /// - [Right(null)] - Data not modified (use cache)
  /// - [Left(Failure)] - Error occurred
  Future<Either<Failure, CachedData<BookingsList>?>> call({
    DateTime? lastModified,
  }) {
    return repository.getBookings(lastModified: lastModified);
  }
}
