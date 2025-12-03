import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/network/api_client.dart';
import '../../../../../core/network/endpoints.dart';
import '../../models/car_wash_shop_model.dart';
import '../../models/service_category_model.dart';
import '../../models/user_profile_model.dart';

/// Provider for the Home API data source.
final homeApiProvider = Provider<HomeApi>((ref) {
  return HomeApi(ref.read(apiClientProvider));
});

/// Remote data source for home screen API calls.
class HomeApi {
  final ApiClient _apiClient;

  HomeApi(this._apiClient);

  /// Fetches the current user's profile.
  Future<UserProfileModel> getUserProfile() async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      Endpoints.profile(),
    );

    return UserProfileModel.fromJson(response.data!);
  }

  /// Updates the current user's profile with location data.
  Future<UserProfileModel> updateUserProfile({
    String? name,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    double? latitude,
    double? longitude,
  }) async {
    final updateData = <String, dynamic>{};

    if (name != null) updateData['name'] = name;
    if (firstName != null) updateData['first_name'] = firstName;
    if (lastName != null) updateData['last_name'] = lastName;
    if (email != null) updateData['email'] = email;
    if (phone != null) updateData['phone'] = phone;
    if (latitude != null) updateData['latitude'] = latitude;
    if (longitude != null) updateData['longitude'] = longitude;

    final response = await _apiClient.patch<Map<String, dynamic>>(
      Endpoints.profile(),
      data: updateData,
    );

    return UserProfileModel.fromJson(response.data!);
  }

  /// Fetches service categories with conditional caching support.
  Future<ConditionalApiResponse<List<ServiceCategoryModel>>>
  getServiceCategories({DateTime? ifModifiedSince}) async {
    return _apiClient.getConditional<List<ServiceCategoryModel>>(
      Endpoints.shopCategories(),
      ifModifiedSince: ifModifiedSince,
      fromJson: (data) {
        if (data is List) {
          return data
              .map(
                (item) =>
                    ServiceCategoryModel.fromJson(item as Map<String, dynamic>),
              )
              .toList();
        }
        // Handle paginated response
        final response = data as Map<String, dynamic>;
        if (response.containsKey('results')) {
          return (response['results'] as List)
              .map(
                (item) =>
                    ServiceCategoryModel.fromJson(item as Map<String, dynamic>),
              )
              .toList();
        }
        return <ServiceCategoryModel>[];
      },
    );
  }

  /// Fetches shops near the user's location.
  Future<ConditionalApiResponse<List<CarWashShopModel>>> getShopsNearYou({
    required double latitude,
    required double longitude,
    DateTime? ifModifiedSince,
  }) async {
    return _apiClient.getConditional<List<CarWashShopModel>>(
      Endpoints.shopsNearYou(),
      ifModifiedSince: ifModifiedSince,
      queryParameters: {
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
      },
      fromJson: (data) {
        if (data is List) {
          return data
              .map(
                (item) =>
                    CarWashShopModel.fromJson(item as Map<String, dynamic>),
              )
              .toList();
        }
        // Handle paginated response
        final response = data as Map<String, dynamic>;
        if (response.containsKey('results')) {
          return (response['results'] as List)
              .map(
                (item) =>
                    CarWashShopModel.fromJson(item as Map<String, dynamic>),
              )
              .toList();
        }
        return <CarWashShopModel>[];
      },
    );
  }

  /// Searches for shops by query.
  Future<ShopsResponse> searchShops({
    required String query,
    int page = 1,
    int pageSize = 10,
  }) async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      Endpoints.shops(search: query, page: page, pageSize: pageSize),
    );

    return ShopsResponse.fromJson(response.data!);
  }

  /// Toggles wishlist status for a shop.
  Future<bool> toggleWishlist({required int shopId}) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      Endpoints.toggleWishlist(shopId.toString()),
    );

    // Assuming the API returns the new wishlist status
    return response.data?['is_wishlisted'] as bool? ?? false;
  }
}
