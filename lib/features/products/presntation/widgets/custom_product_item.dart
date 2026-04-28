import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import 'package:veloura/features/products/presntation/widgets/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductItem extends StatelessWidget {
  final Product productModel;
  const CustomProductItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.productCardBackground,
      elevation: 0.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1.05,
            child: Stack(
              children: [
                Padding(
                  padding:  EdgeInsets.only(right: 8.w, left: 8.w, top: 8.h),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      image: DecorationImage(
                        image: NetworkImage(productModel.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                if (productModel.label != null)
                  Positioned(
                    top: 8.h,
                    left: 8.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 3.h,
                      ),
                      color: _getLabelColor(productModel.label!),
                      child: Text(
                        productModel.label!,
                        style: AppTextStyles.productBadgeLabel,
                      ),
                    ),
                  ),
                const SizedBox(),
                Positioned(
                  bottom: 8.h,
                  right: 16.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      size: 16.sp,
                      color: AppColors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(right: 12.w, left: 12.w, bottom: 12.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Expanded(
                        child: Text(
                          productModel.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.discoverProductName,
                        ),
                      ),
                    ),
                    Text("4.8", style: AppTextStyles.discoverProductRating),
                  ],
                ),
                 SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(
                      productModel.price,
                      style: AppTextStyles.discoverProductPrice
                    ),
                     SizedBox(width: 8.w),
                    Text(
                      productModel.originalPrice ?? "",
                      style: AppTextStyles.discoverProductOriginalPrice
                    ),
                  ],
                ),
                 SizedBox(height: 12.h),
                 Divider(
                  height: 1.h,
                  thickness: 0.5,
                  color: Color(0xffEEEEEE),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("MIDNIGHT", style: _subTextStyle()),
                        Text("BLUE", style: _subTextStyle()),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LIMITED",
                          style: _subTextStyle(color: const Color(0xffD9534F)),
                        ),
                        Text(
                          "STOCK",
                          style: _subTextStyle(color: const Color(0xffD9534F)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _subTextStyle({Color color = Colors.grey}) {
    return TextStyle(
      color: color,
      fontSize: 8,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
      height: 1.3,
    );
  }

  Color _getLabelColor(String label) {
    if (label == "NEW") {
      return const Color(0xffD9534F);
    } else if (label == "SOLD OUT") {
      return Colors.grey;
    } else {
      return Colors.black;
    }
  }
}
