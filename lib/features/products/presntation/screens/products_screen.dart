import 'package:flutter/material.dart';
import 'package:veloura/features/products/presntation/widgets/categoey_list.dart';
import 'package:veloura/features/products/presntation/widgets/coustem_product_item.dart';
import 'package:veloura/features/products/presntation/widgets/product_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFAF7),
      appBar: AppBar(
        backgroundColor: const Color(0xffFCFAF7),
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "VELOURA",
          style: TextStyle(
            color: Color(0xff061F3D),
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontFamily: 'Serif',
          ),
        ),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.shopping_bag_outlined, color: Colors.black),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
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
      // Bottom Navigation
    );
  }
}
