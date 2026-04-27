import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        trailing: showArrow
            ? Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: AppColors.grey,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
