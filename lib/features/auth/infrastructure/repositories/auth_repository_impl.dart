import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
  AuthRepositoryImpl({
    required this.authApi,
    required this.localDataSource,
  });

  final AuthApi authApi;
  final AuthLocalDataSource localDataSource;

  @override
  Future<Either<Failure, OtpState>> requestOtp(
    OtpRequestCredentials credentials,
  ) async {
    try {
      final dto = OtpRequestDto(phone: credentials.phoneNumber);
      final result = await authApi.requestOtp(dto);
      return Right(result.toDomain());
    } on DioException catch (e) {
      return Left(NetworkExceptions.mapDioException(e));
    } catch (e) {
      return Left(NetworkExceptions.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Session>> verifyOtp(
    OtpVerifyCredentials credentials,
  ) async {
    try {
      final dto = OtpVerifyDto(
        phone: credentials.phoneNumber,
        otpCode: credentials.otp,
        newPassword: credentials.newPassword,
      );
      final result = await authApi.verifyOtp(dto);
      final session = result.toDomain();

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
      final dto = RegisterRequestDto(
        phone: credentials.phoneNumber,
        username: credentials.username,
        password: credentials.password,
        passwordConfirm: credentials.confirmPassword,
      );
      final result = await authApi.register(dto);
      final session = result.toDomain();

      // Save session locally
      await localDataSource.saveSession(session);

      return Right(session);
    } on DioException catch (e) {
      return Left(NetworkExceptions.mapDioException(e));
    } catch (e) {
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
}
