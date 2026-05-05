import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String date;
  final String comment;
  final int rating;

  const ReviewCard({
    super.key,
    required this.name,
    required this.date,
    required this.comment,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      color: colors.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(color: colors.border, width: 1),
      ),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: textTheme.titleLarge),
                    SizedBox(height: 4.h),
                    Text('Verified Buyer • $date', style: textTheme.bodySmall),
                  ],
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: index < rating ? colors.gold : colors.textTertiary,
                      size: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(comment, style: textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
