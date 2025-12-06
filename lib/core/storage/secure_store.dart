import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage wrapper for sensitive data like tokens.
class SecureStore {
  SecureStore({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(encryptedSharedPreferences: true),
              iOptions: IOSOptions(
                accessibility: KeychainAccessibility.first_unlock,
              ),
            );

  final FlutterSecureStorage _storage;

  // Keys
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _xcsrfTokenKey = 'xcsrf_token';
  static const _userIdKey = 'user_id';
  static const _sessionIdKey = 'session_id';

  // Access Token
  Future<void> setAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  Future<String?> getAccessToken() async {
    return _storage.read(key: _accessTokenKey);
  }

  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  // Refresh Token
  Future<void> setRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  Future<String?> getRefreshToken() async {
    return _storage.read(key: _refreshTokenKey);
  }

  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _refreshTokenKey);
  }

  // XCSRF Token
  Future<void> setXcsrfToken(String token) async {
    await _storage.write(key: _xcsrfTokenKey, value: token);
  }

  Future<String?> getXcsrfToken() async {
    return _storage.read(key: _xcsrfTokenKey);
  }

  Future<void> deleteXcsrfToken() async {
    await _storage.delete(key: _xcsrfTokenKey);
  }

  // User ID
  Future<void> setUserId(String userId) async {
    await _storage.write(key: _userIdKey, value: userId);
  }

  Future<String?> getUserId() async {
    return _storage.read(key: _userIdKey);
  }

  Future<void> deleteUserId() async {
    await _storage.delete(key: _userIdKey);
  }

  // Session ID
  Future<void> setSessionId(String sessionId) async {
    await _storage.write(key: _sessionIdKey, value: sessionId);
  }

  Future<String?> getSessionId() async {
    return _storage.read(key: _sessionIdKey);
  }

  Future<void> deleteSessionId() async {
    await _storage.delete(key: _sessionIdKey);
  }

  /// Clear all secure storage data.
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
