import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/list_category.dart';
import '../widgets/custom_text.dart';
import '../widgets/product_card.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Responsive.width(context);
    final height = Responsive.height(context);

    final crossAxisCount = width > 900 ? 3 : 1;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: AppStrings.appName),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              SizedBox(height: height * 0.02),

              CustomText(
                text: AppStrings.collection,
                fontSize: 12,
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),

              SizedBox(height: height * 0.01),

              CustomText(
                text: AppStrings.jewelry,
                fontSize: 28,
                fontWeight: FontWeight.w300,
                color: AppColors.primaryColor,
                letterSpacing: 2,
              ),

              SizedBox(height: height * 0.015),
               Divider(thickness: 0.2),

              SizedBox(height: height * 0.01),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: width * 0.08,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.tune,
                        size: width * 0.05,
                        color: AppColors.brown,
                      ),
                      SizedBox(width: width * 0.02),
                      CustomText(
                        text: AppStrings.filter,
                        fontSize: 12,
                        color: AppColors.brown,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.swap_vert,
                        size: width * 0.05,
                        color: AppColors.brown,
                      ),
                      SizedBox(width: width * 0.02),
                      CustomText(
                        text: AppStrings.sort,
                        fontSize: 12,
                        color: AppColors.brown,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: height * 0.01),

              CustomText(
                text: AppStrings.itemsCount(categoryList.length),
                fontSize: 12,
                color: AppColors.secondaryColor,
              ),

              SizedBox(height: height * 0.01),
               Divider(thickness: 0.2),

              SizedBox(height: height * 0.015),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: height * 0.02),
                  itemCount: categoryList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: width * 0.04,
                    mainAxisSpacing: height * 0.02,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(category: categoryList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
