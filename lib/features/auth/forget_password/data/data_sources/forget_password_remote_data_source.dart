import 'dart:developer';
import 'package:dio/dio.dart';

class ForgetPasswordRemoteDataSource {
  final Dio dio;

  // ✅ Removed SecureStorageServices — it was injected but never used,
  // and caused an unnecessary dependency on secure storage in this class.
  ForgetPasswordRemoteDataSource(this.dio);

  Future<String> forgotPassword({required String email}) async {
    final trimmedEmail = email.trim();
    log('ForgetPassword — requesting OTP for "$trimmedEmail"');

    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/forgot-password',
        data: {'email': trimmedEmail},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      log('ForgetPassword — success: ${response.data}');

      if (response.statusCode == 200) {
        return response.data?.toString() ?? 'OTP sent successfully';
      } else {
        throw Exception('Something went wrong');
      }
    } on DioException catch (e) {
      log('ForgetPassword — error: ${e.response?.data}');
      if (e.response != null) {
        final data = e.response?.data;
        if (data is Map) {
          final emailErrors = data['errors']?['email'];
          if (emailErrors is List && emailErrors.isNotEmpty) {
            throw Exception(emailErrors.first);
          }
          throw Exception(data['message'] ?? 'Something went wrong');
        }
      }
      throw Exception('Check your internet connection');
    }
  }
}