import 'package:flutter/material.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/list_category.dart';
import '../widgets/custom_text.dart';
import '../widgets/product_card.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Responsive.width(context);
    final height = Responsive.height(context);
    final colors = context.colors;

    final crossAxisCount = width > 900 ? 3 : 1;

    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              SizedBox(height: height * 0.02),

              CustomText(
                text: AppStrings.collection,
                fontSize: 12,
                color: colors.textSecondary,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
              ),

              SizedBox(height: height * 0.01),

              CustomText(
                text: AppStrings.jewelry,
                fontSize: 28,
                fontWeight: FontWeight.w400,
                color: colors.textPrimary,
                letterSpacing: 2,
              ),

              SizedBox(height: height * 0.015),
              Divider(thickness: 0.2, color: colors.border),

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
                        color: colors.textSecondary,
                      ),
                      SizedBox(width: width * 0.02),
                      CustomText(
                        text: AppStrings.filter,
                        fontSize: 12,
                        color: colors.textSecondary,
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
                        color: colors.textSecondary,
                      ),
                      SizedBox(width: width * 0.02),
                      CustomText(
                        text: AppStrings.sort,
                        fontSize: 11,
                        color: colors.textSecondary,
                        fontWeight: FontWeight.w500,
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
                fontWeight: FontWeight.w400,
                color: colors.textTertiary,
              ),

              SizedBox(height: height * 0.01),
               Divider(thickness: 0.2, color: colors.border),

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
