My Bookings Module Prompt for Car Wash Application

Prompt: Car Wash App - My Bookings Module
Implement the complete My Bookings module for a Car Wash application following the established enterprise architecture. This module displays the user's booking history with tabs for upcoming and past bookings.

**Module Overview:**
- Second tab in bottom navigation (after Home)
- Displays user's bookings in two categories: Booked (upcoming) and History (completed/past)
- Each booking displayed as a card with shop info, date, and service details
- Uses if-modified-since header pattern for conditional data fetching
- XCSRF token sent with all non-GET requests
- Hive caching for bookings list (benefits from offline access and conditional refresh)
- Static placeholders for: search bar, settings menu (3 dots)

---

## PART 1: DOMAIN LAYER

### File: `lib/features/bookings/domain/entities/booking.dart`
Create using Freezed:
- id: String
- bookingReference: String
- shopId: String
- shopName: String
- shopImageUrl: String
- shopAddress: String
- shopCity: String
- bookingDate: DateTime
- timeSlot: BookingTimeSlot
- services: List<BookedService>
- status: BookingStatus
- totalAmount: double
- vehicleType: VehicleType (from shop module)
- pickupAndDelivery: bool
- createdAt: DateTime
- completedAt: DateTime (nullable)
- cancelledAt: DateTime (nullable)
- Helper: bool get isUpcoming => status == BookingStatus.confirmed || status == BookingStatus.pending
- Helper: bool get isPast => status == BookingStatus.completed || status == BookingStatus.cancelled
- Helper: String get primaryServiceName => services.first.name (or formatted list)

### File: `lib/features/bookings/domain/entities/booking_time_slot.dart`
Create using Freezed:
- startTime: String
- endTime: String
- Helper: String get displayTime (e.g., "10:00 AM - 11:00 AM")

### File: `lib/features/bookings/domain/entities/booked_service.dart`
Create using Freezed:
- id: String
- name: String
- price: double
- duration: int (minutes)

### File: `lib/features/bookings/domain/entities/booking_status.dart`
Create enum (if not already defined in shop module, or reuse):
```dart
enum BookingStatus {
  pending,
  confirmed,
  inProgress,
  completed,
  cancelled,
  noShow
}

extension BookingStatusX on BookingStatus {
  String get displayName => switch (this) {
    BookingStatus.pending => 'Pending',
    BookingStatus.confirmed => 'Confirmed',
    BookingStatus.inProgress => 'In Progress',
    BookingStatus.completed => 'Completed',
    BookingStatus.cancelled => 'Cancelled',
    BookingStatus.noShow => 'No Show',
  };
  
  bool get isUpcoming => this == BookingStatus.pending || 
                          this == BookingStatus.confirmed;
  
  bool get isPast => this == BookingStatus.completed || 
                     this == BookingStatus.cancelled || 
                     this == BookingStatus.noShow;
}
```

### File: `lib/features/bookings/domain/entities/bookings_tab.dart`
Create enum:
```dart
enum BookingsTab { booked, history }
```

### File: `lib/features/bookings/domain/entities/bookings_list.dart`
Create using Freezed - wrapper for categorized bookings:
- upcomingBookings: List<Booking>
- pastBookings: List<Booking>
- Helper: int get upcomingCount
- Helper: int get historyCount
- Helper: bool get isEmpty => upcomingBookings.isEmpty && pastBookings.isEmpty

### File: `lib/features/bookings/domain/repositories/bookings_repository.dart`
Abstract class BookingsRepository with methods (all return Future<Either<Failure, T>>):
- getBookings(DateTime? lastModified) -> CachedData<BookingsList>?
  - Returns null if 304 Not Modified (use cache)
  - Returns all bookings, categorized by status
- getBookingDetails(String bookingId) -> Booking
  - Fetch single booking with full details
- cancelBooking(String bookingId) -> Booking
  - Requires XCSRF token (non-GET)
  - Returns updated booking with cancelled status
- rescheduleBooking(String bookingId, DateTime newDate, String newSlotId) -> Booking
  - Requires XCSRF token (non-GET)
  - For future implementation

---

## PART 2: INFRASTRUCTURE LAYER

### File: `lib/features/bookings/infrastructure/models/booking_model.dart`
- JSON serializable matching API response
- Fields: id, booking_reference, shop_id, shop_name, shop_image_url, shop_address, shop_city, booking_date, time_slot, services, status, total_amount, vehicle_type, pickup_delivery, created_at, completed_at, cancelled_at
- toDomain() -> Booking
- fromJson/toJson
- Handle nested objects (time_slot, services)
- Handle date parsing

### File: `lib/features/bookings/infrastructure/models/booking_time_slot_model.dart`
- JSON serializable
- Fields: start_time, end_time
- toDomain() -> BookingTimeSlot

### File: `lib/features/bookings/infrastructure/models/booked_service_model.dart`
- JSON serializable
- Fields: id, name, price, duration
- toDomain() -> BookedService

### File: `lib/features/bookings/infrastructure/models/bookings_list_model.dart`
- JSON serializable
- May receive flat list from API and categorize locally
- Or API may return categorized: { upcoming: [...], history: [...] }
- toDomain() -> BookingsList
- Handle both API response structures

### File: `lib/features/bookings/infrastructure/data_sources/remote/bookings_api.dart`

Abstract class BookingsApi:
- getBookings(String? ifModifiedSince) -> Future<ConditionalResponse<BookingsListModel>>
- getBookingDetails(String bookingId) -> Future<BookingModel>
- cancelBooking(String bookingId, String xcsrfToken) -> Future<BookingModel>

Implementation BookingsApiImpl:
- Constructor takes DioClient
- For getBookings:
  - Add "if-modified-since" header if provided
  - Handle 304 vs 200 response
  - Categorize bookings by status if API returns flat list
- For cancelBooking:
  - Use POST/DELETE method as per API design
  - XCSRF token added via interceptor
- Use endpoints from core/network/endpoints.dart

### File: `lib/features/bookings/infrastructure/data_sources/local/bookings_local_ds.dart`

Abstract class BookingsLocalDataSource:
- saveBookings(BookingsList, DateTime lastModified) -> Future<void>
- getBookings() -> Future<CachedData<BookingsList>?>
- updateBooking(Booking) -> Future<void>
  - Update single booking in cached list (after cancel, etc.)
- clearCache() -> Future<void>
- getLastModified() -> Future<DateTime?>

Implementation BookingsLocalDataSourceImpl:
- Constructor takes Hive box reference
- Store bookings list with timestamp
- Handle individual booking updates within cached list
- Handle Hive exceptions gracefully

### File: `lib/features/bookings/infrastructure/repositories/bookings_repository_impl.dart`

BookingsRepositoryImpl implements BookingsRepository:
- Constructor: BookingsApi, BookingsLocalDataSource, ConnectivityChecker

getBookings implementation:
1. Get lastModified from local cache
2. Call API with ifModifiedSince header
3. If 304 -> return null (caller uses cache)
4. If 200 -> save to cache with new timestamp, return data
5. If offline -> return cached data if available, else NetworkFailure

getBookingDetails implementation:
- Fetch fresh from API
- Optionally update in local cache

cancelBooking implementation:
- Call API with XCSRF (handled by interceptor)
- On success: update local cache with cancelled booking
- Return updated booking or failure

---

## PART 3: HIVE SETUP FOR BOOKINGS MODULE

### File: `lib/core/storage/hive/adapters/booking_adapter.dart`
- TypeAdapter for Booking entity
- TypeId: 30
- Handle all fields including nested objects
- Register in hive_init.dart

### File: `lib/core/storage/hive/adapters/booking_time_slot_adapter.dart`
- TypeAdapter for BookingTimeSlot
- TypeId: 31

### File: `lib/core/storage/hive/adapters/booked_service_adapter.dart`
- TypeAdapter for BookedService
- TypeId: 32

### File: `lib/core/storage/hive/adapters/booking_status_adapter.dart`
- TypeAdapter for BookingStatus enum
- TypeId: 33

### Update: `lib/core/storage/hive/boxes.dart`
Add box name:
```dart
static const bookingsBox = 'bookings_box';
```

### Update: `lib/core/storage/hive/keys.dart`
Add keys:
```dart
class BookingsBoxKeys {
  static const bookingsList = 'bookings_list';
  static const bookingsTimestamp = 'bookings_timestamp';
  static const upcomingBookings = 'upcoming_bookings';
  static const pastBookings = 'past_bookings';
}
```

### Update: `lib/app/bootstrap/hive_init.dart`
- Register Booking, BookingTimeSlot, BookedService, BookingStatus adapters
- Open bookingsBox

---

## PART 4: APPLICATION LAYER

### File: `lib/features/bookings/application/states/bookings_state.dart`
Create using Freezed:
```dart
@freezed
class BookingsState with _$BookingsState {
  const factory BookingsState({
    required BookingsListState listState,
    required BookingsTab selectedTab,
    required String searchQuery, // for future search implementation
  }) = _BookingsState;
  
  factory BookingsState.initial() => BookingsState(
    listState: BookingsListState.initial(),
    selectedTab: BookingsTab.booked,
    searchQuery: '',
  );
}

extension BookingsStateX on BookingsState {
  List<Booking> get currentTabBookings => selectedTab == BookingsTab.booked
      ? listState.maybeMap(
          loaded: (s) => s.bookings.upcomingBookings,
          orElse: () => [],
        )
      : listState.maybeMap(
          loaded: (s) => s.bookings.pastBookings,
          orElse: () => [],
        );
  
  int get currentTabCount => currentTabBookings.length;
  
  bool get isCurrentTabEmpty => currentTabBookings.isEmpty;
}
```

### File: `lib/features/bookings/application/states/bookings_list_state.dart`
Create using Freezed:
- initial()
- loading()
- loaded(BookingsList bookings, {bool fromCache})
- error(Failure failure)
- refreshing(BookingsList currentBookings) // for pull-to-refresh while showing data

### File: `lib/features/bookings/application/states/booking_detail_state.dart`
Create using Freezed:
- initial()
- loading()
- loaded(Booking booking)
- cancelling()
- cancelled(Booking booking)
- error(Failure failure)

### File: `lib/features/bookings/application/usecases/get_bookings_usecase.dart`
- Takes BookingsRepository
- call(DateTime? lastModified) -> Future<Either<Failure, CachedData<BookingsList>?>>

### File: `lib/features/bookings/application/usecases/get_booking_details_usecase.dart`
- Takes BookingsRepository
- call(String bookingId) -> Future<Either<Failure, Booking>>

### File: `lib/features/bookings/application/usecases/cancel_booking_usecase.dart`
- Takes BookingsRepository
- call(String bookingId) -> Future<Either<Failure, Booking>>
- Non-GET request, XCSRF handled by interceptor

### File: `lib/features/bookings/application/providers/bookings_providers.dart`
Define providers:
```dart
// Repository provider
final bookingsRepositoryProvider = Provider<BookingsRepository>((ref) => ...);

// Usecase providers
final getBookingsUsecaseProvider = Provider((ref) => ...);
final getBookingDetailsUsecaseProvider = Provider((ref) => ...);
final cancelBookingUsecaseProvider = Provider((ref) => ...);

// Main bookings state provider
final bookingsStateProvider = StateNotifierProvider<BookingsNotifier, BookingsState>(
  (ref) => BookingsNotifier(ref),
);

// Booking detail state provider (family by bookingId)
final bookingDetailStateProvider = StateNotifierProvider.family<BookingDetailNotifier, BookingDetailState, String>(
  (ref, bookingId) => BookingDetailNotifier(ref, bookingId),
);

// Derived providers for convenience
final upcomingBookingsProvider = Provider((ref) {
  final state = ref.watch(bookingsStateProvider);
  return state.listState.maybeMap(
    loaded: (s) => s.bookings.upcomingBookings,
    orElse: () => <Booking>[],
  );
});

final pastBookingsProvider = Provider((ref) {
  final state = ref.watch(bookingsStateProvider);
  return state.listState.maybeMap(
    loaded: (s) => s.bookings.pastBookings,
    orElse: () => <Booking>[],
  );
});

final selectedBookingsTabProvider = Provider((ref) {
  return ref.watch(bookingsStateProvider).selectedTab;
});

// Counts for badges
final upcomingBookingsCountProvider = Provider((ref) {
  return ref.watch(upcomingBookingsProvider).length;
});
```

### File: `lib/features/bookings/application/providers/bookings_notifier.dart`
BookingsNotifier extends StateNotifier<BookingsState>:

Constructor:
- Ref for accessing usecases and local data source

Methods:
```dart
Future<void> initialize() async {
  await _fetchBookings();
}

Future<void> _fetchBookings() async {
  // 1. Show cached data first if available
  final cached = await bookingsLocalDataSource.getBookings();
  if (cached != null) {
    state = state.copyWith(
      listState: BookingsListState.loaded(cached.data, fromCache: true),
    );
  } else {
    state = state.copyWith(listState: BookingsListState.loading());
  }
  
  // 2. Fetch with conditional request
  final lastModified = cached?.lastModified;
  final result = await getBookingsUsecase(lastModified);
  
  result.fold(
    (failure) {
      if (cached == null) {
        state = state.copyWith(listState: BookingsListState.error(failure));
      }
      // Keep showing cache on error if available
    },
    (newData) {
      if (newData != null) {
        // 200 OK - new data
        state = state.copyWith(
          listState: BookingsListState.loaded(newData.data, fromCache: false),
        );
      }
      // null means 304 - keep current state (already showing cache)
    },
  );
}

Future<void> refresh() async {
  // Show refreshing state while keeping current data visible
  final currentBookings = state.listState.maybeMap(
    loaded: (s) => s.bookings,
    orElse: () => null,
  );
  
  if (currentBookings != null) {
    state = state.copyWith(
      listState: BookingsListState.refreshing(currentBookings),
    );
  }
  
  // Force fresh fetch (ignore cache timestamp)
  final result = await getBookingsUsecase(null);
  
  result.fold(
    (failure) {
      // Revert to previous loaded state on error
      if (currentBookings != null) {
        state = state.copyWith(
          listState: BookingsListState.loaded(currentBookings, fromCache: true),
        );
      } else {
        state = state.copyWith(listState: BookingsListState.error(failure));
      }
      // Show error toast/snackbar
    },
    (newData) {
      if (newData != null) {
        state = state.copyWith(
          listState: BookingsListState.loaded(newData.data, fromCache: false),
        );
      }
    },
  );
}

void selectTab(BookingsTab tab) {
  state = state.copyWith(selectedTab: tab);
}

void updateSearchQuery(String query) {
  state = state.copyWith(searchQuery: query);
  // Search filtering to be implemented later
}

void updateBookingInList(Booking updatedBooking) {
  // Called after cancellation to update local list
  final currentState = state.listState;
  if (currentState is BookingsListStateLoaded) {
    final updatedUpcoming = currentState.bookings.upcomingBookings
        .map((b) => b.id == updatedBooking.id ? updatedBooking : b)
        .where((b) => b.isUpcoming) // Remove if no longer upcoming
        .toList();
    
    final updatedPast = [
      ...currentState.bookings.pastBookings
          .map((b) => b.id == updatedBooking.id ? updatedBooking : b),
      if (updatedBooking.isPast && 
          !currentState.bookings.pastBookings.any((b) => b.id == updatedBooking.id))
        updatedBooking, // Add to past if newly cancelled
    ];
    
    final updatedBookings = BookingsList(
      upcomingBookings: updatedUpcoming,
      pastBookings: updatedPast,
    );
    
    state = state.copyWith(
      listState: BookingsListState.loaded(updatedBookings, fromCache: false),
    );
    
    // Update local cache
    bookingsLocalDataSource.saveBookings(updatedBookings, DateTime.now());
  }
}
```

### File: `lib/features/bookings/application/providers/booking_detail_notifier.dart`
BookingDetailNotifier extends StateNotifier<BookingDetailState>:

Constructor:
- Ref for accessing usecases
- String bookingId

Methods:
```dart
Future<void> initialize() async {
  state = BookingDetailState.loading();
  
  final result = await getBookingDetailsUsecase(bookingId);
  
  result.fold(
    (failure) => state = BookingDetailState.error(failure),
    (booking) => state = BookingDetailState.loaded(booking),
  );
}

Future<void> cancelBooking() async {
  final currentBooking = state.maybeMap(
    loaded: (s) => s.booking,
    orElse: () => null,
  );
  
  if (currentBooking == null) return;
  
  state = BookingDetailState.cancelling();
  
  final result = await cancelBookingUsecase(bookingId);
  
  result.fold(
    (failure) {
      state = BookingDetailState.error(failure);
      // Could revert to loaded state with error message
    },
    (cancelledBooking) {
      state = BookingDetailState.cancelled(cancelledBooking);
      // Update main bookings list
      ref.read(bookingsStateProvider.notifier).updateBookingInList(cancelledBooking);
    },
  );
}
```

---

## PART 5: PRESENTATION LAYER

### File: `lib/features/bookings/presentation/screens/bookings_screen.dart`
ConsumerStatefulWidget - Main bookings screen (tab in bottom nav)

Structure:
- Scaffold with:
  - AppBar:
    - Leading: Back button (or none if in bottom nav shell)
    - Title: "My Bookings"
    - Actions: Settings icon (3 dots) - static placeholder
  - Body: Column
    - SearchBarSection (static placeholder)
    - BookingsTabBar (Booked | History)
    - Expanded: BookingsListSection
  - No FAB

Lifecycle:
- initState: Call bookingsNotifier.initialize()
- Support pull-to-refresh

### File: `lib/features/bookings/presentation/screens/booking_detail_screen.dart`
ConsumerStatefulWidget - Individual booking details (for future expansion)

Props (via route arguments):
- bookingId: String
- booking: Booking (optional, for immediate display)

Structure:
- Scaffold with:
  - AppBar: Back button, "Booking Details"
  - Body: BookingDetailContent
  - BottomBar: Action buttons (Cancel, Reschedule - if applicable)

Note: This screen may be optional for MVP - can show details in bottom sheet instead

### File: `lib/features/bookings/presentation/components/bookings_app_bar.dart`
StatelessWidget

Structure:
- Title: "My Bookings"
- Back button (if not in shell navigation)
- Actions: IconButton with 3 dots (more_vert icon)
  - OnTap: Show toast "Settings coming soon" or show empty menu

### File: `lib/features/bookings/presentation/components/bookings_search_bar.dart`
StatelessWidget - STATIC PLACEHOLDER

Structure:
- Container styled as search bar
- Search icon on left
- Hint text: "Search bookings..."
- Non-interactive or shows toast on tap: "Search coming soon"
- Same styling as home screen search bar for consistency

### File: `lib/features/bookings/presentation/components/bookings_tab_bar.dart`
ConsumerWidget

Structure:
- Container with background
- Row of 2 tab buttons:
  - "Booked" (with count badge optional)
  - "History" (with count badge optional)
- Active tab highlighted with different background/text color
- Animated indicator sliding between tabs
- OnTap: Call bookingsNotifier.selectTab(tab)

Styling:
- Match the toggle bar style from other modules
- Use ScreenUtil for all dimensions

### File: `lib/features/bookings/presentation/components/bookings_list_section.dart`
ConsumerWidget

Structure:
- Watch bookingsState
- RefreshIndicator for pull-to-refresh
- Handle states:
  - Loading: Show shimmer placeholder cards
  - Error: Show error view with retry
  - Loaded/Refreshing: Show list of BookingCard widgets
  - Empty: Show appropriate empty state per tab

Content based on selectedTab:
- Booked tab: Show upcomingBookings
- History tab: Show pastBookings

### File: `lib/features/bookings/presentation/components/booking_card.dart`
StatelessWidget

Props:
- Booking booking
- VoidCallback onTap

Structure:
- Card with padding:
  - Row:
    - Left: Shop image (square/rounded, cached network image)
    - Right: Column (expanded)
      - Shop name (bold, primary text)
      - Location: "{shopAddress}, {shopCity}" (secondary text, with location icon)
      - Date: Formatted booking date (e.g., "Mon, 15 Jan 2025") with calendar icon
      - Service: Primary service name or "X services" (with service icon)
  - Optional: Status badge in corner (for non-confirmed statuses)
- OnTap: Navigate to detail or show bottom sheet

Layout details:
- Image: ~80.w x 80.h with rounded corners
- Text spacing using ScreenUtil
- Icons: small, muted color, inline with text
- Card elevation and border radius from theme

### File: `lib/features/bookings/presentation/components/booking_status_badge.dart`
StatelessWidget

Props:
- BookingStatus status

Structure:
- Small chip/badge
- Color based on status:
  - pending: orange/yellow
  - confirmed: green
  - inProgress: blue
  - completed: grey/green
  - cancelled: red
  - noShow: dark grey
- Text: status.displayName

### File: `lib/features/bookings/presentation/components/bookings_empty_state.dart`
StatelessWidget

Props:
- BookingsTab tab
- VoidCallback? onAction

Structure:
- Centered content:
  - Illustration or icon
  - Title based on tab:
    - Booked: "No upcoming bookings"
    - History: "No booking history"
  - Subtitle:
    - Booked: "Book a car wash service to get started"
    - History: "Your completed bookings will appear here"
  - Action button (optional):
    - Booked tab: "Browse Services" -> navigate to home
    - History tab: none

### File: `lib/features/bookings/presentation/components/bookings_settings_menu.dart`
StatelessWidget - STATIC PLACEHOLDER

Props:
- VoidCallback onClose

Structure:
- PopupMenuButton or BottomSheet
- Options (all static, show toast on tap):
  - "Filter by date"
  - "Sort by"
  - "Export bookings"
- All show: "Coming soon" toast

### File: `lib/features/bookings/presentation/dialogs/booking_detail_bottom_sheet.dart`
ConsumerWidget

Props:
- Booking booking

Structure:
- DraggableScrollableSheet or standard BottomSheet
- Content:
  - Shop image (larger)
  - Shop name
  - Location with map icon (tap to open maps - future)
  - Divider
  - Booking details:
    - Reference: booking.bookingReference
    - Date: formatted date
    - Time: time slot
    - Services: list of service names with prices
    - Vehicle type
    - Pickup & Delivery status
  - Divider
  - Price breakdown:
    - Subtotal
    - Admin fee
    - Total
  - Divider
  - Status badge
  - Action buttons (if applicable):
    - Cancel booking (if upcoming and cancellable)
    - Rebook (if past - future feature)
    - Contact shop (future feature)

### File: `lib/features/bookings/presentation/dialogs/cancel_booking_dialog.dart`
StatelessWidget

Props:
- Booking booking
- VoidCallback onConfirm
- VoidCallback onCancel

Structure:
- AlertDialog or custom dialog
- Title: "Cancel Booking?"
- Content: 
  - "Are you sure you want to cancel your booking at {shopName}?"
  - Booking date/time summary
  - Cancellation policy reminder (if applicable)
- Actions:
  - "Keep Booking" button (outlined)
  - "Cancel Booking" button (destructive/red)

### File: `lib/features/bookings/presentation/components/shimmer_loaders/booking_card_shimmer.dart`
StatelessWidget

Structure:
- Card matching BookingCard dimensions
- Shimmer placeholders for:
  - Image area (square)
  - Title line
  - Location line (shorter)
  - Date line (shorter)
  - Service line (medium)
- Use shimmer effect matching other modules

### File: `lib/features/bookings/presentation/components/shimmer_loaders/bookings_list_shimmer.dart`
StatelessWidget

Structure:
- Column or ListView of 3-5 BookingCardShimmer widgets
- Proper spacing between cards

---

## PART 6: NAVIGATION INTEGRATION

### Update: `lib/app/router/routes.dart`
```dart
static const bookings = '/bookings';
static const bookingDetail = '/bookings/:bookingId';

// Path builder
static String bookingDetailPath(String bookingId) => '/bookings/$bookingId';
```

### Update: `lib/app/router/app_router.dart`
Configure routes:
- /bookings -> BookingsScreen (part of bottom nav shell)
- /bookings/:bookingId -> BookingDetailScreen (optional, or use bottom sheet)

### Update: `lib/core/widgets/bottom_nav_bar.dart` (or create if doesn't exist)
- Add bookings as second tab
- Icon: calendar or booking icon
- Label: "My Bookings"
- Badge: upcoming bookings count (optional)

### File: `lib/app/router/bottom_nav_shell.dart` (if using shell route)
- Configure bottom navigation with:
  - Home (index 0)
  - My Bookings (index 1)
  - [Future tabs]
- Preserve state across tabs

---

## PART 7: NETWORK LAYER UPDATES

### Update: `lib/core/network/endpoints.dart`
Add bookings endpoints:
```dart
// Bookings endpoints
static String bookings() => '/bookings';
static String bookingDetails(String bookingId) => '/bookings/$bookingId';
static String cancelBooking(String bookingId) => '/bookings/$bookingId/cancel';
static String rescheduleBooking(String bookingId) => '/bookings/$bookingId/reschedule';
```

---

## PART 8: ERROR HANDLING FOR BOOKINGS MODULE

### Update: `lib/core/error/failure.dart`
Add bookings-specific failures:
- BookingNotFoundFailure
- BookingAlreadyCancelledFailure
- CancellationNotAllowedFailure(String reason) // e.g., too close to appointment
- BookingFetchFailure

Update toUserMessage() for these failures with user-friendly messages.

---

## PART 9: BOTTOM NAVIGATION SETUP

### File: `lib/core/widgets/app_bottom_nav.dart`
Create bottom navigation bar widget:

Structure:
- BottomNavigationBar or custom implementation
- Items:
  - Home: home icon, "Home"
  - My Bookings: calendar/bookmark icon, "My Bookings"
  - [Placeholder for future tabs: Profile, etc.]
- Track current index
- OnTap: Navigate to corresponding route

Integration:
- Use in app shell/scaffold
- Persist across tab switches (maintain state)

### File: `lib/features/shell/presentation/screens/main_shell_screen.dart`
ConsumerWidget - Main shell with bottom navigation

Structure:
- Scaffold
- Body: IndexedStack or Navigator for each tab
  - Home screen
  - Bookings screen
  - [Future screens]
- BottomNavigationBar: AppBottomNav

State:
- Current tab index provider

---

## REQUIREMENTS CHECKLIST:

1. **Conditional fetch with if-modified-since** - Implemented for bookings list
2. **Hive caching** - Bookings list with timestamp for offline access
3. **XCSRF token** - Sent via interceptor for cancelBooking (non-GET)
4. **Bottom navigation integration** - Second tab after Home
5. **Tab bar** - Booked (upcoming) and History (past) tabs
6. **Booking cards** - Shop image, name, location, date, service
7. **Pull-to-refresh** - Refresh bookings list
8. **Loading states** - Shimmer placeholders for cards
9. **Empty states** - Different messages for each tab
10. **Search bar** - Static placeholder
11. **Settings menu** - Static placeholder (3 dots)
12. **Booking detail** - Bottom sheet or separate screen
13. **Cancel booking** - Confirmation dialog, update list
14. **Status badges** - Visual indicator for booking status
15. **Error handling** - Retry options, user-friendly messages
16. **Responsive UI** - All dimensions use ScreenUtil

## CACHING STRATEGY SUMMARY:

| Data | Cache in Hive | Conditional Fetch | Reason |
|------|---------------|-------------------|--------|
| Bookings List | YES | YES (if-modified-since) | Offline access, doesn't change frequently |
| Booking Detail | NO | NO | Small data, fetch fresh for accuracy |

## STATIC PLACEHOLDERS (No Backend Integration Yet):

1. Search bar - UI present, no filtering
2. Settings menu (3 dots) - Shows menu, options non-functional
3. Reschedule booking - Future feature

## BOOKING STATUS FLOW:
pending -> confirmed -> inProgress -> completed | v cancelled
noShow (set by backend if customer doesn't arrive)
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
Prompt: Bookings Module Hive Adapters
Generate Hive TypeAdapters for the Bookings module entities.

**Adapters needed:**

1. BookingAdapter (TypeId: 30)
   - All Booking fields including nested objects
   - Handle nullable DateTime fields (completedAt, cancelledAt)

2. BookingTimeSlotAdapter (TypeId: 31)
   - Fields: startTime, endTime

3. BookedServiceAdapter (TypeId: 32)
   - Fields: id, name, price, duration

4. BookingStatusAdapter (TypeId: 33)
   - Enum adapter for BookingStatus

5. BookingsListAdapter (TypeId: 34)
   - Fields: upcomingBookings (List<Booking>), pastBookings (List<Booking>)

**Requirements:**
- Place in lib/core/storage/hive/adapters/
- Register all in hive_init.dart
- Handle List<Booking> serialization efficiently
- Handle nested objects properly
- Null-safe for optional fields

Prompt: Bottom Navigation Shell Setup
Implement the bottom navigation shell for the Car Wash app.

**Requirements:**

1. Create `lib/features/shell/presentation/screens/main_shell_screen.dart`:
   - Scaffold with body and bottom navigation
   - IndexedStack to preserve tab states
   - Tabs: Home, My Bookings, [Profile placeholder]

2. Create `lib/core/widgets/app_bottom_nav.dart`:
   - Custom or standard BottomNavigationBar
   - Items with icons and labels
   - Active/inactive styling from theme
   - Optional badge support (for notification counts)

3. Create `lib/features/shell/application/providers/shell_providers.dart`:
   - currentTabIndexProvider: StateProvider<int>
   - Navigation helper methods

4. Update `lib/app/router/app_router.dart`:
   - ShellRoute for bottom navigation
   - Nested routes for each tab
   - Preserve state on tab switch

**Icons:**
- Home: Icons.home_outlined / Icons.home
- My Bookings: Icons.calendar_today_outlined / Icons.calendar_today
- Profile: Icons.person_outline / Icons.person

Generate complete implementation with smooth tab switching and state preservation.

Prompt: Booking Card Component
Create the BookingCard component with detailed styling.

**Requirements:**

1. Layout:
   - Card with 12.r border radius
   - 16.w horizontal padding, 12.h vertical padding
   - Row layout: Image | Content

2. Image section:
   - 80.w x 80.h square
   - 8.r border radius
   - CachedNetworkImage with placeholder
   - Error fallback to placeholder icon

3. Content section:
   - Shop name: titleMedium, maxLines 1, ellipsis
   - Location row: location icon (16.sp) + text (bodySmall), maxLines 1
   - Date row: calendar icon (16.sp) + formatted date (bodySmall)
   - Service row: service icon (16.sp) + service name(s) (bodySmall)
   - 4.h spacing between rows

4. Status badge (optional):
   - Positioned top-right of card
   - Only show for non-confirmed statuses

5. Interactions:
   - Ripple effect on tap
   - onTap callback

6. Responsiveness:
   - All dimensions use ScreenUtil
   - Text scales properly

Generate the complete BookingCard widget with all styling details.

Prompt: Booking Detail Bottom Sheet
Create the booking detail bottom sheet with full information display.

**Requirements:**

1. Structure:
   - DraggableScrollableSheet with minChildSize: 0.5, maxChildSize: 0.9
   - Handle bar at top
   - Scrollable content

2. Content sections:
   a. Header:
      - Shop image (full width, 150.h)
      - Shop name overlay or below image
      - Status badge

   b. Booking Info:
      - Reference number (copyable)
      - Date and time
      - Vehicle type
      - Pickup & Delivery status

   c. Services:
      - List of booked services
      - Individual prices
      - Duration per service

   d. Price Summary:
      - Subtotal
      - Admin fee
      - Discount (if any)
      - Total (highlighted)

   e. Actions (conditional):
      - Cancel button (if upcoming and within cancellation window)
      - Contact shop button (placeholder)
      - Navigate to shop button (placeholder)

3. Cancellation flow:
   - Show confirmation dialog
   - Handle loading state
   - Show success/error feedback
   - Close sheet and update list on success

Generate the complete bottom sheet with all sections.

Prompt: Bookings Empty States
Create empty state components for the bookings tabs.

**Requirements:**

1. `lib/features/bookings/presentation/components/upcoming_empty_state.dart`:
   - Illustration: Calendar with checkmark or car wash icon
   - Title: "No upcoming bookings"
   - Subtitle: "Book a car wash service to see your appointments here"
   - CTA Button: "Browse Services" -> navigate to home

2. `lib/features/bookings/presentation/components/history_empty_state.dart`:
   - Illustration: Clock or history icon
   - Title: "No booking history yet"
   - Subtitle: "Your completed and past bookings will appear here"
   - No CTA button needed

3. Shared styling:
   - Centered vertically (with offset for visual balance)
   - Illustration: 120.w x 120.h
   - Title: headlineSmall, center aligned
   - Subtitle: bodyMedium, secondary color, center aligned
   - Button: Primary style, min width 200.w
   - Spacing: 16.h between elements

Generate both empty state components with consistent styling.


