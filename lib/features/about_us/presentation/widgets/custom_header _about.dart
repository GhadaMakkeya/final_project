import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

  class CustomHeaderAbout extends StatelessWidget {
  const CustomHeaderAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu, size: 22.sp),

        Text(
          "Veloura",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "Serif",
          ),
        ),

        Icon(Icons.shopping_bag_outlined, size: 22.sp),
      ],
    );
  }
}