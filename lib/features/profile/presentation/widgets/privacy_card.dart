import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const PrivacyCard({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFE5E0DA).withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFFE8EAF6),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Icon(icon, color: const Color(0xFF5C6BC0), size: 22.sp),
          ),
          SizedBox(height: 15.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: 'Georgia',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            body,
            style: TextStyle(
              fontSize: 13.sp,
              color: const Color(0xFF7A7570),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
