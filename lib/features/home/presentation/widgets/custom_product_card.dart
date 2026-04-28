import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import 'package:veloura/features/home/data/product_data_model.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/features/product_details/presentation/screens/product_details_screen.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductDetailsScreen();
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8.r),
                    child: Image.network(
                      productDataModel.imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                productDataModel.productName,
                style: AppTextStyles.cardTitle,
              ),
              Text(productDataModel.price, style: AppTextStyles.cardPrice),
            ],
          ),
        ),
      ),
    );
  }
}
