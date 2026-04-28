import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import 'package:veloura/features/category/data/models/category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback? onTap;

  ProductCard({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    category.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16.r,
                    child: Icon(
                      Icons.favorite_border,
                      color: AppColors.brown,
                      size: 16.sp,
                    ),
                  ),
                ),
                if (category.isNew)
                  Positioned(
                    bottom: 10.h,
                    left: 10.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      color: AppColors.newBadge,
                      child: Text("NEW ARRIVAL", style: AppTextStyles.productBadgeLabel),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(category.name, style: AppTextStyles.productName.copyWith(fontSize: 24.sp)),
              Text("\$${category.price}", style: AppTextStyles.productPrice),
            ],
          ),
          SizedBox(height: 2.h),
          Text(category.subtitle, style: AppTextStyles.reviewerMeta.copyWith(fontSize: 14.sp)),
          SizedBox(height: 10.h)
        ],
      ),
    );
  }
}