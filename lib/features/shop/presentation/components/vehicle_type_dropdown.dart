import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/vehicle_type.dart';

/// Dropdown for selecting vehicle type.
class VehicleTypeDropdown extends StatelessWidget {
  final VehicleType selectedType;
  final ValueChanged<VehicleType> onChanged;

  const VehicleTypeDropdown({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Icon(
            Icons.directions_car_outlined,
            size: 20.sp,
            color: Colors.grey[600],
          ),
          SizedBox(width: 8.w),
          Text(
            'Select Vehicle',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(width: 8.w),
          Icon(
            Icons.chevron_right,
            size: 20.sp,
            color: Colors.grey[400],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<VehicleType>(
                value: selectedType,
                isDense: true,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 20.sp,
                ),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black87,
                ),
                items: VehicleType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.displayName),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    onChanged(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
