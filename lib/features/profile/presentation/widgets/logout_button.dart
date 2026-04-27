import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogoutButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
        side: BorderSide(color: AppColors.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(Icons.logout, color: AppColors.primaryColor, size: 20),
      label: Text(
        AppStrings.logout,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}