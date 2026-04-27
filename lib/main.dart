import 'package:flutter/material.dart';
import 'package:veloura/features/add_product/presentation/screens/add_product_screen.dart';
void main() {
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
