import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/app/theme/colors.dart';

/// Profile avatar widget matching the simple UI of ProfileScreen.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    required this.initials,
    required this.size,
    this.imageUrl,
    super.key,
  });

  final String? imageUrl;
  final String initials;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.grey200, // Matched original background
      ),
      child: ClipOval(child: _buildAvatarContent()),
    );
  }

  Widget _buildAvatarContent() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) => _buildInitialsOrIcon(),
        errorWidget: (context, url, error) => _buildInitialsOrIcon(),
      );
    }
    return _buildInitialsOrIcon();
  }

  Widget _buildInitialsOrIcon() {
    if (initials.isNotEmpty) {
      return Center(
        child: Text(
          initials,
          style: TextStyle(
            fontSize:
                (size * 0.4).sp, // Scaled to size like original (24 for 60)
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      );
    }
    // Fallback icon matching original UI
    return Icon(
      Icons.person,
      size: (size * 0.53).sp, // ~32 for 60
      color: AppColors.textSecondary,
    );
  }
}
