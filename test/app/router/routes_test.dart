import 'package:flutter_test/flutter_test.dart';
import 'package:newapp/app/router/routes.dart';

void main() {
  group('Type-Safe Routes Tests', () {
    test('SplashRoute should generate correct path', () {
      const route = SplashRoute();
      expect(route.path, equals('/'));
    });

    test('LoginRoute should generate correct path', () {
      const route = LoginRoute();
      expect(route.path, equals('/login'));
    });

    test('HomeRoute should generate correct path', () {
      const route = HomeRoute();
      expect(route.path, equals('/home'));
    });

    test('ProfileRoute should generate correct path', () {
      const route = ProfileRoute();
      expect(route.path, equals('/profile'));
    });

    test('OtpVerificationRoute should generate correct path', () {
      const route = OtpVerificationRoute(
        phoneNumber: '1234567890',
        rememberMe: true,
      );

      expect(route.path, equals('/otp-verification'));
    });

    test(
      'OtpVerificationRoute should generate correct fullPath with parameters',
      () {
        const route = OtpVerificationRoute(
          phoneNumber: '1234567890',
          rememberMe: true,
        );

        expect(route.fullPath, contains('/otp-verification'));
        expect(route.fullPath, contains('phoneNumber=1234567890'));
        expect(route.fullPath, contains('rememberMe=true'));
      },
    );

    test(
      'OtpVerificationRoute should handle special characters in phone number',
      () {
        const route = OtpVerificationRoute(
          phoneNumber: '+1 (234) 567-890',
          rememberMe: false,
        );

        expect(route.fullPath, contains('/otp-verification'));
        expect(route.fullPath, contains('phoneNumber=%2B1%20(234)%20567-890'));
        expect(route.fullPath, contains('rememberMe=false'));
      },
    );

    test('OtpVerificationRoute should use default rememberMe value', () {
      const route = OtpVerificationRoute(phoneNumber: '1234567890');

      expect(route.fullPath, contains('rememberMe=false'));
    });
  });

  group('Route Type Safety Tests', () {
    test('Routes should be strongly typed', () {
      // These should compile without issues
      const splash = SplashRoute();
      const login = LoginRoute();
      const home = HomeRoute();
      const profile = ProfileRoute();

      // This should require phoneNumber parameter
      const otp = OtpVerificationRoute(phoneNumber: '1234567890');

      // Verify types
      expect(splash, isA<SplashRoute>());
      expect(login, isA<LoginRoute>());
      expect(home, isA<HomeRoute>());
      expect(profile, isA<ProfileRoute>());
      expect(otp, isA<OtpVerificationRoute>());
      expect(otp.phoneNumber, equals('1234567890'));
      expect(otp.rememberMe, equals(false)); // default value
    });
  });

  group('Legacy Routes Compatibility Tests', () {
    test('Legacy Routes constants should still work', () {
      // These are deprecated but should still work for backward compatibility
      // ignore: deprecated_member_use_from_same_package
      expect(Routes.splash, equals('/'));
      // ignore: deprecated_member_use_from_same_package
      expect(Routes.login, equals('/login'));
      // ignore: deprecated_member_use_from_same_package
      expect(Routes.home, equals('/home'));
      // ignore: deprecated_member_use_from_same_package
      expect(Routes.profile, equals('/profile'));
      // ignore: deprecated_member_use_from_same_package
      expect(Routes.otpVerification, equals('/otp-verification'));
    });
  });
}
