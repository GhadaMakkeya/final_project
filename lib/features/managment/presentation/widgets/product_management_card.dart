import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/features/home/data/models/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductManagementCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onDelete;

  const ProductManagementCard({super.key, required this.product, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.imageUrl,
        width: 50.w,
        height: 50.h,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
      ),
      title: Text(product.name),
      subtitle: Text('\$${product.price}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: BaseColors.alert),
        onPressed: onDelete,
      ),
    );
  }
}