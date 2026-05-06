import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

class PhilosophyCard extends StatelessWidget {
  const PhilosophyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final colors = context.colors;

    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(54.r),

        /// THEME CARD COLOR
        color: colors.cardColor,

        border: Border.all(color: colors.border),
      ),

      child: Column(
        children: [
          /// QUOTE
          Text(
            '"Jewelry is not\nsimply an accessory\n— it is a reflection of\nidentity."',

            textAlign: TextAlign.center,

            style: textTheme.headlineSmall?.copyWith(
              height: 1.4,

              color: colors.textPrimary,
            ),
          ),

          SizedBox(height: 40.h),

          /// LINE
          Container(width: 60.w, height: 1, color: colors.border),

          SizedBox(height: 12.h),

          /// LABEL
          Text(
            "THE PHILOSOPHY",

            style: textTheme.labelSmall?.copyWith(
              letterSpacing: 2,

              color: colors.textSecondary,

              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
