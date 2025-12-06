import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/shop_service.dart';
import '../../domain/entities/shop_tab.dart';
import '../../domain/entities/vehicle_type.dart';
import 'services_state.dart';
import 'shop_state.dart';

part 'shop_detail_state.freezed.dart';

/// Combined state for shop detail screen.
@freezed
class ShopDetailState with _$ShopDetailState {
  const ShopDetailState._();

  const factory ShopDetailState({
    required ShopState shopState,
    required ServicesState servicesState,
    required VehicleType selectedVehicleType,
    required Set<String> selectedServiceIds,
    required ShopTab selectedTab,
  }) = _ShopDetailState;

  factory ShopDetailState.initial() => ShopDetailState(
        shopState: const ShopState.initial(),
        servicesState: const ServicesState.initial(),
        selectedVehicleType: VehicleType.sedan,
        selectedServiceIds: const {},
        selectedTab: ShopTab.services,
      );

  /// Returns whether user can proceed to next step.
  bool get canProceed => selectedServiceIds.isNotEmpty;

  /// Returns the list of selected services.
  List<ShopService> get selectedServices {
    return servicesState.maybeMap(
      loaded: (s) => s.services
          .where((svc) => selectedServiceIds.contains(svc.id))
          .toList(),
      orElse: () => <ShopService>[],
    );
  }

  /// Returns the total price of selected services.
  double get selectedServicesTotal {
    return selectedServices.fold(0, (sum, s) => sum + s.price);
  }

  /// Returns the count of selected services.
  int get selectedServicesCount => selectedServiceIds.length;
}
