import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/shop.dart';

part 'shop_state.freezed.dart';

/// State for shop list.
@freezed
class ShopListState with _$ShopListState {
  const factory ShopListState.initial() = ShopListInitial;
  const factory ShopListState.loading() = ShopListLoading;
  const factory ShopListState.loaded({
    required List<Shop> shops,
    @Default(false) bool hasMore,
    @Default(1) int currentPage,
  }) = ShopListLoaded;
  const factory ShopListState.error({required Failure failure}) = ShopListError;
}

/// State for shop details.
@freezed
class ShopDetailsState with _$ShopDetailsState {
  const factory ShopDetailsState.initial() = ShopDetailsInitial;
  const factory ShopDetailsState.loading() = ShopDetailsLoading;
  const factory ShopDetailsState.loaded({required Shop shop}) =
      ShopDetailsLoaded;
  const factory ShopDetailsState.error({required Failure failure}) =
      ShopDetailsError;
}

/// State for shop availability.
@freezed
class ShopAvailabilityState with _$ShopAvailabilityState {
  const factory ShopAvailabilityState.initial() = ShopAvailabilityInitial;
  const factory ShopAvailabilityState.loading() = ShopAvailabilityLoading;
  const factory ShopAvailabilityState.loaded({
    required List<ShopDateAvailability> availability,
  }) = ShopAvailabilityLoaded;
  const factory ShopAvailabilityState.error({required Failure failure}) =
      ShopAvailabilityError;
}

/// State for favorite shops.
@freezed
class FavoriteShopsState with _$FavoriteShopsState {
  const factory FavoriteShopsState.initial() = FavoriteShopsInitial;
  const factory FavoriteShopsState.loading() = FavoriteShopsLoading;
  const factory FavoriteShopsState.loaded({required List<Shop> shops}) =
      FavoriteShopsLoaded;
  const factory FavoriteShopsState.error({required Failure failure}) =
      FavoriteShopsError;
}

/// Selected items state for booking.
@freezed
class SelectedItemsState with _$SelectedItemsState {
  const factory SelectedItemsState({
    @Default({}) Map<String, ShopService> services,
    @Default({}) Map<String, ShopPackage> packages,
    @Default({}) Map<String, ShopAccessory> accessories,
    ShopVehicleType? vehicleType,
  }) = _SelectedItemsState;
}
