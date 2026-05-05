import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/features/category/presentation/screens/category_screen.dart';

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
            return _buildCategoryChip(
              context,
              name,
              isSelected: name == "COLLECTIONS",
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(
    BuildContext context,
    String label, {
    bool isSelected = false,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryScreen()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? colors.chipSelectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: colors.border),
        ),
        child: Text(
          label,
          style: isSelected
              ? textTheme.labelMedium?.copyWith(color: colors.chipSelectedText)
              : textTheme.labelMedium?.copyWith(
                  color: colors.chipUnSelectedText,
                ),
        ),
      ),
    );
  }
}
