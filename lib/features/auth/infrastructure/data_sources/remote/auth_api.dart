import '../../../../../core/network/api_client.dart';
import '../../../../../core/network/endpoints.dart';
import '../../models/otp_verify_dto.dart';
import '../../models/session_model.dart';

/// Abstract interface for auth API operations.
abstract class AuthApi {
  Future<SessionModel> verifyOtp(OtpVerifyDto dto);
}

/// Implementation of auth API using HTTP client.
class AuthApiImpl implements AuthApi {
  final ApiClient _apiClient;

  const AuthApiImpl(this._apiClient);

  @override
  Future<SessionModel> verifyOtp(OtpVerifyDto dto) async {
    try {
      final response = await _apiClient.post(
        Endpoints.verifyOtp(),
        data: dto.toJson(),
      );

      // --- TEMPORARY DEBUG FOR CAPTURING REAL SESSION DATA ---
      // ignore: avoid_print
      print("🔴 REAL SESSION DATA FOR HARDCODING: ${response.data}");
      // ignore: avoid_print
      print("🔴 HEADERS: ${response.headers}");
      // --------------------------------------------------------

      return SessionModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
