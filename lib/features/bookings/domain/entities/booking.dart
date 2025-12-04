import 'package:equatable/equatable.dart';

import 'booked_service.dart';
import 'booking_status.dart';
import 'booking_time_slot.dart';
import 'vehicle_type.dart';

/// Represents a complete booking entity in the car wash application.
///
/// Contains all information about a booking including shop details,
/// scheduled time, services, and status.
class Booking extends Equatable {
  /// Creates a new [Booking] instance.
  const Booking({
    required this.id,
    required this.bookingReference,
    required this.shopId,
    required this.shopName,
    required this.shopImageUrl,
    required this.shopAddress,
    required this.shopCity,
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

  /// Unique identifier for the booking.
  final String id;

  /// Human-readable reference number for the booking.
  final String bookingReference;

  /// Unique identifier of the shop.
  final String shopId;

  /// Name of the shop.
  final String shopName;

  /// URL of the shop's image.
  final String shopImageUrl;

  /// Street address of the shop.
  final String shopAddress;

  /// City where the shop is located.
  final String shopCity;

  /// Date of the scheduled booking.
  final DateTime bookingDate;

  /// Time slot for the booking.
  final BookingTimeSlot timeSlot;

  /// List of services included in this booking.
  final List<BookedService> services;

  /// Current status of the booking.
  final BookingStatus status;

  /// Total amount for all services.
  final double totalAmount;

  /// Type of vehicle for the service.
  final VehicleType vehicleType;

  /// Whether pickup and delivery service is included.
  final bool pickupAndDelivery;

  /// Timestamp when the booking was created.
  final DateTime createdAt;

  /// Timestamp when the booking was completed (if applicable).
  final DateTime? completedAt;

  /// Timestamp when the booking was cancelled (if applicable).
  final DateTime? cancelledAt;

  /// Returns true if this is an upcoming booking.
  bool get isUpcoming => status.isUpcoming;

  /// Returns true if this is a past/historical booking.
  bool get isPast => status.isPast;

  /// Returns the primary service name or a summary of services.
  String get primaryServiceName {
    if (services.isEmpty) return 'No services';
    if (services.length == 1) return services.first.name;
    return '${services.first.name} +${services.length - 1} more';
  }

  /// Returns a formatted total amount string.
  String get formattedTotalAmount => '₹${totalAmount.toStringAsFixed(2)}';

  /// Returns the full location string.
  String get fullLocation => '$shopAddress, $shopCity';

  /// Returns the total duration of all services in minutes.
  int get totalDuration =>
      services.fold(0, (sum, service) => sum + service.duration);

  /// Returns a formatted total duration string.
  String get formattedTotalDuration {
    final duration = totalDuration;
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

  /// Creates a copy of this [Booking] with the given fields replaced.
  Booking copyWith({
    String? id,
    String? bookingReference,
    String? shopId,
    String? shopName,
    String? shopImageUrl,
    String? shopAddress,
    String? shopCity,
    DateTime? bookingDate,
    BookingTimeSlot? timeSlot,
    List<BookedService>? services,
    BookingStatus? status,
    double? totalAmount,
    VehicleType? vehicleType,
    bool? pickupAndDelivery,
    DateTime? createdAt,
    DateTime? completedAt,
    DateTime? cancelledAt,
  }) {
    return Booking(
      id: id ?? this.id,
      bookingReference: bookingReference ?? this.bookingReference,
      shopId: shopId ?? this.shopId,
      shopName: shopName ?? this.shopName,
      shopImageUrl: shopImageUrl ?? this.shopImageUrl,
      shopAddress: shopAddress ?? this.shopAddress,
      shopCity: shopCity ?? this.shopCity,
      bookingDate: bookingDate ?? this.bookingDate,
      timeSlot: timeSlot ?? this.timeSlot,
      services: services ?? this.services,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      vehicleType: vehicleType ?? this.vehicleType,
      pickupAndDelivery: pickupAndDelivery ?? this.pickupAndDelivery,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      cancelledAt: cancelledAt ?? this.cancelledAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        bookingReference,
        shopId,
        shopName,
        shopImageUrl,
        shopAddress,
        shopCity,
        bookingDate,
        timeSlot,
        services,
        status,
        totalAmount,
        vehicleType,
        pickupAndDelivery,
        createdAt,
        completedAt,
        cancelledAt,
      ];
}
