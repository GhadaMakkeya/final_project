import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/features/onboarding/domain/models/onboarding_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingPageModel page;
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  const OnboardingPageContent({
    super.key,
    required this.page,
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  Widget _buildImage() {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(page.imageUrl, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          SizedBox(
            height: 300.h,
            width: double.infinity,
            child: Image.asset(page.imageUrl, fit: BoxFit.cover),
          ),
           SizedBox(height: 36.h),
          Expanded(
            flex: 3,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: SlideTransition(
                position: slideAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      page.title,
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                        fontFamily: AppFontFamilies.georgia,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.15.h,
                        letterSpacing: -0.5,
                        color: Color(0xFF1B2A4A),
                      ),
                    ),
                     SizedBox(height: 16.h),
                    Text(
                      page.subtitle,
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        height: 2.h,
                        letterSpacing: 0.2,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
