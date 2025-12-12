import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../application/providers/garage_providers.dart';
import '../../domain/entities/vehicle.dart';
import '../components/garage_empty_state.dart';
import '../components/vehicle_card.dart';
import '../dialogs/add_vehicle_bottom_sheet.dart';
import '../dialogs/delete_vehicle_dialog.dart';

/// My Garage screen showing user's vehicles.
class GarageScreen extends ConsumerStatefulWidget {
  const GarageScreen({super.key});

  @override
  ConsumerState<GarageScreen> createState() => _GarageScreenState();
}

class _GarageScreenState extends ConsumerState<GarageScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(garageStateProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final garageState = ref.watch(garageStateProvider);
    final filteredVehicles = ref.watch(filteredVehiclesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
            size: 24.sp,
          ),
        ),
        title: Text(
          'My Garage',
          style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => AddVehicleBottomSheet.show(context),
            icon: Icon(Icons.add, color: AppColors.primary, size: 28.sp),
            tooltip: 'Add Vehicle',
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          _buildSearchBar(),

          // Content
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => ref.read(garageStateProvider.notifier).refresh(),
              child: _buildContent(garageState, filteredVehicles),
            ),
          ),
        ],
      ),
      floatingActionButton:
          garageState is GarageLoaded && (garageState).vehicles.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () => AddVehicleBottomSheet.show(context),
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.add, color: Colors.white),
              label: Text(
                'Add Vehicle',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.all(16.w),
      color: AppColors.surface,
      child: Row(
        children: [
          // Search field
          Expanded(
            child: Container(
              height: 44.h,
              decoration: BoxDecoration(
                color: AppColors.grey100,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12.w),
                  Icon(
                    Icons.search,
                    color: AppColors.textSecondary,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        ref.read(garageSearchQueryProvider.notifier).state =
                            value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Search vehicles...',
                        hintStyle: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textHint,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                      ),
                      style: AppTypography.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // Filter button
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: AppColors.grey100,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Filter coming soon'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              icon: Icon(
                Icons.tune,
                color: AppColors.textSecondary,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(GarageState state, List<Vehicle> vehicles) {
    return switch (state) {
      GarageInitial() || GarageLoading() => _buildLoadingState(),
      GarageError(message: final message) => _buildErrorState(message),
      GarageLoaded() =>
        vehicles.isEmpty
            ? GarageEmptyState(
                onAddVehicle: () => AddVehicleBottomSheet.show(context),
              )
            : _buildVehicleList(vehicles),
    };
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.primary),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48.sp, color: AppColors.error),
          SizedBox(height: 16.h),
          const Text('Failed to load vehicles', style: AppTypography.bodyLarge),
          SizedBox(height: 8.h),
          Text(
            message,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () =>
                ref.read(garageStateProvider.notifier).initialize(),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: const Text('Retry', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleList(List<Vehicle> vehicles) {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: vehicles.length,
      itemBuilder: (context, index) {
        final vehicle = vehicles[index];
        return VehicleCard(
          vehicle: vehicle,
          onTap: () {
            // TODO: Navigate to vehicle detail or edit
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Selected: ${vehicle.make} ${vehicle.model}'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          onSetDefault: () => _onSetDefaultVehicle(vehicle),
          onDelete: () => _onDeleteVehicle(vehicle),
        );
      },
    );
  }

  Future<void> _onSetDefaultVehicle(Vehicle vehicle) async {
    final success = await ref
        .read(garageStateProvider.notifier)
        .setDefaultVehicle(vehicle.id);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success
                ? '${vehicle.make} ${vehicle.model} set as default'
                : 'Failed to set default vehicle',
          ),
          backgroundColor: success ? Colors.green : Colors.red,
        ),
      );
    }
  }

  Future<void> _onDeleteVehicle(Vehicle vehicle) async {
    await DeleteVehicleDialog.show(
      context,
      vehicle: vehicle,
      onConfirm: () async {
        final success = await ref
            .read(garageStateProvider.notifier)
            .deleteVehicle(vehicle.id);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                success
                    ? 'Vehicle deleted successfully'
                    : 'Failed to delete vehicle',
              ),
              backgroundColor: success ? Colors.green : Colors.red,
            ),
          );
        }
      },
    );
  }
}
