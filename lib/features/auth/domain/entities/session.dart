import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

/// Session entity representing an authenticated user session.
/// Contains session ID and XCSRF token for API authentication.
@freezed
class Session with _$Session {
  const Session._();

  const factory Session({
    required String sessionId,
    required String xcsrfToken,
    required String userId,
    required DateTime createdAt,
    DateTime? expiresAt,
  }) = _Session;

  /// Checks if the session has expired.
  /// Returns true if expiresAt is set and is in the past,
  /// or if expiresAt is null and session is older than 24 hours.
  bool get isExpired {
    if (expiresAt != null) {
      return DateTime.now().isAfter(expiresAt!);
    }
    // Default expiry: 24 hours from creation
    final defaultExpiry = createdAt.add(const Duration(hours: 24));
    return DateTime.now().isAfter(defaultExpiry);
  }

  /// Creates an empty Session instance.
  factory Session.empty() => Session(
        sessionId: '',
        xcsrfToken: '',
        userId: '',
        createdAt: DateTime.now(),
        expiresAt: null,
      );
}
