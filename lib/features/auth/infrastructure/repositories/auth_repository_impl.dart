import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';

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
      // debugPrint(
      //   '📝 Repository: Starting OTP request for phone: ${credentials.phoneNumber}',
      // );

      // Format phone number with country code for API request
      final formattedPhone = _formatPhoneWithCountryCode(
        credentials.phoneNumber,
      );
      final dto = OtpRequestDto(phone: formattedPhone);
      // debugPrint('📦 Repository: Created OTP request DTO: ${dto.toJson()}');

      final result = await authApi.requestOtp(dto);
      // debugPrint('✅ Repository: OTP request successful');

      return Right(result.toDomain());
    } on DioException catch (e) {
      // debugPrint('❌ Repository: DioException during OTP request: ${e.message}');
      // debugPrint('📊 Repository: Response data: ${e.response?.data}');
      // debugPrint('🔢 Repository: Status code: ${e.response?.statusCode}');
      // debugPrint('🌐 Repository: Request URL: ${e.requestOptions.uri}');
      return Left(NetworkExceptions.mapDioException(e));
    } catch (e) {
      // debugPrint('💥 Repository: Unexpected error during OTP request: $e');
      return Left(NetworkExceptions.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Session>> verifyOtp(
    OtpVerifyCredentials credentials,
  ) async {
    try {
      // debugPrint(
      //   '📝 Repository: Starting OTP verification for phone: ${credentials.phoneNumber}',
      // );
      // debugPrint('🔐 Repository: OTP code: ${credentials.otp}');

      // Format phone number with country code for API request
      final formattedPhone = _formatPhoneWithCountryCode(
        credentials.phoneNumber,
      );
      // debugPrint('📱 Repository: Formatted phone: $formattedPhone');

      final dto = OtpVerifyDto(
        phone: formattedPhone,
        otpCode: credentials.otp,
        newPassword: credentials.newPassword,
      );
      // debugPrint(
      //   '📦 Repository: Created OTP verification DTO: ${dto.toJson()}',
      // );
      final result = await authApi.verifyOtp(dto);
      final session = result.toDomain();

      // Clear any previous session data before saving new session
      await localDataSource.clearSession();

      // Save session locally
      await localDataSource.saveSession(session);

      // Save phone number if remember me is enabled
      if (credentials.rememberMe) {
        await localDataSource.saveRememberMe(true);
        await localDataSource.saveLastPhoneNumber(credentials.phoneNumber);
      }

      return Right(session);
    } on DioException catch (e) {
      return Left(NetworkExceptions.mapDioException(e));
    } catch (e) {
      return Left(NetworkExceptions.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Session>> register(
    RegisterCredentials credentials,
  ) async {
    try {
      // debugPrint(
      //   '📝 Repository: Starting registration for phone: ${credentials.phoneNumber}',
      // );

      // Format phone number with country code for API request
      final formattedPhone = _formatPhoneWithCountryCode(
        credentials.phoneNumber,
      );
      final dto = RegisterRequestDto(
        phone: formattedPhone,
        username: credentials.username,
        password: credentials.password,
        passwordConfirm: credentials.confirmPassword,
      );

      // debugPrint('📦 Repository: Created DTO: ${dto.toJson()}');

      final result = await authApi.register(dto);
      final session = result.toDomain();

      // debugPrint('✅ Repository: Registration successful, saving session');

      // Clear any previous session data before saving new session
      await localDataSource.clearSession();

      // Save session locally
      await localDataSource.saveSession(session);

      // debugPrint('💾 Repository: Session saved locally');

      return Right(session);
    } on DioException catch (e) {
      // debugPrint(
      //   '❌ Repository: DioException during registration: ${e.message}',
      // );
      // debugPrint('📊 Repository: Response data: ${e.response?.data}');
      // debugPrint('🔢 Repository: Status code: ${e.response?.statusCode}');
      return Left(NetworkExceptions.mapDioException(e));
    } catch (e) {
      // debugPrint('💥 Repository: Unexpected error during registration: $e');
      return Left(NetworkExceptions.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      // Call API logout
      await authApi.logout();

      // Clear local session
      await localDataSource.clearSession();

      return const Right(unit);
    } on DioException catch (e) {
      // Even if API fails, clear local session
      await localDataSource.clearSession();
      return Left(NetworkExceptions.mapDioException(e));
    } catch (e) {
      await localDataSource.clearSession();
      return Left(NetworkExceptions.mapException(e));
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

  /// Formats phone number with +91 country code if not already present.
  String _formatPhoneWithCountryCode(String phoneNumber) {
    // Remove any existing country code or special characters
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    // If phone starts with 91, remove it first
    final phoneWithoutCountryCode =
        cleanPhone.startsWith('91') && cleanPhone.length > 10
        ? cleanPhone.substring(2)
        : cleanPhone;

    // Add +91 prefix
    return '+91$phoneWithoutCountryCode';
  }
}
