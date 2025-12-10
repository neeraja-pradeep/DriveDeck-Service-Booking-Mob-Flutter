import '../../domain/entities/booking.dart';
import '../../domain/entities/booking_status.dart';
import '../../domain/entities/vehicle_type.dart';
import 'booked_service_model.dart';
import 'booking_time_slot_model.dart';

/// JSON-serializable model for [Booking].
///
/// Used for API communication and local storage.
class BookingModel {
  /// Creates a new [BookingModel] instance.
  const BookingModel({
    required this.id,
    required this.bookingReference,
    required this.shopId,
    required this.shopName,
    required this.shopImageUrl,
    required this.shopAddress,
    required this.shopCity,
    this.shopLatitude,
    this.shopLongitude,
    required this.bookingDate,
    required this.timeSlot,
    required this.services,
    required this.status,
    required this.totalAmount,
    required this.vehicleType,
    required this.pickupAndDelivery,
    required this.createdAt,
    this.completedAt,
    this.cancelledAt,
  });

  /// Creates a [BookingModel] from JSON map.
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    // Handle nested shop object if present
    final shop = json['shop'] as Map<String, dynamic>?;

    // Parse services list; backend may return only service_name + service_id
    final servicesJson = json['services'] as List<dynamic>? ?? [];
    List<BookedServiceModel> services = servicesJson
        .map((s) => BookedServiceModel.fromJson(s as Map<String, dynamic>))
        .toList();

    if (services.isEmpty && (json['service_name'] != null || json['service_id'] != null)) {
      services = [
        BookedServiceModel(
          id: (json['service_id'] ?? '').toString(),
          name: (json['service_name'] ?? '') as String,
          price: _parseDouble(json['amount']),
          duration: 60, // fallback 1 hour when duration not provided
        ),
      ];
    }

    // Parse time slot; backend returns start_slot_time
    final timeSlotJson = json['time_slot'] as Map<String, dynamic>?;
    final startSlotTime = json['start_slot_time'] as String? ?? '';
    final timeSlot = timeSlotJson != null
        ? BookingTimeSlotModel.fromJson(timeSlotJson)
        : BookingTimeSlotModel(
            startTime: timeSlotJson?['start_time'] as String? ??
                startSlotTime,
            endTime: timeSlotJson?['end_time'] as String? ?? '',
          );

    return BookingModel(
      id: (json['id'] ?? json['booking_id'] ?? '').toString(),
      bookingReference: (json['booking_reference'] ??
              json['reference'] ??
              json['id'] ??
              '')
          .toString(),
      shopId: (shop?['id'] ?? json['shop_id'] ?? '').toString(),
      shopName: shop?['name'] as String? ??
          json['shop_name'] as String? ??
          'Car Wash Center',
      shopImageUrl:
          shop?['image_url'] as String? ?? json['shop_image_url'] as String? ?? '',
      shopAddress:
          shop?['address'] as String? ?? json['shop_address'] as String? ?? 'Address unavailable',
      shopCity: shop?['city'] as String? ?? json['shop_city'] as String? ?? '',
      shopLatitude: _parseNullableDouble(
        shop?['latitude'] ?? json['latitude'] ?? json['shop_latitude'],
      ),
      shopLongitude: _parseNullableDouble(
        shop?['longitude'] ?? json['longitude'] ?? json['shop_longitude'],
      ),
      bookingDate: _parseDateTime(
        json['booking_date'] ?? json['date'] ?? json['appointment_date'],
      ),
      timeSlot: timeSlot,
      services: services,
      status: BookingStatusX.fromString(
        json['status'] as String? ?? 'pending',
      ),
      totalAmount: _parseDouble(
        json['total_amount'] ?? json['total'] ?? json['amount'],
      ),
      vehicleType: VehicleTypeX.fromString(
        json['vehicle_type'] as String? ?? 'car',
      ),
      pickupAndDelivery: json['pickup_delivery'] as bool? ??
          json['pickup_and_delivery'] as bool? ??
          false,
      createdAt: _parseDateTime(json['created_at']),
      completedAt: _parseNullableDateTime(json['completed_at']),
      cancelledAt: _parseNullableDateTime(json['cancelled_at']),
    );
  }

  /// Creates a [BookingModel] from domain entity.
  factory BookingModel.fromDomain(Booking entity) {
    return BookingModel(
      id: entity.id,
      bookingReference: entity.bookingReference,
      shopId: entity.shopId,
      shopName: entity.shopName,
      shopImageUrl: entity.shopImageUrl,
      shopAddress: entity.shopAddress,
      shopCity: entity.shopCity,
      shopLatitude: entity.shopLatitude,
      shopLongitude: entity.shopLongitude,
      bookingDate: entity.bookingDate,
      timeSlot: BookingTimeSlotModel.fromDomain(entity.timeSlot),
      services:
          entity.services.map((s) => BookedServiceModel.fromDomain(s)).toList(),
      status: entity.status,
      totalAmount: entity.totalAmount,
      vehicleType: entity.vehicleType,
      pickupAndDelivery: entity.pickupAndDelivery,
      createdAt: entity.createdAt,
      completedAt: entity.completedAt,
      cancelledAt: entity.cancelledAt,
    );
  }

  /// Unique identifier for the booking.
  final String id;

  /// Human-readable reference number.
  final String bookingReference;

  /// Shop identifier.
  final String shopId;

  /// Shop name.
  final String shopName;

  /// Shop image URL.
  final String shopImageUrl;

  /// Shop address.
  final String shopAddress;

  /// Shop city.
  final String shopCity;

  /// Shop latitude.
  final double? shopLatitude;

  /// Shop longitude.
  final double? shopLongitude;

  /// Booking date.
  final DateTime bookingDate;

  /// Time slot.
  final BookingTimeSlotModel timeSlot;

  /// List of services.
  final List<BookedServiceModel> services;

  /// Booking status.
  final BookingStatus status;

  /// Total amount.
  final double totalAmount;

  /// Vehicle type.
  final VehicleType vehicleType;

  /// Pickup and delivery flag.
  final bool pickupAndDelivery;

  /// Created timestamp.
  final DateTime createdAt;

  /// Completed timestamp.
  final DateTime? completedAt;

  /// Cancelled timestamp.
  final DateTime? cancelledAt;

  /// Converts this model to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'booking_reference': bookingReference,
      'shop_id': shopId,
      'shop_name': shopName,
      'shop_image_url': shopImageUrl,
      'shop_address': shopAddress,
      'shop_city': shopCity,
      'shop_latitude': shopLatitude,
      'shop_longitude': shopLongitude,
      'booking_date': bookingDate.toIso8601String(),
      'time_slot': timeSlot.toJson(),
      'services': services.map((s) => s.toJson()).toList(),
      'status': status.toApiString(),
      'total_amount': totalAmount,
      'vehicle_type': vehicleType.toApiString(),
      'pickup_delivery': pickupAndDelivery,
      'created_at': createdAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'cancelled_at': cancelledAt?.toIso8601String(),
    };
  }

  /// Converts this model to a domain entity.
  Booking toDomain() {
    return Booking(
      id: id,
      bookingReference: bookingReference,
      shopId: shopId,
      shopName: shopName,
      shopImageUrl: shopImageUrl,
      shopAddress: shopAddress,
      shopCity: shopCity,
      shopLatitude: shopLatitude,
      shopLongitude: shopLongitude,
      bookingDate: bookingDate,
      timeSlot: timeSlot.toDomain(),
      services: services.map((s) => s.toDomain()).toList(),
      status: status,
      totalAmount: totalAmount,
      vehicleType: vehicleType,
      pickupAndDelivery: pickupAndDelivery,
      createdAt: createdAt,
      completedAt: completedAt,
      cancelledAt: cancelledAt,
    );
  }

  static DateTime _parseDateTime(dynamic value) {
    if (value == null) return DateTime.now();
    if (value is DateTime) return value;
    if (value is String) {
      return DateTime.tryParse(value) ?? DateTime.now();
    }
    return DateTime.now();
  }

  static DateTime? _parseNullableDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) {
      return DateTime.tryParse(value);
    }
    return null;
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  static double? _parseNullableDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
