import 'package:flutter/material.dart';
import 'package:veloura/features/category/presentation/screens/category_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/features/onboarding/presentation/screens/onboarding_screen.dart';

late double screenWidth;
late double screenHeight;

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
          theme: ThemeData(),
          home: CategoryScreen(),
        );
      },
    );
  }
}