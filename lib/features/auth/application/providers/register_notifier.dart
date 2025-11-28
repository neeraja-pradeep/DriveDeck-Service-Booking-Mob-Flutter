import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/auth_credentials.dart';
import '../states/register_state.dart';
import '../usecases/register_usecase.dart';
import 'auth_notifier.dart';

/// Notifier for managing registration flow state.
class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier({
    required this.registerUsecase,
    required this.authNotifier,
  }) : super(const RegisterState.initial());

  final RegisterUsecase registerUsecase;
  final AuthNotifier authNotifier;

  /// Registers a new user.
  Future<void> register(RegisterCredentials credentials) async {
    state = const RegisterState.loading();

    final result = await registerUsecase(credentials);

    result.fold(
      (failure) {
        state = RegisterState.error(failure: failure);
      },
      (session) {
        state = RegisterState.success(session: session);
        // Update main auth state
        authNotifier.setAuthenticated(session);
      },
    );
  }

  /// Resets the registration state.
  void resetState() {
    state = const RegisterState.initial();
  }
}
