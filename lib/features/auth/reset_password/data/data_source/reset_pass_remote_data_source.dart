import 'package:dio/dio.dart';

class ResetPassRemoteDataSource {
  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      final Dio dio = Dio();
      await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/reset-password ',
        data: {"email": email, "otp": otp, "newPassword": newPassword},
      );
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? "Error");
    }
  }
}
