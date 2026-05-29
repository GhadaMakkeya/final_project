import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/features/home/data/models/category_model.dart';
import 'package:veloura/features/home/presentation/cubits/categery_cubit/category_cubit.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: context.read<CategoryCubit>().selectedIndex == index
              ? colors.chipSelectedColor
              : Colors.transparent,
          border: Border.all(color: colors.border),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            categoryModel.name,
            style: context.read<CategoryCubit>().selectedIndex == index
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