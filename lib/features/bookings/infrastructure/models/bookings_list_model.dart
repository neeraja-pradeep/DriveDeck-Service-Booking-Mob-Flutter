import '../../domain/entities/bookings_list.dart';
import 'booking_model.dart';

/// JSON-serializable model for [BookingsList].
///
/// Used for API communication and local storage.
/// Handles both categorized and flat list API responses.
class BookingsListModel {
  /// Creates a new [BookingsListModel] instance.
  const BookingsListModel({
    required this.upcomingBookings,
    required this.pastBookings,
  });

  /// Creates a [BookingsListModel] from JSON map.
  ///
  /// Handles two response formats:
  /// 1. Categorized: { "upcoming": [...], "history": [...] }
  /// 2. Flat list: [ {...}, {...} ] - will be categorized locally
  factory BookingsListModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return _fromCategorizedJson(json);
    } else if (json is List) {
      return _fromFlatList(json);
    }
    return const BookingsListModel(
      upcomingBookings: [],
      pastBookings: [],
    );
  }

  /// Creates from categorized JSON response.
  static BookingsListModel _fromCategorizedJson(Map<String, dynamic> json) {
    final upcomingJson = json['upcoming'] as List<dynamic>? ??
        json['booked'] as List<dynamic>? ??
        [];
    final pastJson = json['history'] as List<dynamic>? ??
        json['past'] as List<dynamic>? ??
        [];

    return BookingsListModel(
      upcomingBookings: upcomingJson
          .map((b) => BookingModel.fromJson(b as Map<String, dynamic>))
          .toList(),
      pastBookings: pastJson
          .map((b) => BookingModel.fromJson(b as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Creates from flat list and categorizes locally.
  static BookingsListModel _fromFlatList(List<dynamic> json) {
    final allBookings = json
        .map((b) => BookingModel.fromJson(b as Map<String, dynamic>))
        .toList();

    final upcoming = allBookings
        .where((b) => b.status.isUpcoming)
        .toList()
      ..sort((a, b) => a.bookingDate.compareTo(b.bookingDate));

    final past = allBookings
        .where((b) => b.status.isPast)
        .toList()
      ..sort((a, b) => b.bookingDate.compareTo(a.bookingDate));

    return BookingsListModel(
      upcomingBookings: upcoming,
      pastBookings: past,
    );
  }

  /// Creates a [BookingsListModel] from domain entity.
  factory BookingsListModel.fromDomain(BookingsList entity) {
    return BookingsListModel(
      upcomingBookings:
          entity.upcomingBookings.map((b) => BookingModel.fromDomain(b)).toList(),
      pastBookings:
          entity.pastBookings.map((b) => BookingModel.fromDomain(b)).toList(),
    );
  }

  /// List of upcoming bookings.
  final List<BookingModel> upcomingBookings;

  /// List of past bookings.
  final List<BookingModel> pastBookings;

  /// Converts this model to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'upcoming': upcomingBookings.map((b) => b.toJson()).toList(),
      'history': pastBookings.map((b) => b.toJson()).toList(),
    };
  }

  /// Converts this model to a domain entity.
  BookingsList toDomain() {
    return BookingsList(
      upcomingBookings: upcomingBookings.map((b) => b.toDomain()).toList(),
      pastBookings: pastBookings.map((b) => b.toDomain()).toList(),
    );
  }

  /// Creates a copy of this model with the given fields replaced.
  BookingsListModel copyWith({
    List<BookingModel>? upcomingBookings,
    List<BookingModel>? pastBookings,
  }) {
    return BookingsListModel(
      upcomingBookings: upcomingBookings ?? this.upcomingBookings,
      pastBookings: pastBookings ?? this.pastBookings,
    );
  }
}
