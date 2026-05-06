import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCardAbout extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InfoCardAbout({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(54.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 22.sp,
            color: Colors.grey,
          ),

          SizedBox(height: 16.h),

          Text(
            title,
            style: TextStyle(
              fontSize: 22.sp,
              fontFamily: "Serif",
            ),
          ),

          SizedBox(height: 12.h),

          Text(
            description,
            style: TextStyle(
              fontSize: 16.sp,
              height: 1.6,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}