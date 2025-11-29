import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/error/failure.dart';
import 'features/auth/application/providers/auth_providers.dart';
import 'features/auth/domain/entities/auth_credentials.dart';

/// Debug widget to test registration functionality
class DebugRegistrationTest extends ConsumerStatefulWidget {
  const DebugRegistrationTest({super.key});

  @override
  ConsumerState<DebugRegistrationTest> createState() =>
      _DebugRegistrationTestState();
}

class _DebugRegistrationTestState extends ConsumerState<DebugRegistrationTest> {
  final _phoneController = TextEditingController(text: '9876543210');
  final _usernameController = TextEditingController(text: 'testuser123');
  final _passwordController = TextEditingController(text: 'TestPass123!');
  final _confirmPasswordController = TextEditingController(
    text: 'TestPass123!',
  );

  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Debug Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: registerState.isLoading ? null : _testRegistration,
              child: registerState.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Test Registration'),
            ),
            const SizedBox(height: 16),
            registerState.when(
              initial: () => const Text('Ready to test'),
              loading: () => const Text('Registering...'),
              success: (session) =>
                  Text('Success! Session ID: ${session.sessionId}'),
              error: (failure) => Text(
                'Error: ${failure.userMessage}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _testRegistration() {
    final credentials = RegisterCredentials(
      phoneNumber: _phoneController.text.trim(),
      username: _usernameController.text.trim(),
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );

    // debugPrint('🧪 Debug: Testing registration with:');
    // debugPrint('📱 Phone: ${credentials.phoneNumber}');
    // debugPrint('👤 Username: ${credentials.username}');
    // debugPrint('🔒 Password: ${credentials.password}');

    ref.read(registerStateProvider.notifier).register(credentials);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
