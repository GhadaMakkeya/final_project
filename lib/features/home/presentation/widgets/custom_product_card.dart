import 'package:flutter/material.dart';
import 'package:veloura/features/home/data/product_data_model.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    child: Image.network(
                      productDataModel.imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                productDataModel.productName,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff1E1B16),
                  fontFamily: AppFontFamilies.georgia,
                ),
              ),

              Text(
                productDataModel.price,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff565E77),
                  fontFamily: AppFontFamilies.georgia,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
