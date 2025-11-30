import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/car_wash_shop.dart';
import '../../domain/entities/service_category.dart';
import '../../domain/entities/user_location.dart';
import '../../domain/entities/user_profile.dart';

part 'home_state.freezed.dart';

/// State for the home screen.
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    // User profile
    @Default(AsyncValue.loading()) AsyncValue<UserProfile?> profileState,

    // User location
    @Default(AsyncValue.loading()) AsyncValue<UserLocation?> locationState,
    @Default(false) bool isLocationPermissionRequested,

    // Service categories
    @Default(AsyncValue.loading()) AsyncValue<List<ServiceCategory>> categoriesState,

    // Car wash shops near you
    @Default(AsyncValue.loading()) AsyncValue<List<CarWashShop>> shopsNearYouState,

    // Search
    @Default('') String searchQuery,
    @Default(AsyncValue.data([])) AsyncValue<List<CarWashShop>> searchResultsState,
    @Default(false) bool isSearching,

    // General
    @Default(false) bool isRefreshing,
    Failure? lastError,
  }) = _HomeState;

  const HomeState._();

  /// Returns true if all required data is loaded.
  bool get isDataLoaded {
    return profileState.hasValue &&
        locationState.hasValue &&
        categoriesState.hasValue &&
        shopsNearYouState.hasValue;
  }

  /// Returns true if any required data is loading.
  bool get isLoading {
    return profileState.isLoading ||
        locationState.isLoading ||
        categoriesState.isLoading ||
        shopsNearYouState.isLoading;
  }

  /// Returns true if there's an error in any state.
  bool get hasError {
    return profileState.hasError ||
        locationState.hasError ||
        categoriesState.hasError ||
        shopsNearYouState.hasError;
  }

  /// Returns the user's display name for greeting.
  String get greeting {
    final profile = profileState.valueOrNull;
    if (profile != null) {
      return profile.displayName;
    }
    return 'Guest';
  }

  /// Returns the formatted location string.
  String get locationString {
    final location = locationState.valueOrNull;
    if (location != null) {
      return location.shortAddress;
    }
    return 'Set location';
  }
}

/// Async value extension for easier state handling.
extension AsyncValueX<T> on AsyncValue<T> {
  /// Returns true if the value is loading.
  bool get isLoading => this is AsyncLoading<T>;

  /// Returns true if the value has data.
  bool get hasValue => valueOrNull != null;

  /// Returns true if there's an error.
  bool get hasError => this is AsyncError<T>;

  /// Returns the error if present.
  Object? get error => (this as AsyncError<T>?)?.error;
}
