import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Column(
      children: [
        SizedBox(
          width: 130.w,
          height: 130.h,
          child: Stack(
            children: [
              // Main avatar
              Center(
                child: CircleAvatar(
                  radius: 65.r,
                  backgroundColor: Colors.black26,
                  backgroundImage: const NetworkImage(
                    "https://i.pravatar.cc/150?img=3",
                  ),
                ),
              ),
              Positioned(
                bottom: 10.h,
                right: 10.w,
                child: GestureDetector(
                  onTap: onEdit,
                  child: Container(
                    width: 36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: colors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: colors.background, width: 2.w),
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 16.sp,
                      color: colors.background,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 14.h),
        Text(name, style: textTheme.headlineSmall),
        SizedBox(height: 4.h),
        Text(email, style: textTheme.bodyMedium),
      ],
    );
  }
}
