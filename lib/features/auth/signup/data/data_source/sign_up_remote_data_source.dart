import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/features/auth/signup/data/models/sign_up_requist_model.dart';

class SignUpRemoteDataSource {
  final Dio dio;
  final SecureStorageServices secureStorageService;

  SignUpRemoteDataSource(this.dio, this.secureStorageService);

  Future<void> signUp(SignUpRequistModel model) async {
    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/register',
        data: model.toJson(),
      );
      log('Sign Up Successful: ${response.data['message']}');
    } on DioException catch (e) {
      log('Status Code: ${e.response?.statusCode}');
      log('Error Data: ${e.response?.data}');

      String errMessage = 'Something went wrong';
      try {
        final data = e.response?.data;
        if (data != null) {
          final errors = data['errors'];
          if (errors != null && errors is Map && errors.isNotEmpty) {
            final firstError = errors.values.first;
            if (firstError is List && firstError.isNotEmpty) {
              errMessage = firstError[0].toString();
            } else {
              errMessage = firstError.toString();
            }
          } else {
            errMessage = data['message']?.toString() ?? 'Something went wrong';
          }
        }
      } catch (_) {
        errMessage = e.message ?? 'Something went wrong';
      }
      throw Exception(errMessage);
    } on Exception catch (e) {
      throw Exception('Error: $e');
    }
  }
}
