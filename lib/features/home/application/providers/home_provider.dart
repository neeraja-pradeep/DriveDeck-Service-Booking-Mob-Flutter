import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/application/providers/auth_providers.dart';
import '../../../auth/application/states/auth_state.dart';
import '../../domain/entities/car_wash_shop.dart';
import '../../domain/entities/service_category.dart';
import '../../domain/entities/user_location.dart';
import '../../../profile/domain/entities/user_profile.dart';
import '../../infrastructure/repositories/home_repository_impl.dart';
import '../states/home_state.dart';

/// Provider for the HomeNotifier.
/// This provider watches the auth state and only initializes when user is authenticated.
final homeNotifierProvider =
    StateNotifierProvider.autoDispose<HomeNotifier, HomeState>((ref) {
      // Watch auth state to ensure user is authenticated
      final authState = ref.watch(authStateProvider);

      return HomeNotifier(ref, authState);
    });

/// State notifier for managing home screen state.
class HomeNotifier extends StateNotifier<HomeState> {
  final Ref _ref;
  final AuthState _authState;

  HomeNotifier(this._ref, this._authState) : super(HomeState.initial()) {
    // Only initialize if user is authenticated
    _authState.whenOrNull(
      authenticated: (session) {
        _init();
      },
    );
  }

  /// Checks if user is authenticated before making API calls.
  bool get _isAuthenticated {
    return _authState.whenOrNull(authenticated: (session) => true) ?? false;
  }

  /// Initializes the home screen by loading all required data.
  /// Only loads data if user is authenticated.
  Future<void> _init() async {
    if (!mounted) return;

    if (!_isAuthenticated) {
      // Set state to indicate authentication is required
      if (mounted) {
        state = state.copyWith(
          lastError: const Failure.unauthorized(
            message: 'Please log in to access home features',
          ),
        );
      }
      return;
    }

    await Future.wait([loadUserProfile(), _loadLocationAndData()]);
  }

  /// Loads location and then location-dependent data.
  Future<void> _loadLocationAndData() async {
    if (!mounted) return;

    await loadLocation();

    if (!mounted) return;

    // Load data that depends on location
    final location = state.locationState.valueOrNull;
    if (location != null && location.isValid) {
      // Update user profile with location first
      await _updateProfileWithLocation(location);
      if (!mounted) return;
      await Future.wait([loadServiceCategories(), loadShopsNearYou()]);
    } else {
      // Still try to load categories even without location
      await loadServiceCategories();
      if (!mounted) return;
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
        if (mounted) {
          state = state.copyWith(lastError: failure);
        }
      },
      (updatedProfile) {
        // Update the profile state with the new location data
        if (mounted) {
          state = state.copyWith(profileState: AsyncValue.data(updatedProfile));
        }
      },
    );
  }

  /// Loads the user profile.
  Future<void> loadUserProfile() async {
    if (!mounted) return;

    if (!_isAuthenticated) {
      if (mounted) {
        state = state.copyWith(
          profileState: AsyncValue.error(
            const Failure.unauthorized(message: 'Authentication required'),
            StackTrace.current,
          ),
        );
      }
      return;
    }

    if (mounted) {
      state = state.copyWith(profileState: const AsyncValue.loading());
    }

    final repository = _ref.read(homeRepositoryProvider);
    final result = await repository.getUserProfile();

    result.fold(
      (failure) {
        if (mounted) {
          state = state.copyWith(
            profileState: AsyncValue.error(failure, StackTrace.current),
            lastError: failure,
          );
        }
      },
      (profile) {
        if (mounted) {
          state = state.copyWith(profileState: AsyncValue.data(profile));
        }
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
        if (mounted) {
          if (state.locationState.hasValue) {
            state = state.copyWith(lastError: failure);
          } else {
            state = state.copyWith(
              locationState: AsyncValue.error(failure, StackTrace.current),
              lastError: failure,
            );
          }
        }
      },
      (location) {
        if (mounted) {
          state = state.copyWith(locationState: AsyncValue.data(location));
        }
      },
    );
  }

  /// Loads service categories.
  Future<void> loadServiceCategories() async {
    if (!mounted) return;

    if (!_isAuthenticated) {
      if (mounted) {
        state = state.copyWith(
          categoriesState: AsyncValue.error(
            const Failure.unauthorized(message: 'Authentication required'),
            StackTrace.current,
          ),
        );
      }
      return;
    }

    if (mounted) {
      state = state.copyWith(categoriesState: const AsyncValue.loading());
    }

    final repository = _ref.read(homeRepositoryProvider);
    final result = await repository.getServiceCategories();

    result.fold(
      (failure) {
        if (mounted) {
          state = state.copyWith(
            categoriesState: AsyncValue.error(failure, StackTrace.current),
            lastError: failure,
          );
        }
      },
      (categories) {
        if (mounted) {
          state = state.copyWith(categoriesState: AsyncValue.data(categories));
        }
      },
    );
  }

  /// Loads car wash shops near the user.
  Future<void> loadShopsNearYou() async {
    if (!mounted) return;

    if (!_isAuthenticated) {
      if (mounted) {
        state = state.copyWith(
          shopsNearYouState: AsyncValue.error(
            const Failure.unauthorized(message: 'Authentication required'),
            StackTrace.current,
          ),
        );
      }
      return;
    }

    final location = state.locationState.valueOrNull;
    if (location == null || !location.isValid) {
      if (mounted) {
        state = state.copyWith(shopsNearYouState: const AsyncValue.data([]));
      }
      return;
    }

    if (mounted) {
      state = state.copyWith(shopsNearYouState: const AsyncValue.loading());
    }

    final repository = _ref.read(homeRepositoryProvider);

    // First ensure the profile has the location data
    await _updateProfileWithLocation(location);

    if (!mounted) return;

    final result = await repository.getShopsNearYou(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    result.fold(
      (failure) {
        if (mounted) {
          state = state.copyWith(
            shopsNearYouState: AsyncValue.error(failure, StackTrace.current),
            lastError: failure,
          );
        }
      },
      (shops) {
        if (mounted) {
          state = state.copyWith(shopsNearYouState: AsyncValue.data(shops));
        }
      },
    );
  }

  /// Refreshes all home screen data.
  Future<void> refresh() async {
    if (!mounted) return;

    if (!_isAuthenticated) {
      if (mounted) {
        state = state.copyWith(
          lastError: const Failure.unauthorized(
            message: 'Please log in to refresh data',
          ),
        );
      }
      return;
    }

    if (mounted) {
      state = state.copyWith(isRefreshing: true);
    }

    await Future.wait([
      loadUserProfile(),
      loadServiceCategories(),
      _loadLocationAndData(), // This will handle location update and shops loading
    ]);

    if (mounted) {
      state = state.copyWith(isRefreshing: false);
    }
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
    if (!mounted) return;

    if (query.isEmpty) {
      if (mounted) {
        state = state.copyWith(
          searchQuery: '',
          searchResultsState: const AsyncValue.data([]),
          isSearching: false,
        );
      }
      return;
    }

    if (mounted) {
      state = state.copyWith(
        searchQuery: query,
        isSearching: true,
        searchResultsState: const AsyncValue.loading(),
      );
    }

    final repository = _ref.read(homeRepositoryProvider);
    final result = await repository.searchShops(query: query);

    result.fold(
      (failure) {
        if (mounted) {
          state = state.copyWith(
            searchResultsState: AsyncValue.error(failure, StackTrace.current),
            isSearching: false,
            lastError: failure,
          );
        }
      },
      (shops) {
        if (mounted) {
          state = state.copyWith(
            searchResultsState: AsyncValue.data(shops),
            isSearching: false,
          );
        }
      },
    );
  }

  /// Clears search results.
  void clearSearch() {
    if (mounted) {
      state = state.copyWith(
        searchQuery: '',
        searchResultsState: const AsyncValue.data([]),
        isSearching: false,
      );
    }
  }

  /// Toggles wishlist for a shop.
  Future<void> toggleWishlist(int shopId) async {
    if (!mounted) return;

    final repository = _ref.read(homeRepositoryProvider);
    final result = await repository.toggleWishlist(shopId: shopId);

    result.fold(
      (failure) {
        if (mounted) {
          state = state.copyWith(lastError: failure);
        }
      },
      (isWishlisted) {
        // Update the shop in the list
        _updateShopWishlistStatus(shopId, isWishlisted);
      },
    );
  }

  /// Updates the wishlist status of a shop in all lists.
  void _updateShopWishlistStatus(int shopId, bool isWishlisted) {
    if (!mounted) return;

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
    if (!mounted) return;

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
        if (mounted) {
          state = state.copyWith(lastError: failure);
        }
      },
      (updatedProfile) {
        if (mounted) {
          state = state.copyWith(profileState: AsyncValue.data(updatedProfile));
          // Reload shops near you with the new location
          if (latitude != null && longitude != null) {
            loadShopsNearYou();
          }
        }
      },
    );
  }

  /// Clears the last error.
  void clearError() {
    if (mounted) {
      state = state.copyWith(lastError: null);
    }
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

/// Provider for current session information.
final currentSessionProvider = Provider.autoDispose((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.whenOrNull(authenticated: (session) => session);
});

/// Provider for current user ID.
final currentUserIdProvider = Provider.autoDispose<String?>((ref) {
  final session = ref.watch(currentSessionProvider);
  return session?.userId;
});
