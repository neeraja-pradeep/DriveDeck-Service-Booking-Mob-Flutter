import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/session.dart';

part 'session_model.g.dart';

/// JSON serializable model for Session entity.
@JsonSerializable()
class SessionModel {
  const SessionModel({
    required this.sessionId,
    required this.xcsrfToken,
    required this.userId,
    this.createdAt,
    this.expiresAt,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  factory SessionModel.fromDomain(Session session) => SessionModel(
        sessionId: session.sessionId,
        xcsrfToken: session.xcsrfToken,
        userId: session.userId,
        createdAt: session.createdAt.toIso8601String(),
        expiresAt: session.expiresAt?.toIso8601String(),
      );

  @JsonKey(name: 'session_id')
  final String sessionId;
  @JsonKey(name: 'xcsrf_token')
  final String xcsrfToken;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'expires_at')
  final String? expiresAt;

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);

  /// Converts this model to a domain Session entity.
  Session toDomain() => Session(
        sessionId: sessionId,
        xcsrfToken: xcsrfToken,
        userId: userId,
        createdAt: createdAt != null
            ? DateTime.tryParse(createdAt!) ?? DateTime.now()
            : DateTime.now(),
        expiresAt: expiresAt != null ? DateTime.tryParse(expiresAt!) : null,
      );
}
