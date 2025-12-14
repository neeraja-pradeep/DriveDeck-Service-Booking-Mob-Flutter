import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';
import '../../application/providers/garage_providers.dart';
import '../../domain/repositories/garage_repository.dart';

/// Bottom sheet for adding a new vehicle.
class AddVehicleBottomSheet extends ConsumerStatefulWidget {
  const AddVehicleBottomSheet({super.key});

  /// Show the add vehicle bottom sheet.
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddVehicleBottomSheet(),
    );
  }

  @override
  ConsumerState<AddVehicleBottomSheet> createState() =>
      _AddVehicleBottomSheetState();
}

class _AddVehicleBottomSheetState extends ConsumerState<AddVehicleBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _makeController = TextEditingController();
  final _modelController = TextEditingController();
  final _yearController = TextEditingController();
  final _licensePlateController = TextEditingController();

  bool _isFavourite = false;

  @override
  void dispose() {
    _makeController.dispose();
    _modelController.dispose();
    _yearController.dispose();
    _licensePlateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addVehicleState = ref.watch(addVehicleStateProvider);
    final isLoading = addVehicleState is AddVehicleLoading;

    ref.listen<AddVehicleState>(addVehicleStateProvider, (previous, next) {
      if (next is AddVehicleSuccess) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vehicle added successfully'),
            backgroundColor: Colors.green,
          ),
        );
        ref.read(addVehicleStateProvider.notifier).reset();
      } else if (next is AddVehicleError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.all(20.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle bar
                  Center(
                    child: Container(
                      width: 40.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Title
                  Text(
                    'Add Vehicle',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Make field (required)
                  _buildLabel('Make *'),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: _makeController,
                    enabled: !isLoading,
                    textCapitalization: TextCapitalization.words,
                    decoration: _buildInputDecoration('e.g., Toyota, Honda, BMW'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Make is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),

                  // Model field (required)
                  _buildLabel('Model *'),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: _modelController,
                    enabled: !isLoading,
                    textCapitalization: TextCapitalization.words,
                    decoration: _buildInputDecoration('e.g., Camry, Civic, X5'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Model is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),

                  // Year field (optional)
                  _buildLabel('Year'),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: _yearController,
                    enabled: !isLoading,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    decoration: _buildInputDecoration('e.g., 2024'),
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        final year = int.tryParse(value);
                        if (year == null || year < 1900 || year > 2100) {
                          return 'Enter a valid year';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),

                  // License Plate field (optional)
                  _buildLabel('License Plate'),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: _licensePlateController,
                    enabled: !isLoading,
                    textCapitalization: TextCapitalization.characters,
                    decoration: _buildInputDecoration('e.g., KA 01 AB 1234'),
                  ),
                  SizedBox(height: 16.h),

                  // Set as favourite switch
                  SwitchListTile(
                    title: Text(
                      'Set as favourite vehicle',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    subtitle: Text(
                      'This vehicle will be pre-selected for bookings',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    value: _isFavourite,
                    onChanged: isLoading
                        ? null
                        : (value) {
                            setState(() => _isFavourite = value);
                          },
                    activeColor: AppColors.primary,
                    contentPadding: EdgeInsets.zero,
                  ),
                  SizedBox(height: 24.h),

                  // Add button
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _onAddVehicle,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
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
                              'Add Vehicle',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: Colors.red),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
    );
  }

  void _onAddVehicle() {
    if (_formKey.currentState?.validate() != true) return;

    final yearText = _yearController.text.trim();
    final request = AddVehicleRequest(
      make: _makeController.text.trim(),
      model: _modelController.text.trim(),
      year: yearText.isNotEmpty ? int.tryParse(yearText) : null,
      licensePlate: _licensePlateController.text.trim().isNotEmpty
          ? _licensePlateController.text.trim()
          : null,
      isFavourite: _isFavourite,
    );

    ref.read(addVehicleStateProvider.notifier).addVehicle(request);
  }
}
