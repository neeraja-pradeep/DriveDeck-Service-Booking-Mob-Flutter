Home Screen Module Prompt for Car Wash Application

Prompt: Car Wash App - Home Screen Module

Implement the complete Home Screen module for a Car Wash application following the established enterprise architecture.

**Module Overview:**
- Landing screen after successful authentication
- Displays user greeting with name and current location
- Location permission required on first load after authentication
- Uses if-modified-since header pattern for conditional data fetching
- XCSRF token sent with all non-GET requests
- Hive caching ONLY for: services list and car wash listings (data that benefits from offline access and conditional refresh)

**Conditional Fetch Pattern (if-modified-since):**
- Store last-modified timestamp locally for cacheable endpoints
- Send timestamp in "if-modified-since" header on subsequent requests
- If backend returns 304 Not Modified -> use cached data
- If backend returns 200 OK -> update cache with new data and new timestamp
- This applies to: services list, car wash listings

---

## PART 1: DOMAIN LAYER

### File: `lib/features/home/domain/entities/user_location.dart`
Create using Freezed:
- latitude: double
- longitude: double
- address: String (formatted address)
- city: String
- state: String
- pincode: String (nullable)
- Factory: UserLocation.empty()

### File: `lib/features/home/domain/entities/service_category.dart`
Create using Freezed:
- id: String
- name: String
- iconUrl: String
- isActive: bool

### File: `lib/features/home/domain/entities/car_wash_service.dart`
Create using Freezed:
- id: String
- name: String
- imageUrl: String
- distanceKm: double
- rating: double
- totalRatings: int
- isWishlisted: bool
- price: double (nullable, for display if available)
- address: String

### File: `lib/features/home/domain/entities/promo_card.dart`
Create using Freezed (for the swipeable card boxes):
- id: String
- title: String
- subtitle: String (nullable)
- imageUrl: String
- actionUrl: String (nullable, for deep linking later)

### File: `lib/features/home/domain/entities/home_tab.dart`
Create enum:
```dart
enum HomeTab { carWash, accessories, marketplace }
```

### File: `lib/features/home/domain/entities/cached_data.dart`
Generic wrapper for cached data with timestamp:
- data: T
- lastModified: DateTime
- Factory for creating with current timestamp

### File: `lib/features/home/domain/repositories/home_repository.dart`
Abstract class HomeRepository with methods (all return Future<Either<Failure, T>>):
- getServiceCategories(DateTime? lastModified) -> CachedData<List<ServiceCategory>>?
  - Returns null if 304 Not Modified (use cache)
- getCarWashServices(DateTime? lastModified) -> CachedData<List<CarWashService>>?
  - Returns null if 304 Not Modified (use cache)
- getPromoCards() -> List<PromoCard>
  - No caching needed, always fresh
- toggleWishlist(String serviceId) -> CarWashService
  - Requires XCSRF token (non-GET)
- getAccessoriesServices() -> List<dynamic>
  - Placeholder for future implementation
- getMarketplaceServices() -> List<dynamic>
  - Placeholder for future implementation

### File: `lib/features/home/domain/repositories/location_repository.dart`
Abstract class LocationRepository with methods:
- requestLocationPermission() -> Future<Either<Failure, LocationPermissionStatus>>
- getCurrentLocation() -> Future<Either<Failure, UserLocation>>
- getAddressFromCoordinates(double lat, double lng) -> Future<Either<Failure, UserLocation>>

### File: `lib/features/home/domain/entities/location_permission_status.dart`
Create enum:
```dart
enum LocationPermissionStatus {
  granted,
  denied,
  deniedForever,
  serviceDisabled
}
```

---

## PART 2: INFRASTRUCTURE LAYER

### File: `lib/features/home/infrastructure/models/user_location_model.dart`
- JSON serializable
- toDomain() -> UserLocation
- fromJson/toJson

### File: `lib/features/home/infrastructure/models/service_category_model.dart`
- JSON serializable
- Fields: id, name, icon_url, is_active
- toDomain() -> ServiceCategory
- fromJson/toJson

### File: `lib/features/home/infrastructure/models/car_wash_service_model.dart`
- JSON serializable
- Fields: id, name, image_url, distance_km, rating, total_ratings, is_wishlisted, price, address
- toDomain() -> CarWashService
- fromJson/toJson

### File: `lib/features/home/infrastructure/models/promo_card_model.dart`
- JSON serializable
- toDomain() -> PromoCard
- fromJson/toJson

### File: `lib/features/home/infrastructure/data_sources/remote/home_api.dart`

Abstract class HomeApi:
- getServiceCategories(String? ifModifiedSince) -> Future<ConditionalResponse<List<ServiceCategoryModel>>>
- getCarWashServices(String? ifModifiedSince) -> Future<ConditionalResponse<List<CarWashServiceModel>>>
- getPromoCards() -> Future<List<PromoCardModel>>
- toggleWishlist(String serviceId, String xcsrfToken) -> Future<CarWashServiceModel>

Implementation HomeApiImpl:
- Constructor takes DioClient
- For conditional fetch endpoints:
  - Add "if-modified-since" header with ISO 8601 timestamp if provided
  - Check response status:
    - 304: return ConditionalResponse.notModified()
    - 200: return ConditionalResponse.modified(data, newTimestamp from response headers)
- For toggleWishlist:
  - Add X-CSRF-Token header
  - Use POST/PUT method

### File: `lib/features/home/infrastructure/models/conditional_response.dart`
Create using Freezed:
```dart
@freezed
class ConditionalResponse<T> with _$ConditionalResponse<T> {
  const factory ConditionalResponse.modified({
    required T data,
    required DateTime lastModified,
  }) = _Modified<T>;
  
  const factory ConditionalResponse.notModified() = _NotModified<T>;
}
```

### File: `lib/features/home/infrastructure/data_sources/local/home_local_ds.dart`

Abstract class HomeLocalDataSource:
- saveServiceCategories(List<ServiceCategory>, DateTime lastModified) -> Future<void>
- getServiceCategories() -> Future<CachedData<List<ServiceCategory>>?>
- saveCarWashServices(List<CarWashService>, DateTime lastModified) -> Future<void>
- getCarWashServices() -> Future<CachedData<List<CarWashService>>?>
- clearCache() -> Future<void>
- getLastModified(String key) -> Future<DateTime?>

Implementation HomeLocalDataSourceImpl:
- Constructor takes Hive box reference
- Use Hive ONLY for:
  - Service categories (with timestamp)
  - Car wash services (with timestamp)
- Store lastModified timestamp alongside data
- Handle Hive exceptions gracefully

### File: `lib/features/home/infrastructure/data_sources/local/location_local_ds.dart`
Abstract class LocationLocalDataSource:
- saveLastLocation(UserLocation) -> Future<void>
- getLastLocation() -> Future<UserLocation?>

Implementation:
- Use SharedPreferences or simple Hive box
- For quick access to last known location

### File: `lib/features/home/infrastructure/repositories/home_repository_impl.dart`

HomeRepositoryImpl implements HomeRepository:
- Constructor: HomeApi, HomeLocalDataSource, ConnectivityChecker
- getServiceCategories implementation:
  1. Get lastModified from local cache
  2. Call API with ifModifiedSince header
  3. If 304 -> return null (caller uses cache)
  4. If 200 -> save to cache with new timestamp, return data
  5. If offline -> return cached data if available, else NetworkFailure
- getCarWashServices: same pattern
- getPromoCards: always fetch fresh, no caching
- toggleWishlist:
  - Call API with XCSRF token
  - Update cached car wash service locally if cache exists
  - Return updated service

### File: `lib/features/home/infrastructure/repositories/location_repository_impl.dart`

LocationRepositoryImpl implements LocationRepository:
- Constructor: LocationLocalDataSource
- Use geolocator or location package
- requestLocationPermission:
  - Request permission
  - Return appropriate status enum
- getCurrentLocation:
  - Check permission first
  - Get coordinates
  - Reverse geocode to get address
  - Save to local
  - Return UserLocation
- Handle all location exceptions -> LocationFailure

---

## PART 3: HIVE SETUP FOR HOME MODULE

### File: `lib/core/storage/hive/adapters/service_category_adapter.dart`
- TypeAdapter for ServiceCategory (or ServiceCategoryModel for storage)
- TypeId: [assign unique number]
- Register in hive_init.dart

### File: `lib/core/storage/hive/adapters/car_wash_service_adapter.dart`
- TypeAdapter for CarWashService storage
- TypeId: [assign unique number]
- Register in hive_init.dart

### Update: `lib/core/storage/hive/boxes.dart`
Add box names:
```dart
static const homeDataBox = 'home_data_box';
```

### Update: `lib/core/storage/hive/keys.dart`
Add keys:
```dart
class HomeBoxKeys {
  static const serviceCategories = 'service_categories';
  static const serviceCategoriesTimestamp = 'service_categories_timestamp';
  static const carWashServices = 'car_wash_services';
  static const carWashServicesTimestamp = 'car_wash_services_timestamp';
}
```

### Update: `lib/app/bootstrap/hive_init.dart`
- Register ServiceCategory and CarWashService adapters
- Open homeDataBox

---

## PART 4: APPLICATION LAYER

### File: `lib/features/home/application/states/home_state.dart`
Create using Freezed:
```dart
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required UserProfile userProfile, // from auth
    required LocationState locationState,
    required ServiceCategoriesState serviceCategoriesState,
    required CarWashServicesState carWashServicesState,
    required PromoCardsState promoCardsState,
    required HomeTab selectedTab,
  }) = _HomeState;
  
  factory HomeState.initial() => HomeState(
    userProfile: UserProfile.empty(),
    locationState: LocationState.initial(),
    serviceCategoriesState: ServiceCategoriesState.initial(),
    carWashServicesState: CarWashServicesState.initial(),
    promoCardsState: PromoCardsState.initial(),
    selectedTab: HomeTab.carWash,
  );
}
```

### File: `lib/features/home/application/states/location_state.dart`
Create using Freezed:
- initial()
- requestingPermission()
- permissionDenied(LocationPermissionStatus status)
- loading()
- loaded(UserLocation location)
- error(Failure failure)

### File: `lib/features/home/application/states/service_categories_state.dart`
Create using Freezed:
- initial()
- loading()
- loaded(List<ServiceCategory> categories, {bool fromCache})
- error(Failure failure)

### File: `lib/features/home/application/states/car_wash_services_state.dart`
Create using Freezed:
- initial()
- loading()
- loaded(List<CarWashService> services, {bool fromCache})
- error(Failure failure)
- Helper: toggleWishlistFor(String serviceId) -> new state with updated service

### File: `lib/features/home/application/states/promo_cards_state.dart`
Create using Freezed:
- initial()
- loading()
- loaded(List<PromoCard> cards)
- error(Failure failure)

### File: `lib/features/home/application/usecases/request_location_permission_usecase.dart`
- Takes LocationRepository
- call() -> Future<Either<Failure, LocationPermissionStatus>>

### File: `lib/features/home/application/usecases/get_current_location_usecase.dart`
- Takes LocationRepository
- call() -> Future<Either<Failure, UserLocation>>

### File: `lib/features/home/application/usecases/fetch_service_categories_usecase.dart`
- Takes HomeRepository
- call(DateTime? lastModified) -> Future<Either<Failure, CachedData<List<ServiceCategory>>?>>

### File: `lib/features/home/application/usecases/fetch_car_wash_services_usecase.dart`
- Takes HomeRepository
- call(DateTime? lastModified) -> Future<Either<Failure, CachedData<List<CarWashService>>?>>

### File: `lib/features/home/application/usecases/fetch_promo_cards_usecase.dart`
- Takes HomeRepository
- call() -> Future<Either<Failure, List<PromoCard>>>

### File: `lib/features/home/application/usecases/toggle_wishlist_usecase.dart`
- Takes HomeRepository
- call(String serviceId) -> Future<Either<Failure, CarWashService>>
- Non-GET request, XCSRF handled by repository/interceptor

### File: `lib/features/home/application/providers/home_providers.dart`
Define providers:
```dart
// Repository providers
final homeRepositoryProvider = Provider<HomeRepository>((ref) => ...);
final locationRepositoryProvider = Provider<LocationRepository>((ref) => ...);

// Usecase providers
final requestLocationPermissionUsecaseProvider = Provider((ref) => ...);
final getCurrentLocationUsecaseProvider = Provider((ref) => ...);
final fetchServiceCategoriesUsecaseProvider = Provider((ref) => ...);
final fetchCarWashServicesUsecaseProvider = Provider((ref) => ...);
final fetchPromoCardsUsecaseProvider = Provider((ref) => ...);
final toggleWishlistUsecaseProvider = Provider((ref) => ...);

// State providers
final homeStateProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) => ...);

// Granular providers for specific UI sections (optional, for performance)
final locationStateProvider = Provider((ref) => ref.watch(homeStateProvider).locationState);
final selectedTabProvider = Provider((ref) => ref.watch(homeStateProvider).selectedTab);
final carWashServicesProvider = Provider((ref) => ref.watch(homeStateProvider).carWashServicesState);

// User profile from auth (read from auth module)
final currentUserProvider = Provider((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.maybeMap(
    authenticated: (s) => s.session.user,
    orElse: () => null,
  );
});
```

### File: `lib/features/home/application/providers/home_notifier.dart`
HomeNotifier extends StateNotifier<HomeState>:

Constructor: 
- All usecases injected
- HomeLocalDataSource for reading cache timestamps

Methods:
```dart
// Called on screen init
Future<void> initialize() async {
  await _checkLocationPermission();
  await _loadInitialData();
}

Future<void> _checkLocationPermission() async {
  state = state.copyWith(locationState: LocationState.requestingPermission());
  final result = await requestLocationPermissionUsecase();
  result.fold(
    (failure) => state = state.copyWith(locationState: LocationState.error(failure)),
    (status) {
      if (status == LocationPermissionStatus.granted) {
        _fetchCurrentLocation();
      } else {
        state = state.copyWith(locationState: LocationState.permissionDenied(status));
      }
    },
  );
}

Future<void> _fetchCurrentLocation() async {
  state = state.copyWith(locationState: LocationState.loading());
  final result = await getCurrentLocationUsecase();
  result.fold(
    (failure) => state = state.copyWith(locationState: LocationState.error(failure)),
    (location) => state = state.copyWith(locationState: LocationState.loaded(location)),
  );
}

Future<void> _loadInitialData() async {
  // Load all sections in parallel
  await Future.wait([
    _fetchServiceCategories(),
    _fetchCarWashServices(),
    _fetchPromoCards(),
  ]);
}

Future<void> _fetchServiceCategories() async {
  // 1. First show cached data if available
  final cached = await homeLocalDataSource.getServiceCategories();
  if (cached != null) {
    state = state.copyWith(
      serviceCategoriesState: ServiceCategoriesState.loaded(cached.data, fromCache: true),
    );
  } else {
    state = state.copyWith(serviceCategoriesState: ServiceCategoriesState.loading());
  }
  
  // 2. Fetch with conditional request
  final lastModified = cached?.lastModified;
  final result = await fetchServiceCategoriesUsecase(lastModified);
  
  result.fold(
    (failure) {
      // If we have cache, keep showing it
      if (cached == null) {
        state = state.copyWith(serviceCategoriesState: ServiceCategoriesState.error(failure));
      }
    },
    (newData) {
      if (newData != null) {
        // 200 OK - new data
        state = state.copyWith(
          serviceCategoriesState: ServiceCategoriesState.loaded(newData.data, fromCache: false),
        );
      }
      // null means 304 - keep current state (already showing cache)
    },
  );
}

Future<void> _fetchCarWashServices() async {
  // Same pattern as service categories
}

Future<void> _fetchPromoCards() async {
  state = state.copyWith(promoCardsState: PromoCardsState.loading());
  final result = await fetchPromoCardsUsecase();
  result.fold(
    (failure) => state = state.copyWith(promoCardsState: PromoCardsState.error(failure)),
    (cards) => state = state.copyWith(promoCardsState: PromoCardsState.loaded(cards)),
  );
}

void selectTab(HomeTab tab) {
  state = state.copyWith(selectedTab: tab);
  // Fetch data for tab if needed (accessories, marketplace - placeholder for now)
}

Future<void> toggleWishlist(String serviceId) async {
  final result = await toggleWishlistUsecase(serviceId);
  result.fold(
    (failure) => /* show error toast/snackbar via callback or separate provider */,
    (updatedService) {
      // Update the service in the list
      final currentState = state.carWashServicesState;
      if (currentState is Loaded) {
        final updatedList = currentState.services.map((s) {
          return s.id == serviceId ? updatedService : s;
        }).toList();
        state = state.copyWith(
          carWashServicesState: CarWashServicesState.loaded(updatedList, fromCache: false),
        );
      }
    },
  );
}

Future<void> refreshAll() async {
  // Force refresh - clear timestamps and refetch
  await _loadInitialData();
}

Future<void> retryLocation() async {
  await _checkLocationPermission();
}
```

---

## PART 5: PRESENTATION LAYER

### File: `lib/features/home/presentation/screens/home_screen.dart`
ConsumerStatefulWidget - Main home screen

Structure:
- AppScaffold
- SafeArea
- RefreshIndicator for pull-to-refresh
- SingleChildScrollView or CustomScrollView with slivers
- Column layout:
  1. HomeHeaderSection
  2. SearchBarSection (static placeholder)
  3. PromoCardsSection (horizontal swipeable)
  4. ServiceCategoriesSection (horizontal swipeable)
  5. HomeTabBar (Car Wash | Accessories | Marketplace)
  6. TabContent (based on selected tab):
     - CarWashListSection
     - AccessoriesPlaceholder
     - MarketplacePlaceholder
  7. SessionDetailsSection (heading only for now)

Lifecycle:
- initState: Call homeNotifier.initialize()
- Handle location permission result (show settings prompt if denied forever)

### File: `lib/features/home/presentation/components/home_header_section.dart`
ConsumerWidget

Structure:
- Row:
  - Left Column:
    - Greeting text: "Hello {userName}" (from currentUserProvider)
    - Location row:
      - Location icon
      - Location text (city, state) or "Fetching location..." or "Location unavailable"
      - Chevron down icon (for future location picker)
  - Spacer
  - Right: Car icon button (placeholder, onTap: show toast "Coming soon")

Handle states:
- Location loading: show shimmer or "Fetching..."
- Location error: show "Tap to retry" with tap handler
- Location denied: show "Enable location" with tap to open settings
- Location loaded: show formatted address

### File: `lib/features/home/presentation/components/search_bar_section.dart`
StatelessWidget - Static placeholder

Structure:
- Container with search bar styling
- Search icon on left
- Hint text: "Search services, accessories..."
- Disabled/non-interactive for now
- OnTap: show toast "Search coming soon" OR navigate to search screen placeholder

### File: `lib/features/home/presentation/components/promo_cards_section.dart`
ConsumerWidget

Structure:
- SizedBox with fixed height
- PageView.builder or horizontal ListView.builder with snap
- Dots indicator below for current page
- Each card: PromoCardItem

Handle states:
- Loading: show shimmer placeholders
- Error: show retry option
- Loaded: show cards

### File: `lib/features/home/presentation/components/promo_card_item.dart`
StatelessWidget

Props:
- PromoCard card

Structure:
- Card with rounded corners
- Background image (use cached_network_image)
- Overlay gradient for text readability
- Title text
- Subtitle text (if available)
- OnTap: placeholder for deep linking

### File: `lib/features/home/presentation/components/service_categories_section.dart`
ConsumerWidget

Structure:
- Section title: "Services" (optional)
- Horizontal scrollable list
- Each item: ServiceCategoryItem

Handle states:
- Loading: shimmer horizontal list
- Error: inline error with retry
- Loaded: show categories
- Show "(from cache)" indicator subtly if fromCache is true (optional, for dev)

### File: `lib/features/home/presentation/components/service_category_item.dart`
StatelessWidget

Props:
- ServiceCategory category
- VoidCallback onTap

Structure:
- Vertical layout in fixed width container
- Circular/rounded icon container with network image
- Category name below
- OnTap handler (navigate to category detail - placeholder for now)

### File: `lib/features/home/presentation/components/home_tab_bar.dart`
ConsumerWidget

Structure:
- Container with background
- Row of 3 tab buttons:
  - Car Wash
  - Accessories
  - Marketplace
- Active tab highlighted (different background, text color)
- Animated indicator sliding between tabs
- OnTap: call homeNotifier.selectTab(tab)

### File: `lib/features/home/presentation/components/car_wash_list_section.dart`
ConsumerWidget

Structure:
- Vertical list of CarWashServiceCard widgets
- No ListView (already inside scroll view) - use Column with items
- Or use SliverList if parent is CustomScrollView

Handle states:
- Loading: shimmer card placeholders
- Error: error view with retry
- Loaded: show service cards

### File: `lib/features/home/presentation/components/car_wash_service_card.dart`
ConsumerWidget

Props:
- CarWashService service

Structure:
- Card with:
  - Service image (left or top)
  - Service name
  - Distance: "{X} km away"
  - Rating: Star icon + rating value + "({totalRatings})"
  - Wishlist heart icon (top right corner):
    - Filled if isWishlisted
    - OnTap: call homeNotifier.toggleWishlist(service.id)
    - Show loading indicator during wishlist toggle (optional)
- OnTap card: navigate to service detail (placeholder)

### File: `lib/features/home/presentation/components/accessories_placeholder.dart`
StatelessWidget

Structure:
- Centered text: "Accessories coming soon"
- Or empty state view

### File: `lib/features/home/presentation/components/marketplace_placeholder.dart`
StatelessWidget

Structure:
- Centered text: "Marketplace coming soon"
- Or empty state view

### File: `lib/features/home/presentation/components/session_details_section.dart`
StatelessWidget

Structure:
- Section heading: "Session Details"
- Placeholder content or empty for now
- This section will be expanded in future modules

### File: `lib/features/home/presentation/components/shimmer_loaders/`
Create shimmer placeholder widgets:
- home_header_shimmer.dart
- promo_card_shimmer.dart
- service_category_shimmer.dart
- car_wash_service_shimmer.dart

Use shimmer package or custom animation.

---

## PART 6: LOCATION PERMISSION HANDLING

### File: `lib/features/home/presentation/dialogs/location_permission_dialog.dart`
StatelessWidget dialog

Show when:
- Permission denied (explain why location is needed, offer retry)
- Permission denied forever (explain and offer to open settings)

Props:
- LocationPermissionStatus status
- VoidCallback onRetry
- VoidCallback onOpenSettings

### Update: `lib/core/utils/permission_utils.dart`
Create utility for:
- Opening app settings
- Checking permission status
- Platform-specific handling

### Add dependency to pubspec.yaml:
```yaml
dependencies:
  geolocator: ^11.0.0
  geocoding: ^3.0.0
  permission_handler: ^11.3.1
```

---

## PART 7: NETWORK LAYER UPDATES

### Update: `lib/core/network/endpoints.dart`
Add home endpoints:
```dart
// Home endpoints
static String serviceCategories() => '/services/categories';
static String carWashServices() => '/services/car-wash';
static String promoCards() => '/home/promo-cards';
static String toggleWishlist(String serviceId) => '/services/$serviceId/wishlist';

// For future tabs
static String accessoriesServices() => '/services/accessories';
static String marketplaceServices() => '/services/marketplace';
```

### File: `lib/core/network/interceptors/conditional_fetch_interceptor.dart`
Create interceptor (optional, can also handle in API impl):
- For configured endpoints, check if if-modified-since should be added
- Handle 304 response specially (don't treat as error)

OR handle this logic directly in HomeApiImpl - simpler approach for now.

---

## PART 8: ROUTING UPDATES

### Update: `lib/app/router/routes.dart`
```dart
static const home = '/home';
static const serviceDetail = '/service/:serviceId';
static const categoryDetail = '/category/:categoryId';
```

### Update: `lib/app/router/app_router.dart`
- Add /home route -> HomeScreen
- Set as redirect destination after successful auth
- Add placeholder routes for service detail and category detail

---

## PART 9: ERROR HANDLING FOR HOME

### Update: `lib/core/error/failure.dart`
Add home-specific failures:
- LocationPermissionDeniedFailure(LocationPermissionStatus status)
- LocationServiceDisabledFailure
- LocationFetchFailure(String message)

Update toUserMessage() for these failures.

---

## REQUIREMENTS CHECKLIST:

1. **Conditional fetch with if-modified-since** - Implemented for services and car wash listings
2. **Hive caching** - ONLY for service categories and car wash services (with timestamps)
3. **XCSRF token** - Sent via interceptor for toggleWishlist (non-GET)
4. **Location permission** - Requested on first load, handled gracefully for all states
5. **User greeting** - Shows authenticated user's name from auth state
6. **Current location** - Reverse geocoded address display
7. **Horizontal swipeable lists** - Promo cards and service categories
8. **Tab bar** - Car Wash, Accessories, Marketplace with smooth switching
9. **Car wash service cards** - Name, distance, rating, wishlist toggle
10. **Wishlist functionality** - Toggle with XCSRF token, update UI optimistically or after response
11. **Pull-to-refresh** - Refresh all data
12. **Loading states** - Shimmer placeholders for all sections
13. **Error handling** - Inline errors with retry options
14. **Offline support** - Show cached data when available
15. **Responsive UI** - All dimensions use ScreenUtil

## CACHING STRATEGY SUMMARY:

| Data | Cache in Hive | Conditional Fetch | Reason |
|------|---------------|-------------------|--------|
| Service Categories | YES | YES (if-modified-since) | Rarely changes, offline access useful |
| Car Wash Services | YES | YES (if-modified-since) | User browses offline, changes infrequently |
| Promo Cards | NO | NO | Always fresh, marketing content changes often |
| User Location | SharedPrefs only | NO | Just last known location for quick display |

## FOLLOW ESTABLISHED PATTERNS:

- Either<Failure, T> for all repository methods
- Freezed for entities, models, states
- Riverpod for all state management
- Component-based UI (no monolithic screens)
- Abstract + Implementation pattern for testability
- ScreenUtil for all sizing (.w, .h, .sp, .r)
- No hardcoded strings (prepare for l10n)
- Document all public APIs

Generate complete, production-ready code for all files listed above.

Supplementary Prompts
Prompt: Add if-modified-since Header Handling to API Client
Update the API client to support conditional requests with if-modified-since header.

**Requirements:**

1. Update `lib/core/network/api_client.dart`:
   - Add method: getConditional<T>() that accepts optional ifModifiedSince DateTime
   - Convert DateTime to HTTP date format (RFC 7231)
   - Handle 304 Not Modified response (don't throw error)
   - Extract Last-Modified or custom timestamp header from response
   - Return wrapper type indicating modified/not-modified status

2. Create `lib/core/network/conditional_response.dart`:
   - Generic ConditionalApiResponse<T> using Freezed
   - Variants: modified(T data, DateTime lastModified), notModified()

3. HTTP date format helper in `lib/core/utils/date_utils.dart`:
   - toHttpDate(DateTime) -> String (RFC 7231 format)
   - fromHttpDate(String) -> DateTime

Handle edge cases:
- Missing Last-Modified header (use current time as fallback)
- Invalid date format in header
- Network errors during conditional request

Prompt: Home Module Hive Adapters

Generate Hive TypeAdapters for the Home module entities.

**Adapters needed:**

1. ServiceCategoryAdapter (TypeId: 10)
   - Fields: id, name, iconUrl, isActive

2. CarWashServiceAdapter (TypeId: 11)
   - Fields: id, name, imageUrl, distanceKm, rating, totalRatings, isWishlisted, price (nullable), address

3. CachedDataWrapperAdapter (TypeId: 12)
   - Generic wrapper for storing data with timestamp
   - Fields: data (dynamic/Object), lastModifiedMillis (int)

**Requirements:**
- Place in lib/core/storage/hive/adapters/
- Register all in hive_init.dart
- Handle nullable fields properly
- Use efficient serialization (avoid storing nulls)

Prompt: Location Service Implementation

Implement the location service for the Car Wash app.

**Files to create:**

1. `lib/core/services/location_service.dart`
   - Abstract class LocationService
   - Methods:
     - checkPermission() -> Future<LocationPermissionStatus>
     - requestPermission() -> Future<LocationPermissionStatus>
     - getCurrentPosition() -> Future<Position>
     - getAddressFromCoordinates(lat, lng) -> Future<Placemark>
     - openLocationSettings() -> Future<bool>
     - isLocationServiceEnabled() -> Future<bool>

2. `lib/core/services/location_service_impl.dart`
   - Implementation using geolocator and geocoding packages
   - Handle all platform-specific quirks
   - Proper error handling for each failure mode
   - Timeout for location fetch (10 seconds)
   - Desired accuracy: high for first fetch, balanced for subsequent

3. `lib/core/services/location_providers.dart`
   - Provider for LocationService

**Error scenarios to handle:**
- Location service disabled on device
- Permission denied
- Permission denied forever
- Timeout getting location
- Geocoding failure
- No internet for reverse geocoding

Prompt: Shimmer Loading Components
Create shimmer loading placeholder components for the Home screen.

**Files to create:**

1. `lib/features/home/presentation/components/shimmer_loaders/shimmer_container.dart`
   - Base shimmer wrapper with configurable base/highlight colors
   - Use shimmer package

2. `lib/features/home/presentation/components/shimmer_loaders/home_header_shimmer.dart`
   - Shimmer for greeting text (wider box)
   - Shimmer for location text (narrower box)

3. `lib/features/home/presentation/components/shimmer_loaders/promo_cards_shimmer.dart`
   - Horizontal list of card-shaped shimmers
   - Match exact dimensions of PromoCardItem

4. `lib/features/home/presentation/components/shimmer_loaders/service_categories_shimmer.dart`
   - Horizontal list of circular + text shimmers
   - Match ServiceCategoryItem layout

5. `lib/features/home/presentation/components/shimmer_loaders/car_wash_service_shimmer.dart`
   - Card shimmer matching CarWashServiceCard layout
   - Image placeholder, text lines, rating placeholder

**Requirements:**
- All dimensions use ScreenUtil
- Colors from theme (surface color as base)
- Smooth animation
- Match actual component dimensions exactly for seamless transition

