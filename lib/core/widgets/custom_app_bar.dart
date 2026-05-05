import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({super.key, this.leading, this.actions, this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return AppBar(
      toolbarHeight: 65.h,
      backgroundColor: colors.background,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 64.w,
      title: Text(
        AppStrings.appName,
        style: textTheme.titleLarge?.copyWith(
          letterSpacing: 3.5,
          color: colors.primary,
        ),
      ),
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65.h);
}
