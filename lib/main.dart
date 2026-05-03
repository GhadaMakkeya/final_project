import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_theme.dart';
import 'package:veloura/features/auth/login/presentation/screens/login_screen.dart';
import 'package:veloura/features/auth/login/presentation/widgets/login_form.dart';
import 'package:veloura/features/auth/otp/presentation/screens/otp_screen.dart';
import 'package:veloura/features/auth/signup/presentation/screens/sign_up_screen.dart';
import 'package:veloura/features/auth/forget_password/presentation/screens/forget_password.dart';
import 'package:veloura/features/auth/reset_password/presentation/screens/reset_password_screen.dart';
import 'package:veloura/features/category/presentation/screens/category_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/features/home/presentation/screens/home_screen.dart';
import 'package:veloura/features/managment/presentation/screens/add_product_screen.dart';
import 'package:veloura/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:veloura/features/product_details/presentation/screens/product_details_screen.dart';

late double screenWidth;
late double screenHeight;
import 'package:veloura/features/onboarding/presentation/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        screenWidth = ScreenUtil().screenWidth;
        screenHeight = ScreenUtil().screenHeight;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: OnboardingScreen(),
        );
      },
    );
  }
}
