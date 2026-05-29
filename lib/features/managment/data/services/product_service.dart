import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/features/home/data/models/product_model.dart';

class ProductService {
  final Dio _dio;
  final SecureStorageServices _secureStorage = SecureStorageServices();

  ProductService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://accessories-eshop.runasp.net/api',
          ),
        );

  Future<Options> get _authOptions async {
    final token = await _secureStorage.getAccessToken();
    return Options(headers: {'Authorization': 'Bearer $token'});
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _dio.get(
        '/products',
        options: await _authOptions,
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['items']; 
        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      log('Error fetching products: $e', name: 'ProductService');
      throw Exception('Failed to load products');
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      final response = await _dio.delete(
        '/products/$id',
        options: await _authOptions,
      );
      return response.statusCode == 200 || response.statusCode == 204;
    } catch (e) {
      log('Error deleting product: $e', name: 'ProductService');
      return false;
    }
  }
}