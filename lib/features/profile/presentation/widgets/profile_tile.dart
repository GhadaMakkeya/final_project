import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        color: Color.fromARGB(255, 253, 252, 252),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color.fromARGB(255, 253, 252, 252),
          width: 1.w,
        ),
      ),
      child: ListTile(
        contentPadding:  EdgeInsets.symmetric(horizontal: 20.w),
        title: Text(
          title,
          style:  TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        trailing: showArrow
            ? Icon(
                Icons.arrow_forward_ios,
                size: 14.sp,
                color: AppColors.grey,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
