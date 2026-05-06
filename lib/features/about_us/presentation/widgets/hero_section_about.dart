import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroSectionAbout extends StatelessWidget {
  const HeroSectionAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "HERITAGE",
          style: TextStyle(
            fontSize: 12.sp,
            letterSpacing: 2,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: 20.h),

        Text(
          "Veloura is a luxury\njewelry house dedicated\nto timeless craftsmanship,\nrefined elegance, and\nmodern sophistication.\nEvery collection is\ndesigned to celebrate\nindividuality and\nconfidence.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.sp,
            height: 1.5,
            fontFamily: "Serif",
          ),
        ),
      ],
    );
  }
}