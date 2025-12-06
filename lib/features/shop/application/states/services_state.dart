import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/shop_service.dart';

part 'services_state.freezed.dart';

/// State for shop services.
@freezed
class ServicesState with _$ServicesState {
  const factory ServicesState.initial() = ServicesStateInitial;
  const factory ServicesState.loading() = ServicesStateLoading;
  const factory ServicesState.loaded(List<ShopService> services) = ServicesStateLoaded;
  const factory ServicesState.error(Failure failure) = ServicesStateError;
}
