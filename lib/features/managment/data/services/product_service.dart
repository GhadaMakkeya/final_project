import 'package:dio/dio.dart';
import 'package:veloura/features/managment/data/models/product_model.dart'; 

class ProductService {
  final Dio _dio;

  ProductService() : _dio = Dio(
    BaseOptions(
      baseUrl: 'https://accessories-eshop.runasp.net/api',
    ),
  );

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('/products');
      if (response.statusCode == 200) {
        // لازم ندخل جوه الـ items لأن السيرفر باعت Object مش List
        List<dynamic> data = response.data['items']; 
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
      throw Exception('Failed to load products');
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      final response = await _dio.delete('/products/$id');
      return response.statusCode == 200 || response.statusCode == 204;
    } catch (e) {
      return false;
    }
  }
}