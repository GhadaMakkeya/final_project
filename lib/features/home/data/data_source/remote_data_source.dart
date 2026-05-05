import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:veloura/features/home/data/models/offers_data.dart';
import 'package:veloura/features/home/data/models/product_data_model.dart';

class RemoteDataSource {
  final Dio dio = Dio();

  Future<List<ProductDataModel>> getProducts() async {
    try {
      final response = await dio.get(
        'https://accessories-eshop.runasp.net/api/products',
      );

      List<ProductDataModel> products = [];
      final data = response.data['items'];

      for (var element in data) {
        products.add(ProductDataModel.fromJson(element));
      }
      return products;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data;
      throw Exception("$errorMessage Error loading products");
    } on Exception catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<OffersData>> getOffers() async {
    try {
      final response = await dio.get(
        'https://accessories-eshop.runasp.net/api/offers',
      );
      List<OffersData> offers = [];
      final data = response.data['offers']['items'];

      for (var item in data) {
        offers.add(OffersData.fromJson(item));
      }
      return offers;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data;
      throw Exception("$errorMessage Error loading offers");
    } on Exception catch (e) {
      throw Exception('Error: $e');
    }
  }
}
