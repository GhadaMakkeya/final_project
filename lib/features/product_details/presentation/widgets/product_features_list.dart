import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_text_styles.dart';

class ProductFeaturesList extends StatelessWidget {
  const ProductFeaturesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFeatureItem('100% Mulberry Silk'),
        _buildFeatureItem('90cm x 90cm'),
        _buildFeatureItem('Dry clean only'),
      ],
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline, color: const Color(0xFFA68A6B), size: 18.sp),
          SizedBox(width: 8.w),
          Text(
            text,
            style: AppTextStyles.productSpecItem
          ),
        ],
      ),
    );
  }
}