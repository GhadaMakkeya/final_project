import 'package:veloura/core/theme/app_colors.dart';
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

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
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
                      style: textTheme.headlineLarge?.copyWith(fontSize: 42,),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      page.subtitle,
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colors.textSecondary,
                        height: 2,
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
