Authentication Feature Prompt for Car Wash Application

Prompt: Car Wash App - Authentication Feature (Session-Based)

Implement the complete authentication feature for a Car Wash application using session-based authentication with XCSRF token protection.

**Authentication Flow Overview:**
- User authenticates via mobile number + OTP OR registration
- Backend returns session-id (stored in cookies/headers) and XCSRF token on successful auth
- XCSRF token must be sent with all non-GET requests
- Session expiry redirects user to login screen for re-authentication
- Social login buttons (Facebook, Google, Apple) are UI placeholders only - no functionality

---

## PART 1: DOMAIN LAYER

### File: `lib/features/auth/domain/entities/user.dart`
Create User entity using Freezed with fields:
- id: String
- phoneNumber: String
- name: String (nullable for OTP-only login)
- createdAt: DateTime
- Factory: User.empty()

### File: `lib/features/auth/domain/entities/session.dart`
Create Session entity using Freezed with fields:
- sessionId: String
- xcsrfToken: String
- userId: String
- createdAt: DateTime
- expiresAt: DateTime (nullable if server doesn't provide)
- Getter: bool get isExpired (check against current time, return true if expiresAt is null and session is old)

### File: `lib/features/auth/domain/entities/auth_credentials.dart`
Create using Freezed:

1. OtpRequestCredentials:
   - phoneNumber: String

2. OtpVerifyCredentials:
   - phoneNumber: String
   - otp: String
   - rememberMe: bool

3. RegisterCredentials:
   - phoneNumber: String
   - name: String
   - password: String
   - confirmPassword: String

### File: `lib/features/auth/domain/entities/otp_state.dart`
Create using Freezed:
- otpSentTo: String (phone number)
- expiresAt: DateTime
- attemptsRemaining: int (optional)

### File: `lib/features/auth/domain/repositories/auth_repository.dart`
Abstract class AuthRepository with methods (all return Future<Either<Failure, T>>):
- requestOtp(OtpRequestCredentials credentials) -> OtpState
- verifyOtp(OtpVerifyCredentials credentials) -> Session
- register(RegisterCredentials credentials) -> Session
- logout() -> Unit
- getCurrentSession() -> Session? (nullable, from local storage)
- clearSession() -> Unit
- isSessionValid() -> bool

---

## PART 2: INFRASTRUCTURE LAYER

### File: `lib/features/auth/infrastructure/models/user_model.dart`
- JSON serializable model matching API response
- toDomain() -> User
- fromDomain(User) factory
- fromJson/toJson

### File: `lib/features/auth/infrastructure/models/session_model.dart`
- JSON serializable model
- Fields to parse: session_id, xcsrf_token, user_id, created_at, expires_at
- toDomain() -> Session
- fromDomain(Session) factory
- Handle snake_case from API

### File: `lib/features/auth/infrastructure/models/otp_state_model.dart`
- JSON serializable
- toDomain() -> OtpState

### File: `lib/features/auth/infrastructure/models/auth_request_models.dart`
Create JSON serializable request DTOs:
1. OtpRequestDto: { phone_number: String }
2. OtpVerifyDto: { phone_number: String, otp: String, remember_me: bool }
3. RegisterRequestDto: { phone_number: String, name: String, password: String }

### File: `lib/features/auth/infrastructure/data_sources/remote/auth_api.dart`

Abstract class AuthApi with methods:
- requestOtp(OtpRequestDto) -> Future<OtpStateModel>
- verifyOtp(OtpVerifyDto) -> Future<SessionModel>
- register(RegisterRequestDto) -> Future<SessionModel>
- logout() -> Future<void>

Implementation AuthApiImpl:
- Constructor takes DioClient
- Use endpoints from core/network/endpoints.dart
- Extract session-id from response headers/cookies
- Extract XCSRF token from response headers (commonly X-CSRF-Token or similar)
- Handle API error responses and map to Failures

### File: `lib/features/auth/infrastructure/data_sources/local/auth_local_ds.dart`

Abstract class AuthLocalDataSource with methods:
- saveSession(Session) -> Future<void>
- getSession() -> Future<Session?>
- clearSession() -> Future<void>
- saveRememberMe(bool) -> Future<void>
- getRememberMe() -> Future<bool>
- saveLastPhoneNumber(String) -> Future<void>
- getLastPhoneNumber() -> Future<String?>

Implementation AuthLocalDataSourceImpl:
- Constructor takes SecureStore (for session tokens)
- Store sessionId in SecureStore
- Store xcsrfToken in SecureStore
- Store rememberMe preference
- Store last phone number if rememberMe is true

### File: `lib/features/auth/infrastructure/repositories/auth_repository_impl.dart`

AuthRepositoryImpl implements AuthRepository:
- Constructor: AuthApi, AuthLocalDataSource, ConnectivityChecker
- Implement all methods
- On successful auth (verifyOtp, register):
  - Save session to local storage
  - Return session
- On logout:
  - Call API logout
  - Clear local session
- Handle network errors -> NetworkFailure
- Handle API errors -> ServerFailure with message
- Wrap all in try-catch returning Either

---

## PART 3: NETWORK LAYER UPDATES

### File: `lib/core/network/interceptors/xcsrf_interceptor.dart`
Create new interceptor:
- Read XCSRF token from SecureStore
- For non-GET requests (POST, PUT, DELETE, PATCH):
  - Add X-CSRF-Token header with stored token
- Skip if token not available (pre-auth requests)

### File: `lib/core/network/interceptors/session_interceptor.dart`
Create new interceptor:
- Read session-id from SecureStore
- Add to request headers or cookies as required by backend
- On 401 response:
  - Clear local session
  - Trigger redirect to login (via callback or event)

### Update: `lib/core/network/api_client.dart`
- Add XcsrfInterceptor to interceptor chain
- Add SessionInterceptor to interceptor chain
- Add callback/stream for session expiry events
- Order: Logging -> Session -> XCSRF -> Auth -> Retry -> Error

### File: `lib/core/network/endpoints.dart`
Add auth endpoints:
```dart
static String requestOtp() => '/auth/otp/request';
static String verifyOtp() => '/auth/otp/verify';
static String register() => '/auth/register';
static String logout() => '/auth/logout';
```

---

## PART 4: APPLICATION LAYER

### File: `lib/features/auth/application/states/auth_state.dart`
Create using Freezed - sealed class AuthState with variants:
- initial()
- loading()
- authenticated(Session session)
- unauthenticated()
- sessionExpired() - distinct from unauthenticated for UI messaging
- error(Failure failure)

Helpers:
- bool get isAuthenticated
- bool get isLoading
- Session? get currentSession

### File: `lib/features/auth/application/states/login_state.dart`
Create using Freezed for login flow state:
- initial()
- requestingOtp()
- otpSent(OtpState otpState)
- verifyingOtp()
- success(Session session)
- error(Failure failure)

### File: `lib/features/auth/application/states/register_state.dart`
Create using Freezed:
- initial()
- loading()
- success(Session session)
- error(Failure failure)

### File: `lib/features/auth/application/usecases/request_otp_usecase.dart`
- Takes AuthRepository
- call(OtpRequestCredentials) -> Future<Either<Failure, OtpState>>
- Validate phone number format before calling API

### File: `lib/features/auth/application/usecases/verify_otp_usecase.dart`
- Takes AuthRepository
- call(OtpVerifyCredentials) -> Future<Either<Failure, Session>>
- Validate OTP format (length, numeric)

### File: `lib/features/auth/application/usecases/register_usecase.dart`
- Takes AuthRepository
- call(RegisterCredentials) -> Future<Either<Failure, Session>>
- Validate:
  - Phone number format
  - Name not empty
  - Password meets requirements (min length, complexity)
  - Password matches confirmPassword

### File: `lib/features/auth/application/usecases/logout_usecase.dart`
- Takes AuthRepository
- call() -> Future<Either<Failure, Unit>>

### File: `lib/features/auth/application/usecases/check_session_usecase.dart`
- Takes AuthRepository
- call() -> Future<Either<Failure, Session?>>
- Check if valid session exists locally

### File: `lib/features/auth/application/providers/auth_providers.dart`
Define providers:
```dart
// Repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // Inject dependencies and return AuthRepositoryImpl
});

// Usecase providers
final requestOtpUsecaseProvider = Provider((ref) => ...);
final verifyOtpUsecaseProvider = Provider((ref) => ...);
final registerUsecaseProvider = Provider((ref) => ...);
final logoutUsecaseProvider = Provider((ref) => ...);
final checkSessionUsecaseProvider = Provider((ref) => ...);

// Main auth state provider
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>(...);

// Login flow state provider
final loginStateProvider = StateNotifierProvider<LoginNotifier, LoginState>(...);

// Register flow state provider  
final registerStateProvider = StateNotifierProvider<RegisterNotifier, RegisterState>(...);

// Current XCSRF token provider (for interceptor access)
final xcsrfTokenProvider = FutureProvider<String?>((ref) => ...);

// Session expiry listener
final sessionExpiryProvider = StreamProvider<void>(...);
```

### File: `lib/features/auth/application/providers/auth_notifier.dart`
AuthNotifier extends StateNotifier<AuthState>:
- Constructor: takes checkSessionUsecase, logoutUsecase
- Methods:
  - checkAuthStatus() - called on app start
  - setAuthenticated(Session) - called after successful login/register
  - logout()
  - handleSessionExpiry() - set state to sessionExpired
- Listen to session expiry events from network layer

### File: `lib/features/auth/application/providers/login_notifier.dart`
LoginNotifier extends StateNotifier<LoginState>:
- Constructor: takes requestOtpUsecase, verifyOtpUsecase, authNotifier ref
- Methods:
  - requestOtp(String phoneNumber)
  - verifyOtp(String otp, bool rememberMe)
  - resetState()
- On successful verify, call authNotifier.setAuthenticated()

### File: `lib/features/auth/application/providers/register_notifier.dart`
RegisterNotifier extends StateNotifier<RegisterState>:
- Constructor: takes registerUsecase, authNotifier ref
- Methods:
  - register(RegisterCredentials)
  - resetState()
- On successful register, call authNotifier.setAuthenticated()

---

## PART 5: PRESENTATION LAYER

### File: `lib/features/auth/presentation/screens/login_screen.dart`
ConsumerStatefulWidget - Main authentication screen with toggle between Login/Register

Structure:
- AppScaffold with no app bar (clean auth screen)
- SafeArea wrapper
- SingleChildScrollView for keyboard handling
- Column layout:
  1. App logo/branding at top
  2. AuthModeToggle (Login | Register)
  3. Conditional content based on mode:
     - Login mode: LoginFormSection
     - Register mode: RegisterFormSection
  4. SocialLoginSection at bottom

State management:
- Local state for current mode (login/register)
- Watch loginStateProvider and registerStateProvider
- Navigate to OTP screen when OTP sent
- Navigate to home when authenticated

### File: `lib/features/auth/presentation/screens/otp_verification_screen.dart`
ConsumerStatefulWidget - OTP entry screen

Props (via route arguments):
- phoneNumber: String
- rememberMe: bool

Structure:
- AppScaffold with back button
- Column layout:
  1. Header text ("Enter verification code")
  2. Subtitle ("Code sent to +91 XXXXX")
  3. OtpInputSection (6 digit input)
  4. Resend timer/button
  5. VerifyButton

Behavior:
- Auto-focus first OTP field
- Auto-advance on digit entry
- Auto-submit when all digits entered (optional)
- Show loading state during verification
- Show error inline
- Navigate to home on success
- Handle resend OTP with cooldown timer

### File: `lib/features/auth/presentation/components/auth_mode_toggle.dart`
StatelessWidget - Toggle bar between Login and Register

Props:
- currentMode: AuthMode (enum: login, register)
- onModeChanged: Function(AuthMode)

UI:
- Container with rounded background
- Two segments: "Login" | "Register"
- Active segment highlighted
- Smooth animation on switch
- Use ScreenUtil for sizing

### File: `lib/features/auth/presentation/components/login_form_section.dart`
ConsumerWidget - Login form content

Contains:
- PhoneNumberField (with country code prefix +91 or picker)
- RememberMeCheckbox
- ContinueButton
- Appropriate spacing

Behavior:
- Validate phone number on submit
- Show loading on ContinueButton when requesting OTP
- Show error below field if validation fails
- Call loginNotifier.requestOtp() on submit

### File: `lib/features/auth/presentation/components/register_form_section.dart`
ConsumerWidget - Registration form content

Contains:
- PhoneNumberField
- NameTextField
- PasswordTextField (with visibility toggle)
- ConfirmPasswordTextField (with visibility toggle)
- ContinueButton

Validation:
- Phone: valid format, 10 digits
- Name: not empty, min 2 characters
- Password: min 8 chars, at least 1 number, 1 special char
- Confirm: matches password

Behavior:
- Validate all fields on submit
- Show field-level errors
- Show loading state during registration
- Call registerNotifier.register() on submit

### File: `lib/features/auth/presentation/components/phone_number_field.dart`
StatelessWidget - Reusable phone input

Props:
- controller: TextEditingController
- errorText: String?
- onChanged: Function(String)?
- enabled: bool

UI:
- Country code prefix (hardcoded +91 or selectable)
- Phone number input
- Numeric keyboard
- Max 10 digits
- Format display (XXX-XXX-XXXX optional)

### File: `lib/features/auth/presentation/components/otp_input_section.dart`
StatefulWidget - 6-digit OTP input

Props:
- onCompleted: Function(String otp)
- onChanged: Function(String otp)
- errorText: String?
- enabled: bool

UI:
- 6 individual boxes/fields
- Each accepts 1 digit
- Auto-advance to next on entry
- Auto-retreat on backspace
- Paste support (detect 6-digit paste)
- Error state styling
- Use ScreenUtil for box sizing

### File: `lib/features/auth/presentation/components/social_login_section.dart`
StatelessWidget - Social login buttons (placeholder only)

UI:
- Divider with "Or continue with" text
- Row of 3 circular icon buttons:
  - Facebook (Facebook icon)
  - Google (Google icon)
  - Apple (Apple icon)
- All buttons show "Coming soon" toast on tap

### File: `lib/features/auth/presentation/components/remember_me_checkbox.dart`
StatelessWidget - Remember me option

Props:
- value: bool
- onChanged: Function(bool)

UI:
- Checkbox with label "Remember me"
- Aligned to start

### File: `lib/features/auth/presentation/components/resend_otp_section.dart`
StatefulWidget - Resend OTP with countdown

Props:
- onResend: VoidCallback
- initialCountdown: int (seconds, default 30)

UI:
- When countdown active: "Resend code in 00:XX"
- When countdown finished: "Didn't receive code? Resend"
- Resend is tappable TextButton
- Reset countdown on resend

---

## PART 6: ROUTING UPDATES

### Update: `lib/app/router/routes.dart`
Add routes:
```dart
static const login = '/login';
static const otpVerification = '/otp-verification';
static const home = '/home'; // destination after auth
```

### Update: `lib/app/router/app_router.dart`
Configure routes:
- /login -> LoginScreen (initial route if not authenticated)
- /otp-verification -> OtpVerificationScreen (expects phoneNumber, rememberMe params)
- Add auth guard to protected routes
- Redirect logic:
  - If authenticated -> go to home
  - If sessionExpired -> go to login with message
  - If unauthenticated -> go to login

### Update: `lib/app/router/guards/auth_guard.dart`
- Check authStateProvider
- If authenticated or loading initial check -> allow
- If unauthenticated or sessionExpired -> redirect to login
- Pass session expiry flag to login for messaging

---

## PART 7: SESSION EXPIRY HANDLING

### File: `lib/features/auth/application/providers/session_monitor.dart`
Create provider that:
- Listens to 401 responses from API client
- Calls authNotifier.handleSessionExpiry()
- Can be initialized in app bootstrap

### Update: `lib/app/app.dart`
- Listen to authStateProvider
- When state becomes sessionExpired:
  - Show snackbar/dialog: "Session expired. Please login again."
  - Navigate to login screen

---

## REQUIREMENTS CHECKLIST:

1. **Session tokens stored securely** - SecureStore for sessionId and XCSRF
2. **XCSRF sent on non-GET requests** - Via interceptor
3. **Session expiry handled gracefully** - Redirect to login with message
4. **Remember me functionality** - Store phone number for quick re-login
5. **Phone number validation** - Indian format (10 digits)
6. **Password validation** - Minimum 8 chars, complexity requirements
7. **OTP input** - 6 digits, auto-advance, paste support
8. **Social login placeholders** - UI only, toast on tap
9. **Toggle between login/register** - Smooth animated toggle
10. **Responsive UI** - All dimensions use ScreenUtil
11. **Error handling** - Field-level and general errors
12. **Loading states** - Button loading indicators, disable interaction

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
Prompt: Secure Storage Keys for Auth
Update `lib/core/storage/secure_store_keys.dart` to include authentication-related keys:

Keys needed:
- sessionId
- xcsrfToken
- userId
- rememberMe
- lastPhoneNumber

Follow the existing pattern in the file. Use descriptive constant names.

Prompt: Auth-Specific Failures

Update `lib/core/error/failure.dart` to include authentication-specific failure types:

Add to the Failure sealed class:
- InvalidOtpFailure (message, attemptsRemaining)
- OtpExpiredFailure
- PhoneNumberAlreadyExistsFailure
- InvalidCredentialsFailure
- SessionExpiredFailure
- AccountNotFoundFailure

Each should extend/be a variant of the base Failure.
Update toUserMessage() extension to return appropriate user-facing messages for each.

Prompt: Auth Validators

Add authentication-specific validators to `lib/core/utils/validators.dart`:

1. validatePhoneNumber(String value)
   - Must be exactly 10 digits
   - Must start with 6, 7, 8, or 9 (Indian mobile)
   - Return null if valid, error message if invalid

2. validateOtp(String value)
   - Must be exactly 6 digits
   - Must be numeric only
   
3. validatePassword(String value)
   - Minimum 8 characters
   - At least 1 uppercase letter
   - At least 1 lowercase letter
   - At least 1 number
   - At least 1 special character (!@#$%^&*)
   - Return null if valid, specific error message if invalid

4. validateConfirmPassword(String password, String confirmPassword)
   - Must match password
   
5. validateName(String value)
   - Not empty
   - Minimum 2 characters
   - Only letters and spaces

All validators return String? (null = valid, String = error message).

