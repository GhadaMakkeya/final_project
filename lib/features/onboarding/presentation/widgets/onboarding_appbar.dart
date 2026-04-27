import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSkip;
  const OnboardingAppBar({super.key, required this.onSkip});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65.h,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 64.w,
      title: Text(AppStrings.appName, style: AppTextStyles.appNameTextStyle),
      actions: [
        Padding(
          padding:  EdgeInsets.only(right: 12.0.w),
          child: GestureDetector(
            onTap: onSkip,
            child:  Center(
              child: Text(
                'SKIP',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                  color: Color(0xFF94A3B8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
