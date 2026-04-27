import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/theme/app_text_styles.dart';

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
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color:  const Color.fromARGB(255, 251, 247, 247),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Color.fromARGB(255, 121, 95, 68), width: 1), 
      ),
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
                  Text(
                    name,
                    style: AppTextStyles.font16InterRegular.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF001F3F), 
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Verified Buyer • $date',
                    style: AppTextStyles.font16InterRegular.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xFF757575),
                    ),
                  ),
                ],
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: const Color(0xFF001F3F), 
                    size: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            comment,
            style: AppTextStyles.font16InterRegular.copyWith(
              fontSize: 14.sp,
              height: 1.5,
              color: const Color(0xFF4E4639),
            ),
          ),
        ],
      ),
    );
  }
}