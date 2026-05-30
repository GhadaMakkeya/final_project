// ✅ Fix: Replace context.read() with BlocBuilder
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/features/home/presentation/cubits/categery_cubit/category_cubit.dart';
import 'package:veloura/features/home/presentation/cubits/categery_cubit/category_state.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const SizedBox(
              height: 44,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            );
          }

          if (state is CategorySuccess) {
            final categories = state.categories;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: categories.map((category) {
                  return _buildCategoryChip(
                    context,
                    category.name,
                    isSelected: category.name == "Aurelia Pendant",
                  );
                }).toList(),
              ),
            );
          }

          return const SizedBox.shrink();
        },
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
        Navigator.pushNamed(
          context,
          '/category',
          arguments: label,
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
          style: textTheme.labelMedium?.copyWith(
            color: isSelected
                ? colors.chipSelectedText
                : colors.chipUnSelectedText,
          ),
        ),
      ),
    );
  }
}
