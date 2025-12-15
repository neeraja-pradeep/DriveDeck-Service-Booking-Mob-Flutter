import 'package:dio/dio.dart';

import '../../../../../core/network/api_client.dart';
import '../../../../../core/network/endpoints.dart';
import '../../models/booking_model.dart';
import '../../models/bookings_list_model.dart';
import '../../models/payment_models.dart';

/// Abstract class defining the remote data source for bookings.
abstract class BookingsApi {
  /// Fetches all bookings with optional conditional request.
  ///
  /// [ifModifiedSince] - Optional header for conditional fetching.
  /// [status] - Filter by status ('booked' or 'history').
  ///
  /// Returns the response containing bookings data.
  Future<ConditionalApiResponse<BookingsListModel>> getBookings({
    String? ifModifiedSince,
    String? status,
  });

  /// Fetches details of a specific booking.
  Future<BookingModel> getBookingDetails(String bookingId);

  /// Cancels a booking.
  Future<BookingModel> cancelBooking(String bookingId);

  /// Reschedules a booking.
  Future<BookingModel> rescheduleBooking({
    required String bookingId,
    required DateTime newDate,
    required String newSlotId,
  });

  /// Initiates a booking with payment.
  /// Returns Razorpay order details for payment processing.
  Future<InitiateBookingResponse> initiateBooking(InitiateBookingRequest request);

  /// Verifies payment after Razorpay callback.
  Future<VerifyPaymentResponse> verifyPayment(VerifyPaymentRequest request);

  /// Initiates a refund for a booking.
  Future<InitiateRefundResponse> initiateRefund(InitiateRefundRequest request);
}

/// Response wrapper for conditional API requests.
class ConditionalApiResponse<T> {
  /// Creates a new [ConditionalApiResponse].
  const ConditionalApiResponse({
    required this.data,
    required this.statusCode,
    this.lastModified,
  });

  /// The response data (null if 304).
  final T? data;

  /// HTTP status code.
  final int statusCode;

  /// Last-Modified header value.
  final String? lastModified;

  /// Returns true if the data was modified (200 OK).
  bool get isModified => statusCode == 200;

  /// Returns true if the data was not modified (304).
  bool get isNotModified => statusCode == 304;
}

/// Implementation of [BookingsApi] using Dio.
class BookingsApiImpl implements BookingsApi {
  /// Creates a new [BookingsApiImpl].
  BookingsApiImpl({required this.apiClient});

  /// The API client for making HTTP requests.
  final ApiClient apiClient;

  @override
  Future<ConditionalApiResponse<BookingsListModel>> getBookings({
    String? ifModifiedSince,
    String? status,
  }) async {
    final headers = <String, dynamic>{};
    if (ifModifiedSince != null) {
      headers['If-Modified-Since'] = ifModifiedSince;
    }

    final queryParams = <String, dynamic>{};
    if (status != null) {
      queryParams['status'] = status;
    }

    try {
      final response = await apiClient.get<dynamic>(
        Endpoints.bookings(),
        headers: headers,
        queryParameters: queryParams,
        options: Options(
          validateStatus: (status) => status == 200 || status == 304,
        ),
      );

      if (response.statusCode == 304) {
        return ConditionalApiResponse<BookingsListModel>(
          data: null,
          statusCode: 304,
          lastModified: response.headers.value('Last-Modified'),
        );
      }

      final data = response.data;
      BookingsListModel bookingsList;

      if (data is List) {
        bookingsList = BookingsListModel.fromJson(data);
      } else if (data is Map<String, dynamic>) {
        // Check if response has 'results' key (paginated response)
        final results = data['results'] ?? data;
        bookingsList = BookingsListModel.fromJson(results);
      } else {
        bookingsList = const BookingsListModel(
          upcomingBookings: [],
          pastBookings: [],
        );
      }

      return ConditionalApiResponse<BookingsListModel>(
        data: bookingsList,
        statusCode: 200,
        lastModified: response.headers.value('Last-Modified'),
      );
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<BookingModel> getBookingDetails(String bookingId) async {
    final response = await apiClient.get<Map<String, dynamic>>(
      Endpoints.bookingDetails(bookingId),
    );

    return BookingModel.fromJson(response.data!);
  }

  @override
  Future<BookingModel> cancelBooking(String bookingId) async {
    final response = await apiClient.post<Map<String, dynamic>>(
      Endpoints.cancelBooking(bookingId),
    );

    return BookingModel.fromJson(response.data!);
  }

  @override
  Future<BookingModel> rescheduleBooking({
    required String bookingId,
    required DateTime newDate,
    required String newSlotId,
  }) async {
    final response = await apiClient.post<Map<String, dynamic>>(
      Endpoints.rescheduleBooking(bookingId),
      data: {
        'date': newDate.toIso8601String().split('T').first,
        'slot_id': newSlotId,
      },
    );

    return BookingModel.fromJson(response.data!);
  }

  @override
  Future<InitiateBookingResponse> initiateBooking(
    InitiateBookingRequest request,
  ) async {
    final response = await apiClient.post<Map<String, dynamic>>(
      Endpoints.initiateBooking(),
      data: request.toJson(),
    );

    return InitiateBookingResponse.fromJson(response.data!);
  }

  @override
  Future<VerifyPaymentResponse> verifyPayment(
    VerifyPaymentRequest request,
  ) async {
    final response = await apiClient.post<Map<String, dynamic>>(
      Endpoints.verifyPayment(),
      data: request.toJson(),
    );

    return VerifyPaymentResponse.fromJson(response.data!);
  }

  @override
  Future<InitiateRefundResponse> initiateRefund(
    InitiateRefundRequest request,
  ) async {
    final response = await apiClient.post<Map<String, dynamic>>(
      Endpoints.initiateRefund(),
      data: request.toJson(),
    );

    return InitiateRefundResponse.fromJson(response.data!);
  }
}
