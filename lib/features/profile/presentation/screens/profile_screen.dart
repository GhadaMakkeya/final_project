import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/logout_button.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_tile.dart';
import '../widgets/section_title.dart';
import '../widgets/theme_switch.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
      backgroundColor: Color(0xffF2EDE8),
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Color(0xffF2EDE8),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 64,
        title: Text(
          AppStrings.appName,
          style: const TextStyle(
            fontFamily: AppFontFamilies.georgia,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 4,
            color: Color(0xFF1A1A1A),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: AppColors.primary),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_outlined, color: AppColors.primary),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          children: [
            SizedBox(height: 20),
            ProfileHeader(
              name: AppStrings.name,
              email: AppStrings.email,
              onEdit: () {},
            ),
            SizedBox(height: 30),
            SectionTitle(title: AppStrings.account),
            SizedBox(height: 8),
            ProfileTile(title: AppStrings.changePassword, onTap: () {}),
            SizedBox(height: 24),
            SectionTitle(title: AppStrings.preferences),
            SizedBox(height: 8),
            ThemeSwitch(),

            SizedBox(height: 24),

            SectionTitle(title: AppStrings.information),
            SizedBox(height: 8),
            ProfileTile(title: AppStrings.privacyPolicy, onTap: () {}),
            SizedBox(height: 8),
            ProfileTile(title: AppStrings.aboutUs, onTap: () {}),
            SizedBox(height: 8),
            ProfileTile(title: AppStrings.contactUs, onTap: () {}),

            SizedBox(height: 36),

            LogoutButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
