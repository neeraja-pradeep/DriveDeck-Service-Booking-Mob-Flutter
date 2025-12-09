import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';
import '../../application/providers/garage_providers.dart';
import '../../domain/entities/vehicle.dart';
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
  final _colorController = TextEditingController();

  GarageVehicleType _selectedVehicleType = GarageVehicleType.sedan;
  bool _isDefault = false;

  @override
  void dispose() {
    _makeController.dispose();
    _modelController.dispose();
    _yearController.dispose();
    _licensePlateController.dispose();
    _colorController.dispose();
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
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
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

                  // Make field
                  _buildLabel('Make *'),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: _makeController,
                    enabled: !isLoading,
                    decoration: _buildInputDecoration('e.g., Toyota, Honda'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Make is required';
                      }
                      if (value.trim().length < 2) {
                        return 'Make must be at least 2 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),

                  // Model field
                  _buildLabel('Model *'),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: _modelController,
                    enabled: !isLoading,
                    decoration: _buildInputDecoration('e.g., Camry, Civic'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Model is required';
                      }
                      if (value.trim().length < 2) {
                        return 'Model must be at least 2 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),

                  // Year and License Plate in a row
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Year'),
                            SizedBox(height: 8.h),
                            TextFormField(
                              controller: _yearController,
                              enabled: !isLoading,
                              keyboardType: TextInputType.number,
                              decoration: _buildInputDecoration('e.g., 2022'),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  final year = int.tryParse(value);
                                  if (year == null) {
                                    return 'Invalid year';
                                  }
                                  if (year < 1990 ||
                                      year > DateTime.now().year + 1) {
                                    return 'Invalid year';
                                  }
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('License Plate'),
                            SizedBox(height: 8.h),
                            TextFormField(
                              controller: _licensePlateController,
                              enabled: !isLoading,
                              textCapitalization: TextCapitalization.characters,
                              decoration: _buildInputDecoration('e.g., ABC 1234'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Color field
                  _buildLabel('Color'),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: _colorController,
                    enabled: !isLoading,
                    decoration: _buildInputDecoration('e.g., White, Black'),
                  ),
                  SizedBox(height: 16.h),

                  // Vehicle Type dropdown
                  _buildLabel('Vehicle Type *'),
                  SizedBox(height: 8.h),
                  DropdownButtonFormField<GarageVehicleType>(
                    value: _selectedVehicleType,
                    decoration: _buildInputDecoration('Select vehicle type'),
                    items: GarageVehicleType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type.displayName),
                      );
                    }).toList(),
                    onChanged: isLoading
                        ? null
                        : (value) {
                            if (value != null) {
                              setState(() => _selectedVehicleType = value);
                            }
                          },
                  ),
                  SizedBox(height: 16.h),

                  // Set as default switch
                  SwitchListTile(
                    title: Text(
                      'Set as default vehicle',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    subtitle: Text(
                      'This vehicle will be pre-selected for bookings',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    value: _isDefault,
                    onChanged: isLoading
                        ? null
                        : (value) {
                            setState(() => _isDefault = value);
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

    final request = AddVehicleRequest(
      make: _makeController.text.trim(),
      model: _modelController.text.trim(),
      year: _yearController.text.isNotEmpty
          ? int.tryParse(_yearController.text)
          : null,
      licensePlate: _licensePlateController.text.trim().isNotEmpty
          ? _licensePlateController.text.trim()
          : null,
      color: _colorController.text.trim().isNotEmpty
          ? _colorController.text.trim()
          : null,
      vehicleType: _selectedVehicleType.name,
      isDefault: _isDefault,
    );

    ref.read(addVehicleStateProvider.notifier).addVehicle(request);
  }
}
