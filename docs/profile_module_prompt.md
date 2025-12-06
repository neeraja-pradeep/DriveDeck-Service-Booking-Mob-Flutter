Profile Module Prompt for Car Wash Application

Prompt: Car Wash App - Profile Module

Implement the complete Profile module for a Car Wash application following the established enterprise architecture. This module manages user profile, personal information editing, vehicle garage, and account settings.

**Module Overview:**
- Third tab in bottom navigation (after Home and My Bookings)
- Displays user profile with navigation to various sub-sections
- Personal info editing with save functionality
- My Garage for managing user's vehicles
- Navigation to booking history
- Logout functionality with confirmation
- Uses if-modified-since header pattern for profile and garage data
- XCSRF token sent with all non-GET requests (profile update, add/remove vehicle, logout)
- Hive caching for: user profile, vehicle list (benefits from offline access)
- Static placeholders for: profile picture edit, membership, settings, help & support

---

## PART 1: DOMAIN LAYER

### File: `lib/features/profile/domain/entities/user_profile.dart`
Create using Freezed:
- id: String
- firstName: String
- lastName: String
- email: String (nullable - may not be set for phone-only auth)
- phoneNumber: String
- profileImageUrl: String (nullable)
- createdAt: DateTime
- updatedAt: DateTime
- Helper: String get fullName => '$firstName $lastName'.trim()
- Helper: String get initials => (firstName.isNotEmpty ? firstName[0] : '') + (lastName.isNotEmpty ? lastName[0] : '')
- Factory: UserProfile.empty()

### File: `lib/features/profile/domain/entities/update_profile_request.dart`
Create using Freezed:
- firstName: String
- lastName: String
- email: String (nullable)
- phoneNumber: String (read-only display, not editable for now)

### File: `lib/features/profile/domain/entities/vehicle.dart`
Create using Freezed:
- id: String
- make: String (e.g., "Toyota", "Honda")
- model: String (e.g., "Camry", "Civic")
- year: int (nullable)
- licensePlate: String (nullable)
- color: String (nullable)
- vehicleType: VehicleType (from shop module - hatchback, sedan, suv, etc.)
- imageUrl: String (nullable)
- isDefault: bool
- createdAt: DateTime
- Helper: String get displayName => '$make $model' or '$year $make $model'

### File: `lib/features/profile/domain/entities/add_vehicle_request.dart`
Create using Freezed:
- make: String
- model: String
- year: int (nullable)
- licensePlate: String (nullable)
- color: String (nullable)
- vehicleType: VehicleType
- isDefault: bool

### File: `lib/features/profile/domain/entities/profile_menu_item.dart`
Create enum for profile menu options:
```dart
enum ProfileMenuItem {
  myGarage,
  membership,
  history,
  settings,
  helpSupport,
  logout
}

extension ProfileMenuItemX on ProfileMenuItem {
  String get title => switch (this) {
    ProfileMenuItem.myGarage => 'My Garage',
    ProfileMenuItem.membership => 'Membership',
    ProfileMenuItem.history => 'History',
    ProfileMenuItem.settings => 'Settings',
    ProfileMenuItem.helpSupport => 'Help & Support',
    ProfileMenuItem.logout => 'Logout',
  };
  
  IconData get icon => switch (this) {
    ProfileMenuItem.myGarage => Icons.directions_car_outlined,
    ProfileMenuItem.membership => Icons.card_membership_outlined,
    ProfileMenuItem.history => Icons.history_outlined,
    ProfileMenuItem.settings => Icons.settings_outlined,
    ProfileMenuItem.helpSupport => Icons.help_outline,
    ProfileMenuItem.logout => Icons.logout_outlined,
  };
  
  bool get isDestructive => this == ProfileMenuItem.logout;
}
```

### File: `lib/features/profile/domain/repositories/profile_repository.dart`
Abstract class ProfileRepository with methods (all return Future<Either<Failure, T>>):
- getProfile(DateTime? lastModified) -> CachedData<UserProfile>?
  - Returns null if 304 Not Modified (use cache)
- updateProfile(UpdateProfileRequest request) -> UserProfile
  - Requires XCSRF token (non-GET)
- uploadProfileImage(File image) -> String (returns new image URL)
  - Requires XCSRF token (non-GET)
  - For future implementation
- logout() -> Unit
  - Requires XCSRF token (non-GET)
  - Clears session on backend

### File: `lib/features/profile/domain/repositories/garage_repository.dart`
Abstract class GarageRepository with methods (all return Future<Either<Failure, T>>):
- getVehicles(DateTime? lastModified) -> CachedData<List<Vehicle>>?
  - Returns null if 304 Not Modified (use cache)
- addVehicle(AddVehicleRequest request) -> Vehicle
  - Requires XCSRF token (non-GET)
- updateVehicle(String vehicleId, AddVehicleRequest request) -> Vehicle
  - Requires XCSRF token (non-GET)
- deleteVehicle(String vehicleId) -> Unit
  - Requires XCSRF token (non-GET)
- setDefaultVehicle(String vehicleId) -> Vehicle
  - Requires XCSRF token (non-GET)

---

## PART 2: INFRASTRUCTURE LAYER

### File: `lib/features/profile/infrastructure/models/user_profile_model.dart`
- JSON serializable matching API response
- Fields: id, first_name, last_name, email, phone_number, profile_image_url, created_at, updated_at
- toDomain() -> UserProfile
- fromJson/toJson
- Handle nullable fields

### File: `lib/features/profile/infrastructure/models/update_profile_request_model.dart`
- JSON serializable for API request
- Fields: first_name, last_name, email
- fromDomain(UpdateProfileRequest) factory
- toJson()

### File: `lib/features/profile/infrastructure/models/vehicle_model.dart`
- JSON serializable matching API response
- Fields: id, make, model, year, license_plate, color, vehicle_type, image_url, is_default, created_at
- toDomain() -> Vehicle
- fromJson/toJson
- Handle vehicle_type string to enum conversion

### File: `lib/features/profile/infrastructure/models/add_vehicle_request_model.dart`
- JSON serializable for API request
- Fields: make, model, year, license_plate, color, vehicle_type, is_default
- fromDomain(AddVehicleRequest) factory
- toJson()

### File: `lib/features/profile/infrastructure/data_sources/remote/profile_api.dart`

Abstract class ProfileApi:
- getProfile(String? ifModifiedSince) -> Future<ConditionalResponse<UserProfileModel>>
- updateProfile(UpdateProfileRequestModel request, String xcsrfToken) -> Future<UserProfileModel>
- logout(String xcsrfToken) -> Future<void>

Implementation ProfileApiImpl:
- Constructor takes DioClient
- For getProfile:
  - Add "if-modified-since" header if provided
  - Handle 304 vs 200 response
- For updateProfile and logout:
  - Use POST/PUT method
  - XCSRF token added via interceptor
- Use endpoints from core/network/endpoints.dart

### File: `lib/features/profile/infrastructure/data_sources/remote/garage_api.dart`

Abstract class GarageApi:
- getVehicles(String? ifModifiedSince) -> Future<ConditionalResponse<List<VehicleModel>>>
- addVehicle(AddVehicleRequestModel request, String xcsrfToken) -> Future<VehicleModel>
- updateVehicle(String vehicleId, AddVehicleRequestModel request, String xcsrfToken) -> Future<VehicleModel>
- deleteVehicle(String vehicleId, String xcsrfToken) -> Future<void>
- setDefaultVehicle(String vehicleId, String xcsrfToken) -> Future<VehicleModel>

Implementation GarageApiImpl:
- Constructor takes DioClient
- Handle conditional fetch for getVehicles
- XCSRF token handled by interceptor for mutations

### File: `lib/features/profile/infrastructure/data_sources/local/profile_local_ds.dart`

Abstract class ProfileLocalDataSource:
- saveProfile(UserProfile, DateTime lastModified) -> Future<void>
- getProfile() -> Future<CachedData<UserProfile>?>
- clearProfile() -> Future<void>
- getLastModified() -> Future<DateTime?>

Implementation ProfileLocalDataSourceImpl:
- Constructor takes Hive box reference and SecureStore
- Store profile in Hive with timestamp
- Handle Hive exceptions gracefully

### File: `lib/features/profile/infrastructure/data_sources/local/garage_local_ds.dart`

Abstract class GarageLocalDataSource:
- saveVehicles(List<Vehicle>, DateTime lastModified) -> Future<void>
- getVehicles() -> Future<CachedData<List<Vehicle>>?>
- addVehicleToCache(Vehicle) -> Future<void>
- updateVehicleInCache(Vehicle) -> Future<void>
- removeVehicleFromCache(String vehicleId) -> Future<void>
- clearCache() -> Future<void>

Implementation GarageLocalDataSourceImpl:
- Constructor takes Hive box reference
- Manage vehicle list with timestamp
- Support incremental updates

### File: `lib/features/profile/infrastructure/repositories/profile_repository_impl.dart`

ProfileRepositoryImpl implements ProfileRepository:
- Constructor: ProfileApi, ProfileLocalDataSource, SecureStore, ConnectivityChecker

getProfile implementation:
1. Get lastModified from local cache
2. Call API with ifModifiedSince header
3. If 304 -> return null (caller uses cache)
4. If 200 -> save to cache with new timestamp, return data
5. If offline -> return cached data if available, else NetworkFailure

updateProfile implementation:
- Call API with XCSRF (handled by interceptor)
- On success: update local cache
- Return updated profile or failure

logout implementation:
- Call API logout endpoint
- Clear all local data:
  - Clear SecureStore (session, tokens)
  - Clear Hive caches (profile, vehicles, bookings, etc.)
- Reset auth state
- Return success or failure

### File: `lib/features/profile/infrastructure/repositories/garage_repository_impl.dart`

GarageRepositoryImpl implements GarageRepository:
- Constructor: GarageApi, GarageLocalDataSource, ConnectivityChecker

getVehicles implementation:
- Same conditional fetch pattern as other modules

addVehicle implementation:
- Call API with XCSRF
- On success: add to local cache
- Return new vehicle

deleteVehicle implementation:
- Call API with XCSRF
- On success: remove from local cache
- Return success

setDefaultVehicle implementation:
- Call API with XCSRF
- On success: update all vehicles in cache (set isDefault appropriately)
- Return updated vehicle

---

## PART 3: HIVE SETUP FOR PROFILE MODULE

### File: `lib/core/storage/hive/adapters/user_profile_adapter.dart`
- TypeAdapter for UserProfile entity
- TypeId: 40
- Handle all fields including nullable ones
- Register in hive_init.dart

### File: `lib/core/storage/hive/adapters/vehicle_adapter.dart`
- TypeAdapter for Vehicle entity
- TypeId: 41
- Handle VehicleType enum
- Handle nullable fields

### Update: `lib/core/storage/hive/boxes.dart`
Add box names:
```dart
static const profileBox = 'profile_box';
static const garageBox = 'garage_box';
```

### Update: `lib/core/storage/hive/keys.dart`
Add keys:
```dart
class ProfileBoxKeys {
  static const userProfile = 'user_profile';
  static const profileTimestamp = 'profile_timestamp';
}

class GarageBoxKeys {
  static const vehicles = 'vehicles';
  static const vehiclesTimestamp = 'vehicles_timestamp';
}
```

### Update: `lib/app/bootstrap/hive_init.dart`
- Register UserProfile, Vehicle adapters
- Open profileBox and garageBox

---

## PART 4: APPLICATION LAYER

### File: `lib/features/profile/application/states/profile_state.dart`
Create using Freezed:
```dart
@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required ProfileDataState dataState,
    required bool isLoggingOut,
  }) = _ProfileState;
  
  factory ProfileState.initial() => ProfileState(
    dataState: ProfileDataState.initial(),
    isLoggingOut: false,
  );
}
```

### File: `lib/features/profile/application/states/profile_data_state.dart`
Create using Freezed:
- initial()
- loading()
- loaded(UserProfile profile, {bool fromCache})
- error(Failure failure)

### File: `lib/features/profile/application/states/edit_profile_state.dart`
Create using Freezed:
- initial(UserProfile profile)
- saving()
- saved(UserProfile profile)
- error(Failure failure, UserProfile currentProfile)

### File: `lib/features/profile/application/states/garage_state.dart`
Create using Freezed:
```dart
@freezed
class GarageState with _$GarageState {
  const factory GarageState({
    required GarageListState listState,
    required String searchQuery,
  }) = _GarageState;
  
  factory GarageState.initial() => GarageState(
    listState: GarageListState.initial(),
    searchQuery: '',
  );
}

extension GarageStateX on GarageState {
  List<Vehicle> get filteredVehicles {
    return listState.maybeMap(
      loaded: (s) {
        if (searchQuery.isEmpty) return s.vehicles;
        final query = searchQuery.toLowerCase();
        return s.vehicles.where((v) =>
          v.make.toLowerCase().contains(query) ||
          v.model.toLowerCase().contains(query) ||
          (v.licensePlate?.toLowerCase().contains(query) ?? false)
        ).toList();
      },
      orElse: () => [],
    );
  }
  
  Vehicle? get defaultVehicle => listState.maybeMap(
    loaded: (s) => s.vehicles.where((v) => v.isDefault).firstOrNull,
    orElse: () => null,
  );
}
```

### File: `lib/features/profile/application/states/garage_list_state.dart`
Create using Freezed:
- initial()
- loading()
- loaded(List<Vehicle> vehicles, {bool fromCache})
- error(Failure failure)

### File: `lib/features/profile/application/states/add_vehicle_state.dart`
Create using Freezed:
- initial()
- saving()
- saved(Vehicle vehicle)
- error(Failure failure)

### File: `lib/features/profile/application/usecases/get_profile_usecase.dart`
- Takes ProfileRepository
- call(DateTime? lastModified) -> Future<Either<Failure, CachedData<UserProfile>?>>

### File: `lib/features/profile/application/usecases/update_profile_usecase.dart`
- Takes ProfileRepository
- call(UpdateProfileRequest request) -> Future<Either<Failure, UserProfile>>
- Non-GET request, XCSRF handled by interceptor

### File: `lib/features/profile/application/usecases/logout_usecase.dart`
- Takes ProfileRepository, AuthRepository (or AuthNotifier ref)
- call() -> Future<Either<Failure, Unit>>
- Non-GET request
- Clear all local data on success
- Reset auth state

### File: `lib/features/profile/application/usecases/get_vehicles_usecase.dart`
- Takes GarageRepository
- call(DateTime? lastModified) -> Future<Either<Failure, CachedData<List<Vehicle>>?>>

### File: `lib/features/profile/application/usecases/add_vehicle_usecase.dart`
- Takes GarageRepository
- call(AddVehicleRequest request) -> Future<Either<Failure, Vehicle>>
- Non-GET request

### File: `lib/features/profile/application/usecases/delete_vehicle_usecase.dart`
- Takes GarageRepository
- call(String vehicleId) -> Future<Either<Failure, Unit>>
- Non-GET request

### File: `lib/features/profile/application/usecases/set_default_vehicle_usecase.dart`
- Takes GarageRepository
- call(String vehicleId) -> Future<Either<Failure, Vehicle>>
- Non-GET request

### File: `lib/features/profile/application/providers/profile_providers.dart`
Define providers:
```dart
// Repository providers
final profileRepositoryProvider = Provider<ProfileRepository>((ref) => ...);
final garageRepositoryProvider = Provider<GarageRepository>((ref) => ...);

// Usecase providers
final getProfileUsecaseProvider = Provider((ref) => ...);
final updateProfileUsecaseProvider = Provider((ref) => ...);
final logoutUsecaseProvider = Provider((ref) => ...);
final getVehiclesUsecaseProvider = Provider((ref) => ...);
final addVehicleUsecaseProvider = Provider((ref) => ...);
final deleteVehicleUsecaseProvider = Provider((ref) => ...);
final setDefaultVehicleUsecaseProvider = Provider((ref) => ...);

// Main profile state provider
final profileStateProvider = StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) => ProfileNotifier(ref),
);

// Edit profile state provider
final editProfileStateProvider = StateNotifierProvider<EditProfileNotifier, EditProfileState>(
  (ref) => EditProfileNotifier(ref),
);

// Garage state provider
final garageStateProvider = StateNotifierProvider<GarageNotifier, GarageState>(
  (ref) => GarageNotifier(ref),
);

// Add vehicle state provider
final addVehicleStateProvider = StateNotifierProvider<AddVehicleNotifier, AddVehicleState>(
  (ref) => AddVehicleNotifier(ref),
);

// Derived providers
final currentUserProfileProvider = Provider((ref) {
  final state = ref.watch(profileStateProvider);
  return state.dataState.maybeMap(
    loaded: (s) => s.profile,
    orElse: () => null,
  );
});

final userVehiclesProvider = Provider((ref) {
  final state = ref.watch(garageStateProvider);
  return state.listState.maybeMap(
    loaded: (s) => s.vehicles,
    orElse: () => <Vehicle>[],
  );
});

final defaultVehicleProvider = Provider((ref) {
  final vehicles = ref.watch(userVehiclesProvider);
  return vehicles.where((v) => v.isDefault).firstOrNull;
});
```

### File: `lib/features/profile/application/providers/profile_notifier.dart`
ProfileNotifier extends StateNotifier<ProfileState>:

Methods:
```dart
Future<void> initialize() async {
  await _fetchProfile();
}

Future<void> _fetchProfile() async {
  // 1. Show cached data first if available
  final cached = await profileLocalDataSource.getProfile();
  if (cached != null) {
    state = state.copyWith(
      dataState: ProfileDataState.loaded(cached.data, fromCache: true),
    );
  } else {
    state = state.copyWith(dataState: ProfileDataState.loading());
  }
  
  // 2. Fetch with conditional request
  final lastModified = cached?.lastModified;
  final result = await getProfileUsecase(lastModified);
  
  result.fold(
    (failure) {
      if (cached == null) {
        state = state.copyWith(dataState: ProfileDataState.error(failure));
      }
    },
    (newData) {
      if (newData != null) {
        state = state.copyWith(
          dataState: ProfileDataState.loaded(newData.data, fromCache: false),
        );
      }
    },
  );
}

Future<void> refresh() async {
  // Force fresh fetch
  final result = await getProfileUsecase(null);
  result.fold(
    (failure) => /* show error toast */,
    (newData) {
      if (newData != null) {
        state = state.copyWith(
          dataState: ProfileDataState.loaded(newData.data, fromCache: false),
        );
      }
    },
  );
}

void updateProfileLocally(UserProfile profile) {
  state = state.copyWith(
    dataState: ProfileDataState.loaded(profile, fromCache: false),
  );
}

Future<void> logout() async {
  state = state.copyWith(isLoggingOut: true);
  
  final result = await logoutUsecase();
  
  result.fold(
    (failure) {
      state = state.copyWith(isLoggingOut: false);
      // Show error - but may want to force logout anyway
    },
    (_) {
      // Auth state will be reset by logout usecase
      // Navigation to login will be handled by auth listener
      state = state.copyWith(isLoggingOut: false);
    },
  );
}
```

### File: `lib/features/profile/application/providers/edit_profile_notifier.dart`
EditProfileNotifier extends StateNotifier<EditProfileState>:

Methods:
```dart
void initialize(UserProfile profile) {
  state = EditProfileState.initial(profile);
}

Future<void> saveProfile(UpdateProfileRequest request) async {
  state = EditProfileState.saving();
  
  final result = await updateProfileUsecase(request);
  
  result.fold(
    (failure) => state = EditProfileState.error(failure, request.toProfile()),
    (updatedProfile) {
      state = EditProfileState.saved(updatedProfile);
      // Update main profile state
      ref.read(profileStateProvider.notifier).updateProfileLocally(updatedProfile);
    },
  );
}
```

### File: `lib/features/profile/application/providers/garage_notifier.dart`
GarageNotifier extends StateNotifier<GarageState>:

Methods:
```dart
Future<void> initialize() async {
  await _fetchVehicles();
}

Future<void> _fetchVehicles() async {
  // Same conditional fetch pattern
  final cached = await garageLocalDataSource.getVehicles();
  if (cached != null) {
    state = state.copyWith(
      listState: GarageListState.loaded(cached.data, fromCache: true),
    );
  } else {
    state = state.copyWith(listState: GarageListState.loading());
  }
  
  final lastModified = cached?.lastModified;
  final result = await getVehiclesUsecase(lastModified);
  
  result.fold(
    (failure) {
      if (cached == null) {
        state = state.copyWith(listState: GarageListState.error(failure));
      }
    },
    (newData) {
      if (newData != null) {
        state = state.copyWith(
          listState: GarageListState.loaded(newData.data, fromCache: false),
        );
      }
    },
  );
}

void updateSearchQuery(String query) {
  state = state.copyWith(searchQuery: query);
}

Future<void> deleteVehicle(String vehicleId) async {
  final result = await deleteVehicleUsecase(vehicleId);
  
  result.fold(
    (failure) => /* show error toast */,
    (_) {
      // Remove from local list
      final currentState = state.listState;
      if (currentState is GarageListStateLoaded) {
        final updatedList = currentState.vehicles
            .where((v) => v.id != vehicleId)
            .toList();
        state = state.copyWith(
          listState: GarageListState.loaded(updatedList, fromCache: false),
        );
      }
    },
  );
}

Future<void> setDefaultVehicle(String vehicleId) async {
  final result = await setDefaultVehicleUsecase(vehicleId);
  
  result.fold(
    (failure) => /* show error toast */,
    (updatedVehicle) {
      // Update all vehicles - only one should be default
      final currentState = state.listState;
      if (currentState is GarageListStateLoaded) {
        final updatedList = currentState.vehicles.map((v) {
          if (v.id == vehicleId) return updatedVehicle;
          if (v.isDefault) return v.copyWith(isDefault: false);
          return v;
        }).toList();
        state = state.copyWith(
          listState: GarageListState.loaded(updatedList, fromCache: false),
        );
      }
    },
  );
}

void addVehicleToList(Vehicle vehicle) {
  final currentState = state.listState;
  if (currentState is GarageListStateLoaded) {
    // If new vehicle is default, update others
    List<Vehicle> updatedList;
    if (vehicle.isDefault) {
      updatedList = currentState.vehicles
          .map((v) => v.isDefault ? v.copyWith(isDefault: false) : v)
          .toList();
    } else {
      updatedList = List.from(currentState.vehicles);
    }
    updatedList.add(vehicle);
    state = state.copyWith(
      listState: GarageListState.loaded(updatedList, fromCache: false),
    );
  }
}
```

### File: `lib/features/profile/application/providers/add_vehicle_notifier.dart`
AddVehicleNotifier extends StateNotifier<AddVehicleState>:

Methods:
```dart
void reset() {
  state = AddVehicleState.initial();
}

Future<void> addVehicle(AddVehicleRequest request) async {
  state = AddVehicleState.saving();
  
  final result = await addVehicleUsecase(request);
  
  result.fold(
    (failure) => state = AddVehicleState.error(failure),
    (vehicle) {
      state = AddVehicleState.saved(vehicle);
      // Add to garage list
      ref.read(garageStateProvider.notifier).addVehicleToList(vehicle);
    },
  );
}
```

---

## PART 5: PRESENTATION LAYER

### Screen 1: Profile Screen (Main)

### File: `lib/features/profile/presentation/screens/profile_screen.dart`
ConsumerStatefulWidget - Main profile screen (tab in bottom nav)

Structure:
- Scaffold with:
  - AppBar:
    - Title: "Profile"
    - No back button (bottom nav tab)
  - Body: SingleChildScrollView
    - ProfileHeaderSection
    - ProfileMenuSection
  - No FAB

Lifecycle:
- initState: Call profileNotifier.initialize()

### File: `lib/features/profile/presentation/components/profile_header_section.dart`
ConsumerWidget

Structure:
- Container with padding
- Row:
  - Left: ProfileAvatar (with edit badge - static)
  - Center (expanded): Column
    - User full name (titleLarge)
    - Phone number (bodyMedium, secondary color)
  - Right: Edit icon button
    - OnTap: Navigate to EditProfileScreen

### File: `lib/features/profile/presentation/components/profile_avatar.dart`
StatelessWidget

Props:
- String? imageUrl
- String initials (fallback)
- double size
- bool showEditBadge
- VoidCallback? onEditTap (static - shows toast for now)

Structure:
- CircleAvatar with:
  - CachedNetworkImage if imageUrl provided
  - Initials text on colored background as fallback
- If showEditBadge: Positioned edit icon at bottom-right
  - Small circular container with camera/edit icon
  - OnTap: Show toast "Profile picture edit coming soon"

### File: `lib/features/profile/presentation/components/profile_menu_section.dart`
StatelessWidget

Structure:
- Column of ProfileMenuItem widgets:
  1. My Garage -> Navigate to GarageScreen
  2. Membership -> Navigate to MembershipScreen (coming soon)
  3. History -> Navigate to BookingsScreen with history tab selected
  4. Settings -> Static, show toast
  5. Help & Support -> Static, show toast
  6. Divider
  7. Logout -> Show logout confirmation dialog

### File: `lib/features/profile/presentation/components/profile_menu_item_tile.dart`
StatelessWidget

Props:
- ProfileMenuItem item
- VoidCallback onTap

Structure:
- ListTile or custom Row:
  - Leading: Icon (from item.icon)
  - Title: Text (from item.title)
  - Trailing: Chevron right icon
  - If isDestructive: Red text/icon color
- InkWell for tap effect
- Divider below (optional)

---

### Screen 2: Edit Profile Screen

### File: `lib/features/profile/presentation/screens/edit_profile_screen.dart`
ConsumerStatefulWidget

Structure:
- Scaffold with:
  - AppBar:
    - Leading: Back button
    - Title: "Personal Info"
  - Body: SingleChildScrollView with padding
    - EditProfileForm
  - Handles keyboard properly

Lifecycle:
- initState: Initialize editProfileNotifier with current profile

### File: `lib/features/profile/presentation/components/edit_profile_form.dart`
ConsumerStatefulWidget

Structure:
- Form with TextFormFields:
  - First Name (required)
  - Last Name (required)
  - Email (optional, email validation)
  - Phone Number (read-only, displayed but not editable)
- Spacing between fields
- SaveChangesButton at bottom

Controllers:
- TextEditingController for each editable field
- Initialize with current profile values

Validation:
- First name: required, min 2 chars
- Last name: required, min 2 chars
- Email: optional, but if provided must be valid email format
- Phone: displayed only, no validation needed

### File: `lib/features/profile/presentation/components/save_changes_button.dart`
ConsumerWidget

Structure:
- Full-width AppButton
- Text: "Save Changes"
- Loading state when saving
- Disabled if no changes made
- OnPressed: Validate form and call editProfileNotifier.saveProfile()

Handle states:
- Saving: Show loading indicator
- Saved: Show success toast, pop screen
- Error: Show error toast, keep on screen

---

### Screen 3: My Garage Screen

### File: `lib/features/profile/presentation/screens/garage_screen.dart`
ConsumerStatefulWidget

Structure:
- Scaffold with:
  - AppBar:
    - Leading: Back button
    - Title: "My Garage"
    - Actions: Add vehicle button (+ icon)
  - Body: Column
    - GarageSearchBar (static placeholder)
    - Expanded: VehicleListSection
  - FAB (optional): Add vehicle button (alternative to app bar action)

Lifecycle:
- initState: Call garageNotifier.initialize()

### File: `lib/features/profile/presentation/components/garage_search_bar.dart`
StatelessWidget - STATIC PLACEHOLDER

Structure:
- Container styled as search bar
- Search icon on left
- Hint text: "Search vehicles..."
- Non-interactive or shows toast on tap: "Search coming soon"

### File: `lib/features/profile/presentation/components/vehicle_list_section.dart`
ConsumerWidget

Structure:
- Watch garageState
- Handle states:
  - Loading: Shimmer placeholder cards
  - Error: Error view with retry
  - Loaded: List of VehicleCard widgets
  - Empty: GarageEmptyState

Pull-to-refresh support

### File: `lib/features/profile/presentation/components/vehicle_card.dart`
StatelessWidget

Props:
- Vehicle vehicle
- VoidCallback onTap
- VoidCallback onSetDefault
- VoidCallback onDelete

Structure:
- Card with:
  - Leading: Vehicle icon or image (car icon based on vehicleType)
  - Title: vehicle.displayName (e.g., "2022 Toyota Camry")
  - Subtitle: License plate (if available) or vehicle type
  - Default badge: Show "Default" chip if isDefault
  - Trailing: PopupMenuButton with options:
    - Set as Default (if not already default)
    - Delete
- OnTap: Show vehicle detail bottom sheet or expand

### File: `lib/features/profile/presentation/components/garage_empty_state.dart`
StatelessWidget

Structure:
- Centered content:
  - Car illustration or icon
  - Title: "No vehicles added"
  - Subtitle: "Add your vehicles to easily book services"
  - CTA Button: "Add Vehicle" -> open add vehicle flow

### File: `lib/features/profile/presentation/dialogs/add_vehicle_bottom_sheet.dart`
ConsumerStatefulWidget

Structure:
- BottomSheet with:
  - Handle bar
  - Title: "Add Vehicle"
  - Form fields:
    - Make (required) - TextField or Dropdown with common makes
    - Model (required) - TextField
    - Year (optional) - Number input or year picker
    - License Plate (optional) - TextField
    - Color (optional) - TextField or color picker
    - Vehicle Type (required) - Dropdown (Hatchback, Sedan, SUV, MUV, Luxury)
    - Set as Default - Checkbox/Switch
  - Add Button

Validation:
- Make: required
- Model: required
- Vehicle Type: required

On success: Close sheet, vehicle added to list

### File: `lib/features/profile/presentation/dialogs/delete_vehicle_dialog.dart`
StatelessWidget

Props:
- Vehicle vehicle
- VoidCallback onConfirm
- VoidCallback onCancel

Structure:
- AlertDialog
- Title: "Delete Vehicle?"
- Content: "Are you sure you want to remove {vehicle.displayName} from your garage?"
- Actions:
  - Cancel button (outlined)
  - Delete button (destructive/red)

---

### Screen 4: Membership Screen (Placeholder)

### File: `lib/features/profile/presentation/screens/membership_screen.dart`
StatelessWidget - STATIC PLACEHOLDER

Structure:
- Scaffold with:
  - AppBar: Back button, "Membership"
  - Body: ComingSoonView

### File: `lib/features/profile/presentation/components/coming_soon_view.dart`
StatelessWidget

Structure:
- Centered content:
  - Illustration or icon (rocket, construction, etc.)
  - Title: "Coming Soon"
  - Subtitle: "We're working on something exciting. Stay tuned!"
- Consistent styling for reuse

---

### Logout Dialog

### File: `lib/features/profile/presentation/dialogs/logout_dialog.dart`
ConsumerWidget

Structure:
- AlertDialog
- Title: "Are you sure?"
- Content: "Do you want to logout?"
- Actions:
  - Cancel button (outlined) -> Close dialog
  - Logout button (destructive) -> Call profileNotifier.logout()

Handle logout state:
- Show loading indicator on logout button while processing
- On success: Dialog closes, auth state resets, navigates to login
- On error: Show error toast, keep dialog open

---

### Shimmer Loaders

### File: `lib/features/profile/presentation/components/shimmer_loaders/profile_header_shimmer.dart`
- Shimmer for avatar + name area

### File: `lib/features/profile/presentation/components/shimmer_loaders/vehicle_card_shimmer.dart`
- Shimmer matching VehicleCard layout

---

## PART 6: NAVIGATION INTEGRATION

### Update: `lib/app/router/routes.dart`
```dart
static const profile = '/profile';
static const editProfile = '/profile/edit';
static const garage = '/profile/garage';
static const membership = '/profile/membership';

// For history navigation
static const bookingsHistory = '/bookings?tab=history';
```

### Update: `lib/app/router/app_router.dart`
Configure routes:
- /profile -> ProfileScreen (part of bottom nav shell)
- /profile/edit -> EditProfileScreen
- /profile/garage -> GarageScreen
- /profile/membership -> MembershipScreen

Navigation helpers:
```dart
void goToEditProfile() => context.push(Routes.editProfile);
void goToGarage() => context.push(Routes.garage);
void goToMembership() => context.push(Routes.membership);
void goToBookingsHistory() {
  // Navigate to bookings tab and select history
  // Option 1: Deep link with query param
  // Option 2: Set tab via provider then navigate
  ref.read(bookingsStateProvider.notifier).selectTab(BookingsTab.history);
  context.go(Routes.bookings);
}
```

### Update bottom navigation shell:
- Add Profile as third tab
- Icon: person_outline / person
- Label: "Profile"

---

## PART 7: NETWORK LAYER UPDATES

### Update: `lib/core/network/endpoints.dart`
Add profile endpoints:
```dart
// Profile endpoints
static String profile() => '/profile';
static String updateProfile() => '/profile';
static String uploadProfileImage() => '/profile/image';
static String logout() => '/auth/logout';

// Garage endpoints
static String vehicles() => '/profile/vehicles';
static String vehicle(String vehicleId) => '/profile/vehicles/$vehicleId';
static String setDefaultVehicle(String vehicleId) => '/profile/vehicles/$vehicleId/default';
```

---

## PART 8: ERROR HANDLING FOR PROFILE MODULE

### Update: `lib/core/error/failure.dart`
Add profile-specific failures:
- ProfileNotFoundFailure
- ProfileUpdateFailure(String message)
- VehicleNotFoundFailure
- VehicleLimitReachedFailure (if there's a max vehicles limit)
- DuplicateVehicleFailure (if license plate must be unique)
- LogoutFailure

Update toUserMessage() for these failures.

---

## PART 9: LOGOUT FLOW INTEGRATION

### Update: `lib/features/auth/application/providers/auth_notifier.dart`
Ensure logout properly:
- Clears SecureStore (session, tokens)
- Clears all Hive boxes
- Resets auth state to unauthenticated
- Router redirects to login

### File: `lib/app/providers/logout_handler.dart` (optional)
Centralized logout handling:
- Clear all local storage
- Reset all state providers
- Navigate to login
- Can be called from profile or on session expiry

---

## REQUIREMENTS CHECKLIST:

1. **Conditional fetch with if-modified-since** - Implemented for profile and vehicles
2. **Hive caching** - Profile data and vehicle list with timestamps
3. **XCSRF token** - Sent via interceptor for updateProfile, addVehicle, deleteVehicle, logout (non-GET)
4. **Bottom navigation integration** - Third tab after Home and My Bookings
5. **Profile header** - Avatar with edit badge (static), name, edit button
6. **Edit profile screen** - First name, last name, email, phone (read-only), save button
7. **My Garage screen** - Search bar (static), vehicle list
8. **Vehicle cards** - Make/model, license plate, default badge, actions menu
9. **Add vehicle** - Bottom sheet form with required fields
10. **Delete vehicle** - Confirmation dialog
11. **Set default vehicle** - Update list state
12. **Membership** - Coming soon placeholder screen
13. **History navigation** - Navigate to bookings with history tab selected
14. **Settings** - Static, toast placeholder
15. **Help & Support** - Static, toast placeholder
16. **Logout** - Confirmation dialog, clear all data, redirect to login
17. **Loading states** - Shimmer placeholders
18. **Error handling** - Retry options, user-friendly messages
19. **Responsive UI** - All dimensions use ScreenUtil

## CACHING STRATEGY SUMMARY:

| Data | Cache in Hive | Conditional Fetch | Reason |
|------|---------------|-------------------|--------|
| User Profile | YES | YES (if-modified-since) | Offline access, rarely changes |
| Vehicles List | YES | YES (if-modified-since) | Offline access, user's personal data |

## STATIC PLACEHOLDERS (No Backend Integration Yet):

1. Profile picture edit - UI present, shows toast
2. Search bar in garage - UI present, non-functional
3. Membership screen - Coming soon view
4. Settings - Toast placeholder
5. Help & Support - Toast placeholder

## LOGOUT FLOW:
User taps Logout 
             ↓ 
Show confirmation dialog 
             ↓ 
User confirms 
             ↓   
Call logout API (with XCSRF) 
             ↓ 
Clear SecureStore (session, tokens) 
             ↓ 
Clear all Hive boxes 
             ↓ 
Reset auth state to unauthenticated 
             ↓ 
Router redirects to login screen

## FOLLOW ESTABLISHED PATTERNS:

- Either<Failure, T> for all repository methods
- Freezed for entities, models, states
- Riverpod for all state management
- Component-based UI (no monolithic screens)
- Abstract + Implementation pattern for testability
- ScreenUtil for all sizing (.w, .h, .sp, .r)
- No hardcoded strings (prepare for l10n)
- Document all public APIs
- Reuse ConditionalResponse pattern from previous modules

Generate complete, production-ready code for all files listed above.

Supplementary Prompts
Prompt: Profile Module Hive Adapters
Generate Hive TypeAdapters for the Profile module entities.

**Adapters needed:**

1. UserProfileAdapter (TypeId: 40)
   - All UserProfile fields
   - Handle nullable email and profileImageUrl
   - Handle DateTime fields

2. VehicleAdapter (TypeId: 41)
   - All Vehicle fields
   - Handle VehicleType enum (reuse from shop module if exists)
   - Handle nullable fields (year, licensePlate, color, imageUrl)

**Requirements:**
- Place in lib/core/storage/hive/adapters/
- Register all in hive_init.dart
- Efficient serialization
- Null-safe handling

Prompt: Complete Bottom Navigation Setup
Update the bottom navigation shell to include all three tabs.

**Tabs:**
1. Home (index 0) - home icon
2. My Bookings (index 1) - calendar icon
3. Profile (index 2) - person icon

**Requirements:**

1. Update `lib/features/shell/presentation/screens/main_shell_screen.dart`:
   - IndexedStack with 3 screens
   - State preservation across tabs

2. Update `lib/core/widgets/app_bottom_nav.dart`:
   - 3 navigation items
   - Active/inactive styling
   - Badge support for bookings count (optional)

3. Update `lib/features/shell/application/providers/shell_providers.dart`:
   - Tab index state
   - Navigation helpers

4. Handle deep links:
   - /bookings?tab=history should navigate to bookings tab with history selected

Generate the updated navigation implementation.

Prompt: Add Vehicle Form Component
Create the Add Vehicle form as a bottom sheet.

**Requirements:**

1. Form fields:
   - Make: TextFormField with common car makes autocomplete/dropdown
   - Model: TextFormField
   - Year: TextFormField with number keyboard (4 digits, 1990-current year)
   - License Plate: TextFormField with uppercase formatting
   - Color: TextFormField or color picker
   - Vehicle Type: DropdownButtonFormField with VehicleType values
   - Set as Default: SwitchListTile

2. Validation:
   - Make: required, 2-50 chars
   - Model: required, 2-50 chars
   - Year: optional, 1990-current year
   - License Plate: optional, alphanumeric pattern
   - Vehicle Type: required

3. UX:
   - DraggableScrollableSheet for bottom sheet
   - Keyboard handling
   - Loading state on submit
   - Success: close sheet, show toast
   - Error: show error, keep sheet open

4. Responsive:
   - All dimensions use ScreenUtil
   - Proper spacing

Generate the complete AddVehicleBottomSheet component.

Prompt: Logout Handler Service
Create a centralized logout handler service.

**Requirements:**

1. Create `lib/app/services/logout_handler.dart`:
   - LogoutHandler class
   - Method: performLogout() -> Future<Either<Failure, Unit>>

2. Logout steps:
   a. Call logout API endpoint (with XCSRF)
   b. Clear SecureStore:
      - accessToken
      - refreshToken
      - sessionId
      - xcsrfToken
      - userId
   c. Clear Hive boxes:
      - homeDataBox
      - shopCacheBox
      - bookingsBox
      - profileBox
      - garageBox
   d. Reset Riverpod providers:
      - authStateProvider
      - profileStateProvider
      - bookingsStateProvider
      - homeStateProvider

3. Handle offline logout:
   - If API call fails due to network, still clear local data
   - User can't use app without session anyway

4. Create provider:
   - logoutHandlerProvider

5. Integration:
   - Call from ProfileNotifier.logout()
   - Also call on session expiry

Generate the complete logout handler with all integrations.

Prompt: Profile Menu Navigation
Implement the profile menu item navigation logic.

**Requirements:**

1. Navigation mapping for ProfileMenuItem:
   - myGarage: push to /profile/garage
   - membership: push to /profile/membership
   - history: 
     - Set bookingsStateProvider.selectedTab to BookingsTab.history
     - Navigate to bookings tab in bottom nav (index 1)
   - settings: show toast "Settings coming soon"
   - helpSupport: show toast "Help & Support coming soon"
   - logout: show LogoutDialog

2. Create `lib/features/profile/presentation/utils/profile_navigation.dart`:
   - handleProfileMenuTap(BuildContext, WidgetRef, ProfileMenuItem)

3. Handle history navigation specifically:
   - Must switch bottom nav tab
   - Must select history sub-tab in bookings
   - Smooth transition without double navigation

Generate the navigation handler with all cases implemented.

