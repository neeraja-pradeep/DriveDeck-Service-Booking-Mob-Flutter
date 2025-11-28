import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage wrapper for storing sensitive data like tokens.
/// Uses flutter_secure_storage which stores data in Keychain (iOS)
/// and EncryptedSharedPreferences (Android).
class SecureStore {
  SecureStore(this._storage);

  final FlutterSecureStorage _storage;

  // Key constants
  static const String sessionIdKey = 'secure_session_id';
  static const String xcsrfTokenKey = 'secure_xcsrf_token';
  static const String userIdKey = 'secure_user_id';
  static const String refreshTokenKey = 'secure_refresh_token';

  /// Saves the session ID securely.
  Future<void> saveSessionId(String sessionId) async {
    await _storage.write(key: sessionIdKey, value: sessionId);
  }

  /// Gets the session ID.
  Future<String?> getSessionId() async {
    return _storage.read(key: sessionIdKey);
  }

  /// Saves the XCSRF token securely.
  Future<void> saveXcsrfToken(String token) async {
    await _storage.write(key: xcsrfTokenKey, value: token);
  }

  /// Gets the XCSRF token.
  Future<String?> getXcsrfToken() async {
    return _storage.read(key: xcsrfTokenKey);
  }

  /// Saves the user ID securely.
  Future<void> saveUserId(String userId) async {
    await _storage.write(key: userIdKey, value: userId);
  }

  /// Gets the user ID.
  Future<String?> getUserId() async {
    return _storage.read(key: userIdKey);
  }

  /// Saves the refresh token securely.
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: refreshTokenKey, value: token);
  }

  /// Gets the refresh token.
  Future<String?> getRefreshToken() async {
    return _storage.read(key: refreshTokenKey);
  }

  /// Clears all auth-related secure storage.
  Future<void> clearAuthData() async {
    await Future.wait([
      _storage.delete(key: sessionIdKey),
      _storage.delete(key: xcsrfTokenKey),
      _storage.delete(key: userIdKey),
      _storage.delete(key: refreshTokenKey),
    ]);
  }

  /// Clears all secure storage.
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  /// Checks if session exists.
  Future<bool> hasSession() async {
    final sessionId = await getSessionId();
    return sessionId != null && sessionId.isNotEmpty;
  }
}
