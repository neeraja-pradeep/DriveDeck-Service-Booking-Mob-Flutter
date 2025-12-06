import '../../domain/entities/booked_service.dart';

/// JSON-serializable model for [BookedService].
///
/// Used for API communication and local storage.
class BookedServiceModel {
  /// Creates a new [BookedServiceModel] instance.
  const BookedServiceModel({
    required this.id,
    required this.name,
    required this.price,
    required this.duration,
  });

  /// Creates a [BookedServiceModel] from JSON map.
  factory BookedServiceModel.fromJson(Map<String, dynamic> json) {
    return BookedServiceModel(
      id: (json['id'] ?? json['service_id'] ?? '').toString(),
      name: json['name'] as String? ?? json['service_name'] as String? ?? '',
      price: _parseDouble(json['price']),
      duration: _parseInt(json['duration']),
    );
  }

  /// Creates a [BookedServiceModel] from domain entity.
  factory BookedServiceModel.fromDomain(BookedService entity) {
    return BookedServiceModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      duration: entity.duration,
    );
  }

  /// Unique identifier for the service.
  final String id;

  /// Name of the service.
  final String name;

  /// Price of the service.
  final double price;

  /// Duration of the service in minutes.
  final int duration;

  /// Converts this model to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'duration': duration,
    };
  }

  /// Converts this model to a domain entity.
  BookedService toDomain() {
    return BookedService(
      id: id,
      name: name,
      price: price,
      duration: duration,
    );
  }

  /// Creates a copy of this model with the given fields replaced.
  BookedServiceModel copyWith({
    String? id,
    String? name,
    double? price,
    int? duration,
  }) {
    return BookedServiceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      duration: duration ?? this.duration,
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  static int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }
}
