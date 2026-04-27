import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:veloura/features/products/presntation/widgets/categoey_list.dart';
import 'package:veloura/features/products/presntation/widgets/coustem_product_item.dart';
import 'package:veloura/features/products/presntation/widgets/product_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2EDE8),
      appBar: AppBar(
        toolbarHeight: 65,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        centerTitle: true,
        backgroundColor: Color(0xffF2EDE8),
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
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.shopping_bag_outlined, color: Colors.black),
          SizedBox(width: 15),
        ],
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailsScreen()),
          );
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CategoryList(),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 2, 6, 6),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: myProducts.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.53,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemBuilder: (context, index) {
                    return CustomProductItem(productModel: myProducts[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation
    );
  }
}
