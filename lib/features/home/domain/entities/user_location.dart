import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_location.freezed.dart';

/// User location entity for storing location data.
@freezed
class UserLocation with _$UserLocation {
  const factory UserLocation({
    required double latitude,
    required double longitude,
    String? address,
    String? city,
    String? state,
    String? country,
    String? postalCode,
    DateTime? timestamp,
  }) = _UserLocation;

  const UserLocation._();

  /// Returns a short address string.
  String get shortAddress {
    if (city != null && state != null) {
      return '$city, $state';
    }
    if (address != null) {
      return address!;
    }
    return 'Location set';
  }

  /// Checks if the location is valid.
  bool get isValid => latitude != 0 && longitude != 0;
}
