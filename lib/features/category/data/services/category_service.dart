import 'package:dio/dio.dart';

import '../../../../core/services/secure_storage_services.dart';
import '../models/category_model.dart';

class CategoryService {
  final Dio dio;
  final SecureStorageServices secureStorage;

  CategoryService({required this.dio, required this.secureStorage});

  Future<List<CategoryModel>> getCategories() async {
    final token = await secureStorage.getAccessToken();

    final response = await dio.get(
      "https://accessories-eshop.runasp.net/api/categories",

      options: Options(
        headers: {
          "Authorization": "Bearer $token",

          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      final List data = response.data['categories'];

      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed To Load Categories");
    }
  }
}
