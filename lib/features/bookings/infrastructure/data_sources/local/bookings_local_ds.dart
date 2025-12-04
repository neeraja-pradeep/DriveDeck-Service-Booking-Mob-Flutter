import 'dart:convert';

import 'package:hive/hive.dart';

import '../../../../../core/storage/hive/boxes.dart';
import '../../../../../core/storage/hive/keys.dart';
import '../../../domain/entities/bookings_list.dart';
import '../../../domain/entities/cached_data.dart';
import '../../models/bookings_list_model.dart';

/// Abstract class defining the local data source for bookings.
abstract class BookingsLocalDataSource {
  /// Saves bookings to local storage.
  Future<void> saveBookings(BookingsList bookings, DateTime lastModified);

  /// Retrieves cached bookings.
  Future<CachedData<BookingsList>?> getBookings();

  /// Updates a single booking in the cached list.
  Future<void> updateBookingInCache(String bookingId, Map<String, dynamic> updates);

  /// Clears the bookings cache.
  Future<void> clearCache();

  /// Gets the last modified timestamp.
  Future<DateTime?> getLastModified();
}

/// Implementation of [BookingsLocalDataSource] using Hive.
class BookingsLocalDataSourceImpl implements BookingsLocalDataSource {
  /// Creates a new [BookingsLocalDataSourceImpl].
  BookingsLocalDataSourceImpl();

  Box<dynamic>? _box;

  /// Gets or opens the Hive box.
  Future<Box<dynamic>> get box async {
    if (_box != null && _box!.isOpen) {
      return _box!;
    }
    _box = await Hive.openBox<dynamic>(HiveBoxes.bookingsBox);
    return _box!;
  }

  @override
  Future<void> saveBookings(
    BookingsList bookings,
    DateTime lastModified,
  ) async {
    try {
      final hiveBox = await box;
      final model = BookingsListModel.fromDomain(bookings);

      await hiveBox.put(
        BookingsBoxKeys.bookingsList,
        jsonEncode(model.toJson()),
      );
      await hiveBox.put(
        BookingsBoxKeys.bookingsTimestamp,
        lastModified.toIso8601String(),
      );
    } on HiveError {
      // Silently fail - cache is optional
    }
  }

  @override
  Future<CachedData<BookingsList>?> getBookings() async {
    try {
      final hiveBox = await box;
      final jsonString = hiveBox.get(BookingsBoxKeys.bookingsList) as String?;
      final timestampString =
          hiveBox.get(BookingsBoxKeys.bookingsTimestamp) as String?;

      if (jsonString == null || timestampString == null) {
        return null;
      }

      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final model = BookingsListModel.fromJson(json);
      final timestamp = DateTime.parse(timestampString);

      return CachedData<BookingsList>(
        data: model.toDomain(),
        lastModified: timestamp,
      );
    } on HiveError {
      return null;
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> updateBookingInCache(
    String bookingId,
    Map<String, dynamic> updates,
  ) async {
    try {
      final cached = await getBookings();
      if (cached == null) return;

      final currentList = cached.data;

      // Update in upcoming bookings
      final updatedUpcoming = currentList.upcomingBookings.map((booking) {
        if (booking.id == bookingId) {
          return booking.copyWith(
            status: updates['status'],
            cancelledAt: updates['cancelled_at'],
          );
        }
        return booking;
      }).toList();

      // Update in past bookings
      final updatedPast = currentList.pastBookings.map((booking) {
        if (booking.id == bookingId) {
          return booking.copyWith(
            status: updates['status'],
            cancelledAt: updates['cancelled_at'],
          );
        }
        return booking;
      }).toList();

      final updatedList = BookingsList(
        upcomingBookings: updatedUpcoming,
        pastBookings: updatedPast,
      );

      await saveBookings(updatedList, DateTime.now());
    } on HiveError {
      // Silently fail
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final hiveBox = await box;
      await hiveBox.delete(BookingsBoxKeys.bookingsList);
      await hiveBox.delete(BookingsBoxKeys.bookingsTimestamp);
    } on HiveError {
      // Silently fail
    }
  }

  @override
  Future<DateTime?> getLastModified() async {
    try {
      final hiveBox = await box;
      final timestampString =
          hiveBox.get(BookingsBoxKeys.bookingsTimestamp) as String?;

      if (timestampString == null) return null;
      return DateTime.parse(timestampString);
    } on HiveError {
      return null;
    } on FormatException {
      return null;
    }
  }
}
