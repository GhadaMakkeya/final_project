import 'package:dio/dio.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/features/home/data/models/category_model.dart';
import 'package:veloura/features/home/data/models/offers_data.dart';
import 'package:veloura/features/home/data/models/product_model.dart';

class RemoteDataSource {
  final Dio dio = Dio();
  final SecureStorageServices secureStorage = SecureStorageServices();

  Future<void> ensureValidToken() async {
    final expiresAt = await secureStorage.getExpiresAt();
    if (expiresAt == null) return;

    if (DateTime.now().isAfter(expiresAt)) {
      await _refreshToken();
    }
  }

  Future<void> _refreshToken() async {
    try {
      final refreshToken = await secureStorage.getRefreshToken();
      if (refreshToken == null) throw Exception('No refresh token');

      final freshDio = Dio();
      final response = await freshDio.post(
        'https://accessories-eshop.runasp.net/api/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      await secureStorage.saveAuthData(
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
        expiresAt: DateTime.parse(response.data['expiresAt']),
      );
    } catch (e) {
      await secureStorage.clearAuthData();
      throw Exception('Session expired, please login again');
    }
  }

  Future<Options> authOptions() async {
    await ensureValidToken();
    final token = await secureStorage.getAccessToken();
    return Options(headers: {'Authorization': 'Bearer $token'});
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get(
        'https://accessories-eshop.runasp.net/api/products',
      );

      List<ProductModel> products = [];
      final data = response.data['items'];

      for (var element in data) {
        products.add(ProductModel.fromJson(element));
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

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dio.get(
        'https://accessories-eshop.runasp.net/api/categories',
        options: await authOptions(),
      );

      List<CategoryModel> categories = [];
      final data = response.data['categories'];

      for (var item in data) {
        categories.add(CategoryModel.fromJson(item));
      }
      return categories;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data;
      throw Exception("$errorMessage Error loading categories");
    } on Exception catch (e) {
      throw Exception('Error: $e');
    }
  }
}