Shop Detail Module Prompt for Car Wash Application

Prompt: Car Wash App - Shop Detail Module (Service Booking Flow)

Implement the complete Shop Detail module for a Car Wash application following the established enterprise architecture. This module covers the entire booking flow from shop selection to checkout.

**Module Overview:**
- Multi-screen booking flow: Shop Detail → Date/Time Selection → Checkout
- User selects services, picks date/time slot, and completes booking
- Uses if-modified-since header pattern for shop details (conditional fetch)
- XCSRF token sent with all non-GET requests (booking creation, etc.)
- Hive caching ONLY for: shop details (benefits from conditional refresh)
- Static placeholders for: vehicle type dropdown, packages tab, accessories tab, promo code, payment method selection

**Booking Flow:**
1. Shop Detail Screen (services selection)
2. Date/Time Selection Screen (calendar + time slots)
3. Checkout Screen (review + payment)

---

## PART 1: DOMAIN LAYER

### File: `lib/features/shop/domain/entities/shop.dart`
Create using Freezed:
- id: String
- name: String
- images: List<String> (image URLs)
- rating: double
- totalReviews: int
- address: String
- city: String
- distanceKm: double (nullable)
- isNearby: bool (computed or from API, e.g., <5km)
- description: String
- openingHours: OpeningHours
- latitude: double
- longitude: double

### File: `lib/features/shop/domain/entities/opening_hours.dart`
Create using Freezed:
- monday: DayHours
- tuesday: DayHours
- wednesday: DayHours
- thursday: DayHours
- friday: DayHours
- saturday: DayHours
- sunday: DayHours
- Helper: String getTodayHours()
- Helper: bool isOpenNow()

### File: `lib/features/shop/domain/entities/day_hours.dart`
Create using Freezed:
- openTime: String (e.g., "09:00")
- closeTime: String (e.g., "18:00")
- isClosed: bool
- Helper: String get formatted (e.g., "9:00 AM - 6:00 PM" or "Closed")

### File: `lib/features/shop/domain/entities/vehicle_type.dart`
Create enum:
```dart
enum VehicleType {
  hatchback,
  sedan,
  suv,
  muv,
  luxury
}

extension VehicleTypeX on VehicleType {
  String get displayName => switch (this) {
    VehicleType.hatchback => 'Hatchback',
    VehicleType.sedan => 'Sedan',
    VehicleType.suv => 'SUV',
    VehicleType.muv => 'MUV',
    VehicleType.luxury => 'Luxury',
  };
}
```

### File: `lib/features/shop/domain/entities/shop_service.dart`
Create using Freezed:
- id: String
- name: String
- description: String (nullable)
- price: double
- duration: int (minutes)
- vehicleType: VehicleType (the type this price applies to)
- imageUrl: String (nullable)
- isPopular: bool

### File: `lib/features/shop/domain/entities/shop_tab.dart`
Create enum:
```dart
enum ShopTab { services, packages, accessories }
```

### File: `lib/features/shop/domain/entities/time_slot.dart`
Create using Freezed:
- id: String
- startTime: String (e.g., "10:00")
- endTime: String (e.g., "11:00")
- isAvailable: bool
- Helper: String get displayTime (e.g., "10:00 AM - 11:00 AM")

### File: `lib/features/shop/domain/entities/booking_date.dart`
Create using Freezed:
- date: DateTime
- slots: List<TimeSlot>
- Helper: bool get hasAvailableSlots

### File: `lib/features/shop/domain/entities/booking_request.dart`
Create using Freezed:
- shopId: String
- selectedServices: List<String> (service IDs)
- date: DateTime
- timeSlotId: String
- vehicleType: VehicleType
- pickupAndDelivery: bool
- promoCode: String (nullable)
- paymentMethod: String (nullable, static for now)

### File: `lib/features/shop/domain/entities/booking_summary.dart`
Create using Freezed:
- shop: Shop
- services: List<ShopService>
- date: DateTime
- timeSlot: TimeSlot
- vehicleType: VehicleType
- pickupAndDelivery: bool
- subtotal: double
- adminFee: double
- discount: double (from promo, static 0 for now)
- totalPrice: double
- Helper: String get formattedDate
- Helper: String get formattedTimeSlot

### File: `lib/features/shop/domain/entities/booking_confirmation.dart`
Create using Freezed:
- bookingId: String
- bookingReference: String
- status: BookingStatus
- createdAt: DateTime

### File: `lib/features/shop/domain/entities/booking_status.dart`
Create enum:
```dart
enum BookingStatus {
  pending,
  confirmed,
  inProgress,
  completed,
  cancelled
}
```

### File: `lib/features/shop/domain/repositories/shop_repository.dart`
Abstract class ShopRepository with methods (all return Future<Either<Failure, T>>):
- getShopDetails(String shopId, DateTime? lastModified) -> CachedData<Shop>?
  - Returns null if 304 Not Modified
- getShopServices(String shopId, VehicleType vehicleType) -> List<ShopService>
- getAvailableSlots(String shopId, DateTime date) -> BookingDate
- createBooking(BookingRequest request) -> BookingConfirmation
  - Requires XCSRF token (non-GET)
- validatePromoCode(String code, String shopId) -> PromoValidation
  - Static/placeholder for now

---

## PART 2: INFRASTRUCTURE LAYER

### File: `lib/features/shop/infrastructure/models/shop_model.dart`
- JSON serializable matching API response
- Fields: id, name, images, rating, total_reviews, address, city, distance_km, description, opening_hours, latitude, longitude
- toDomain() -> Shop
- fromJson/toJson
- Handle nested opening_hours object

### File: `lib/features/shop/infrastructure/models/opening_hours_model.dart`
- JSON serializable
- Nested DayHoursModel for each day
- toDomain() -> OpeningHours

### File: `lib/features/shop/infrastructure/models/day_hours_model.dart`
- JSON serializable
- Fields: open_time, close_time, is_closed
- toDomain() -> DayHours

### File: `lib/features/shop/infrastructure/models/shop_service_model.dart`
- JSON serializable
- Fields: id, name, description, price, duration, vehicle_type, image_url, is_popular
- toDomain() -> ShopService
- Handle vehicle_type string to enum conversion

### File: `lib/features/shop/infrastructure/models/time_slot_model.dart`
- JSON serializable
- Fields: id, start_time, end_time, is_available
- toDomain() -> TimeSlot

### File: `lib/features/shop/infrastructure/models/booking_date_model.dart`
- JSON serializable
- Fields: date, slots (list)
- toDomain() -> BookingDate

### File: `lib/features/shop/infrastructure/models/booking_request_model.dart`
- JSON serializable for API request
- Fields: shop_id, service_ids, date, time_slot_id, vehicle_type, pickup_delivery, promo_code
- fromDomain(BookingRequest) factory
- toJson()

### File: `lib/features/shop/infrastructure/models/booking_confirmation_model.dart`
- JSON serializable
- Fields: booking_id, booking_reference, status, created_at
- toDomain() -> BookingConfirmation

### File: `lib/features/shop/infrastructure/data_sources/remote/shop_api.dart`

Abstract class ShopApi:
- getShopDetails(String shopId, String? ifModifiedSince) -> Future<ConditionalResponse<ShopModel>>
- getShopServices(String shopId, String vehicleType) -> Future<List<ShopServiceModel>>
- getAvailableSlots(String shopId, String date) -> Future<BookingDateModel>
- createBooking(BookingRequestModel request, String xcsrfToken) -> Future<BookingConfirmationModel>

Implementation ShopApiImpl:
- Constructor takes DioClient
- For getShopDetails:
  - Add "if-modified-since" header if provided
  - Handle 304 vs 200 response
- For createBooking:
  - Use POST method
  - XCSRF token added via interceptor (already configured)
- Use endpoints from core/network/endpoints.dart

### File: `lib/features/shop/infrastructure/data_sources/local/shop_local_ds.dart`

Abstract class ShopLocalDataSource:
- saveShopDetails(Shop, DateTime lastModified) -> Future<void>
- getShopDetails(String shopId) -> Future<CachedData<Shop>?>
- clearShopCache(String shopId) -> Future<void>
- getLastModified(String shopId) -> Future<DateTime?>

Implementation ShopLocalDataSourceImpl:
- Constructor takes Hive box reference
- Cache shop details with timestamp
- Key format: "shop_{shopId}"
- Handle Hive exceptions gracefully

Note: Services and slots are NOT cached (dynamic pricing, real-time availability)

### File: `lib/features/shop/infrastructure/repositories/shop_repository_impl.dart`

ShopRepositoryImpl implements ShopRepository:
- Constructor: ShopApi, ShopLocalDataSource, ConnectivityChecker

getShopDetails implementation:
1. Get lastModified from local cache for this shopId
2. Call API with ifModifiedSince header
3. If 304 -> return null (caller uses cache)
4. If 200 -> save to cache with new timestamp, return data
5. If offline -> return cached data if available, else NetworkFailure

getShopServices implementation:
- Always fetch fresh (no caching - prices may change)
- Map vehicle type enum to API string

getAvailableSlots implementation:
- Always fetch fresh (real-time availability)
- Format date for API

createBooking implementation:
- Transform domain request to model
- XCSRF handled by interceptor
- Return confirmation or failure

---

## PART 3: HIVE SETUP FOR SHOP MODULE

### File: `lib/core/storage/hive/adapters/shop_adapter.dart`
- TypeAdapter for Shop entity
- TypeId: 20
- Handle all fields including nested OpeningHours
- Register in hive_init.dart

### File: `lib/core/storage/hive/adapters/opening_hours_adapter.dart`
- TypeAdapter for OpeningHours
- TypeId: 21
- Handle nested DayHours for each day

### File: `lib/core/storage/hive/adapters/day_hours_adapter.dart`
- TypeAdapter for DayHours
- TypeId: 22

### Update: `lib/core/storage/hive/boxes.dart`
Add box name:
```dart
static const shopCacheBox = 'shop_cache_box';
```

### Update: `lib/core/storage/hive/keys.dart`
Add keys:
```dart
class ShopBoxKeys {
  static String shopDetails(String shopId) => 'shop_$shopId';
  static String shopTimestamp(String shopId) => 'shop_timestamp_$shopId';
}
```

### Update: `lib/app/bootstrap/hive_init.dart`
- Register Shop, OpeningHours, DayHours adapters
- Open shopCacheBox

---

## PART 4: APPLICATION LAYER

### File: `lib/features/shop/application/states/shop_detail_state.dart`
Create using Freezed:
```dart
@freezed
class ShopDetailState with _$ShopDetailState {
  const factory ShopDetailState({
    required ShopState shopState,
    required ServicesState servicesState,
    required VehicleType selectedVehicleType,
    required Set<String> selectedServiceIds,
    required ShopTab selectedTab,
  }) = _ShopDetailState;
  
  factory ShopDetailState.initial() => ShopDetailState(
    shopState: ShopState.initial(),
    servicesState: ServicesState.initial(),
    selectedVehicleType: VehicleType.sedan, // default
    selectedServiceIds: {},
    selectedTab: ShopTab.services,
  );
}

// Helpers as extension
extension ShopDetailStateX on ShopDetailState {
  bool get canProceed => selectedServiceIds.isNotEmpty;
  List<ShopService> get selectedServices => ...; // filter from servicesState
  double get selectedServicesTotal => ...; // sum prices
}
```

### File: `lib/features/shop/application/states/shop_state.dart`
Create using Freezed:
- initial()
- loading()
- loaded(Shop shop, {bool fromCache})
- error(Failure failure)

### File: `lib/features/shop/application/states/services_state.dart`
Create using Freezed:
- initial()
- loading()
- loaded(List<ShopService> services)
- error(Failure failure)

### File: `lib/features/shop/application/states/booking_date_state.dart`
Create using Freezed:
- initial()
- loading()
- loaded(List<BookingDate> availableDates, DateTime selectedDate, TimeSlot? selectedSlot)
- error(Failure failure)

### File: `lib/features/shop/application/states/checkout_state.dart`
Create using Freezed:
- initial()
- loading()
- ready(BookingSummary summary)
- processing() // during payment/booking creation
- success(BookingConfirmation confirmation)
- error(Failure failure)

### File: `lib/features/shop/application/states/booking_flow_state.dart`
Create using Freezed - holds entire booking flow data:
```dart
@freezed
class BookingFlowState with _$BookingFlowState {
  const factory BookingFlowState({
    required Shop? shop,
    required List<ShopService> selectedServices,
    required VehicleType vehicleType,
    required DateTime? selectedDate,
    required TimeSlot? selectedSlot,
    required bool pickupAndDelivery,
    required String? promoCode,
    required String? paymentMethod,
  }) = _BookingFlowState;
  
  factory BookingFlowState.initial() => BookingFlowState(
    shop: null,
    selectedServices: [],
    vehicleType: VehicleType.sedan,
    selectedDate: null,
    selectedSlot: null,
    pickupAndDelivery: false,
    promoCode: null,
    paymentMethod: null,
  );
}

extension BookingFlowStateX on BookingFlowState {
  bool get canProceedToDateTime => shop != null && selectedServices.isNotEmpty;
  bool get canProceedToCheckout => selectedDate != null && selectedSlot != null;
  double get subtotal => selectedServices.fold(0, (sum, s) => sum + s.price);
  double get adminFee => 25.0; // static for now
  double get total => subtotal + adminFee;
}
```

### File: `lib/features/shop/application/usecases/get_shop_details_usecase.dart`
- Takes ShopRepository
- call(String shopId, DateTime? lastModified) -> Future<Either<Failure, CachedData<Shop>?>>

### File: `lib/features/shop/application/usecases/get_shop_services_usecase.dart`
- Takes ShopRepository
- call(String shopId, VehicleType vehicleType) -> Future<Either<Failure, List<ShopService>>>

### File: `lib/features/shop/application/usecases/get_available_slots_usecase.dart`
- Takes ShopRepository
- call(String shopId, DateTime date) -> Future<Either<Failure, BookingDate>>

### File: `lib/features/shop/application/usecases/create_booking_usecase.dart`
- Takes ShopRepository
- call(BookingRequest request) -> Future<Either<Failure, BookingConfirmation>>
- Non-GET request, XCSRF handled by interceptor

### File: `lib/features/shop/application/providers/shop_providers.dart`
Define providers:
```dart
// Repository provider
final shopRepositoryProvider = Provider<ShopRepository>((ref) => ...);

// Usecase providers
final getShopDetailsUsecaseProvider = Provider((ref) => ...);
final getShopServicesUsecaseProvider = Provider((ref) => ...);
final getAvailableSlotsUsecaseProvider = Provider((ref) => ...);
final createBookingUsecaseProvider = Provider((ref) => ...);

// Shop detail state provider (scoped to shopId)
final shopDetailStateProvider = StateNotifierProvider.family<ShopDetailNotifier, ShopDetailState, String>(
  (ref, shopId) => ShopDetailNotifier(ref, shopId),
);

// Booking date state provider
final bookingDateStateProvider = StateNotifierProvider<BookingDateNotifier, BookingDateState>(
  (ref) => BookingDateNotifier(ref),
);

// Booking flow state (persists across screens)
final bookingFlowStateProvider = StateNotifierProvider<BookingFlowNotifier, BookingFlowState>(
  (ref) => BookingFlowNotifier(),
);

// Checkout state provider
final checkoutStateProvider = StateNotifierProvider<CheckoutNotifier, CheckoutState>(
  (ref) => CheckoutNotifier(ref),
);

// Current shop ID being viewed
final currentShopIdProvider = StateProvider<String?>((ref) => null);

// Derived providers
final selectedServicesProvider = Provider((ref) {
  final shopId = ref.watch(currentShopIdProvider);
  if (shopId == null) return <ShopService>[];
  final state = ref.watch(shopDetailStateProvider(shopId));
  // Return selected services
});
```

### File: `lib/features/shop/application/providers/shop_detail_notifier.dart`
ShopDetailNotifier extends StateNotifier<ShopDetailState>:

Constructor:
- Ref for accessing usecases and local data source
- String shopId

Methods:
```dart
Future<void> initialize() async {
  await _fetchShopDetails();
  await _fetchServices();
}

Future<void> _fetchShopDetails() async {
  // 1. Show cached data first if available
  final cached = await shopLocalDataSource.getShopDetails(shopId);
  if (cached != null) {
    state = state.copyWith(
      shopState: ShopState.loaded(cached.data, fromCache: true),
    );
  } else {
    state = state.copyWith(shopState: ShopState.loading());
  }
  
  // 2. Fetch with conditional request
  final lastModified = cached?.lastModified;
  final result = await getShopDetailsUsecase(shopId, lastModified);
  
  result.fold(
    (failure) {
      if (cached == null) {
        state = state.copyWith(shopState: ShopState.error(failure));
      }
      // Keep showing cache on error if available
    },
    (newData) {
      if (newData != null) {
        state = state.copyWith(
          shopState: ShopState.loaded(newData.data, fromCache: false),
        );
        // Update booking flow state with shop
        ref.read(bookingFlowStateProvider.notifier).setShop(newData.data);
      }
    },
  );
}

Future<void> _fetchServices() async {
  state = state.copyWith(servicesState: ServicesState.loading());
  final result = await getShopServicesUsecase(shopId, state.selectedVehicleType);
  result.fold(
    (failure) => state = state.copyWith(servicesState: ServicesState.error(failure)),
    (services) => state = state.copyWith(servicesState: ServicesState.loaded(services)),
  );
}

void selectVehicleType(VehicleType type) {
  state = state.copyWith(
    selectedVehicleType: type,
    selectedServiceIds: {}, // Clear selections when vehicle changes
  );
  ref.read(bookingFlowStateProvider.notifier).setVehicleType(type);
  _fetchServices(); // Refetch services for new vehicle type
}

void toggleServiceSelection(String serviceId) {
  final current = Set<String>.from(state.selectedServiceIds);
  if (current.contains(serviceId)) {
    current.remove(serviceId);
  } else {
    current.add(serviceId);
  }
  state = state.copyWith(selectedServiceIds: current);
}

void selectTab(ShopTab tab) {
  state = state.copyWith(selectedTab: tab);
}

void proceedToDateSelection() {
  // Update booking flow with selected services
  final selectedServices = state.servicesState.maybeMap(
    loaded: (s) => s.services.where((svc) => state.selectedServiceIds.contains(svc.id)).toList(),
    orElse: () => <ShopService>[],
  );
  ref.read(bookingFlowStateProvider.notifier).setSelectedServices(selectedServices);
  // Navigation handled by UI
}
```

### File: `lib/features/shop/application/providers/booking_date_notifier.dart`
BookingDateNotifier extends StateNotifier<BookingDateState>:

Methods:
```dart
Future<void> initialize(String shopId) async {
  _shopId = shopId;
  // Load initial month's available dates
  await fetchSlotsForDate(DateTime.now());
}

Future<void> fetchSlotsForDate(DateTime date) async {
  state = BookingDateState.loading();
  final result = await getAvailableSlotsUsecase(_shopId, date);
  result.fold(
    (failure) => state = BookingDateState.error(failure),
    (bookingDate) => state = BookingDateState.loaded(
      availableDates: [bookingDate],
      selectedDate: date,
      selectedSlot: null,
    ),
  );
}

void selectDate(DateTime date) {
  fetchSlotsForDate(date);
}

void selectTimeSlot(TimeSlot slot) {
  state = state.maybeMap(
    loaded: (s) => s.copyWith(selectedSlot: slot),
    orElse: () => state,
  );
  ref.read(bookingFlowStateProvider.notifier).setDateAndSlot(
    state.maybeMap(loaded: (s) => s.selectedDate, orElse: () => DateTime.now()),
    slot,
  );
}

void togglePickupDelivery(bool value) {
  ref.read(bookingFlowStateProvider.notifier).setPickupAndDelivery(value);
}
```

### File: `lib/features/shop/application/providers/booking_flow_notifier.dart`
BookingFlowNotifier extends StateNotifier<BookingFlowState>:

Methods:
```dart
void setShop(Shop shop) {
  state = state.copyWith(shop: shop);
}

void setVehicleType(VehicleType type) {
  state = state.copyWith(vehicleType: type);
}

void setSelectedServices(List<ShopService> services) {
  state = state.copyWith(selectedServices: services);
}

void setDateAndSlot(DateTime date, TimeSlot slot) {
  state = state.copyWith(selectedDate: date, selectedSlot: slot);
}

void setPickupAndDelivery(bool value) {
  state = state.copyWith(pickupAndDelivery: value);
}

void setPromoCode(String? code) {
  state = state.copyWith(promoCode: code);
}

void setPaymentMethod(String? method) {
  state = state.copyWith(paymentMethod: method);
}

void reset() {
  state = BookingFlowState.initial();
}

BookingRequest toBookingRequest() {
  return BookingRequest(
    shopId: state.shop!.id,
    selectedServices: state.selectedServices.map((s) => s.id).toList(),
    date: state.selectedDate!,
    timeSlotId: state.selectedSlot!.id,
    vehicleType: state.vehicleType,
    pickupAndDelivery: state.pickupAndDelivery,
    promoCode: state.promoCode,
    paymentMethod: state.paymentMethod,
  );
}

BookingSummary toBookingSummary() {
  return BookingSummary(
    shop: state.shop!,
    services: state.selectedServices,
    date: state.selectedDate!,
    timeSlot: state.selectedSlot!,
    vehicleType: state.vehicleType,
    pickupAndDelivery: state.pickupAndDelivery,
    subtotal: state.subtotal,
    adminFee: state.adminFee,
    discount: 0, // static for now
    totalPrice: state.total,
  );
}
```

### File: `lib/features/shop/application/providers/checkout_notifier.dart`
CheckoutNotifier extends StateNotifier<CheckoutState>:

Methods:
```dart
void initialize() {
  final bookingFlow = ref.read(bookingFlowStateProvider);
  final summary = ref.read(bookingFlowStateProvider.notifier).toBookingSummary();
  state = CheckoutState.ready(summary);
}

Future<void> processBooking() async {
  state = CheckoutState.processing();
  
  final request = ref.read(bookingFlowStateProvider.notifier).toBookingRequest();
  final result = await createBookingUsecase(request);
  
  result.fold(
    (failure) => state = CheckoutState.error(failure),
    (confirmation) {
      state = CheckoutState.success(confirmation);
      // Clear booking flow
      ref.read(bookingFlowStateProvider.notifier).reset();
    },
  );
}

void applyPromoCode(String code) {
  // Static placeholder - just store the code
  ref.read(bookingFlowStateProvider.notifier).setPromoCode(code);
  // In real implementation: validate and update summary
}

void selectPaymentMethod(String method) {
  ref.read(bookingFlowStateProvider.notifier).setPaymentMethod(method);
}
```

---

## PART 5: PRESENTATION LAYER

### Screen 1: Shop Detail Screen

### File: `lib/features/shop/presentation/screens/shop_detail_screen.dart`
ConsumerStatefulWidget

Props (via route arguments):
- shopId: String
- shopName: String (for immediate app bar display)

Structure:
- Scaffold with:
  - AppBar: back button, shop name (from props initially, then from state)
  - Body: SingleChildScrollView or CustomScrollView
    - ShopImageCarousel
    - ShopInfoSection
    - ShopDescriptionSection
    - OpeningHoursSection
    - VehicleTypeDropdown (static)
    - ShopTabBar (Services | Packages | Accessories)
    - Tab content based on selection
  - FloatingActionButton: "Next" button (enabled when services selected)

Lifecycle:
- initState: Initialize shop detail notifier

### File: `lib/features/shop/presentation/components/shop_image_carousel.dart`
StatefulWidget

Props:
- List<String> imageUrls

Structure:
- PageView.builder for swipeable images
- CachedNetworkImage for each image
- Page indicator dots at bottom
- Placeholder shimmer while loading
- Fallback image on error
- Use ScreenUtil for height (e.g., 250.h)

### File: `lib/features/shop/presentation/components/shop_info_section.dart`
ConsumerWidget

Display:
- Shop name (large title)
- Row: Rating stars + rating value + "(X reviews)"
- Location text with icon
- If isNearby: show "(Nearest Centre)" badge

### File: `lib/features/shop/presentation/components/shop_description_section.dart`
StatelessWidget

Props:
- String description

Structure:
- Section with "About" or no header
- Description text (expandable if long - "Read more")

### File: `lib/features/shop/presentation/components/opening_hours_section.dart`
StatelessWidget

Props:
- OpeningHours hours

Structure:
- "Opening Hours" header
- Show today's hours prominently
- Expandable to show full week (optional)
- Green/red indicator for open/closed status

### File: `lib/features/shop/presentation/components/vehicle_type_dropdown.dart`
ConsumerWidget - STATIC PLACEHOLDER

Structure:
- Dropdown with vehicle types: Hatchback, Sedan, SUV, MUV, Luxury
- Default selected: Sedan
- On change: Call notifier.selectVehicleType()
- Static for now (just UI, actual filtering to be implemented later if needed)

### File: `lib/features/shop/presentation/components/shop_tab_bar.dart`
ConsumerWidget

Structure:
- Container with 3 tabs: Services | Packages | Accessories
- Active tab highlighted
- OnTap: Call notifier.selectTab()

### File: `lib/features/shop/presentation/components/services_list_section.dart`
ConsumerWidget

Structure:
- Watch servicesState from shop detail provider
- Loading: shimmer placeholders
- Error: retry option
- Loaded: List of ServiceListItem widgets
- Add bottom padding for floating button

### File: `lib/features/shop/presentation/components/service_list_item.dart`
ConsumerWidget

Props:
- ShopService service
- bool isSelected
- VoidCallback onToggle

Structure:
- Card/ListTile layout:
  - Service image (left, optional)
  - Service name
  - Service description (truncated)
  - Duration: "X mins"
  - Price: "₹XXX"
  - Checkbox/selection indicator (right)
- Highlight if selected
- OnTap: toggle selection

### File: `lib/features/shop/presentation/components/packages_placeholder.dart`
StatelessWidget

Structure:
- Centered text: "Packages coming soon"
- Or styled empty state

### File: `lib/features/shop/presentation/components/accessories_placeholder.dart`
StatelessWidget

Structure:
- Centered text: "Accessories coming soon"
- Or styled empty state

### File: `lib/features/shop/presentation/components/next_floating_button.dart`
ConsumerWidget

Props:
- VoidCallback onPressed
- bool isEnabled

Structure:
- Floating action button style (extended)
- Text: "Next"
- Disabled styling when no services selected
- Show selected count: "Next (3 services)"

---

### Screen 2: Date/Time Selection Screen

### File: `lib/features/shop/presentation/screens/date_time_selection_screen.dart`
ConsumerStatefulWidget

Structure:
- Scaffold with:
  - AppBar: back button, "Select Date & Time"
  - Body: Column
    - CalendarSection
    - TimeSlotSection (horizontal scrollable)
    - PickupDeliveryToggle
    - CancellationPolicySection (static)
    - Spacer
    - NextButton (bottom)

Lifecycle:
- initState: Initialize booking date notifier with shopId

### File: `lib/features/shop/presentation/components/calendar_section.dart`
ConsumerStatefulWidget

Structure:
- Calendar widget (use table_calendar or custom)
- Highlight selected date
- Disable past dates
- Disable dates with no available slots (if API provides this)
- On date select: Call notifier.selectDate()

Note: Use table_calendar package or build simple custom calendar

### File: `lib/features/shop/presentation/components/time_slots_section.dart`
ConsumerWidget

Structure:
- Section header: "Available Time Slots"
- Horizontal scrollable list of TimeSlotChip widgets
- Loading: shimmer chips
- Empty: "No slots available for this date"
- Show slots from bookingDateState

### File: `lib/features/shop/presentation/components/time_slot_chip.dart`
StatelessWidget

Props:
- TimeSlot slot
- bool isSelected
- bool isAvailable
- VoidCallback onTap

Structure:
- Chip/container with time range text
- Selected: primary color background
- Unavailable: greyed out, non-interactive
- Available: outline style

### File: `lib/features/shop/presentation/components/pickup_delivery_toggle.dart`
ConsumerWidget

Structure:
- Row: Label "Pickup & Delivery" + Switch/Toggle
- Optional: Price indicator "+₹XX"
- OnChanged: Call notifier.togglePickupDelivery()

### File: `lib/features/shop/presentation/components/cancellation_policy_section.dart`
StatelessWidget - STATIC PLACEHOLDER

Structure:
- Container with info icon
- "Cancellation Policy" header
- Static text: "Free cancellation up to 24 hours before the appointment. Cancellations within 24 hours may incur a fee."
- Styled as info card

### File: `lib/features/shop/presentation/components/date_time_next_button.dart`
ConsumerWidget

Structure:
- Full-width button at bottom
- Text: "Next"
- Enabled only when date AND time slot selected
- OnPressed: Navigate to checkout

---

### Screen 3: Checkout Screen

### File: `lib/features/shop/presentation/screens/checkout_screen.dart`
ConsumerStatefulWidget

Structure:
- Scaffold with:
  - AppBar: back button, "Checkout"
  - Body: SingleChildScrollView
    - ShopSummaryCard
    - BookingInfoSection
    - PriceDetailsSection
    - PromoCodeSection (static)
    - PaymentMethodSection (static)
    - Spacer
  - BottomBar: ConfirmBookingButton

Lifecycle:
- initState: Initialize checkout notifier

### File: `lib/features/shop/presentation/components/shop_summary_card.dart`
ConsumerWidget

Structure:
- Card with:
  - Row:
    - Shop image thumbnail (left)
    - Column (right):
      - Shop name
      - Location
      - Rating row

### File: `lib/features/shop/presentation/components/booking_info_section.dart`
ConsumerWidget

Structure:
- "Your Booking" header
- Info rows:
  - Date: formatted date
  - Slot: time slot display
  - Service Type: vehicle type
  - Services: comma-separated service names or count
  - Phone: user's phone (from auth state)
- Optional: Pickup & Delivery badge if enabled

### File: `lib/features/shop/presentation/components/price_details_section.dart`
ConsumerWidget

Structure:
- "Price Details" header
- Rows:
  - Service total: ₹XXX
  - Admin fee: ₹XX
  - Discount: -₹XX (if applicable, static 0 for now)
  - Divider
  - Total: ₹XXX (bold, larger)

### File: `lib/features/shop/presentation/components/promo_code_section.dart`
StatefulWidget - STATIC PLACEHOLDER

Structure:
- "Have a promo code?" header or inline
- TextField with "Apply" button
- On apply: Show toast "Promo code feature coming soon"
- Or just accept input without validation

### File: `lib/features/shop/presentation/components/payment_method_section.dart`
StatelessWidget - STATIC PLACEHOLDER

Structure:
- "Payment Method" header
- ListTile/Button: "Select Payment Method" with chevron
- OnTap: Show PaymentMethodBottomSheet

### File: `lib/features/shop/presentation/dialogs/payment_method_bottom_sheet.dart`
StatelessWidget - STATIC PLACEHOLDER

Structure:
- BottomSheet with:
  - Header: "Select Payment Method"
  - Options (all static, just UI):
    - Credit/Debit Card
    - UPI
    - Net Banking
    - Cash on Service
  - OnSelect: Close sheet, show toast "Payment integration coming soon"

### File: `lib/features/shop/presentation/components/confirm_booking_button.dart`
ConsumerWidget

Structure:
- Full-width button
- Text: "Confirm Booking" or "Pay ₹XXX"
- Loading indicator when processing
- OnPressed:
  - If processing: disabled
  - Else: Call checkoutNotifier.processBooking()
- Handle success: Navigate to confirmation screen or show success dialog

### File: `lib/features/shop/presentation/dialogs/booking_success_dialog.dart`
StatelessWidget

Props:
- BookingConfirmation confirmation

Structure:
- Success icon/animation
- "Booking Confirmed!" header
- Booking reference number
- Summary of date/time
- "View Booking" button -> navigate to bookings
- "Back to Home" button -> navigate to home

---

## PART 6: ROUTING UPDATES

### Update: `lib/app/router/routes.dart`
```dart
static const shopDetail = '/shop/:shopId';
static const dateTimeSelection = '/booking/date-time';
static const checkout = '/booking/checkout';
static const bookingSuccess = '/booking/success';

// Path builders
static String shopDetailPath(String shopId) => '/shop/$shopId';
```

### Update: `lib/app/router/app_router.dart`
Configure routes:
- /shop/:shopId -> ShopDetailScreen (parse shopId from path)
- /booking/date-time -> DateTimeSelectionScreen
- /booking/checkout -> CheckoutScreen
- /booking/success -> BookingSuccessScreen or dialog

Navigation flow:
- Home -> Shop Detail: goToShopDetail(shopId, shopName)
- Shop Detail -> Date/Time: goToDateTimeSelection()
- Date/Time -> Checkout: goToCheckout()
- Checkout -> Success -> Home

---

## PART 7: NETWORK LAYER UPDATES

### Update: `lib/core/network/endpoints.dart`
Add shop endpoints:
```dart
// Shop endpoints
static String shopDetails(String shopId) => '/shops/$shopId';
static String shopServices(String shopId) => '/shops/$shopId/services';
static String availableSlots(String shopId) => '/shops/$shopId/slots';
static String createBooking() => '/bookings';
static String validatePromo() => '/promo/validate';
```

---

## PART 8: ERROR HANDLING FOR SHOP MODULE

### Update: `lib/core/error/failure.dart`
Add shop-specific failures:
- ShopNotFoundFailure
- NoSlotsAvailableFailure
- BookingFailure(String message)
- SlotNoLongerAvailableFailure
- InvalidPromoCodeFailure

Update toUserMessage() for these failures.

---

## PART 9: DEPENDENCIES

### Add to pubspec.yaml:
```yaml
dependencies:
  table_calendar: ^3.1.1  # For calendar widget
  cached_network_image: ^3.3.1  # For image caching
  smooth_page_indicator: ^1.1.0  # For carousel indicators
```

---

## REQUIREMENTS CHECKLIST:

1. **Conditional fetch with if-modified-since** - Implemented for shop details only
2. **Hive caching** - ONLY for shop details (with timestamps)
3. **XCSRF token** - Sent via interceptor for createBooking (non-GET)
4. **Multi-screen booking flow** - Shop Detail → Date/Time → Checkout
5. **Shop image carousel** - Horizontal swipeable with indicators
6. **Shop info display** - Name, rating, reviews, location, nearby badge
7. **Opening hours** - Today's hours with open/closed status
8. **Vehicle type dropdown** - Static placeholder, UI only
9. **Services tab** - List of services with selection
10. **Packages/Accessories tabs** - Static placeholders
11. **Service selection** - Multi-select with visual feedback
12. **Calendar date picker** - Disable past dates
13. **Time slots** - Horizontal swipeable, availability status
14. **Pickup & Delivery toggle** - Boolean switch
15. **Cancellation policy** - Static text display
16. **Checkout summary** - Shop card, booking info, price breakdown
17. **Promo code** - Static input field placeholder
18. **Payment method** - Static bottom sheet placeholder
19. **Booking confirmation** - Success state with reference
20. **Loading states** - Shimmer placeholders throughout
21. **Error handling** - Retry options, user-friendly messages
22. **Responsive UI** - All dimensions use ScreenUtil

## CACHING STRATEGY SUMMARY:

| Data | Cache in Hive | Conditional Fetch | Reason |
|------|---------------|-------------------|--------|
| Shop Details | YES | YES (if-modified-since) | Static info, offline viewing useful |
| Shop Services | NO | NO | Prices may vary, always fresh |
| Time Slots | NO | NO | Real-time availability critical |
| Booking | NO | NO | Transaction data, no caching |

## STATIC PLACEHOLDERS (No Backend Integration Yet):

1. Vehicle type dropdown - UI functional, filtering may not work
2. Packages tab - Empty state
3. Accessories tab - Empty state
4. Promo code field - Input accepted, no validation
5. Payment method selection - UI only, no payment processing

## FOLLOW ESTABLISHED PATTERNS:

- Either<Failure, T> for all repository methods
- Freezed for entities, models, states
- Riverpod for all state management
- Component-based UI (no monolithic screens)
- Abstract + Implementation pattern for testability
- ScreenUtil for all sizing (.w, .h, .sp, .r)
- No hardcoded strings (prepare for l10n)
- Document all public APIs
- BookingFlowState persists across screens for data continuity

Generate complete, production-ready code for all files listed above.
Supplementary Prompts
Prompt: Shop Module Hive Adapters
Generate Hive TypeAdapters for the Shop module entities.

**Adapters needed:**

1. ShopAdapter (TypeId: 20)
   - All Shop fields including nested OpeningHours

2. OpeningHoursAdapter (TypeId: 21)
   - All 7 days as DayHours objects

3. DayHoursAdapter (TypeId: 22)
   - Fields: openTime, closeTime, isClosed

**Requirements:**
- Place in lib/core/storage/hive/adapters/
- Register all in hive_init.dart
- Handle nested objects properly
- Efficient serialization

Prompt: Calendar Widget Integration
Implement the calendar section for date selection in the booking flow.

**Requirements:**

1. Use table_calendar package

2. Configuration:
   - First day: Today
   - Last day: 30 days from today
   - Disable past dates
   - Highlight selected date
   - Custom styling matching app theme

3. Integration:
   - On date tap: Call bookingDateNotifier.selectDate()
   - Show loading indicator while fetching slots
   - Visual indicator for dates with no availability (optional)

4. Responsive:
   - Use ScreenUtil for all dimensions
   - Adapt to different screen sizes

Generate the complete CalendarSection component.

Prompt: Image Carousel Component
Create a reusable image carousel component for the shop detail screen.

**Requirements:**

1. Features:
   - Horizontal swipeable images
   - Page indicator dots
   - Auto-advance (optional, configurable)
   - Pinch to zoom (optional)
   - Full-screen view on tap (optional)

2. Image handling:
   - Use cached_network_image
   - Shimmer placeholder while loading
   - Error fallback image
   - Memory-efficient (dispose properly)

3. Responsive:
   - Height: 250.h
   - Full width
   - Indicator dots sized with ScreenUtil

Generate the ShopImageCarousel component with all requirements.

Prompt: Booking Flow State Management
Review and optimize the booking flow state management.

**Current flow:**
1. ShopDetailState - manages shop info and service selection
2. BookingDateState - manages date/time selection
3. BookingFlowState - persists data across screens
4. CheckoutState - manages checkout and booking creation

**Requirements:**

1. Ensure data consistency across screens
2. Handle back navigation (preserve selections)
3. Handle app backgrounding (persist to local storage if needed)
4. Clear state after successful booking
5. Handle session expiry mid-booking gracefully

Review the current state design and suggest any improvements for:
- Memory efficiency
- State restoration
- Error recovery
- Edge cases

Provide updated provider/notifier code if changes needed.

Prompt: Price Calculation Logic
Implement price calculation utilities for the booking flow.

**Requirements:**

1. Create `lib/features/shop/domain/services/price_calculator.dart`:
   - calculateSubtotal(List<ShopService> services) -> double
   - calculateAdminFee(double subtotal) -> double (static ₹25 for now, or percentage)
   - calculateDiscount(String? promoCode, double subtotal) -> double (static 0 for now)
   - calculateTotal(subtotal, adminFee, discount) -> double

2. Handle edge cases:
   - Empty services list
   - Null values
   - Rounding (2 decimal places)

3. Future-proof for:
   - Dynamic admin fee calculation
   - Promo code validation
   - Tax calculation

Generate the price calculator with tests.

