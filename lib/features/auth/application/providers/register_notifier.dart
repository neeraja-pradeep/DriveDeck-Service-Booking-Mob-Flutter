// import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../core/error/failure.dart';
import '../../domain/entities/auth_credentials.dart';
import '../../domain/entities/session.dart';
import '../states/register_state.dart';
import '../usecases/register_usecase.dart';

/// Notifier for managing registration flow state.
class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier({required this.registerUsecase, required this.onAuthSuccess})
    : super(const RegisterState.initial());

  final RegisterUsecase registerUsecase;
  final void Function(Session session) onAuthSuccess;

  /// Registers a new user.
  Future<void> register(RegisterCredentials credentials) async {
    // debugPrint('🎯 RegisterNotifier: Starting registration process');
    // debugPrint('📱 Phone: ${credentials.phoneNumber}');
    // debugPrint('👤 Username: ${credentials.username}');

    state = const RegisterState.loading();

    final result = await registerUsecase(credentials);

    result.fold(
      (failure) {
        // debugPrint(
        //   '❌ RegisterNotifier: Registration failed with error: ${failure.userMessage}',
        // );
        state = RegisterState.error(failure: failure);
      },
      (session) {
        // debugPrint('✅ RegisterNotifier: Registration successful!');
        // debugPrint('🔑 Session ID: ${session.sessionId}');
        state = RegisterState.success(session: session);
        // Update main auth state via callback
        onAuthSuccess(session);
      },
    );
  }

  /// Resets the registration state.
  void resetState() {
    state = const RegisterState.initial();
  }
}
