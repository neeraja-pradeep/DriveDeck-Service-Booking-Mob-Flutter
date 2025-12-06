import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Section displaying shop description with expandable text.
class ShopDescriptionSection extends StatefulWidget {
  final String description;

  const ShopDescriptionSection({
    super.key,
    required this.description,
  });

  @override
  State<ShopDescriptionSection> createState() => _ShopDescriptionSectionState();
}

class _ShopDescriptionSectionState extends State<ShopDescriptionSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final shouldShowExpandButton = widget.description.length > 150;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _isExpanded || !shouldShowExpandButton
                ? widget.description
                : '${widget.description.substring(0, 150)}...',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
          if (shouldShowExpandButton) ...[
            SizedBox(height: 4.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(
                _isExpanded ? 'Read less' : 'Read more',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
