import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/features/profile/presentation/screens/profile_screen.dart';
import 'package:veloura/features/profile/presentation/widgets/about_info_card.dart';
import 'package:veloura/features/profile/presentation/widgets/about_philosophy_card.dart';
import 'package:veloura/features/profile/presentation/widgets/hero_section_about.dart';
import '../widgets/social_icons_section.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;


    return Scaffold(
      backgroundColor: colors.background,

      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,

              MaterialPageRoute(builder: (_) =>  ProfileScreen()),
            );
          },

          icon: Icon(
            Icons.arrow_back_ios_new_outlined,

            color: colors.textPrimary,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),

            child: Column(
              children: [
                SizedBox(height: 10.h),

                SizedBox(height: 35.h),

                const HeroSectionAbout(),

                SizedBox(height: 30.h),

                Divider(thickness: 1, height: 1, color: colors.border),

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
