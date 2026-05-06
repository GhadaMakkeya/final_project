import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

class PrivacyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const PrivacyCard({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colors.authCardColor, // استخدمنا لون الكارت المخصص
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: colors.gold.withOpacity(0.1), // لمسة ذهبية خفيفة للايقونة
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Icon(icon, color: colors.gold, size: 22.sp),
          ),
          SizedBox(height: 15.h),
          Text(
            title,
            style: textTheme.headlineSmall, // خط Georgia الفخم
          ),
          SizedBox(height: 10.h),
          Text(
            body,
            style: textTheme.bodyMedium?.copyWith(
              color: colors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}