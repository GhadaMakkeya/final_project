import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import 'package:veloura/main.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/list_category.dart';
import '../widgets/product_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: AppColors.primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.grid_view, color: AppColors.primaryColor),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16.h),
                    Text(
                      AppStrings.collection.toUpperCase(),
                      style: AppTextStyles.productCollectionLabel,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      AppStrings.jewelry,
                      style: AppTextStyles.sectionHeading.copyWith(
                        fontSize: 40.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Divider(thickness: 0.5, color: AppColors.divider),
                    SizedBox(height: 12.h),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.tune, size: 16.sp, color: AppColors.brown),
                          SizedBox(width: 6.w),
                          Text(
                            AppStrings.filter,
                            style: AppTextStyles.settingsSectionLabel,
                          ),
                          SizedBox(width: 24.w),
                          Icon(
                            Icons.swap_vert,
                            size: 16.sp,
                            color: AppColors.brown,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            AppStrings.sort,
                            style: AppTextStyles.settingsSectionLabel,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      AppStrings.itemsCount(categoryList.length),
                      style: AppTextStyles.reviewerMeta,
                    ),
                    SizedBox(height: 12.h),
                    Divider(thickness: 0.5, color: AppColors.divider),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      ProductCard(category: categoryList[index]),
                  childCount: categoryList.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: screenWidth > 600 ? 0.8 : 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
