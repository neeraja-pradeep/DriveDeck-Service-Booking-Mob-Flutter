import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../domain/entities/auth_credentials.dart';
import '../../domain/entities/otp_state.dart';
import '../../domain/entities/session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/local/auth_local_ds.dart';
import '../data_sources/remote/auth_api.dart';
import '../models/auth_request_models.dart';

/// Implementation of AuthRepository.
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authApi, required this.localDataSource});

  final AuthApi authApi;
  final AuthLocalDataSource localDataSource;

  @override
  Future<Either<Failure, OtpState>> requestOtp(
    OtpRequestCredentials credentials,
  ) async {
    try {
      debugPrint(
        '📝 Repository: Starting OTP request for phone: ${credentials.phoneNumber}',
      );

      // Format phone number with country code for API request
      final formattedPhone = _formatPhoneWithCountryCode(
        credentials.phoneNumber,
      );
      final dto = OtpRequestDto(phone: formattedPhone);
      debugPrint('📦 Repository: Created OTP request DTO: ${dto.toJson()}');

      final result = await authApi.requestOtp(dto);
      debugPrint('✅ Repository: OTP request successful');
      debugPrint('📄 Repository: OTP response: ${result.toString()}');

      return Right(result.toDomain());
    } on DioException catch (e) {
      debugPrint('❌ Repository: DioException during OTP request: ${e.message}');
      debugPrint('📊 Repository: Response data: ${e.response?.data}');
      debugPrint('🔢 Repository: Status code: ${e.response?.statusCode}');
      debugPrint('🌐 Repository: Request URL: ${e.requestOptions.uri}');
      return Left(NetworkExceptions.handleException(e));
    } catch (e) {
      debugPrint('💥 Repository: Unexpected error during OTP request: $e');
      return Left(NetworkExceptions.handleException(e));
    }
  }

  @override
  Future<Either<Failure, Session>> verifyOtp(
    OtpVerifyCredentials credentials,
  ) async {
    try {
      debugPrint(
        '📝 Repository: Starting OTP verification for phone: ${credentials.phoneNumber}',
      );
      debugPrint('🔐 Repository: OTP code: ${credentials.otp}');

      // Format phone number with country code for API request
      final formattedPhone = _formatPhoneWithCountryCode(
        credentials.phoneNumber,
      );
      debugPrint('📱 Repository: Formatted phone: $formattedPhone');

      final dto = OtpVerifyDto(
        phone: formattedPhone,
        otpCode: credentials.otp,
        newPassword: credentials.newPassword,
      );
      debugPrint(
        '📦 Repository: Created OTP verification DTO: ${dto.toJson()}',
      );

      debugPrint('🚀 Repository: Calling authApi.verifyOtp...');
      final result = await authApi.verifyOtp(dto);
      debugPrint('✅ Repository: OTP API call successful');

      final session = result.toDomain();
      debugPrint(
        '🔄 Repository: Converted to domain session: ${session.sessionId}',
      );

      // Clear any previous session data before saving new session
      debugPrint('🧹 Repository: Clearing previous session data...');
      await localDataSource.clearSession();

      // Save session locally
      debugPrint('💾 Repository: Saving session locally...');
      await localDataSource.saveSession(session);

      // Save phone number if remember me is enabled
      if (credentials.rememberMe) {
        debugPrint('📱 Repository: Saving remember me and phone number...');
        await localDataSource.saveRememberMe(true);
        await localDataSource.saveLastPhoneNumber(credentials.phoneNumber);
      }

      debugPrint('🎉 Repository: OTP verification completed successfully');
      return Right(session);
    } on DioException catch (e) {
      debugPrint('❌ Repository: DioException in verifyOtp: ${e.message}');
      debugPrint('📊 Repository: Response status: ${e.response?.statusCode}');
      debugPrint('📄 Repository: Response data: ${e.response?.data}');
      debugPrint('🌐 Repository: Request URL: ${e.requestOptions.uri}');
      debugPrint('📋 Repository: Request data: ${e.requestOptions.data}');
      return Left(NetworkExceptions.handleException(e));
    } catch (e) {
      debugPrint('💥 Repository: Unexpected error in verifyOtp: $e');
      debugPrint('📍 Repository: Error type: ${e.runtimeType}');
      return Left(NetworkExceptions.handleException(e));
    }
  }

  @override
  Future<Either<Failure, Session>> register(
    RegisterCredentials credentials,
  ) async {
    try {
      debugPrint(
        '📝 Repository: Starting registration for phone: ${credentials.phoneNumber}',
      );
      debugPrint('👤 Repository: Username: ${credentials.username}');
      debugPrint('📧 Repository: Email: ${credentials.email}');

      final dto = RegisterRequestDto(
        username: credentials.username,
        email: credentials.email,
        password: credentials.password,
        passwordConfirm: credentials.confirmPassword,
        firstName: credentials.firstName,
        lastName: credentials.lastName,
        phone: credentials.phoneNumber,
      );

      debugPrint('📦 Repository: Created registration DTO: ${dto.toJson()}');

      debugPrint('🚀 Repository: Calling authApi.register...');
      final result = await authApi.register(dto);
      debugPrint('✅ Repository: Registration API call successful');

      final session = result.toDomain();
      debugPrint(
        '🔄 Repository: Converted to domain session: ${session.sessionId}',
      );

      debugPrint('✅ Repository: Registration successful, saving session');

      // Clear any previous session data before saving new session
      debugPrint('🧹 Repository: Clearing previous session data...');
      await localDataSource.clearSession();

      // Save session locally
      debugPrint('💾 Repository: Saving session locally...');
      await localDataSource.saveSession(session);

      debugPrint('💾 Repository: Session saved locally successfully');
      debugPrint('🎉 Repository: Registration completed successfully');

      return Right(session);
    } on DioException catch (e) {
      debugPrint(
        '❌ Repository: DioException during registration: ${e.message}',
      );
      debugPrint('📊 Repository: Response status: ${e.response?.statusCode}');
      debugPrint('📄 Repository: Response data: ${e.response?.data}');
      debugPrint('🌐 Repository: Request URL: ${e.requestOptions.uri}');
      debugPrint('📋 Repository: Request data: ${e.requestOptions.data}');
      debugPrint('🔧 Repository: Response headers: ${e.response?.headers}');
      return Left(NetworkExceptions.handleException(e));
    } catch (e) {
      debugPrint('💥 Repository: Unexpected error during registration: $e');
      debugPrint('📍 Repository: Error type: ${e.runtimeType}');
      debugPrint('📚 Repository: Stack trace: ${StackTrace.current}');
      return Left(NetworkExceptions.handleException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      debugPrint('🚪 Repository: Starting logout...');

      // Note: Server has no logout endpoint, so we just clear local session.
      // Django session-based auth: session becomes invalid when cookies are cleared.
      await localDataSource.clearSession();

      debugPrint('✅ Repository: Local session cleared successfully');
      return const Right(unit);
    } catch (e) {
      debugPrint('❌ Repository: Error during logout: $e');
      // Ensure session is cleared even on error
      await localDataSource.clearSession();
      return Left(Failure.cache(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Session?>> getCurrentSession() async {
    try {
      final session = await localDataSource.getSession();
      return Right(session);
    } catch (e) {
      return Left(Failure.cache(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearSession() async {
    try {
      await localDataSource.clearSession();
      return const Right(unit);
    } catch (e) {
      return Left(Failure.cache(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isSessionValid() async {
    try {
      final session = await localDataSource.getSession();
      if (session == null) {
        return const Right(false);
      }
      return Right(!session.isExpired);
    } catch (e) {
      return Left(Failure.cache(message: e.toString()));
    }
  }

  /// Formats phone number - returns just the 10 digits without country code.
  String _formatPhoneWithCountryCode(String phoneNumber) {
    // Remove any existing country code or special characters
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    // If phone starts with 91 and is longer than 10 digits, remove the country code
    if (cleanPhone.startsWith('91') && cleanPhone.length > 10) {
      return cleanPhone.substring(2);
    }

    // Return just the clean phone number (10 digits)
    return cleanPhone;
  }
}
