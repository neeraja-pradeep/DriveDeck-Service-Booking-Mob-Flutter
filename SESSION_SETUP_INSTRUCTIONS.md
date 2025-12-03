# Session Setup Instructions for Homepage Module

## Current Status ✅

The homepage module is now set up with **hardcoded development session data** that allows you to test the home screen without going through the full authentication flow.

## What's Been Done

### 1. **Hardcoded Session in Auth Provider**
- **File**: `lib/features/auth/application/providers/auth_provider.dart`
- **Method**: `checkAuthStatus()`
- **Session Data**:
  ```dart
  Session ID: 'dev_session_12345abcdef'
  CSRF Token: 'dev_csrf_token_67890xyz'
  User ID: 'dev_user_123'
  User Name: 'Dev User'
  Phone: '+919876543210'
  ```

### 2. **Debug Info on Home Screen**
- **File**: `lib/features/home/presentation/screens/home_screen.dart`
- **Feature**: Orange debug banner at the top showing:
  - Current auth state
  - Session ID and CSRF token
  - User information
  - Session expiry status

### 3. **Session Capture Logging (Feature-auth module)**
- **File**: `Feature-auth/lib/features/auth/infrastructure/data_sources/remote/auth_api.dart`
- **Feature**: Added console logging to capture real session data when you authenticate

## How to Use

### Option 1: Use Hardcoded Session (Current Setup)
1. **Run the homepage module**: `flutter run` in `Feature-homepage/`
2. **App will automatically log you in** with the hardcoded session
3. **You'll see the home screen** with the debug info banner
4. **All API calls will use** the hardcoded session tokens

### Option 2: Capture Real Session Data
1. **Run the auth module**: `flutter run` in `Feature-auth/`
2. **Complete the login flow** (phone number → OTP)
3. **Check the console** for output like:
   ```
   🔴 REAL SESSION DATA FOR HARDCODING (OTP VERIFY): {
     "session_id": "real_session_abc123...",
     "xcsrf_token": "real_csrf_xyz789...",
     "user_id": "real_user_456",
     ...
   }
   ```
4. **Copy the real values** and replace the hardcoded ones in the homepage module

## File Locations

### Homepage Module Files:
- **Auth Provider**: `Feature-homepage/lib/features/auth/application/providers/auth_provider.dart`
- **Home Screen**: `Feature-homepage/lib/features/home/presentation/screens/home_screen.dart`
- **Auth Wrapper**: `Feature-homepage/lib/features/auth/presentation/widgets/auth_wrapper.dart`

### Auth Module Files (for capturing real data):
- **Auth API**: `Feature-auth/lib/features/auth/infrastructure/data_sources/remote/auth_api.dart`

## Testing the Setup

### 1. **Run Homepage Module**
```bash
cd Feature-homepage
flutter run
```

### 2. **Expected Behavior**
- App starts and shows loading spinner briefly
- Automatically transitions to home screen (no login required)
- Orange debug banner shows session information
- Home screen displays normally with all components

### 3. **Debug Information**
The debug banner shows:
- ✅ **Auth State: Authenticated**
- **Session ID**: dev_session_12345abcdef
- **CSRF Token**: dev_csrf_token_67890xyz
- **User ID**: dev_user_123
- **User Name**: Dev User
- **Phone**: +919876543210
- **Expires**: 7 days from now
- **Valid**: ✅

## API Integration

### Current Status
- **Session tokens are set** in the API client automatically
- **All API calls will include** the session cookies and CSRF headers
- **Profile API calls should work** if your backend accepts these tokens

### If You Get 401/403 Errors
This means your backend doesn't recognize the hardcoded tokens. You need to:
1. Capture real session data from the auth module (Option 2 above)
2. Replace the hardcoded values with real ones
3. Or implement proper session storage/validation

## Modular Development Benefits

### ✅ **Independent Development**
- Homepage module works standalone
- No dependency on auth module for basic testing
- Can develop UI/UX without authentication flow

### ✅ **Easy Testing**
- Instant access to authenticated state
- No need to go through login every time
- Debug info shows exactly what session data is being used

### ✅ **Real Data Integration**
- Easy to switch from hardcoded to real session data
- Console logging captures exact format needed
- Simple copy-paste to update tokens

## Next Steps

1. **Test the current setup** - Run the homepage module and verify it works
2. **Develop your features** - Build homepage functionality with guaranteed auth state
3. **Capture real data** - When ready, use the auth module to get real session tokens
4. **Replace hardcoded data** - Update the auth provider with real session data
5. **Remove debug banner** - Comment out the debug info when ready for production

## Security Notes

⚠️ **Development Only**: The hardcoded session is for development only
⚠️ **Don't Commit Real Tokens**: Never commit real session tokens to Git
⚠️ **Token Expiry**: Real tokens will expire, requiring fresh capture

---

**You're all set!** The homepage module now has a hardcoded session that lets you develop and test the home screen independently of the auth flow.