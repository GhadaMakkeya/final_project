import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/features/profile/presentation/screens/profile_screen.dart';

import '../widgets/hero_section_about.dart';
import '../widgets/info_card_about.dart';
import '../widgets/philosophy_card.dart';
import '../widgets/social_icons_section.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox(height: 10.h),

                SizedBox(height: 35.h),

                const HeroSectionAbout(),

                SizedBox(height: 30.h),

                Divider(thickness: 1, height: 1, color: Colors.grey.shade300),

                SizedBox(height: 35.h),

                const InfoCardAbout(
                  icon: Icons.diamond_outlined,
                  title: "Premium Craftsmanship",
                  description:
                      "Meticulous attention to detail by master artisans, ensuring heirloom quality in every setting.",
                ),

                SizedBox(height: 20.h),

                const InfoCardAbout(
                  icon: Icons.eco_outlined,
                  title: "Ethical Materials",
                  description:
                      "Commitment to sustainability through responsibly sourced gems and recycled precious metals.",
                ),

                SizedBox(height: 20.h),

                const InfoCardAbout(
                  icon: Icons.auto_awesome_outlined,
                  title: "Timeless Design",
                  description:
                      "An aesthetic language that transcends seasonal trends to remain eternally relevant.",
                ),

                SizedBox(height: 40.h),

                const PhilosophyCard(),

                SizedBox(height: 40.h),

                const SocialIconsSection(),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
