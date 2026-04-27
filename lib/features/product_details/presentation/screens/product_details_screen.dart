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
      backgroundColor: Color(0xffF2EDE8),
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
                        style: AppTextStyles.font16InterRegular.copyWith(
                          color: const Color(0xFF7F7667),
                          fontSize: 11.sp,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Midnight Bloom Silk\nScarf',
                        style: AppTextStyles.font32NotoSerifRegular.copyWith(
                          fontSize: 28.sp,
                          height: 1.2,
                          color: const Color(0xFF061F3D),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        '\$345.00',
                        style: AppTextStyles.font16InterRegular.copyWith(
                          color: const Color(0xFF4E4639),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: const Color(0xFF061F3D),
                                size: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '(24 Reviews)',
                            style: AppTextStyles.font16InterRegular.copyWith(
                              color: const Color(0xFF7F7667),
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Woven from the finest mulberry silk, the Midnight Bloom scarf features a meticulously hand-rolled hem and an exclusive archival floral print. Its generous proportions allow for versatile styling, offering an effortless touch of evening elegance to any ensemble.',
                        style: AppTextStyles.font16InterRegular.copyWith(
                          height: 1.6,
                          fontSize: 14.sp,
                          color: const Color(0xFF4E4639),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      const ProductFeaturesList(),
                      SizedBox(height: 32.h),
                      const Divider(color: Color(0xFFE4E2E2), thickness: 1),
                      SizedBox(height: 32.h),
                      Text(
                        'Reviews',
                        style: AppTextStyles.font32NotoSerifRegular.copyWith(
                          fontSize: 24.sp,
                          color: const Color(0xFF061F3D),
                        ),
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
                        color: Color(0xffF2EDE8),
                        buttonTextColor: AppColors.primary,
                      ),
                      SizedBox(height: 100.h),
                      CustomPrimaryButton(
                        onPressed: () {},
                        label: "ADD TO CART",
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
