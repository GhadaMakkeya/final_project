import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

class SocialIconsSection extends StatelessWidget {
  const SocialIconsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Icon(
          Icons.camera_alt_outlined,

          color: colors.textSecondary,

          size: 24.sp,
        ),

        SizedBox(width: 30.w),

        Icon(Icons.push_pin_outlined, color: colors.textSecondary, size: 24.sp),

        SizedBox(width: 30.w),

        Icon(Icons.language, color: colors.textSecondary, size: 24.sp),
      ],
    );
  }
}