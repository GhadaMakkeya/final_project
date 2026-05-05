import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/features/managment/data/models/category_model.dart';
import 'package:veloura/features/managment/data/models/product_model.dart';

class ProductRemoteDataSource {
  final Dio dio;
  final SecureStorageServices secureStorageService;

  ProductRemoteDataSource(this.dio, this.secureStorageService);


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


  Future<List<CategoryModel>> getAllCategories() async {
    final token = await getToken();

    if (token == null || token.isEmpty) {
      log("No valid token found");
      return [];
    }

    try {
      final response = await dio.get(
        'https://accessories-eshop.runasp.net/api/categories',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      final data = response.data;
      final List categoriesJson = (data is Map && data['categories'] != null)
          ? data['categories']
          : [];

      return categoriesJson.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      log("Get Categories Error: $e");
      return [];
    }
  }


  Future<bool> addProduct({
    required ProductModel product,
  }) async {
    final token = await getToken();

    if (token == null || token.isEmpty) {
      throw Exception("Authentication failed. Please log in again.");
    }

    try {
      log("📤 Sending Product Data: ${product.toJson()}");

      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/products',
        data: product.toJson(), 
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      log("Product Added Successfully: ${response.data}");
      return true;
    } on DioException catch (e) {
      log("API Error Status: ${e.response?.statusCode}");
      log("API Error Data: ${e.response?.data}");

      String errorMessage = "Failed to add product";
      final responseData = e.response?.data;

      if (responseData != null && responseData is Map) {
        if (responseData['errors'] != null) {
          final errors = responseData['errors'];
          if (errors is Map && errors.isNotEmpty) {
            var firstErrorList = errors.values.first;
            errorMessage = firstErrorList is List ? firstErrorList[0] : firstErrorList.toString();
          }
        } 
        else if (responseData['message'] != null) {
          errorMessage = responseData['message'].toString();
        }
      } else {
        errorMessage = "Network error: ${e.message}";
      }

      throw Exception(errorMessage);
    } catch (e) {
      log("Unexpected Error: $e");
      throw Exception("An unexpected error occurred.");
    }
  }
}