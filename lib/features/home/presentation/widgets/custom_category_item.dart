import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/features/category/presentation/controller/category_cubit.dart';

import '../../../category/data/models/category_model.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.onTap,
    required this.categoryModel,
    required this.index,
  });

  final CategoryModel categoryModel;
  final VoidCallback onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        final cubit = context.read<CategoryCubit>();
        final isSelected = cubit.selectedIndex == index;

        return GestureDetector(
          onTap: () {
            cubit.selectCategoryByIndex(index);
            onTap();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.only(right: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isSelected ? colors.chipSelectedColor : Colors.transparent,
              border: Border.all(
                color: isSelected ? colors.chipSelectedColor : colors.border,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Center(
              child: Text(
                categoryModel.name,
                style: textTheme.labelMedium?.copyWith(
                  color: isSelected
                      ? colors.chipSelectedText
                      : colors.chipUnSelectedText,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
