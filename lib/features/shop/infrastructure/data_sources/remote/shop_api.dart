import '../../../../../core/network/api_client.dart';
import '../../../../../core/network/endpoints.dart';
import '../../../domain/entities/booking_request.dart';
import '../../models/booking_confirmation_model.dart';
import '../../models/shop_model.dart';

/// Remote data source for shop API calls.
abstract class ShopApi {
  /// Get list of shops.
  Future<List<ShopModel>> getShops({
    int page = 1,
    int pageSize = 10,
    String? search,
  });

  /// Get nearby shops based on location.
  Future<List<ShopModel>> getNearbyShops({
    required double latitude,
    required double longitude,
    double maxKm = 10,
    int limit = 10,
  });

  /// Get shop details by ID.
  Future<ShopModel> getShopDetails(int shopId);

  /// Get services for a shop.
  Future<List<ShopServiceModel>> getShopServices(int shopId);

  /// Get packages for a shop.
  Future<List<ShopPackageModel>> getShopPackages(int shopId);

  /// Get accessories for a shop.
  Future<List<ShopAccessoryModel>> getShopAccessories(int shopId);

  /// Get shop availability for date range (legacy).
  Future<List<ShopDateAvailabilityModel>> getShopAvailability({
    required int shopId,
    required DateTime startDate,
    int days = 7,
  });

  /// Get weekly business hours for a shop.
  /// Returns which weekdays (0=Monday to 6=Sunday) have business hours defined.
  /// Use this to disable unavailable days in the calendar.
  Future<List<WeeklyBusinessHoursModel>> getWeeklyBusinessHours(int shopId);

  /// Get available time slots for a specific date.
  /// Use this to show available booking slots after user selects a date.
  Future<List<ScheduleSlotModel>> getShopSchedule({
    required int shopId,
    required DateTime date,
  });

  /// Add shop to favorites.
  Future<void> addToFavorites(int shopId);

  /// Remove shop from favorites.
  Future<void> removeFromFavorites(int shopId);

  /// Get user's favorite shops.
  Future<List<ShopModel>> getFavoriteShops();

  /// Get shops via reviews feed.
  Future<List<ShopModel>> getShopReviews({int page, int pageSize});

  /// Create a new booking.
  Future<BookingConfirmationModel> createBooking(BookingRequest request);
}

/// Implementation of ShopApi using ApiClient.
class ShopApiImpl implements ShopApi {
  ShopApiImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<List<ShopModel>> getShops({
    int page = 1,
    int pageSize = 10,
    String? search,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
      if (search != null) 'search': search,
    };

    final response = await apiClient.get(
      Endpoints.shops(),
      queryParameters: queryParams,
    );

    final List<dynamic> results = response.data['results'] ?? response.data;
    return results.map((json) => ShopModel.fromJson(json)).toList();
  }

  @override
  Future<List<ShopModel>> getNearbyShops({
    required double latitude,
    required double longitude,
    double maxKm = 10,
    int limit = 10,
  }) async {
    final queryParams = <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'max_km': maxKm,
      'limit': limit,
    };

    final response = await apiClient.get(
      Endpoints.nearbyShops(),
      queryParameters: queryParams,
    );

    final List<dynamic> results = response.data['results'] ?? response.data;
    return results.map((json) => ShopModel.fromJson(json)).toList();
  }

  @override
  Future<ShopModel> getShopDetails(int shopId) async {
    final response = await apiClient.get(Endpoints.shopDetails(shopId));
    return ShopModel.fromJson(response.data);
  }

  @override
  Future<List<ShopServiceModel>> getShopServices(int shopId) async {
    final response = await apiClient.get(Endpoints.shopServices(shopId));
    final List<dynamic> results = response.data['results'] ?? response.data;
    return results.map((json) => ShopServiceModel.fromJson(json)).toList();
  }

  @override
  Future<List<ShopPackageModel>> getShopPackages(int shopId) async {
    final response = await apiClient.get(Endpoints.shopPackages(shopId));
    final List<dynamic> results = response.data['results'] ?? response.data;
    return results.map((json) => ShopPackageModel.fromJson(json)).toList();
  }

  @override
  Future<List<ShopAccessoryModel>> getShopAccessories(int shopId) async {
    final response = await apiClient.get(Endpoints.shopAccessories(shopId));
    final List<dynamic> results = response.data['results'] ?? response.data;
    return results.map((json) => ShopAccessoryModel.fromJson(json)).toList();
  }

  @override
  Future<List<ShopDateAvailabilityModel>> getShopAvailability({
    required int shopId,
    required DateTime startDate,
    int days = 7,
  }) async {
    // Legacy method - now uses date-day endpoint for single day
    // For multi-day availability, loop through days
    final availabilityList = <ShopDateAvailabilityModel>[];

    for (int i = 0; i < days; i++) {
      final date = startDate.add(Duration(days: i));
      try {
        final response = await apiClient.get(
          Endpoints.shopDateDay(shopId),
          queryParameters: {
            'date': date.toIso8601String().split('T').first,
          },
        );

        // API returns { "shop": 2, "start_date": "...", "dates": [...] }
        final List<dynamic> slotsJson = response.data['dates'] ?? [];
        // Convert ScheduleSlotModel format to ShopTimeSlotModel format
        final slots = slotsJson.map((json) {
          final scheduleSlot = ScheduleSlotModel.fromJson(json as Map<String, dynamic>);
          return ShopTimeSlotModel(
            slotNumber: scheduleSlot.slotNumber,
            startTime: scheduleSlot.startTime,
            endTime: scheduleSlot.endTime,
            isAvailable: !(scheduleSlot.isBooked ?? false),
          );
        }).toList();

        availabilityList.add(ShopDateAvailabilityModel(
          date: date.toIso8601String().split('T').first,
          slots: slots,
          isOpen: slots.isNotEmpty,
        ));
      } catch (_) {
        // If fetching fails for a date, mark as unavailable
        availabilityList.add(ShopDateAvailabilityModel(
          date: date.toIso8601String().split('T').first,
          slots: [],
          isOpen: false,
        ));
      }
    }

    return availabilityList;
  }

  @override
  Future<List<WeeklyBusinessHoursModel>> getWeeklyBusinessHours(int shopId) async {
    final response = await apiClient.get(
      Endpoints.weeklyBusinessHours(),
      queryParameters: {'shop': shopId},
    );

    final List<dynamic> results = response.data['results'] ?? response.data;
    return results
        .map((json) => WeeklyBusinessHoursModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<ScheduleSlotModel>> getShopSchedule({
    required int shopId,
    required DateTime date,
  }) async {
    final response = await apiClient.get(
      Endpoints.shopDateDay(shopId),
      queryParameters: {
        'date': date.toIso8601String().split('T').first,
      },
    );

    // API returns { "shop": 2, "start_date": "...", "dates": [...] }
    final List<dynamic> dates = response.data['dates'] ?? [];
    return dates
        .map((json) => ScheduleSlotModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> addToFavorites(int shopId) async {
    await apiClient.post(
      Endpoints.addShopFavorite(),
      data: {'shop': shopId},
    );
  }

  @override
  Future<void> removeFromFavorites(int shopId) async {
    await apiClient.delete(Endpoints.removeShopFavorite(shopId));
  }

  @override
  Future<List<ShopModel>> getFavoriteShops() async {
    final response = await apiClient.get(Endpoints.listShopFavorites());
    final List<dynamic> results = response.data['results'] ?? response.data;
    return results.map((json) => ShopModel.fromJson(json)).toList();
  }

  @override
  Future<List<ShopModel>> getShopReviews({int page = 1, int pageSize = 10}) async {
    final response = await apiClient.get(
      Endpoints.shopReviews(),
      queryParameters: {
        'page': page,
        'page_size': pageSize,
      },
    );

    final List<dynamic> results = response.data['results'] ?? response.data;
    final shops = <ShopModel>[];
    for (final item in results) {
      final shopJson = (item as Map<String, dynamic>)['shop'] as Map<String, dynamic>?;
      if (shopJson != null) {
        shops.add(ShopModel.fromJson(shopJson));
      }
    }
    return shops;
  }

  @override
  Future<BookingConfirmationModel> createBooking(BookingRequest request) async {
    final response = await apiClient.post(
      Endpoints.initiateBooking(),
      data: request.toJson(),
    );
    return BookingConfirmationModel.fromJson(response.data);
  }
}
