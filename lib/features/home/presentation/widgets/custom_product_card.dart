import 'package:flutter/material.dart';
import 'package:veloura/features/home/data/models/product_model.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/features/product_details/presentation/screens/product_details_screen.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailsScreen(product: product),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: .9,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8.r),
                    child: Image.network(
                      product.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleLarge,
              ),
              Text(
                "\$${product.price}",
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
