import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/session.dart';
import '../../domain/entities/user.dart';

part 'session_model.g.dart';

/// Model for session response from API.
@JsonSerializable()
class SessionModel {
  @JsonKey(name: 'session_id')
  final String sessionId;

  @JsonKey(name: 'xcsrf_token')
  final String xcsrfToken;

  @JsonKey(name: 'user')
  final UserModel user;

  @JsonKey(name: 'expires_at')
  final String expiresAt;

  const SessionModel({
    required this.sessionId,
    required this.xcsrfToken,
    required this.user,
    required this.expiresAt,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);

  /// Convert to domain entity.
  Session toEntity() {
    return Session(
      sessionId: sessionId,
      xcsrfToken: xcsrfToken,
      userId: user.id,
      createdAt: DateTime.now(),
      expiresAt: DateTime.parse(expiresAt),
    );
  }
}

/// Model for user data in session response.
@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'phone')
  final String phone;

  const UserModel({required this.id, required this.name, required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  /// Convert to domain entity.
  User toEntity() {
    return User(
      id: id,
      phoneNumber: phone,
      name: name,
      createdAt: DateTime.now(),
    );
  }
}
