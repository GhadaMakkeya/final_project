import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/features/home/data/models/product_model.dart';

class ProductService {
   final Dio dio;
  final SecureStorageServices secureStorageService;

  ProductService(this.dio, this.secureStorageService);

  Future<String?> getToken() async {
    final accessToken = await secureStorageService.getAccessToken();
    final refreshToken = await secureStorageService.getRefreshToken();
    final expiresAt = await secureStorageService.getExpiresAt();

    if (accessToken != null &&
        accessToken.isNotEmpty &&
        expiresAt != null &&
        expiresAt.isAfter(DateTime.now().toUtc())) {
      return accessToken;
    }

    if (refreshToken == null) return null;
    return await _refreshToken(refreshToken);
  }

  Future<String?> _refreshToken(String refreshToken) async {
    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/refresh-token',
        data: {"refreshToken": refreshToken, "useCookies": false},
      );

      final newAccessToken = response.data['accessToken'];
      final newRefreshToken = response.data['refreshToken'];
      final newExpiresAt = response.data['expiresAtUtc'];

      await secureStorageService.saveAuthData(
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
        expiresAt: DateTime.parse(newExpiresAt),
      );

      return newAccessToken;
    } catch (e) {
      log("Refresh Token Error: $e");
      return null;
    }
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('/products');
      if (response.statusCode == 200) {
        // لازم ندخل جوه الـ items لأن السيرفر باعت Object مش List
        List<dynamic> data = response.data['items'];
        return data.map((json) => ProductModel.fromJson(json)).toList();
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
      final response = await dio.delete('/products/$id');
      return response.statusCode == 200 || response.statusCode == 204;
    } catch (e) {
      return false;
    }
  }
}
