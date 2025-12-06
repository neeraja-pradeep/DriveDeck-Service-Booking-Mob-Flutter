import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/otp_state.dart';

part 'otp_state_model.g.dart';

/// JSON serializable model for OTP state.
@JsonSerializable()
class OtpStateModel {
  const OtpStateModel({
    required this.otpSentTo,
    this.expiresAt,
    this.attemptsRemaining,
    this.message,
    this.status,
  });

  factory OtpStateModel.fromJson(Map<String, dynamic> json) =>
      _$OtpStateModelFromJson(json);

  @JsonKey(name: 'phone')
  final String otpSentTo;
  @JsonKey(name: 'expires_at')
  final String? expiresAt;
  @JsonKey(name: 'attempts_remaining')
  final int? attemptsRemaining;
  final String? message;
  final String? status;

  Map<String, dynamic> toJson() => _$OtpStateModelToJson(this);

  /// Converts this model to a domain OtpState entity.
  OtpState toDomain() => OtpState(
    otpSentTo: otpSentTo,
    expiresAt: expiresAt != null
        ? DateTime.tryParse(expiresAt!) ??
              DateTime.now().add(const Duration(minutes: 5))
        : DateTime.now().add(const Duration(minutes: 5)),
    attemptsRemaining: attemptsRemaining,
    message: message ?? 'OTP sent successfully',
    status: status,
  );
}
