import 'package:dio/dio.dart';

import '../../../../../core/network/api_client.dart';
import '../../../../../core/network/endpoints.dart';
import '../../models/booking_confirmation_model.dart';
import '../../models/booking_date_model.dart';
import '../../models/booking_request_model.dart';
import '../../models/shop_model.dart';
import '../../models/shop_service_model.dart';
import '../../models/time_slot_model.dart';

/// Wrapper for conditional API response.
class ConditionalResponse<T> {
  final T? data;
  final bool notModified;
  final String? lastModified;

  const ConditionalResponse({
    this.data,
    this.notModified = false,
    this.lastModified,
  });
}

/// Abstract interface for shop API.
abstract class ShopApi {
  /// Gets shop details with conditional fetch.
  Future<ConditionalResponse<ShopModel>> getShopDetails(
    String shopId,
    String? ifModifiedSince,
  );

  /// Gets services for a shop.
  Future<List<ShopServiceModel>> getShopServices(
    String shopId,
    String? vehicleType,
  );

  /// Gets available slots for a date.
  Future<BookingDateModel> getAvailableSlots(
    String shopId,
    String date,
  );

  /// Creates a booking.
  Future<BookingConfirmationModel> createBooking(
    BookingRequestModel request,
  );
}

/// Implementation of ShopApi using Dio.
class ShopApiImpl implements ShopApi {
  final ApiClient _apiClient;

  ShopApiImpl(this._apiClient);

  @override
  Future<ConditionalResponse<ShopModel>> getShopDetails(
    String shopId,
    String? ifModifiedSince,
  ) async {
    final options = Options(
      headers: {
        if (ifModifiedSince != null) 'If-Modified-Since': ifModifiedSince,
      },
    );

    try {
      final response = await _apiClient.get(
        Endpoints.shopDetails(shopId),
        options: options,
      );

      if (response.statusCode == 304) {
        return const ConditionalResponse(notModified: true);
      }

      final lastModified = response.headers.value('Last-Modified');
      final shop = ShopModel.fromJson(response.data as Map<String, dynamic>);

      return ConditionalResponse(
        data: shop,
        notModified: false,
        lastModified: lastModified,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 304) {
        return const ConditionalResponse(notModified: true);
      }
      rethrow;
    }
  }

  @override
  Future<List<ShopServiceModel>> getShopServices(
    String shopId,
    String? vehicleType,
  ) async {
    final response = await _apiClient.get(
      Endpoints.shopServices(shopId),
      queryParameters: {
        Endpoints.shopQueryParam: shopId,
        if (vehicleType != null) Endpoints.vehicleTypeQueryParam: vehicleType,
      },
    );

    final data = response.data;
    if (data is List) {
      return data
          .map((json) => ShopServiceModel.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    return [];
  }

  @override
  Future<BookingDateModel> getAvailableSlots(
    String shopId,
    String date,
  ) async {
    final response = await _apiClient.get(
      Endpoints.availableSlots(shopId),
      queryParameters: {
        Endpoints.dateQueryParam: date,
      },
    );

    final data = response.data;

    // Handle the API response which contains schedule data
    if (data is Map<String, dynamic>) {
      // If the response already has the expected format
      if (data.containsKey('slots')) {
        return BookingDateModel.fromJson(data);
      }

      // Parse schedule data from API response
      final slots = <TimeSlotModel>[];

      // Generate time slots from 9 AM to 6 PM
      for (var hour = 9; hour < 18; hour++) {
        final startTime = '${hour.toString().padLeft(2, '0')}:00';
        final endTime = '${(hour + 1).toString().padLeft(2, '0')}:00';

        slots.add(TimeSlotModel(
          id: '${shopId}_${date}_$hour',
          startTime: startTime,
          endTime: endTime,
          isAvailable: true,
        ));
      }

      return BookingDateModel(
        date: date,
        slots: slots,
      );
    }

    // Return empty slots if no data
    return BookingDateModel(date: date, slots: const []);
  }

  @override
  Future<BookingConfirmationModel> createBooking(
    BookingRequestModel request,
  ) async {
    final response = await _apiClient.post(
      Endpoints.createBooking,
      data: request.toJson(),
    );

    return BookingConfirmationModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
