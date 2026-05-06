import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhilosophyCard extends StatelessWidget {
  const PhilosophyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 60.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Text(
            '"Jewelry is not\nsimply an accessory\n— it is a reflection of\nidentity."',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26.sp,
              height: 1.4,
              fontFamily: "Serif",
            ),
          ),

          SizedBox(height: 40.h),

          Container(
            width: 60.w,
            height: 1,
            color: Colors.grey.shade400,
          ),

          SizedBox(height: 12.h),

          Text(
            "THE PHILOSOPHY",
            style: TextStyle(
              fontSize: 11.sp,
              letterSpacing: 2,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}