import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/features/cart/data/models/cart_item_model.dart';

class CartRemoteDataSource {
  final Dio dio;
  final SecureStorageServices secureStorage;

  CartRemoteDataSource(this.dio, this.secureStorage);

  Future<Options> get _authOptions async {
    final token = await secureStorage.getAccessToken();
    return Options(headers: {'Authorization': 'Bearer $token'});
  }

  Future<List<CartItemModel>> getCart() async {
    try {
      final response = await dio.get(
        'https://accessories-eshop.runasp.net/api/cart',
        options: await _authOptions,
      );
      log(response.data.toString(), name: 'CART RESPONSE');

      final List cartItems = response.data['cartItems'];
      return cartItems.map((e) => CartItemModel.fromJson(e)).toList();
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'Failed to load cart';
      throw Exception(message);
    } on Exception catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> updatedItem(String itemId, int quantity) async {
    try {
      await dio.put(
        'https://accessories-eshop.runasp.net/api/cart/items/$itemId',
        data: {'id': itemId, 'quantity': quantity},
        options: await _authOptions,
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'Failed to update item';
      throw Exception(message);
    }
  }

  Future<void> decrementItem(String itemId) async {
    try {
      await dio.post(
        'https://accessories-eshop.runasp.net/api/cart/items/decrement',
        data: {'itemId': itemId, 'quantity': 1},
        options: await _authOptions,
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'Failed to decrement item';
      throw Exception(message);
    }
  }

  Future<void> removeItem(String itemId) async {
    try {
      await dio.delete(
        'https://accessories-eshop.runasp.net/api/cart/items/$itemId',
        data: {'id': itemId},
        options: await _authOptions,
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'Failed to remove item';
      throw Exception(message);
    }
  }
}
