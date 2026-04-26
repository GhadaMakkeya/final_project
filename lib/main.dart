import 'package:veloura/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:veloura/features/onboarding/presentation/shopping_cart_screen.dart';
import 'package:veloura/features/products/presentation/screens/add_product_screen.dart';
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: AddNewProductScreen(),
    );
  }
}
