import 'package:equatable/equatable.dart';

/// Represents a service that has been booked.
///
/// Contains details about an individual service within a booking,
/// including pricing and duration information.
class BookedService extends Equatable {
  /// Creates a new [BookedService] instance.
  const BookedService({
    required this.id,
    required this.name,
    required this.price,
    required this.duration,
  });

  /// Unique identifier for the service.
  final String id;

  /// Name of the service (e.g., "Full Car Wash").
  final String name;

  /// Price of the service in the local currency.
  final double price;

  /// Duration of the service in minutes.
  final int duration;

  /// Returns a formatted price string.
  ///
  /// Example: "₹500.00"
  String get formattedPrice => '₹${price.toStringAsFixed(2)}';

  /// Returns a formatted duration string.
  ///
  /// Example: "30 mins" or "1 hr 30 mins"
  String get formattedDuration {
    if (duration < 60) {
      return '$duration mins';
    }
    final hours = duration ~/ 60;
    final mins = duration % 60;
    if (mins == 0) {
      return '$hours hr${hours > 1 ? 's' : ''}';
    }
    return '$hours hr${hours > 1 ? 's' : ''} $mins mins';
  }

  /// Creates a copy of this [BookedService] with the given fields replaced.
  BookedService copyWith({
    String? id,
    String? name,
    double? price,
    int? duration,
  }) {
    return BookedService(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      duration: duration ?? this.duration,
    );
  }

  @override
  List<Object?> get props => [id, name, price, duration];
}
