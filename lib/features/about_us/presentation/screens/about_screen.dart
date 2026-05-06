import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:veloura/core/theme/app_colors.dart';

import 'package:veloura/core/widgets/custom_app_bar.dart';

import 'package:veloura/features/profile/presentation/screens/profile_screen.dart';

import '../widgets/hero_section_about.dart';
import '../widgets/info_card_about.dart';
import '../widgets/philosophy_card.dart';
import '../widgets/social_icons_section.dart';

class AboutScreen
    extends StatelessWidget {

  const AboutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final colors =
        context.colors;

    final textTheme =
        Theme.of(context)
            .textTheme;

    return Scaffold(

      backgroundColor:
      colors.background,

      appBar: CustomAppBar(

        leading: IconButton(

          onPressed:
              () {

            Navigator.push(

              context,

              MaterialPageRoute(

                builder:
                    (_) =>
                const ProfileScreen(),
              ),
            );
          },

          icon: Icon(

            Icons
                .arrow_back_ios_new_outlined,

            color:
            colors.textPrimary,
          ),
        ),
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          physics:
          const BouncingScrollPhysics(),

          child: Padding(

            padding:
            EdgeInsets.symmetric(
              horizontal: 20.w,
            ),

            child: Column(

              children: [

                SizedBox(
                  height: 10.h,
                ),

                SizedBox(
                  height: 35.h,
                ),

                /// HERO
                const HeroSectionAbout(),

                SizedBox(
                  height: 30.h,
                ),

                /// DIVIDER
                Divider(

                  thickness: 1,

                  height: 1,

                  color:
                  colors.border,
                ),

                SizedBox(
                  height: 35.h,
                ),

                /// CARD 1
                const InfoCardAbout(

                  icon:
                  Icons
                      .diamond_outlined,

                  title:
                  "Premium Craftsmanship",

                  description:
                  "Meticulous attention to detail by master artisans, ensuring heirloom quality in every setting.",
                ),

                SizedBox(
                  height: 20.h,
                ),

                /// CARD 2
                const InfoCardAbout(

                  icon:
                  Icons
                      .eco_outlined,

                  title:
                  "Ethical Materials",

                  description:
                  "Commitment to sustainability through responsibly sourced gems and recycled precious metals.",
                ),

                SizedBox(
                  height: 20.h,
                ),

                /// CARD 3
                const InfoCardAbout(

                  icon:
                  Icons
                      .auto_awesome_outlined,

                  title:
                  "Timeless Design",

                  description:
                  "An aesthetic language that transcends seasonal trends to remain eternally relevant.",
                ),

                SizedBox(
                  height: 40.h,
                ),

                /// PHILOSOPHY
                const PhilosophyCard(),

                SizedBox(
                  height: 40.h,
                ),

                /// SOCIAL
                const SocialIconsSection(),

                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}