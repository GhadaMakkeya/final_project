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
    return Column(
      children: [
        SizedBox(
          width: 130.w,
          height: 130.h,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 65.r,
                backgroundColor: Colors.black26,
                backgroundImage: const NetworkImage(
                  "https://i.pravatar.cc/150?img=3",
                ),
              ),
              Positioned(
                bottom: 4.h,
                right: 4.w,
                child: GestureDetector(
                  onTap: onEdit,
                  child: Container(
                    width: 34.w,
                    height: 34.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.white,
                        width: 2.w,
                      ),
                    ),
                    child:  Icon(
                      Icons.edit,
                      size: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
         SizedBox(height: 14.h),
        Text(
          name,
          style:  TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            letterSpacing: 0.5,
          ),
        ),
         SizedBox(height: 4.h),
        Text(
          email,
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
