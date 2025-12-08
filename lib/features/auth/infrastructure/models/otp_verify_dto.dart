import 'package:json_annotation/json_annotation.dart';

part 'otp_verify_dto.g.dart';

/// DTO for OTP verification request.
@JsonSerializable()
class OtpVerifyDto {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'otp_code')
  final String otpCode;

  const OtpVerifyDto({required this.phoneNumber, required this.otpCode});

  factory OtpVerifyDto.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OtpVerifyDtoToJson(this);
}
