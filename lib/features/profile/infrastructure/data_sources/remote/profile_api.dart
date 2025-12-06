import 'package:newapp/core/network/api_client.dart';
import 'package:newapp/core/network/endpoints.dart';
import 'package:newapp/features/profile/infrastructure/models/update_profile_request_model.dart';
import 'package:newapp/features/profile/infrastructure/models/user_profile_model.dart';

/// Response wrapper for conditional fetch.
class ConditionalResponse<T> {
  const ConditionalResponse({
    this.data,
    this.lastModified,
    this.isNotModified = false,
  });

  final T? data;
  final String? lastModified;
  final bool isNotModified;
}

/// Abstract profile API interface.
abstract class ProfileApi {
  /// Get profile with conditional fetch support.
  Future<ConditionalResponse<UserProfileModel>> getProfile({
    String? ifModifiedSince,
  });

  /// Update profile.
  Future<UserProfileModel> updateProfile(UpdateProfileRequestModel request);

  /// Logout user.
  Future<void> logout();
}

/// Profile API implementation.
class ProfileApiImpl implements ProfileApi {
  ProfileApiImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<ConditionalResponse<UserProfileModel>> getProfile({
    String? ifModifiedSince,
  }) async {
    final response = await apiClient.get<Map<String, dynamic>>(
      Endpoints.profile(),
      ifModifiedSince: ifModifiedSince,
    );

    if (response.statusCode == 304) {
      return const ConditionalResponse(isNotModified: true);
    }

    final data = response.data;
    if (data == null) {
      throw Exception('Profile data is null');
    }

    final lastModified = response.extra['lastModified'] as String?;

    return ConditionalResponse(
      data: UserProfileModel.fromJson(data),
      lastModified: lastModified,
    );
  }

  @override
  Future<UserProfileModel> updateProfile(
    UpdateProfileRequestModel request,
  ) async {
    final response = await apiClient.patch<Map<String, dynamic>>(
      Endpoints.updateProfile(),
      data: request.toJson(),
    );

    final data = response.data;
    if (data == null) {
      throw Exception('Update profile response is null');
    }

    return UserProfileModel.fromJson(data);
  }

  @override
  Future<void> logout() async {
    await apiClient.post<void>(Endpoints.logout());
  }
}
