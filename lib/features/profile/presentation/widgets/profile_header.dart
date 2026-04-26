import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final VoidCallback onEdit;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 130,
          height: 130,
          child: Stack(
            children: [
              // Main avatar
              CircleAvatar(
                radius: 65,
                backgroundColor: Colors.black26,
                backgroundImage: const NetworkImage(
                  "https://i.pravatar.cc/150?img=3",
                ),
              ),
              // Edit badge
              Positioned(
                bottom: 4,
                right: 4,
                child: GestureDetector(
                  onTap: onEdit,
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.white,
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Text(
          name,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
