import 'package:hive/hive.dart';

import '../../../../../app/bootstrap/app_bootstrap.dart';
import '../../../../../core/storage/hive/keys.dart';
import '../../../../../core/storage/secure_store.dart';
import '../../../domain/entities/session.dart';

/// Abstract class defining local auth data source operations.
abstract class AuthLocalDataSource {
  Future<void> saveSession(Session session);
  Future<Session?> getSession();
  Future<void> clearSession();
  Future<void> saveRememberMe(bool value);
  Future<bool> getRememberMe();
  Future<void> saveLastPhoneNumber(String phoneNumber);
  Future<String?> getLastPhoneNumber();
}

/// Implementation of AuthLocalDataSource using Hive and SecureStore.
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl({required this.secureStore});

  final SecureStore secureStore;

  /// Get the pre-opened auth box from AppBootstrap.
  Box<dynamic> get _box => AppBootstrap.authBox;

  @override
  Future<void> saveSession(Session session) async {
    // Save sensitive data in secure storage
    await secureStore.saveSessionId(session.sessionId);
    await secureStore.saveXcsrfToken(session.xcsrfToken);
    await secureStore.saveUserId(session.userId);

    // Save non-sensitive data in Hive using pre-opened box
    await _box.put(
      HiveKeys.sessionCreatedAt,
      session.createdAt.toIso8601String(),
    );
    if (session.expiresAt != null) {
      await _box.put(
        HiveKeys.sessionExpiresAt,
        session.expiresAt!.toIso8601String(),
      );
    }
  }

  @override
  Future<Session?> getSession() async {
    final sessionId = await secureStore.getSessionId();
    final xcsrfToken = await secureStore.getXcsrfToken();
    final userId = await secureStore.getUserId();

    // Validate all required session fields
    if (sessionId == null ||
        sessionId.isEmpty ||
        xcsrfToken == null ||
        xcsrfToken.isEmpty ||
        userId == null ||
        userId.isEmpty) {
      return null;
    }

    // Use pre-opened box directly
    final createdAtStr = _box.get(HiveKeys.sessionCreatedAt) as String?;
    final expiresAtStr = _box.get(HiveKeys.sessionExpiresAt) as String?;

    return Session(
      sessionId: sessionId,
      xcsrfToken: xcsrfToken,
      userId: userId,
      createdAt: createdAtStr != null
          ? DateTime.tryParse(createdAtStr) ?? DateTime.now()
          : DateTime.now(),
      expiresAt: expiresAtStr != null ? DateTime.tryParse(expiresAtStr) : null,
    );
  }

  @override
  Future<void> clearSession() async {
    await secureStore.clearAuthData();
    // Clear all auth-related data from Hive box
    await AppBootstrap.clearAuthData();
  }

  @override
  Future<void> saveRememberMe(bool value) async {
    await _box.put(HiveKeys.rememberMe, value);
  }

  @override
  Future<bool> getRememberMe() async {
    return _box.get(HiveKeys.rememberMe, defaultValue: false) as bool;
  }

  @override
  Future<void> saveLastPhoneNumber(String phoneNumber) async {
    await _box.put(HiveKeys.lastPhoneNumber, phoneNumber);
  }

  @override
  Future<String?> getLastPhoneNumber() async {
    return _box.get(HiveKeys.lastPhoneNumber) as String?;
  }
}
