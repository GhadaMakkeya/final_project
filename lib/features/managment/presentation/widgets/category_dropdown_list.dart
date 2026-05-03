import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

const List<String> _kCategories = [
  'Bags & Accessories',
  'Clothing',
  'Footwear',
  'Jewelry',
  'Home & Living',
  'Art & Prints',
];

class CategoryDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: colors.secondary,
        border: Border.all(color: colors.border, width: 1.2.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: colors.secondary,
          borderRadius: BorderRadius.circular(12.r),
          elevation: 3,
          menuMaxHeight: 260.h,
          hint: Row(
            children: [
              Icon(
                Icons.grid_view_rounded,
                size: 16.sp,
                color: colors.textSecondary,
              ),
              SizedBox(width: 8),
              Text(
                'Select a category',
                style: TextStyle(color: colors.textSecondary, fontSize: 13.sp),
              ),
            ],
          ),
          icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              color: BaseColors.transparent,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: colors.textSecondary,
              size: 22.sp,
            ),
          ),
          selectedItemBuilder: (_) => _kCategories
              .map(
                (c) => Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    c,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: colors.textPrimary,
                    ),
                  ),
                ),
              )
              .toList(),
          items: _kCategories.map((c) {
            final isSelected = c == value;
            return DropdownMenuItem(
              value: c,
              child: Row(
                children: [
                  Icon(
                    _categoryIcon(c),
                    size: 16.sp,
                     color: isSelected ? colors.primary : colors.textTertiary,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    c,
                     style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSelected ? colors.textPrimary : colors.textSecondary,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),

          onChanged: onChanged,
        ),
      ),
    );
  }

  IconData _categoryIcon(String category) {
    switch (category) {
      case 'Bags & Accessories':
        return Icons.shopping_bag_outlined;
      case 'Clothing':
        return Icons.checkroom_outlined;
      case 'Footwear':
        return Icons.directions_walk_outlined;
      case 'Jewelry':
        return Icons.diamond_outlined;
      case 'Home & Living':
        return Icons.chair_outlined;
      case 'Art & Prints':
        return Icons.palette_outlined;
      default:
        return Icons.label_outline;
    }
  }
}
