import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool showArrow;

  const ProfileTile({
    super.key,
    required this.title,
    required this.onTap,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.settingsTileBackground,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.formFieldFill, width: 1.w),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        title: Text(
          title,
          style: AppTextStyles.settingsTileText
        ),
        trailing: showArrow
            ? Icon(
                Icons.arrow_forward_ios,
                size: 14.sp,
                color: AppColors.settingsTileArrow,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
