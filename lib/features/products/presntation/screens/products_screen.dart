import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/features/products/presntation/widgets/categoey_list.dart';
import 'package:veloura/features/products/presntation/widgets/custom_product_item.dart';
import 'package:veloura/features/products/presntation/widgets/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: colors.primary),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: colors.primary),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_outlined, color: colors.primary),
          ),
          SizedBox(width: 15.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CategoryList(),
            Padding(
              padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 6.h),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: myProducts.length,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
    );
  }
}
