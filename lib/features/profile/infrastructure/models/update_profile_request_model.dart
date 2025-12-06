import 'package:json_annotation/json_annotation.dart';
import 'package:newapp/features/profile/domain/entities/update_profile_request.dart';

part 'update_profile_request_model.g.dart';

/// Update profile request model for API serialization.
@JsonSerializable()
class UpdateProfileRequestModel {
  const UpdateProfileRequestModel({
    required this.firstName,
    required this.lastName,
    this.email,
  });

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestModelFromJson(json);

  factory UpdateProfileRequestModel.fromDomain(UpdateProfileRequest request) =>
      UpdateProfileRequestModel(
        firstName: request.firstName,
        lastName: request.lastName,
        email: request.email,
      );

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'email')
  final String? email;

  Map<String, dynamic> toJson() => _$UpdateProfileRequestModelToJson(this);
}
