import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/constants/app_strings.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSkip;
  const OnboardingAppBar({super.key, required this.onSkip});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 64,
      title: Text(
        AppStrings.appName,
        style: const TextStyle(
          fontFamily: AppFontFamilies.georgia,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 4,
          color: Color(0xFF1A1A1A),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap: onSkip,
            child: const Center(
              child: Text(
                'SKIP',
                style: TextStyle(
                  fontSize: 12,
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
