import 'package:flutter/material.dart';
import 'package:veloura/features/home/data/models/product_model.dart';

class ProductSearchDelegate extends SearchDelegate {
  final List<ProductModel> allProducts;

  ProductSearchDelegate({required this.allProducts});

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final suggestions = allProducts.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final product = suggestions[index];
        return ListTile(
          leading: Image.network(
            product.imageUrl,
            width: 50,
            errorBuilder: (c, e, s) => const Icon(Icons.image),
          ),
          title: Text(product.name),
          subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
          onTap: () {
            close(context, null);
          },
        );
      },
    );
  }
}