import 'package:flutter/material.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/features/auth/login/presentation/screens/login_screen.dart';
import 'package:veloura/features/cart/presentation/screens/shopping_cart_screen.dart';
import 'package:veloura/features/profile/presentation/screens/contact_us_screen.dart';
import 'package:veloura/features/managment/presentation/screens/add_product_screen.dart';
import 'package:veloura/features/managment/presentation/screens/management_screen.dart';
import 'package:veloura/features/profile/presentation/screens/about_us_screen.dart';
import 'package:veloura/features/profile/presentation/screens/privacy_page.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/logout_button.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_tile.dart';
import '../widgets/section_title.dart';
import '../widgets/theme_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    String? firstName;
    String? lastName;
    String? email;
    final storage = SecureStorageServices();
    Future<void> loadUserData() async {
      firstName = await storage.read(key: 'firstName');
      lastName = await storage.read(key: 'lastName');
      email = await storage.read(key: 'email');

      setState(() {});
    }

    @override
    void initState() {
      super.initState();
      loadUserData();
    }

    final colors = context.colors;
    final padding = MediaQuery.of(context).size.width * 0.05;

    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: colors.primary),
        ),
        actions: [
         IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCartScreen()));
            },
            icon: Icon(Icons.shopping_bag_outlined, color: colors.primary),
          ),
        ],
        title: AppStrings.appName,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            ProfileHeader(
              name: "${firstName ?? ''} ${lastName ?? ''}",
              email: email ?? '',
              onEdit: () {},
            ),
            SizedBox(height: 30.h),
            SectionTitle(title: AppStrings.account),
            SizedBox(height: 8.h),
            ProfileTile(title: AppStrings.changePassword, onTap: () {}),
            SizedBox(height: 24.h),
            SectionTitle(title: AppStrings.preferences),
            SizedBox(height: 8.h),
            const ThemeSwitch(),
            SizedBox(height: 24.h),
            SectionTitle(title: AppStrings.information),
            SizedBox(height: 8.h),
            ProfileTile(title: AppStrings.privacyPolicy, onTap: () {}),
            SizedBox(height: 8.h),
            ProfileTile(
              title: AppStrings.aboutUs,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AboutScreen()),
                );
              },
            ),
            SizedBox(height: 8.h),
            ProfileTile(
              title: AppStrings.contactUs,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ContactUsScreen()),
                );
              },
            ),
            SizedBox(height: 24.h),
            SectionTitle(title: 'Seller Tools'),
            SizedBox(height: 8.h),
            ProfileTile(
              title: AppStrings.privacyPolicy,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PrivacyPolicyScreen()),
                );
              },
            ),
            SizedBox(height: 8.h),
            ProfileTile(
              title: AppStrings.aboutUs,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AboutScreen()),
                );
              },
            ),
            SizedBox(height: 8.h),
            ProfileTile(
              title: AppStrings.contactUs,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ContactUsScreen()),
                );
              },
            ),
            SizedBox(height: 20.h),
            ProfileTile(
              title: "Add Product",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddNewProductScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 8.h),
            ProfileTile(
              title: 'Manage Products',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManagementScreen()),
                );
              },
            ),
            SizedBox(height: 36.h),
            LogoutButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
