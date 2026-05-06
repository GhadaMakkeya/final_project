import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

class CookiesSection extends StatelessWidget {
  const CookiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colors.authCardColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.cookie_outlined, color: colors.gold),
              SizedBox(width: 10.w),
              Text(
                'Cookies Policy',
                style: textTheme.headlineSmall,
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Text(
            'We use cookies and similar technologies to track activity on our platform...',
            style: textTheme.bodyMedium?.copyWith(height: 1.6),
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: colors.background, // لون الخلفية الهادي للقسم الداخلي
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: colors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'COOKIE PREFERENCES',
                  style: textTheme.titleSmall, // النص المتباعد (Inter)
                ),
                SizedBox(height: 8.h),
                Text(
                  'You can instruct your browser to refuse all cookies...',
                  style: textTheme.bodySmall?.copyWith(color: colors.textSecondary),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Manage Settings',
                      style: textTheme.labelMedium?.copyWith(
                        color: colors.gold,
                        decoration: TextDecoration.underline,
                        decorationColor: colors.gold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}