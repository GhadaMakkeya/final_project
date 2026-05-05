import 'dart:developer';
import 'package:dio/dio.dart';

class OtpRemoteDataSource {
  final Dio dio;

  OtpRemoteDataSource(this.dio);

  Future<void> validateOtp({
    required String email,
    required String otp,
  }) async {
    try {
      await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/validate-otp',
        data: {"email": email, "otp": otp},
      );
      log('OTP validated');

      await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/verify-email',
        data: {"email": email, "otp": otp},
      );
      log('Email verified');
    } on DioException catch (e) {
      log('OTP Error: ${e.response?.data}');
      String errMessage = 'Something went wrong';
      try {
        final data = e.response?.data;
        if (data != null) {
          final errors = data['errors'];
          if (errors != null && errors is Map && errors.isNotEmpty) {
            final firstError = errors.values.first;
            errMessage = firstError is List
                ? firstError[0].toString()
                : firstError.toString();
          } else {
            errMessage = data['message']?.toString() ?? 'Something went wrong';
          }
        }
      } catch (_) {
        errMessage = e.message ?? 'Something went wrong';
      }
      throw Exception(errMessage);
    }
  }

  Future<void> resendOtp({required String email}) async {
    try {
      await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/resend-otp',
        data: {"email": email},
      );
      log('OTP Resent to $email');
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ?? 'Failed to resend OTP',
      );
    }
  }
}