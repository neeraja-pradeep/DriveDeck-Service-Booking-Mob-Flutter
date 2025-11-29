import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/session.dart';

part 'register_state.freezed.dart';

/// State for the registration flow.
@freezed
sealed class RegisterState with _$RegisterState {
  const RegisterState._();

  /// Initial state.
  const factory RegisterState.initial() = RegisterInitial;

  /// Registration in progress.
  const factory RegisterState.loading() = RegisterLoading;

  /// Registration successful.
  const factory RegisterState.success({
    required Session session,
  }) = RegisterSuccess;

  /// Registration error.
  const factory RegisterState.error({
    required Failure failure,
  }) = RegisterError;

  /// Check if loading.
  bool get isLoading => this is RegisterLoading;
}
