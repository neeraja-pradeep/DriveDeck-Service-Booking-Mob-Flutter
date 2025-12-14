import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';
import '../../domain/entities/vehicle.dart';

/// Card widget displaying vehicle information.
class VehicleCard extends StatelessWidget {
  const VehicleCard({
    super.key,
    required this.vehicle,
    this.onTap,
    this.onSetDefault,
    this.onDelete,
  });

  final Vehicle vehicle;
  final VoidCallback? onTap;
  final VoidCallback? onSetDefault;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: vehicle.isFavourite
            ? const BorderSide(color: AppColors.primary, width: 2)
            : BorderSide.none,
      ),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              // Vehicle icon
              Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.directions_car,
                  color: AppColors.primary,
                  size: 28.sp,
                ),
              ),
              SizedBox(width: 16.w),

              // Vehicle info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            vehicle.displayName,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (vehicle.isFavourite)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              'Favourite',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    if (vehicle.licensePlate != null &&
                        vehicle.licensePlate!.isNotEmpty)
                      Text(
                        vehicle.licensePlate!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),

              // Actions menu
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: Colors.grey[600]),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                itemBuilder: (context) => [
                  if (!vehicle.isFavourite)
                    PopupMenuItem<String>(
                      value: 'favourite',
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_outline,
                            size: 20.sp,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Set as Favourite',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline,
                          size: 20.sp,
                          color: Colors.red[600],
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.red[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                  switch (value) {
                    case 'favourite':
                      onSetDefault?.call();
                      break;
                    case 'delete':
                      onDelete?.call();
                      break;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
