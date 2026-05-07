import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

class InfoCardAbout extends StatelessWidget {
  final IconData icon;

  final String title;

  final String description;

  const InfoCardAbout({
    super.key,

    required this.icon,

    required this.title,

    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final colors = context.colors;

    return Container(
      width: double.infinity,

      padding: EdgeInsets.all(22.w),

      decoration: BoxDecoration(
        /// BEIGE COLOR FROM THEME
        color: colors.cardColor,

        borderRadius: BorderRadius.circular(54.r),

        border: Border.all(color: colors.border),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Icon(icon, size: 22.sp, color: colors.textSecondary),

          SizedBox(height: 16.h),

          Text(
            title,

            style: textTheme.headlineSmall?.copyWith(color: colors.textPrimary),
          ),

          SizedBox(height: 12.h),

          Text(
            description,

            style: textTheme.bodyMedium?.copyWith(
              height: 1.6,

              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}