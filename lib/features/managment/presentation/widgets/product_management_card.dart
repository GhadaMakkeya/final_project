import 'package:flutter/material.dart';
import 'package:veloura/features/managment/data/models/product_model.dart';

class ProductManagementCard extends StatelessWidget {
  final Product product;
  final VoidCallback onDelete;

  const ProductManagementCard({Key? key, required this.product, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.imageUrl,
        width: 50,
        height: 50,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
      ),
      title: Text(product.name),
      subtitle: Text('\$${product.price}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}