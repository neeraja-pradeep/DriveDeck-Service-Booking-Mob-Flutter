# Session Data Capture Instructions

## Step 1: Capture Real Session Data

1. **Run the app** and navigate to the login screen
2. **Enter your phone number** and request OTP
3. **Enter the OTP** you receive
4. **Check the Debug Console** - you should see output like:

```
🔴 REAL SESSION DATA FOR HARDCODING: {
  "session_id": "sess_8923892749823...",
  "xcsrf_token": "csrf_783478374...",
  "user": {
    "id": "user_555",
    "name": "John Doe", 
    "phone": "+919876543210"
  },
  "expires_at": "2025-12-01T10:00:00Z"
}
🔴 HEADERS: {headers data}
```

## Step 2: Update Hardcoded Data

1. **Open** `lib/features/auth/application/providers/auth_provider.dart`
2. **Find** the `checkAuthStatus()` method
3. **Replace** the placeholder values with your real data:

```dart
// Replace these lines with your captured data:
final realUser = User(
  id: 'user_555',                    // ← Your real user ID
  phoneNumber: '+919876543210',      // ← Your real phone number  
  name: 'John Doe',                  // ← Your real name
  createdAt: DateTime.now(),
);

final realSession = Session(
  sessionId: 'sess_8923892749823...', // ← Your real session ID
  xcsrfToken: 'csrf_783478374...',    // ← Your real XCSRF token
  userId: 'user_555',                 // ← Same as user ID above
  createdAt: DateTime.now(),
  expiresAt: DateTime.now().add(const Duration(days: 7)), // Keep this for dev
);
```

**Important**: The session tokens will be automatically set in the API client, so all subsequent API calls will be authenticated.

## Step 3: Test the Hardcoded Session

1. **Hot restart** the app (not hot reload)
2. The app should now **automatically log you in** without requiring OTP
3. You should see the home screen with your user data

## Important Notes

⚠️ **Security Warning**: 
- Do NOT commit real session tokens to Git
- These tokens will eventually expire on the server
- When tokens expire, repeat Step 1 to get fresh ones

⚠️ **Token Expiration**:
- Real tokens typically expire in 1-24 hours
- If you get 401 errors, capture fresh session data
- The `expiresAt` date in the hardcoded session should be in the future

## Reverting for Production

Before deploying or committing to Git:

1. **Remove** the hardcoded session data
2. **Uncomment** the TODO production code in `checkAuthStatus()`
3. **Implement** proper session storage and validation

## Current Auth API Endpoint

The auth API is configured to call:
- **Verify OTP**: `POST /api/auth/verify-otp/`

Make sure your backend has this endpoint implemented.

## Current Issue

The app is currently getting a 403 error when trying to access the profile endpoint because:
1. The hardcoded session tokens are placeholders (not real)
2. The API client needs real session tokens to authenticate requests

**To fix this:**
1. Follow Step 1 to capture real session data from a successful login
2. Replace the placeholder tokens in Step 2
3. The API client will automatically use these tokens for all requests

## Debug Information

You can see the headers being sent in the debug console:
- Look for `🔵 API Request Headers:` messages
- After setting real session tokens, you should see `sessionid` and `X-CSRFToken` headers