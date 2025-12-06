import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/shop_service.dart';
import '../../domain/entities/vehicle_type.dart';

part 'shop_service_model.freezed.dart';
part 'shop_service_model.g.dart';

/// Model for shop service API response.
@freezed
class ShopServiceModel with _$ShopServiceModel {
  const ShopServiceModel._();

  const factory ShopServiceModel({
    required int id,
    required String name,
    String? description,
    required double price,
    @JsonKey(name: 'duration_in_slots') @Default(1) int durationInSlots,
    @JsonKey(name: 'vehicle_type') String? vehicleType,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_popular') @Default(false) bool isPopular,
  }) = _ShopServiceModel;

  factory ShopServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ShopServiceModelFromJson(json);

  /// Converts to domain entity.
  ShopService toDomain() => ShopService(
        id: id.toString(),
        name: name,
        description: description,
        price: price,
        duration: durationInSlots * 30, // Each slot is 30 minutes
        vehicleType: vehicleType != null
            ? VehicleTypeX.fromApiValue(vehicleType!)
            : VehicleType.sedan,
        imageUrl: imageUrl,
        isPopular: isPopular,
      );
}
