import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:veloura/features/onboarding/presentation/screens/onboarding_screen.dart';

import 'features/cart/presentation/screens/shopping_cart_screen.dart';
void main() {
 // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  
 // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home:  OnboardingScreen(),
    );
  }
}
