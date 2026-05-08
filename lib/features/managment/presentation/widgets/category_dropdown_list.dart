import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/features/managment/presentation/cubits/categery_cubit/cubit/category_cubit.dart';

class CategoryDropdown extends StatefulWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  @override
  void initState() {
    super.initState();
    // جلب التصنيفات عند بدء تشغيل الـ Widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryCubit>().getAllCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CategoryError) {
          return Center(
            child: Text(
              state.errMessage,
              style: TextStyle(color: Colors.red, fontSize: 13.sp),
            ),
          );
        }

        if (state is CategorySuccess) {
          final categories = state.categories;

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: colors.secondary,
              border: Border.all(color: colors.border, width: 1.2.w),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: widget.value,
                isExpanded: true,
                dropdownColor: colors.secondary,
                borderRadius: BorderRadius.circular(12.r),
                elevation: 3,
                menuMaxHeight: 260.h,
                hint: Row(
                  children: [
                    Icon(Icons.grid_view_rounded,
                        size: 16.sp, color: colors.textSecondary),
                    SizedBox(width: 8.w),
                    Text(
                      'Select a category',
                      style: TextStyle(
                          color: colors.textSecondary, fontSize: 13.sp),
                    ),
                  ],
                ),
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                    color: colors.textSecondary, size: 22.sp),
                // ✅ التعديل هنا: نستخدم المعرف (id) كقيمة والاسم (name) للعرض فقط
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category.id, // هذا ما سيتم إرساله للسيرفر (Guid)
                    child: Text(
                      category.name, // هذا ما يراه المستخدم في القائمة
                      style: TextStyle(
                          fontSize: 13.sp, color: colors.textPrimary),
                    ),
                  );
                }).toList(),
                onChanged: widget.onChanged,
              ),
            ),
          );
        }

        // الحالة الافتراضية
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}