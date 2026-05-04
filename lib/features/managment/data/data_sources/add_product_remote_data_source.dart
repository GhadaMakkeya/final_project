import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/features/category/data/models/category_model.dart';
import 'package:veloura/features/managment/data/models/product_model.dart';

class ProductRemoteDataSource {
  final Dio dio;
  ProductRemoteDataSource(this.dio);
  List<CategoryModel> categories = [];
  final SecureStorageServices secureStorageService = SecureStorageServices();

  Future<String?> getToken() async {
    final String? accessToken = await secureStorageService.getAccessToken();
    final String? refreshToken = await secureStorageService.getRefreshToken();
    final DateTime? expiresAt = await secureStorageService.getExpiresAt();

    if (accessToken != null &&
        expiresAt != null &&
        expiresAt.isAfter(DateTime.now().toUtc())) {
      return accessToken;
    } if(refreshToken == null){
         return null;
    }
    return await getNewToken(refreshToken);
  }

  Future getNewToken(String refreshToken) async {
    final response = await dio.get(
      "https://accessories-eshop.runasp.net/api/auth/refresh-token",
      data: {"refreshToken": refreshToken},
    );
    final newAccessToken = response.data['accessToken'];
    final newRefreshToken = response.data['refreshToken'];
    final newExpiresAt = response.data['expiresAt'];
    secureStorageService.saveAuthData(
      accessToken: newAccessToken,
      refreshToken: newRefreshToken,
      expiresAt: DateTime.parse(newExpiresAt),
    );
  }

  Future<void> getAllCategories() async {
    final accessToken = getToken();
    try {
      final response = await dio.get(
        'https://accessories-eshop.runasp.net/api/categories',
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      );

      categories = response.data['categories'];
      log('Categories: $categories');
    } on DioException catch (e) {
      log('Error: ${e.response?.statusCode}');
      log('Message: ${e.response?.data}');
    } catch (e) {
      log('Unexpected error: $e');
    }
  }
}
