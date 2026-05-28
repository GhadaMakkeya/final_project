import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:veloura/features/home/data/models/product_model.dart';

class ProductsFilteredByCategoryService {
  final Dio dio = Dio();

  Future<List<ProductModel>> getProductsByCategory({String? category}) async {
    try {
      final response = await dio.post(
        "https://accessories-eshop.runasp.net/api/products",
        data: {
          "category": category,
          "searchTerm": null,
          "minPrice": null,
          "maxPrice": null,
          "isInStock": null,
          "sortBy": null,
          "sortOrder": null,
          "page": 1,
          "pageSize": 20,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;

        final List itemsJson = (data is Map && data['items'] != null)
            ? data['items']
            : [];

        return itemsJson.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        log("Fetch Products Status Error: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      log("Fetch Products Error: $e");
      return [];
    }
  }
}
