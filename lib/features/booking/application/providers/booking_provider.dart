import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/booking_data.dart';
import '../../domain/entities/time_slot.dart';

/// Provider for current booking data.
final bookingDataProvider =
    StateNotifierProvider<BookingDataNotifier, BookingData?>((ref) {
  return BookingDataNotifier();
});

/// State notifier for managing booking data across screens.
class BookingDataNotifier extends StateNotifier<BookingData?> {
  BookingDataNotifier() : super(null);

  /// Initialize booking with shop and selected items.
  void initializeBooking({
    required String shopId,
    required String shopName,
    required String shopImageUrl,
    required String shopAddress,
    required double shopRating,
    required List<SelectedItem> selectedServices,
    required List<SelectedItem> selectedPackages,
    required List<SelectedItem> selectedAccessories,
    String? vehicleType,
    String? vehicleId,
  }) {
    final subtotal = _calculateSubtotal(
      selectedServices,
      selectedPackages,
      selectedAccessories,
    );

    state = BookingData(
      shopId: shopId,
      shopName: shopName,
      shopImageUrl: shopImageUrl,
      shopAddress: shopAddress,
      shopRating: shopRating,
      selectedServices: selectedServices,
      selectedPackages: selectedPackages,
      selectedAccessories: selectedAccessories,
      vehicleType: vehicleType,
      vehicleId: vehicleId,
      subtotal: subtotal,
      adminFee: 2.50, // Default admin fee
    );
  }

  /// Select date for booking.
  void selectDate(DateTime date) {
    if (state == null) return;
    state = state!.copyWith(selectedDate: date);
  }

  /// Select time slot for booking.
  void selectTimeSlot(String timeSlotId, String displayTime) {
    if (state == null) return;
    state = state!.copyWith(
      selectedTimeSlotId: timeSlotId,
      selectedTimeSlot: displayTime,
    );
  }

  /// Toggle pickup and delivery option.
  void togglePickupAndDelivery(bool value) {
    if (state == null) return;
    state = state!.copyWith(pickupAndDelivery: value);
  }

  /// Set phone number.
  void setPhoneNumber(String phone) {
    if (state == null) return;
    state = state!.copyWith(phoneNumber: phone);
  }

  /// Apply promo code.
  void applyPromoCode(String code, double discount) {
    if (state == null) return;
    state = state!.copyWith(
      promoCode: code,
      discount: discount,
    );
  }

  /// Remove promo code.
  void removePromoCode() {
    if (state == null) return;
    state = state!.copyWith(
      promoCode: null,
      discount: 0.0,
    );
  }

  /// Clear booking data.
  void clearBooking() {
    state = null;
  }

  double _calculateSubtotal(
    List<SelectedItem> services,
    List<SelectedItem> packages,
    List<SelectedItem> accessories,
  ) {
    double total = 0;
    for (final item in services) {
      total += item.price;
    }
    for (final item in packages) {
      total += item.price;
    }
    for (final item in accessories) {
      total += item.price;
    }
    return total;
  }
}

/// Provider for selected date.
final selectedDateProvider = StateProvider<DateTime?>((ref) => null);

/// Provider for selected time slot.
final selectedTimeSlotProvider = StateProvider<TimeSlot?>((ref) => null);

/// Provider for pickup and delivery toggle.
final pickupDeliveryProvider = StateProvider<bool>((ref) => false);

/// Provider for available time slots.
final availableTimeSlotsProvider = Provider<List<TimeSlot>>((ref) {
  // Mock time slots - in real app, this would come from API
  return [
    const TimeSlot(id: '1', time: '10:00', displayTime: '10:00 AM'),
    const TimeSlot(id: '2', time: '11:00', displayTime: '11:00 AM'),
    const TimeSlot(id: '3', time: '13:00', displayTime: '1:00 PM', isAvailable: false),
    const TimeSlot(id: '4', time: '15:00', displayTime: '3:00 PM'),
  ];
});

/// Provider for current month being displayed in calendar.
final currentCalendarMonthProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

/// Get dates for current month.
List<DateTime> getDatesForMonth(DateTime month) {
  final firstDayOfMonth = DateTime(month.year, month.month, 1);
  final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);

  final dates = <DateTime>[];

  // Add days from previous month to fill first week
  final firstWeekday = firstDayOfMonth.weekday;
  if (firstWeekday != 1) {
    final daysToAdd = firstWeekday - 1;
    for (int i = daysToAdd; i > 0; i--) {
      dates.add(firstDayOfMonth.subtract(Duration(days: i)));
    }
  }

  // Add all days of current month
  for (int i = 0; i < lastDayOfMonth.day; i++) {
    dates.add(DateTime(month.year, month.month, i + 1));
  }

  // Add days from next month to complete last week
  final remaining = 7 - (dates.length % 7);
  if (remaining < 7) {
    for (int i = 1; i <= remaining; i++) {
      dates.add(DateTime(month.year, month.month + 1, i));
    }
  }

  return dates;
}

/// Check if date is in the past.
bool isDateInPast(DateTime date) {
  final today = DateTime.now();
  final dateOnly = DateTime(date.year, date.month, date.day);
  final todayOnly = DateTime(today.year, today.month, today.day);
  return dateOnly.isBefore(todayOnly);
}

/// Check if date is today.
bool isToday(DateTime date) {
  final today = DateTime.now();
  return date.year == today.year &&
      date.month == today.month &&
      date.day == today.day;
}

/// Format month name.
String getMonthName(int month) {
  const months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  return months[month - 1];
}
