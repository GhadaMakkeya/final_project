import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/features/managment/data/models/category_model.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.onTap,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: categoryModel.isSelected
              ? colors.chipSelectedColor
              : Colors.transparent,
          border: Border.all(color: colors.border),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            categoryModel.name,
            style: categoryModel.isSelected
                ? textTheme.labelMedium?.copyWith(
                    color: colors.chipSelectedText,
                  )
                : textTheme.labelMedium?.copyWith(
                    color: colors.chipUnSelectedText,
                  ),
          ),
        ),
      ),
    );
  }
}
