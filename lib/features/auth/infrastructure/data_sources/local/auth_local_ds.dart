import 'package:hive/hive.dart';

import '../../../../../core/storage/hive/boxes.dart';
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
  AuthLocalDataSourceImpl({
    required this.secureStore,
  });

  final SecureStore secureStore;

  Box<dynamic>? _authBox;

  Future<Box<dynamic>> get _box async {
    _authBox ??= await Hive.openBox(HiveBoxes.auth);
    return _authBox!;
  }

  @override
  Future<void> saveSession(Session session) async {
    // Save sensitive data in secure storage
    await secureStore.saveSessionId(session.sessionId);
    await secureStore.saveXcsrfToken(session.xcsrfToken);
    await secureStore.saveUserId(session.userId);

    // Save non-sensitive data in Hive
    final box = await _box;
    await box.put(HiveKeys.sessionCreatedAt, session.createdAt.toIso8601String());
    if (session.expiresAt != null) {
      await box.put(HiveKeys.sessionExpiresAt, session.expiresAt!.toIso8601String());
    }
  }

  @override
  Future<Session?> getSession() async {
    final sessionId = await secureStore.getSessionId();
    final xcsrfToken = await secureStore.getXcsrfToken();
    final userId = await secureStore.getUserId();

    if (sessionId == null || sessionId.isEmpty) {
      return null;
    }

    final box = await _box;
    final createdAtStr = box.get(HiveKeys.sessionCreatedAt) as String?;
    final expiresAtStr = box.get(HiveKeys.sessionExpiresAt) as String?;

    return Session(
      sessionId: sessionId,
      xcsrfToken: xcsrfToken ?? '',
      userId: userId ?? '',
      createdAt: createdAtStr != null
          ? DateTime.tryParse(createdAtStr) ?? DateTime.now()
          : DateTime.now(),
      expiresAt: expiresAtStr != null ? DateTime.tryParse(expiresAtStr) : null,
    );
  }

  @override
  Future<void> clearSession() async {
    await secureStore.clearAuthData();
    final box = await _box;
    await box.delete(HiveKeys.sessionCreatedAt);
    await box.delete(HiveKeys.sessionExpiresAt);
  }

  @override
  Future<void> saveRememberMe(bool value) async {
    final box = await _box;
    await box.put(HiveKeys.rememberMe, value);
  }

  @override
  Future<bool> getRememberMe() async {
    final box = await _box;
    return box.get(HiveKeys.rememberMe, defaultValue: false) as bool;
  }

  @override
  Future<void> saveLastPhoneNumber(String phoneNumber) async {
    final box = await _box;
    await box.put(HiveKeys.lastPhoneNumber, phoneNumber);
  }

  @override
  Future<String?> getLastPhoneNumber() async {
    final box = await _box;
    return box.get(HiveKeys.lastPhoneNumber) as String?;
  }
}
