import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/error/failure.dart';
import '../../../bookings/application/providers/bookings_providers.dart';
import '../../../shop/application/providers/shop_providers.dart';
import '../../../shop/domain/entities/booking_confirmation.dart';
import '../../../shop/domain/entities/booking_request.dart';
import '../../../shop/domain/entities/shop.dart';
import '../../../shop/domain/entities/vehicle_type.dart';
import '../../../shop/infrastructure/models/shop_model.dart';
import '../../../home/application/providers/home_provider.dart';
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

/// Provider for available time slots from API.
/// Fetches slots from /api/shop/schedule/ based on selected date and shop.
final availableTimeSlotsAsyncProvider =
    FutureProvider.autoDispose<List<TimeSlot>>((ref) async {
  final bookingData = ref.watch(bookingDataProvider);
  final selectedDate = ref.watch(selectedDateProvider);

  // If no shop or date selected, return empty list
  if (bookingData == null || selectedDate == null) {
    return [];
  }

  final shopId = int.tryParse(bookingData.shopId);
  if (shopId == null) {
    return [];
  }

  try {
    final shopApi = ref.watch(shopApiProvider);
    final scheduleSlots = await shopApi.getShopSchedule(
      shopId: shopId,
      date: selectedDate,
    );

    debugPrint('📅 Fetched ${scheduleSlots.length} slots for $selectedDate');

    // Convert API slots to TimeSlot entities
    return scheduleSlots.map((slot) {
      final domainSlot = slot.toDomain();
      return TimeSlot(
        id: domainSlot.slotNumber.toString(),
        time: domainSlot.startTime,
        displayTime: _formatTimeDisplay(domainSlot.startTime),
        isAvailable: domainSlot.isAvailable,
      );
    }).toList();
  } catch (e) {
    debugPrint('❌ Failed to fetch slots: $e');
    return [];
  }
});

/// Format time for display (e.g., "09:00" -> "9:00 AM")
String _formatTimeDisplay(String time) {
  try {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = parts.length > 1 ? parts[1] : '00';
    final isPM = hour >= 12;
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute ${isPM ? 'PM' : 'AM'}';
  } catch (e) {
    return time;
  }
}

/// Sync provider that reads from async provider (for backwards compatibility).
final availableTimeSlotsProvider = Provider<List<TimeSlot>>((ref) {
  final asyncSlots = ref.watch(availableTimeSlotsAsyncProvider);
  return asyncSlots.when(
    data: (slots) => slots,
    loading: () => [],
    error: (_, __) => [],
  );
});

/// Provider for weekly business hours (to disable unavailable weekdays in calendar).
final weeklyBusinessHoursProvider =
    FutureProvider.autoDispose<List<WeeklyBusinessHours>>((ref) async {
  final bookingData = ref.watch(bookingDataProvider);

  if (bookingData == null) {
    return [];
  }

  final shopId = int.tryParse(bookingData.shopId);
  if (shopId == null) {
    return [];
  }

  try {
    final shopApi = ref.watch(shopApiProvider);
    final hoursModels = await shopApi.getWeeklyBusinessHours(shopId);
    debugPrint('📆 Fetched ${hoursModels.length} business hours for shop $shopId');
    return hoursModels.map((m) => m.toDomain()).toList();
  } catch (e) {
    debugPrint('❌ Failed to fetch weekly business hours: $e');
    return [];
  }
});

/// Provider that returns a set of valid weekdays (0=Monday to 6=Sunday).
/// Use this to enable/disable dates in the calendar.
final availableWeekdaysProvider = Provider<Set<int>>((ref) {
  final hoursAsync = ref.watch(weeklyBusinessHoursProvider);
  return hoursAsync.when(
    data: (hours) {
      // Only include weekdays that have hours defined and are not marked as closed
      return hours
          .where((h) => !h.isClosed)
          .map((h) => h.weekday)
          .toSet();
    },
    loading: () => {0, 1, 2, 3, 4, 5, 6}, // Allow all while loading
    error: (_, __) => {0, 1, 2, 3, 4, 5, 6}, // Allow all on error
  );
});

/// Loading state for time slots.
final timeSlotsLoadingProvider = Provider<bool>((ref) {
  final asyncSlots = ref.watch(availableTimeSlotsAsyncProvider);
  return asyncSlots.isLoading;
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

// ============================================================================
// Booking Creation State
// ============================================================================

/// State for booking creation process.
sealed class BookingCreationState {
  const BookingCreationState();
}

/// Initial state - no booking in progress.
class BookingCreationInitial extends BookingCreationState {
  const BookingCreationInitial();
}

/// Loading state - booking is being created.
class BookingCreationLoading extends BookingCreationState {
  const BookingCreationLoading();
}

/// Success state - booking was created successfully.
class BookingCreationSuccess extends BookingCreationState {
  final BookingConfirmation confirmation;
  const BookingCreationSuccess(this.confirmation);
}

/// Error state - booking creation failed.
class BookingCreationError extends BookingCreationState {
  final Failure failure;
  const BookingCreationError(this.failure);
}

/// Notifier for booking creation process.
class BookingCreationNotifier extends StateNotifier<BookingCreationState> {
  BookingCreationNotifier(this._ref) : super(const BookingCreationInitial());

  final Ref _ref;

  /// Create a booking from the current booking data.
  Future<bool> createBooking({
    required String paymentMethod,
  }) async {
    final bookingData = _ref.read(bookingDataProvider);
    if (bookingData == null) {
      state = const BookingCreationError(
        Failure.validation(message: 'No booking data available'),
      );
      return false;
    }

    // Validate required fields
    if (bookingData.selectedDate == null) {
      state = const BookingCreationError(
        Failure.validation(message: 'Please select a date'),
      );
      return false;
    }

    if (bookingData.selectedTimeSlotId == null) {
      state = const BookingCreationError(
        Failure.validation(message: 'Please select a time slot'),
      );
      return false;
    }

    state = const BookingCreationLoading();

    try {
      // Parse shopId to int
      final shopId = int.tryParse(bookingData.shopId);
      if (shopId == null) {
        state = const BookingCreationError(
          Failure.validation(message: 'Invalid shop ID'),
        );
        return false;
      }

      // Parse timeSlotId to int
      final timeSlotId = int.tryParse(bookingData.selectedTimeSlotId!);
      if (timeSlotId == null) {
        state = const BookingCreationError(
          Failure.validation(message: 'Invalid time slot ID'),
        );
        return false;
      }

      // Resolve authenticated user id (required in body).
      final userIdStr = _ref.read(currentUserIdProvider);
      if (userIdStr == null || userIdStr.isEmpty) {
        state = const BookingCreationError(
          Failure.validation(message: 'Missing user ID'),
        );
        return false;
      }

      final userId = int.tryParse(userIdStr);
      if (userId == null) {
        state = const BookingCreationError(
          Failure.validation(message: 'Invalid user ID'),
        );
        return false;
      }

      // Parse vehicle type
      final vehicleType = bookingData.vehicleType != null
          ? VehicleTypeExtension.fromString(bookingData.vehicleType!)
          : VehicleType.sedan;

      // Build booking request
      final request = BookingRequest(
        shopId: shopId,
        userId: userId,
        selectedServiceIds:
            bookingData.selectedServices.map((s) => s.id).toList(),
        selectedPackageIds:
            bookingData.selectedPackages.map((p) => p.id).toList(),
        selectedAccessoryIds:
            bookingData.selectedAccessories.map((a) => a.id).toList(),
        appointmentDate: bookingData.selectedDate!,
        serviceId: _resolveServiceId(bookingData),
        timeSlotId: timeSlotId,
        vehicleType: vehicleType,
        pickupAndDelivery: bookingData.pickupAndDelivery,
        promoCode: bookingData.promoCode,
        paymentMethod: paymentMethod,
        vehicleId: bookingData.vehicleId,
        durationInBlocks: _calculateDurationInBlocks(bookingData),
        amount: bookingData.totalPrice,
        status: 'pending',
      );

      debugPrint('📦 Creating booking with request: ${request.toJson()}');

      // Call the use case
      final useCase = _ref.read(createBookingUseCaseProvider);
      final result = await useCase(request);

      return result.fold(
        (failure) {
          debugPrint('❌ Booking creation failed: ${failure.message}');
          state = BookingCreationError(failure);
          return false;
        },
        (confirmation) {
          debugPrint(
            '✅ Booking created: ${confirmation.bookingReference}',
          );
          state = BookingCreationSuccess(confirmation);
          // Clear booking data after successful creation
          _ref.read(bookingDataProvider.notifier).clearBooking();
          // Invalidate bookings list so it refreshes when user navigates to it
          _ref.invalidate(bookingsStateProvider);
          return true;
        },
      );
    } catch (e) {
      debugPrint('❌ Booking creation exception: $e');
      state = BookingCreationError(
        Failure.unknown(message: e.toString()),
      );
      return false;
    }
  }

  /// Estimate duration in blocks; fallback to 1 when unknown.
  int _calculateDurationInBlocks(BookingData bookingData) {
    final itemCount = bookingData.selectedServices.length +
        bookingData.selectedPackages.length +
        bookingData.selectedAccessories.length;
    return itemCount > 0 ? itemCount : 1;
  }

  /// Resolve primary service id for API (backend expects single service_id).
  int _resolveServiceId(BookingData bookingData) {
    // Prefer first selected service; fallback to first package or accessory id.
    final candidate = bookingData.selectedServices.isNotEmpty
        ? bookingData.selectedServices.first.id
        : bookingData.selectedPackages.isNotEmpty
            ? bookingData.selectedPackages.first.id
            : bookingData.selectedAccessories.isNotEmpty
                ? bookingData.selectedAccessories.first.id
                : null;

    final parsed = candidate != null ? int.tryParse(candidate) : null;
    if (parsed == null) {
      throw Exception('Missing or invalid service_id');
    }
    return parsed;
  }

  /// Reset state to initial.
  void reset() {
    state = const BookingCreationInitial();
  }
}

/// Provider for booking creation state.
final bookingCreationProvider =
    StateNotifierProvider<BookingCreationNotifier, BookingCreationState>((ref) {
  return BookingCreationNotifier(ref);
});
