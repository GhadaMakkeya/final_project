import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/theme/app_text_styles.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "COLLECTIONS",
      "MAKEUP",
      "FINE JEWELRY",
      "PERFUMES",
      "ACCESSORIES",
      "SHOES",
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: categories.map((name) {
            return _buildCategoryChip(name, isSelected: name == "COLLECTIONS");
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.chipSelected : Colors.transparent,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: AppColors.divider),
      ),
      child: Text(
        label,
        style: isSelected
            ? AppTextStyles.chipLabelSelected
            : AppTextStyles.chipLabelUnselected,
      ),
    );
  }
}
