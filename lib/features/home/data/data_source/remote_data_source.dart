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
    } catch (e) {
      throw Exception("Error");
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
    } catch (e) {
      throw Exception("Error loading offers");
    }
  }
}
