import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:veloura/features/cart/data/models/cart_item_model.dart';

class CartRemoteDataSource {
  final Dio dio = Dio();

  static const String _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwNDU5NjA0Yy1kMTk3LTQ5MGEtNmE5OC0wOGRlYTdlYzQ1MTEiLCJqdGkiOiI3NTdiNDc3NS03YmQzLTQwMTYtYTk3Ny1kYTRiNzA4NWNhNzYiLCJlbWFpbCI6ImVuZy5iYWRhd3k3N0BnbWFpbC5jb20iLCJuYW1lIjoiQWhtZWQgQmFkYXd5Iiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzc3OTg3NTc0LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.i71XWuhuv9-BYC-znjNp0302cWbkYuuWtEIUzDqa7as';

  Options get _options => Options(headers: {'Authorization': 'Bearer $_token'});

  Future<List<CartItemModel>> getCart() async {
    try {
      final response = await dio.get(
        'https://accessories-eshop.runasp.net/api/cart',
        options: _options,
      );
      log(response.data.toString(), name: 'CART RESPONSE');

      final List cartItems = response.data['cartItems'];

      return cartItems.map((e) => CartItemModel.fromJson(e)).toList();
    } on DioException catch (e) {
      String errMessage = e.response?.data['message'] ?? 'Failure';
      throw Exception(errMessage);
    } on Exception catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> updatedItem(String itemId, int quantity) async {
    try {
      await dio.put(
        'https://accessories-eshop.runasp.net/api/cart/items/$itemId',
        data: {'id': itemId, 'quantity': quantity},
        options: _options,
      );
    } on DioException catch (e) {
      String errMessage = e.response?.data['message'] ?? 'Failure';
      throw Exception(errMessage);
    }
  }

  Future<void> decrementItem(String itemId) async {
    try {
      await dio.post(
        'https://accessories-eshop.runasp.net/api/cart/items/decrement',
        data: {'itemId': itemId, 'quantity': 1},
        options: _options,
      );
    } on DioException catch (e) {
      String errMessage = e.response?.data['message'] ?? 'Failure';
      throw Exception(errMessage);
    }
  }

  Future<void> removeItem(String itemId) async {
    try {
      await dio.delete(
        'https://accessories-eshop.runasp.net/api/cart/items/$itemId',
        data: {'id': itemId},
        options: _options,
      );
    } on DioException catch (e) {
      String errMessage = e.response?.data['message'] ?? 'Failure';
      throw Exception(errMessage);
    }
  }
}
