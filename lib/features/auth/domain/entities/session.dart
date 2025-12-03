import 'package:equatable/equatable.dart';

/// Session entity representing the user's authentication session.
class Session extends Equatable {
  final String sessionId;
  final String xcsrfToken;
  final String userId;
  final DateTime createdAt;
  final DateTime expiresAt;

  const Session({
    required this.sessionId,
    required this.xcsrfToken,
    required this.userId,
    required this.createdAt,
    required this.expiresAt,
  });

  /// Check if the session is still valid (not expired).
  bool get isValid => DateTime.now().isBefore(expiresAt);

  @override
  List<Object?> get props => [
    sessionId,
    xcsrfToken,
    userId,
    createdAt,
    expiresAt,
  ];

  Session copyWith({
    String? sessionId,
    String? xcsrfToken,
    String? userId,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) {
    return Session(
      sessionId: sessionId ?? this.sessionId,
      xcsrfToken: xcsrfToken ?? this.xcsrfToken,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}
