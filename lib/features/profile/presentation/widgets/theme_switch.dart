import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/theme_cubit.dart';
import 'package:veloura/core/theme/theme_states.dart';

import '../../../../core/theme/app_colors.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    final isDark = context.watch<ThemeCubit>().state is DarkTheme;

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
              Icon(
                Icons.wb_sunny_outlined,
                size: 18.sp,
                color: colors.textSecondary,
              ),
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
              children: [
                _item(
                  context: context,
                  text: "Light",
                  selected: !isDark,
                  onTap: () => context.read<ThemeCubit>().setLight(),
                ),
                _item(
                  context: context,
                  text: "Dark",
                  selected: isDark,
                  onTap: () => context.read<ThemeCubit>().setDark(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _item({
    required BuildContext context,
    required String text,
    required bool selected,
    required VoidCallback onTap,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    final isSelected = selected == text;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected ? colors.primary : BaseColors.transparent,
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
