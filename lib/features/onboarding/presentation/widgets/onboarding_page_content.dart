import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/features/onboarding/domain/models/onboarding_page_model.dart';
import 'package:flutter/material.dart';

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
    return Image.asset(page.imageUrl, fit: BoxFit.cover, );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          _buildImage(),
          const SizedBox(height: 36),
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
                      style: const TextStyle(
                        fontFamily: AppFontFamilies.georgia,
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        height: 1.15,
                        letterSpacing: -0.5,
                        color: Color(0xFF1B2A4A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      page.subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        height: 1.65,
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
