import 'package:flutter/material.dart';
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
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: colors.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colors.border, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.wb_sunny_outlined, size: 18.sp, color: colors.textSecondary),
              SizedBox(width: 8.w),
              Text("Theme", style: textTheme.bodyLarge),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: colors.cardColor,
              border: Border.all(color: colors.border),
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
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    final isSelected = selected == text;

    return GestureDetector(
      onTap: () => setState(() => selected = text),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary : BaseColors.transparent,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Text(
          text,
          style: isSelected
              ? textTheme.labelLarge?.copyWith(color: colors.chipSelectedText)
              : textTheme.bodySmall?.copyWith(color: colors.chipUnSelectedText),
        ),
      ),
    );
  }
}