import 'package:flutter/material.dart';
import 'package:veloura/features/managment/presentation/screens/add_product_screen.dart';
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
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {

        return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home:  AddNewProductScreen(),
        );
      }
    );
  }
}