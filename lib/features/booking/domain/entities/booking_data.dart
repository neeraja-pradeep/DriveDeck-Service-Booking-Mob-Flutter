import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../home/domain/entities/shop_details.dart';

part 'booking_data.freezed.dart';
part 'booking_data.g.dart';

/// Complete booking data collected across all booking screens.
@freezed
class BookingData with _$BookingData {
  const factory BookingData({
    // Shop information
    required String shopId,
    required String shopName,
    required String shopImageUrl,
    required String shopAddress,
    required double shopRating,

    // Selected services/packages/accessories
    @Default([]) List<SelectedItem> selectedServices,
    @Default([]) List<SelectedItem> selectedPackages,
    @Default([]) List<SelectedItem> selectedAccessories,

    // Vehicle type
    String? vehicleType,
    String? vehicleId,

    // Date and time
    DateTime? selectedDate,
    String? selectedTimeSlot,
    String? selectedTimeSlotId,

    // Pickup and delivery
    @Default(false) bool pickupAndDelivery,

    // Contact info
    String? phoneNumber,

    // Price details
    @Default(0.0) double subtotal,
    @Default(0.0) double adminFee,
    @Default(0.0) double discount,

    // Promo code
    String? promoCode,
  }) = _BookingData;

  factory BookingData.fromJson(Map<String, dynamic> json) =>
      _$BookingDataFromJson(json);
}

/// Extension for calculated properties
extension BookingDataX on BookingData {
  /// Calculate total price
  double get totalPrice => subtotal + adminFee - discount;

  /// Get all selected items count
  int get totalItemsCount =>
      selectedServices.length +
      selectedPackages.length +
      selectedAccessories.length;

  /// Get formatted date
  String get formattedDate {
    if (selectedDate == null) return '';
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${selectedDate!.day} ${months[selectedDate!.month - 1]} ${selectedDate!.year}';
  }

  /// Get primary service name for display
  String get primaryServiceName {
    if (selectedServices.isNotEmpty) return selectedServices.first.name;
    if (selectedPackages.isNotEmpty) return selectedPackages.first.name;
    if (selectedAccessories.isNotEmpty) return selectedAccessories.first.name;
    return 'No service selected';
  }

  /// Get service type display
  String get serviceTypeDisplay {
    final items = <String>[];
    if (selectedServices.isNotEmpty) {
      items.add('${selectedServices.length} service${selectedServices.length > 1 ? 's' : ''}');
    }
    if (selectedPackages.isNotEmpty) {
      items.add('${selectedPackages.length} package${selectedPackages.length > 1 ? 's' : ''}');
    }
    if (selectedAccessories.isNotEmpty) {
      items.add('${selectedAccessories.length} accessor${selectedAccessories.length > 1 ? 'ies' : 'y'}');
    }
    return items.join(', ');
  }
}

/// Represents a selected item (service, package, or accessory).
@freezed
class SelectedItem with _$SelectedItem {
  const factory SelectedItem({
    required String id,
    required String name,
    required double price,
    String? description,
  }) = _SelectedItem;

  factory SelectedItem.fromJson(Map<String, dynamic> json) =>
      _$SelectedItemFromJson(json);

  /// Create from Service entity
  factory SelectedItem.fromService(Service service) => SelectedItem(
        id: service.id,
        name: service.name,
        price: service.price,
      );

  /// Create from Package entity
  factory SelectedItem.fromPackage(Package package) => SelectedItem(
        id: package.id,
        name: package.name,
        price: package.price,
        description: package.includedServices.join(', '),
      );

  /// Create from Accessory entity
  factory SelectedItem.fromAccessory(Accessory accessory) => SelectedItem(
        id: accessory.id,
        name: accessory.name,
        price: accessory.price,
        description: accessory.description,
      );
}
