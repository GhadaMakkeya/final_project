import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_text_styles.dart';

import '../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMenuTap;
  final VoidCallback? onCartTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onMenuTap,
    this.onCartTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: AppColors.primaryColor),
        onPressed: onMenuTap,
      ),
      title: Text(title, style: AppTextStyles.appNameTextStyle),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.shopping_bag_rounded,
            color: AppColors.primaryColor,
          ),
          onPressed: onCartTap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
