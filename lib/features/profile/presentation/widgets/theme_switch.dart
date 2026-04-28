import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  String selected = "Light";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.settingsTileBackground,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.themeToggleBackground, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.wb_sunny_outlined,
                size: 18.sp,
                color: AppColors.settingsTileText,
              ),
              SizedBox(width: 8.w),
              Text("Theme", style: AppTextStyles.settingsTileText),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: AppColors.settingsTileBackground,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [_item("Light"), _item("Dark")],
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(String text) {
    final isSelected = selected == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = text;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.transparent,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Text(
          text,
          style: isSelected
              ? AppTextStyles.themeToggleActive
              : AppTextStyles.themeToggleInactive,
        ),
      ),
    );
  }
}
