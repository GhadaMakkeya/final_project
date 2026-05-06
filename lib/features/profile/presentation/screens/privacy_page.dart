import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/features/profile/presentation/widgets/concierge_section.dart';
import 'package:veloura/features/profile/presentation/widgets/privacy_card.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F0),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy at\nVeloura',
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Georgia',
                color: const Color(0xFF1A1A2E),
              ),
            ),
            SizedBox(height: 16.h),
            const Text(
              'At Veloura, we understand that discretion is the ultimate luxury.',
              style: TextStyle(color: Color(0xFF7A7570), height: 1.75),
            ),
            SizedBox(height: 28.h),
            const PrivacyCard(
              icon: Icons.shield_outlined,
              title: 'Data Collection',
              body:
                  'We collect only essential details required for your journey.',
              variant: CardVariant.light,
            ),
            SizedBox(height: 16.h),
            const PrivacyCard(
              icon: Icons.lock_outline,
              title: 'Fortified Security',
              body:
                  'Utilizing military-grade encryption to safeguard your data.',
              variant: CardVariant.dark,
            ),
            SizedBox(height: 28.h),
            const ConciergeSection(),
          ],
        ),
      ),
    );
  }
}
