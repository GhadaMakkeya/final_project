import 'package:flutter/material.dart';
import 'package:veloura/features/home/data/category_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.categoryData,
    required this.onTap,
  });
  final CategoryData categoryData;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: categoryData.isSelected
              ? Color(0xff1E1B16)
              : Colors.transparent,
          border: Border.all(color: Color(0xffD1C5B4)),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          categoryData.categoryName,
          style: TextStyle(
            color: categoryData.isSelected ? Colors.white : Color(0xff4E4639),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
