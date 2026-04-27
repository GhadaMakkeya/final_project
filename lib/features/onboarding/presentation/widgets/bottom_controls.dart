import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomControls extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final VoidCallback onNext;
  final VoidCallback onGetStarted;

  const BottomControls({
    required this.currentPage,
    required this.pageCount,
    required this.onNext,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLast = currentPage == pageCount - 1;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pageCount,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                height: 8,
                width: currentPage == index ? 20.w : 8.w,
                decoration: BoxDecoration(
                  color: currentPage == index
                      ? Color(0xFF1B2A4A)
                      : Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
          ),
           SizedBox(height: 16.h),

          CustomPrimaryButton(
            label: isLast ? 'GET STARTED' : 'NEXT',
            onPressed: isLast ? onGetStarted : onNext,
            height: 54.h,
            width: 350.w,
          ),
        ],
      ),
    );
  }
}
