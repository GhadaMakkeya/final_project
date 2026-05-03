import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

class ProductFeaturesList extends StatelessWidget {
  const ProductFeaturesList({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return Column(
      children: [
        _buildFeatureItem('100% Mulberry Silk', textTheme, colors),
        _buildFeatureItem('90cm x 90cm', textTheme, colors),
        _buildFeatureItem('Dry clean only', textTheme, colors),
      ],
    );
  }

  Widget _buildFeatureItem(String text, TextTheme textTheme, MyColors colors) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline, color: colors.gold, size: 18.sp),
          SizedBox(width: 8.w),
          Text(text, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
