import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/features/cart/data/models/cart_item_model.dart';

class CartRemoteDataSource {
  final Dio dio;
  final SecureStorageServices secureStorageService;

  CartRemoteDataSource(this.dio, this.secureStorageService);

  Future<String?> getToken() async {
    final accessToken = await secureStorageService.getAccessToken();
    final refreshToken = await secureStorageService.getRefreshToken();
    final expiresAt = await secureStorageService.getExpiresAt();

  log('AccessToken: $accessToken', name: 'TOKEN');
  log('ExpiresAt: $expiresAt', name: 'TOKEN');
  log('Now: ${DateTime.now().toUtc()}', name: 'TOKEN');
  log('IsExpired: ${expiresAt?.isBefore(DateTime.now().toUtc())}', name: 'TOKEN');

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

  Future<void> addToCart(String productId, int quantity) async {
    final token = await getToken();
    try {
      await dio.post(
        'https://accessories-eshop.runasp.net/api/cart/items',
        data: {'productId': productId, 'quantity': quantity},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
    } on DioException catch (e) {
      String errMessage = e.response?.data['message'] ?? 'Failure';
      throw Exception(errMessage);
    }
  }

  Future<List<CartItemModel>> getCart() async {
    final token = await getToken();

    if (token == null || token.isEmpty) {
      log("No valid token found");
      return [];
    }
    try {
      log('Starting getCart request...', name: 'CART');

      final response = await dio.get(
        'https://accessories-eshop.runasp.net/api/cart',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      log('Status: ${response.statusCode}', name: 'CART');
      log('Type: ${response.data.runtimeType}', name: 'CART');
      log('Data: ${response.data}', name: 'CART');

      log(response.data.toString(), name: 'CART RESPONSE');

      final List cartItems = response.data is List
          ? response.data
          : response.data['cartItems'];
      log(response.data.runtimeType.toString(), name: 'CART TYPE');
      log(response.data.toString(), name: 'CART RESPONSE');

      return cartItems.map((e) => CartItemModel.fromJson(e)).toList();
    } on DioException catch (e) {
      String errMessage = e.response?.data['message'] ?? 'Failure';
      throw Exception(errMessage);
    } on Exception catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> updatedItem(String itemId, int quantity) async {
    final token = await getToken();
    try {
      await dio.put(
        'https://accessories-eshop.runasp.net/api/cart/items/$itemId',
        data: {'id': itemId, 'quantity': quantity},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
    } on DioException catch (e) {
      String errMessage = e.response?.data['message'] ?? 'Failure';
      throw Exception(errMessage);
    }
  }

  Future<void> decrementItem(String itemId) async {
    final token = await getToken();
    try {
      await dio.post(
        'https://accessories-eshop.runasp.net/api/cart/items/decrement',
        data: {'itemId': itemId, 'quantity': 1},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
    } on DioException catch (e) {
      String errMessage = e.response?.data['message'] ?? 'Failure';
      throw Exception(errMessage);
    }
  }

  Future<void> removeItem(String itemId) async {
    final token = await getToken();
    try {
      await dio.delete(
        'https://accessories-eshop.runasp.net/api/cart/items/$itemId',
        data: {'id': itemId},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
    } on DioException catch (e) {
      String errMessage = e.response?.data['message'] ?? 'Failure';
      throw Exception(errMessage);
    }
  }
}