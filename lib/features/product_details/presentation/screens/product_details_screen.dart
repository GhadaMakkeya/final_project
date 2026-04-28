import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../widgets/review_card.dart';
import '../widgets/product_features_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/scarf.png',
                      height: 400.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 8.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCircleIcon(Icons.arrow_back),
                            Row(
                              children: [
                                _buildCircleIcon(Icons.favorite_border),
                                SizedBox(width: 8.w),
                                _buildCircleIcon(Icons.ios_share),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 24.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HERITAGE COLLECTION',
                        style: AppTextStyles.productCollectionLabel
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Midnight Bloom Silk\nScarf',
                        style: AppTextStyles.productDetailName
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        '\$345.00',
                        style: AppTextStyles.productDetailPrice
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: AppColors.primaryColor,
                                size: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '(24 Reviews)',
                            style: AppTextStyles.productSpecItem
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Woven from the finest mulberry silk, the Midnight Bloom scarf features a meticulously hand-rolled hem and an exclusive archival floral print. Its generous proportions allow for versatile styling, offering an effortless touch of evening elegance to any ensemble.',
                        style: AppTextStyles.productDescription
                      ),
                      SizedBox(height: 20.h),
                      const ProductFeaturesList(),
                      SizedBox(height: 32.h),
                      const Divider(color: Color(0xFFE4E2E2), thickness: 1),
                      SizedBox(height: 32.h),
                      Text(
                        'Reviews',
                        style: AppTextStyles.reviewsSectionTitle
                      ),
                      SizedBox(height: 20.h),
                      const ReviewCard(
                        name: 'Eleanor V.',
                        date: 'Oct 12, 2023',
                        rating: 5,
                        comment:
                            'Absolutely exquisite. The silk has a substantial weight to it that drapes beautifully, and the colors are even richer in person than in the photos.',
                      ),
                      const ReviewCard(
                        name: 'Sophia L.',
                        date: 'Sep 28, 2023',
                        rating: 4,
                        comment:
                            'A lovely piece, though slightly smaller than I anticipated. The hand-rolled edges are a testament to the craftsmanship.',
                      ),
                      SizedBox(height: 16.h),
                      CustomPrimaryButton(
                        onPressed: () {},
                        label: "Read All Reviews",
                        color: AppColors.backgroundColor,
                        buttonTextColor: AppColors.primaryColor,
                        letterSpacing: 0.5,
                      ),
                      SizedBox(height: 100.h),
                      CustomPrimaryButton(
                        onPressed: () {},
                        label: "ADD TO CART",
                        letterSpacing: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20.sp, color: const Color(0xFF061F3D)),
    );
  }
}
