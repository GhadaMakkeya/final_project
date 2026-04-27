import 'package:flutter/material.dart';
import 'package:veloura/features/auth/forget_password/presentation/screens/forget_password.dart';
import 'package:veloura/features/auth/reset_password/presentation/screens/reset_password_screen.dart';
import 'package:veloura/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        double screenWidth = ScreenUtil().screenWidth;
        double screenHeight = ScreenUtil().screenHeight;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home: ForgetPassword(),
        );
      },
    );
  }
}
