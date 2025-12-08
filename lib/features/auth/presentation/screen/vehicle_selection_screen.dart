import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../application/providers/auth_providers.dart';
import '../../domain/entities/auth_credentials.dart';

/// Vehicle type options for registration.
enum VehicleType {
  sedan('Sedan'),
  hatchback('Hatchback'),
  suv('SUV'),
  convertible('Convertible');

  const VehicleType(this.label);
  final String label;
}

/// Screen for selecting vehicle type during registration.
class VehicleSelectionScreen extends ConsumerStatefulWidget {
  const VehicleSelectionScreen({
    required this.registrationData,
    super.key,
  });

  /// Registration data collected from the previous screen.
  final RegisterCredentials registrationData;

  @override
  ConsumerState<VehicleSelectionScreen> createState() =>
      _VehicleSelectionScreenState();
}

class _VehicleSelectionScreenState
    extends ConsumerState<VehicleSelectionScreen> {
  VehicleType? _selectedVehicleType;

  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerStateProvider);
    final isLoading = registerState.isLoading;

    // Listen for registration success
    ref.listen(registerStateProvider, (previous, next) {
      next.maybeWhen(
        success: (session) {
          // Navigate to home on success
          context.go('/home');
        },
        error: (failure) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.userMessage),
              backgroundColor: AppColors.error,
            ),
          );
        },
        orElse: () {},
      );
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),

                      // Car image placeholder
                      _buildCarImage(),
                      SizedBox(height: 32.h),

                      // Title
                      Text(
                        'What Describes Your Vehicle',
                        style: AppTypography.titleLarge.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),

                      // Vehicle type options
                      _buildVehicleOptions(isLoading),
                    ],
                  ),
                ),
              ),

              // Continue button
              Padding(
                padding: EdgeInsets.only(bottom: 32.h),
                child: _buildContinueButton(isLoading),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the car image placeholder.
  Widget _buildCarImage() {
    return Container(
      width: 200.w,
      height: 140.h,
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD), // Light blue background
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        // TODO: Replace with actual car image
        // Image.asset('assets/images/car_placeholder.png')
        child: Icon(
          Icons.directions_car,
          size: 80.w,
          color: AppColors.grey500,
        ),
      ),
    );
  }

  /// Builds the list of vehicle type options.
  Widget _buildVehicleOptions(bool isLoading) {
    return Column(
      children: VehicleType.values.map((type) {
        final isSelected = _selectedVehicleType == type;
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: InkWell(
            onTap: isLoading
                ? null
                : () {
                    setState(() {
                      _selectedVehicleType = type;
                    });
                  },
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.grey300,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    type.label,
                    style: AppTypography.bodyLarge.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            isSelected ? AppColors.primary : AppColors.grey400,
                        width: 2,
                      ),
                      color: isSelected ? AppColors.primary : Colors.transparent,
                    ),
                    child: isSelected
                        ? Icon(
                            Icons.check,
                            size: 16.w,
                            color: AppColors.white,
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  /// Builds the continue button.
  Widget _buildContinueButton(bool isLoading) {
    final isEnabled = _selectedVehicleType != null && !isLoading;

    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: isEnabled ? _onContinue : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 24.w,
                height: 24.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                'Continue',
                style: AppTypography.labelLarge.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }

  /// Handles the continue button press.
  void _onContinue() {
    if (_selectedVehicleType == null) return;

    // Create updated credentials with vehicle type
    final credentialsWithVehicle = widget.registrationData.copyWith(
      vehicleType: _selectedVehicleType!.name,
    );

    // Trigger registration with vehicle type
    ref.read(registerStateProvider.notifier).register(credentialsWithVehicle);
  }
}
