import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/shop.dart';

part 'shop_state.freezed.dart';

/// State for shop details.
@freezed
class ShopState with _$ShopState {
  const factory ShopState.initial() = ShopStateInitial;
  const factory ShopState.loading() = ShopStateLoading;
  const factory ShopState.loaded(
    Shop shop, {
    @Default(false) bool fromCache,
  }) = ShopStateLoaded;
  const factory ShopState.error(Failure failure) = ShopStateError;
}
