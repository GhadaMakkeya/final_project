import 'package:flutter/material.dart';
import 'package:veloura/core/widgets/custom_bottom_nav_bar.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/list_category.dart';
import '../widgets/custom_text.dart';
import '../widgets/product_card.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: AppStrings.appName),
      body: SafeArea(
        child: ListView(

          children: [
            SizedBox(height: 10),
            CustomText(
              text: AppStrings.collection,
              fontSize: 12,
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),

            SizedBox(height: 10),
            CustomText(
              text: AppStrings.jewelry,
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: AppColors.primaryColor,
              letterSpacing: 2,
            ),

            SizedBox(height: 10),

            Divider(thickness: 0.2, indent: 10, endIndent: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.tune, color: AppColors.brown, size: 16),
                SizedBox(width: 10),

                CustomText(
                  text: AppStrings.filter,
                  fontSize: 12,
                  color: AppColors.brown,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),

                SizedBox(width: 30),
                Icon(Icons.swap_vert, color: AppColors.brown, size: 16),
                SizedBox(width: 10),
                CustomText(
                  text: AppStrings.sort,
                  fontSize: 12,
                  color: AppColors.brown,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomText(
              text: AppStrings.itemsCount(24),
              fontSize: 12,
              color: AppColors.secondaryColor,
            ),

            Divider(thickness: 0.2, indent: 10, endIndent: 10),

            SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              itemCount: categoryList.length,
              separatorBuilder: (_, __) => SizedBox(height: 20),
              itemBuilder: (context, index) {
                return ProductCard(category: categoryList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
