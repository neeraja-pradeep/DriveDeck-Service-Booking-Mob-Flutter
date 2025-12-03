import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/widgets/app_button.dart';
import '../../application/providers/auth_provider.dart';
import '../../application/states/auth_state.dart';

/// Debug screen for testing authentication.
class AuthDebugScreen extends ConsumerWidget {
  const AuthDebugScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final apiClient = ref.read(apiClientProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Auth Debug'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildStatusCard('Auth State', _getAuthStateText(authState)),
            SizedBox(height: 16.h),
            _buildStatusCard(
              'API Session',
              apiClient.hasSession ? 'Set' : 'Not Set',
            ),
            SizedBox(height: 16.h),

            if (authState is AuthAuthenticated) ...[
              _buildStatusCard('User ID', authState.user?.id ?? 'Unknown'),
              SizedBox(height: 16.h),
              _buildStatusCard('User Name', authState.user?.name ?? 'Unknown'),
              SizedBox(height: 16.h),
              _buildStatusCard(
                'Phone',
                authState.user?.phoneNumber ?? 'Unknown',
              ),
              SizedBox(height: 16.h),
              _buildStatusCard('Session ID', authState.session.sessionId),
              SizedBox(height: 16.h),
            ],

            const Spacer(),

            AppButton(
              onPressed: () {
                ref.read(authProvider.notifier).checkAuthStatus();
              },
              text: 'Refresh Auth Status',
            ),

            SizedBox(height: 16.h),

            if (authState.isAuthenticated)
              AppButton(
                onPressed: () {
                  ref.read(authProvider.notifier).logout();
                },
                text: 'Logout',
                isOutlined: true,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(String title, String value) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              value,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  String _getAuthStateText(AuthState state) {
    return switch (state) {
      AuthInitial() => 'Initial',
      AuthLoading() => 'Loading',
      AuthAuthenticated() => 'Authenticated',
      AuthUnauthenticated() => 'Unauthenticated',
      AuthError() => 'Error: ${state.message}',
    };
  }
}
