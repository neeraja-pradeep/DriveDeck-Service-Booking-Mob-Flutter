import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/car_wash_shop.dart';
import '../../domain/entities/service_category.dart';
import '../../domain/entities/user_location.dart';
import '../../domain/entities/user_profile.dart';
import '../../infrastructure/repositories/home_repository_impl.dart';
import '../states/home_state.dart';

/// Provider for the HomeNotifier.
final homeNotifierProvider =
    StateNotifierProvider.autoDispose<HomeNotifier, HomeState>((ref) {
      return HomeNotifier(ref);
    });

/// State notifier for managing home screen state.
class HomeNotifier extends StateNotifier<HomeState> {
  final Ref _ref;

  HomeNotifier(this._ref) : super(HomeState.initial()) {
    _init();
  }

  /// Initializes the home screen by loading all required data.
  Future<void> _init() async {
    await Future.wait([loadUserProfile(), _loadLocationAndData()]);
  }

  /// Loads location and then location-dependent data.
  Future<void> _loadLocationAndData() async {
    await loadLocation();

    // Load data that depends on location
    final location = state.locationState.valueOrNull;
    if (location != null && location.isValid) {
      // Update user profile with location first
      await _updateProfileWithLocation(location);
      await Future.wait([loadServiceCategories(), loadShopsNearYou()]);
    } else {
      // Still try to load categories even without location
      await loadServiceCategories();
      // Set shops to empty with a note about location
      state = state.copyWith(shopsNearYouState: const AsyncValue.data([]));
    }
  }

  /// Updates the user profile with location coordinates.
  Future<void> _updateProfileWithLocation(UserLocation location) async {
    final currentProfile = state.profileState.valueOrNull;

    // Check if profile already has the same location to avoid unnecessary API calls
    if (currentProfile != null &&
        currentProfile.latitude == location.latitude &&
        currentProfile.longitude == location.longitude) {
      return; // Profile already has this location
    }

    final repository = _ref.read(homeRepositoryProvider);
    final result = await repository.updateUserProfile(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    result.fold(
      (failure) {
        // Log the error but don't fail the entire flow
        state = state.copyWith(lastError: failure);
      },
      (updatedProfile) {
        // Update the profile state with the new location data
        state = state.copyWith(profileState: AsyncValue.data(updatedProfile));
      },
    );
  }

  /// Loads the user profile.
  Future<void> loadUserProfile() async {
    state = state.copyWith(profileState: const AsyncValue.loading());

    final repository = _ref.read(homeRepositoryProvider);
    final result = await repository.getUserProfile();

    result.fold(
      (failure) {
        state = state.copyWith(
          profileState: AsyncValue.error(failure, StackTrace.current),
          lastError: failure,
        );
      },
      (profile) {
        state = state.copyWith(profileState: AsyncValue.data(profile));
      },
    );
  }

  /// Loads the user's current location.
  Future<void> loadLocation() async {
    state = state.copyWith(
      locationState: const AsyncValue.loading(),
      isLocationPermissionRequested: true,
    );

    final repository = _ref.read(homeRepositoryProvider);

    // First try to get cached location
    final cachedResult = await repository.getCachedLocation();
    cachedResult.fold(
      (_) {}, // Ignore cache errors
      (cached) {
        if (cached != null) {
          state = state.copyWith(locationState: AsyncValue.data(cached));
        }
      },
    );

    // Then try to get current location
    final result = await repository.getCurrentLocation();

    result.fold(
      (failure) {
        // If we already have cached location, keep it
        if (state.locationState.hasValue) {
          state = state.copyWith(lastError: failure);
        } else {
          state = state.copyWith(
            locationState: AsyncValue.error(failure, StackTrace.current),
            lastError: failure,
          );
        }
      },
      (location) {
        state = state.copyWith(locationState: AsyncValue.data(location));
      },
    );
  }

  /// Loads service categories.
  Future<void> loadServiceCategories() async {
    state = state.copyWith(categoriesState: const AsyncValue.loading());

    final repository = _ref.read(homeRepositoryProvider);
    final result = await repository.getServiceCategories();

    result.fold(
      (failure) {
        state = state.copyWith(
          categoriesState: AsyncValue.error(failure, StackTrace.current),
          lastError: failure,
        );
      },
      (categories) {
        state = state.copyWith(categoriesState: AsyncValue.data(categories));
      },
    );
  }

  /// Loads car wash shops near the user.
  Future<void> loadShopsNearYou() async {
    final location = state.locationState.valueOrNull;
    if (location == null || !location.isValid) {
      state = state.copyWith(shopsNearYouState: const AsyncValue.data([]));
      return;
    }

    state = state.copyWith(shopsNearYouState: const AsyncValue.loading());

    final repository = _ref.read(homeRepositoryProvider);

    // First ensure the profile has the location data
    await _updateProfileWithLocation(location);

    final result = await repository.getShopsNearYou(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          shopsNearYouState: AsyncValue.error(failure, StackTrace.current),
          lastError: failure,
        );
      },
      (shops) {
        state = state.copyWith(shopsNearYouState: AsyncValue.data(shops));
      },
    );
  }

  /// Refreshes all home screen data.
  Future<void> refresh() async {
    state = state.copyWith(isRefreshing: true);

    await Future.wait([
      loadUserProfile(),
      loadServiceCategories(),
      _loadLocationAndData(), // This will handle location update and shops loading
    ]);

    state = state.copyWith(isRefreshing: false);
  }

  /// Manually retry loading shops near you (useful for error recovery).
  Future<void> retryShopsNearYou() async {
    final location = state.locationState.valueOrNull;
    if (location != null && location.isValid) {
      await loadShopsNearYou();
    }
  }

  /// Searches for shops by query.
  Future<void> searchShops(String query) async {
    if (query.isEmpty) {
      state = state.copyWith(
        searchQuery: '',
        searchResultsState: const AsyncValue.data([]),
        isSearching: false,
      );
      return;
    }

    state = state.copyWith(
      searchQuery: query,
      isSearching: true,
      searchResultsState: const AsyncValue.loading(),
    );

    final repository = _ref.read(homeRepositoryProvider);
    final result = await repository.searchShops(query: query);

    result.fold(
      (failure) {
        state = state.copyWith(
          searchResultsState: AsyncValue.error(failure, StackTrace.current),
          isSearching: false,
          lastError: failure,
        );
      },
      (shops) {
        state = state.copyWith(
          searchResultsState: AsyncValue.data(shops),
          isSearching: false,
        );
      },
    );
  }

  /// Clears search results.
  void clearSearch() {
    state = state.copyWith(
      searchQuery: '',
      searchResultsState: const AsyncValue.data([]),
      isSearching: false,
    );
  }

  /// Toggles wishlist for a shop.
  Future<void> toggleWishlist(int shopId) async {
    final repository = _ref.read(homeRepositoryProvider);
    final result = await repository.toggleWishlist(shopId: shopId);

    result.fold(
      (failure) {
        state = state.copyWith(lastError: failure);
      },
      (isWishlisted) {
        // Update the shop in the list
        _updateShopWishlistStatus(shopId, isWishlisted);
      },
    );
  }

  /// Updates the wishlist status of a shop in all lists.
  void _updateShopWishlistStatus(int shopId, bool isWishlisted) {
    // Update in shops near you
    final shops = state.shopsNearYouState.valueOrNull;
    if (shops != null) {
      final updatedShops = shops.map((shop) {
        if (shop.id == shopId) {
          return CarWashShop(
            id: shop.id,
            name: shop.name,
            description: shop.description,
            image: shop.image,
            address: shop.address,
            phone: shop.phone,
            latitude: shop.latitude,
            longitude: shop.longitude,
            rating: shop.rating,
            reviewCount: shop.reviewCount,
            distance: shop.distance,
            openingTime: shop.openingTime,
            closingTime: shop.closingTime,
            isOpen: shop.isOpen,
            isWishlisted: isWishlisted,
            services: shop.services,
            priceRange: shop.priceRange,
          );
        }
        return shop;
      }).toList();

      state = state.copyWith(shopsNearYouState: AsyncValue.data(updatedShops));
    }

    // Update in search results
    final searchResults = state.searchResultsState.valueOrNull;
    if (searchResults != null) {
      final updatedResults = searchResults.map((shop) {
        if (shop.id == shopId) {
          return CarWashShop(
            id: shop.id,
            name: shop.name,
            description: shop.description,
            image: shop.image,
            address: shop.address,
            phone: shop.phone,
            latitude: shop.latitude,
            longitude: shop.longitude,
            rating: shop.rating,
            reviewCount: shop.reviewCount,
            distance: shop.distance,
            openingTime: shop.openingTime,
            closingTime: shop.closingTime,
            isOpen: shop.isOpen,
            isWishlisted: isWishlisted,
            services: shop.services,
            priceRange: shop.priceRange,
          );
        }
        return shop;
      }).toList();

      state = state.copyWith(
        searchResultsState: AsyncValue.data(updatedResults),
      );
    }
  }

  /// Updates the user profile with location data.
  Future<void> updateUserProfileWithLocation({
    double? latitude,
    double? longitude,
    String? name,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) async {
    final repository = _ref.read(homeRepositoryProvider);
    final result = await repository.updateUserProfile(
      latitude: latitude,
      longitude: longitude,
      name: name,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );

    result.fold(
      (failure) {
        state = state.copyWith(lastError: failure);
      },
      (updatedProfile) {
        state = state.copyWith(profileState: AsyncValue.data(updatedProfile));
        // Reload shops near you with the new location
        if (latitude != null && longitude != null) {
          loadShopsNearYou();
        }
      },
    );
  }

  /// Clears the last error.
  void clearError() {
    state = state.copyWith(lastError: null);
  }
}

// ============ Convenience Providers ============

/// Provider for user profile.
final userProfileProvider = Provider.autoDispose<AsyncValue<UserProfile?>>((
  ref,
) {
  return ref.watch(homeNotifierProvider.select((state) => state.profileState));
});

/// Provider for user location.
final userLocationProvider = Provider.autoDispose<AsyncValue<UserLocation?>>((
  ref,
) {
  return ref.watch(homeNotifierProvider.select((state) => state.locationState));
});

/// Provider for service categories.
final serviceCategoriesProvider =
    Provider.autoDispose<AsyncValue<List<ServiceCategory>>>((ref) {
      return ref.watch(
        homeNotifierProvider.select((state) => state.categoriesState),
      );
    });

/// Provider for shops near you.
final shopsNearYouProvider =
    Provider.autoDispose<AsyncValue<List<CarWashShop>>>((ref) {
      return ref.watch(
        homeNotifierProvider.select((state) => state.shopsNearYouState),
      );
    });

/// Provider for search results.
final searchResultsProvider =
    Provider.autoDispose<AsyncValue<List<CarWashShop>>>((ref) {
      return ref.watch(
        homeNotifierProvider.select((state) => state.searchResultsState),
      );
    });

/// Provider for search query.
final searchQueryProvider = Provider.autoDispose<String>((ref) {
  return ref.watch(homeNotifierProvider.select((state) => state.searchQuery));
});

/// Provider for checking if searching.
final isSearchingProvider = Provider.autoDispose<bool>((ref) {
  return ref.watch(homeNotifierProvider.select((state) => state.isSearching));
});

/// Provider for greeting message.
final greetingProvider = Provider.autoDispose<String>((ref) {
  return ref.watch(homeNotifierProvider.select((state) => state.greeting));
});

/// Provider for location string.
final locationStringProvider = Provider.autoDispose<String>((ref) {
  return ref.watch(
    homeNotifierProvider.select((state) => state.locationString),
  );
});
