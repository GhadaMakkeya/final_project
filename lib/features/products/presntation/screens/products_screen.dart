import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import 'package:veloura/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:veloura/features/products/presntation/widgets/categoey_list.dart';
import 'package:veloura/features/products/presntation/widgets/custom_product_item.dart';
import 'package:veloura/features/products/presntation/widgets/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 65.h,
        elevation: 0,
        leading: const Icon(Icons.menu, color: AppColors.black),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        leadingWidth: 64.w,
        title: Text(AppStrings.appName, style: AppTextStyles.appNameTextStyle),
        actions: [
          Icon(Icons.search, color: AppColors.black),
          SizedBox(width: 15.w),
          Icon(Icons.shopping_bag_outlined, color: AppColors.black),
          SizedBox(width: 15.w),
        ],
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailsScreen()),
          );
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CategoryList(),
              Padding(
                padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 6.h),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: myProducts.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.53,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemBuilder: (context, index) {
                    return CustomProductItem(productModel: myProducts[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation
    );
  }
}
