import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/network/api_client.dart';
import '../../../../../core/network/endpoints.dart';
import '../../../../auth/application/providers/auth_providers.dart';
import '../../models/car_wash_shop_model.dart';
import '../../models/service_category_model.dart';
import '../../models/user_profile_model.dart';

/// Provider for the Home API data source.
/// Uses the shared apiClientProvider to ensure session cookies are attached.
final homeApiProvider = Provider<HomeApi>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return HomeApi(apiClient);
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

  /// Fetches service categories.
  Future<List<ServiceCategoryModel>> getServiceCategories() async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      Endpoints.shopCategories(),
    );

    final data = response.data!;
    if (data['results'] is List) {
      return (data['results'] as List)
          .map(
            (item) =>
                ServiceCategoryModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    }
    return <ServiceCategoryModel>[];
  }

  /// Fetches shops near the user's location.
  Future<List<CarWashShopModel>> getShopsNearYou({
    required double latitude,
    required double longitude,
  }) async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      Endpoints.shopsNearYou(),
      queryParameters: {
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
      },
    );

    final data = response.data!;
    if (data['results'] is List) {
      return (data['results'] as List)
          .map(
            (item) => CarWashShopModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    }
    return <CarWashShopModel>[];
  }

  /// Searches for shops by query.
  Future<List<CarWashShopModel>> searchShops({
    required String query,
    int page = 1,
    int pageSize = 10,
  }) async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      Endpoints.shops(),
      queryParameters: {
        'search': query,
        'page': page.toString(),
        'page_size': pageSize.toString(),
      },
    );

    final data = response.data!;
    if (data['results'] is List) {
      return (data['results'] as List)
          .map(
            (item) => CarWashShopModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    }
    return <CarWashShopModel>[];
  }

  /// Toggles wishlist status for a shop.
  Future<bool> toggleWishlist({required String shopId}) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/api/shops/$shopId/wishlist/',
    );

    // Assuming the API returns the new wishlist status
    return response.data?['is_wishlisted'] as bool? ?? false;
  }
}
