import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/bookings_list.dart';
import '../../domain/entities/cached_data.dart';
import '../../domain/repositories/bookings_repository.dart';
import '../data_sources/local/bookings_local_ds.dart';
import '../data_sources/remote/bookings_api.dart';

/// Implementation of [BookingsRepository].
///
/// Coordinates between remote API and local cache for bookings data.
class BookingsRepositoryImpl implements BookingsRepository {
  /// Creates a new [BookingsRepositoryImpl].
  BookingsRepositoryImpl({
    required this.bookingsApi,
    required this.localDataSource,
    required this.connectivity,
  });

  /// Remote API data source.
  final BookingsApi bookingsApi;

  /// Local cache data source.
  final BookingsLocalDataSource localDataSource;

  /// Connectivity checker.
  final Connectivity connectivity;

  /// Checks if the device has network connectivity.
  Future<bool> get _hasConnectivity async {
    final result = await connectivity.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }

  @override
  Future<Either<Failure, CachedData<BookingsList>?>> getBookings({
    DateTime? lastModified,
  }) async {
    try {
      // Check connectivity
      if (!await _hasConnectivity) {
        // Return cached data if offline
        final cached = await localDataSource.getBookings();
        if (cached != null) {
          return Right(cached);
        }
        return const Left(Failure.network(message: 'No internet connection'));
      }

      // Format the if-modified-since header
      String? ifModifiedSince;
      if (lastModified != null) {
        ifModifiedSince = _formatHttpDate(lastModified);
      }

      // Fetch both booked and history status
      final bookedResponse = await bookingsApi.getBookings(
        ifModifiedSince: ifModifiedSince,
        status: 'booked',
      );

      final historyResponse = await bookingsApi.getBookings(
        ifModifiedSince: ifModifiedSince,
        status: 'history',
      );

      // If both return 304, data is not modified
      if (bookedResponse.isNotModified && historyResponse.isNotModified) {
        return const Right(null);
      }

      // Combine the results
      final upcomingBookings = bookedResponse.data?.upcomingBookings ?? [];
      final pastBookings = historyResponse.data?.pastBookings ?? [];

      final combinedList = BookingsList(
        upcomingBookings: upcomingBookings.map((m) => m.toDomain()).toList(),
        pastBookings: pastBookings.map((m) => m.toDomain()).toList(),
      );

      final responseTimestamp = DateTime.now();

      // Save to cache
      await localDataSource.saveBookings(combinedList, responseTimestamp);

      return Right(
        CachedData(data: combinedList, lastModified: responseTimestamp),
      );
    } on DioException catch (e) {
      // Try to return cached data on error
      final cached = await localDataSource.getBookings();
      if (cached != null) {
        return Right(cached);
      }
      return Left(NetworkExceptions.getDioException(e));
    } catch (e) {
      return Left(Failure.bookingFetch(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Booking>> getBookingDetails(String bookingId) async {
    try {
      if (!await _hasConnectivity) {
        return const Left(Failure.network(message: 'No internet connection'));
      }

      final response = await bookingsApi.getBookingDetails(bookingId);
      return Right(response.toDomain());
    } on DioException catch (e) {
      final failure = NetworkExceptions.handleException(e);
      if (failure == const Failure.notFound()) {
        return const Left(Failure.bookingNotFound());
      }
      return Left(failure);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Booking>> cancelBooking(String bookingId) async {
    try {
      if (!await _hasConnectivity) {
        return const Left(Failure.network(message: 'No internet connection'));
      }

      final response = await bookingsApi.cancelBooking(bookingId);
      final cancelledBooking = response.toDomain();

      // Update local cache
      await localDataSource.updateBookingInCache(bookingId, {
        'status': cancelledBooking.status,
        'cancelled_at': cancelledBooking.cancelledAt,
      });

      return Right(cancelledBooking);
    } on DioException catch (e) {
      final failure = NetworkExceptions.handleException(e);

      // Handle specific booking cancellation errors
      if (e.response?.statusCode == 400) {
        final message = e.response?.data['message'] as String?;
        if (message?.contains('already cancelled') ?? false) {
          return const Left(Failure.bookingAlreadyCancelled());
        }
        return Left(
          Failure.cancellationNotAllowed(
            message: message ?? 'Cancellation not allowed',
          ),
        );
      }

      return Left(failure);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Booking>> rescheduleBooking({
    required String bookingId,
    required DateTime newDate,
    required String newSlotId,
  }) async {
    try {
      if (!await _hasConnectivity) {
        return const Left(Failure.network(message: 'No internet connection'));
      }

      final response = await bookingsApi.rescheduleBooking(
        bookingId: bookingId,
        newDate: newDate,
        newSlotId: newSlotId,
      );

      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(NetworkExceptions.handleException(e));
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CachedData<BookingsList>?>> getCachedBookings() async {
    try {
      final cached = await localDataSource.getBookings();
      return Right(cached);
    } catch (e) {
      return Left(Failure.cache(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(Failure.cache(message: e.toString()));
    }
  }

  /// Formats a DateTime as an HTTP date string.
  String _formatHttpDate(DateTime date) {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final utc = date.toUtc();
    final weekday = weekdays[utc.weekday - 1];
    final day = utc.day.toString().padLeft(2, '0');
    final month = months[utc.month - 1];
    final year = utc.year;
    final hour = utc.hour.toString().padLeft(2, '0');
    final minute = utc.minute.toString().padLeft(2, '0');
    final second = utc.second.toString().padLeft(2, '0');

    return '$weekday, $day $month $year $hour:$minute:$second GMT';
  }
}
