import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/user_location.dart';

part 'user_location_model.freezed.dart';
part 'user_location_model.g.dart';

/// User location model for Hive storage.
@freezed
@HiveType(typeId: 3)
class UserLocationModel with _$UserLocationModel {
  const factory UserLocationModel({
    @HiveField(0) required double latitude,
    @HiveField(1) required double longitude,
    @HiveField(2) String? address,
    @HiveField(3) String? city,
    @HiveField(4) String? state,
    @HiveField(5) String? country,
    @HiveField(6) @JsonKey(name: 'postal_code') String? postalCode,
    @HiveField(7) DateTime? timestamp,
  }) = _UserLocationModel;

  const UserLocationModel._();

  factory UserLocationModel.fromJson(Map<String, dynamic> json) =>
      _$UserLocationModelFromJson(json);

  /// Converts the model to a domain entity.
  UserLocation toEntity() {
    return UserLocation(
      latitude: latitude,
      longitude: longitude,
      address: address,
      city: city,
      state: state,
      country: country,
      postalCode: postalCode,
      timestamp: timestamp,
    );
  }

  /// Creates a model from domain entity.
  factory UserLocationModel.fromEntity(UserLocation entity) {
    return UserLocationModel(
      latitude: entity.latitude,
      longitude: entity.longitude,
      address: entity.address,
      city: entity.city,
      state: entity.state,
      country: entity.country,
      postalCode: entity.postalCode,
      timestamp: entity.timestamp,
    );
  }
}
