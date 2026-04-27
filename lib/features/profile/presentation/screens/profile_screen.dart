import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/logout_button.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_tile.dart';
import '../widgets/section_title.dart';
import '../widgets/theme_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 64.w,
        title: Text(AppStrings.appName, style: AppTextStyles.appNameTextStyle),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: AppColors.primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            ProfileHeader(
              name: AppStrings.name,
              email: AppStrings.email,
              onEdit: () {},
            ),
            SizedBox(height: 30.h),
            SectionTitle(title: AppStrings.account),
            SizedBox(height: 8.h),
            ProfileTile(title: AppStrings.changePassword, onTap: () {}),
            SizedBox(height: 24.h),
            SectionTitle(title: AppStrings.preferences),
            SizedBox(height: 8.h),
            ThemeSwitch(),

            SizedBox(height: 24.h),

            SectionTitle(title: AppStrings.information),
            SizedBox(height: 8.h),
            ProfileTile(title: AppStrings.privacyPolicy, onTap: () {}),
            SizedBox(height: 8.h),
            ProfileTile(title: AppStrings.aboutUs, onTap: () {}),
            SizedBox(height: 8.h),
            ProfileTile(title: AppStrings.contactUs, onTap: () {}),

            SizedBox(height: 36.h),

            LogoutButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
