import 'dart:developer';
import 'package:dio/dio.dart';

class OtpRemoteDataSource {
  final Dio dio = Dio();

  OtpRemoteDataSource();

  Future<void> validateOtp({
    required String email,
    required String otp,
    bool isPasswordReset = false,
  }) async {
    final trimmedEmail = email.trim();
    final trimmedOtp = otp.trim();

    log('OTP validateOtp — email: "$trimmedEmail" | otp: "$trimmedOtp" | isPasswordReset: $isPasswordReset');

    try {
      await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/validate-otp',
        data: {"email": trimmedEmail, "otp": trimmedOtp},
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      log('OTP validated successfully');

      if (!isPasswordReset) {
        await dio.post(
          'https://accessories-eshop.runasp.net/api/auth/verify-email',
          data: {"email": trimmedEmail, "otp": trimmedOtp},
          options: Options(headers: {"Content-Type": "application/json"}),
        );
        log('Email verified successfully');
      } else {
        log('Skipping verify-email (password reset flow) — OTP kept valid for reset-password call');
      }
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
    final trimmedEmail = email.trim();
    log('Resending OTP to "$trimmedEmail"');
    try {
      await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/resend-otp',
        data: {"email": trimmedEmail},
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      log('OTP resent to $trimmedEmail');
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ?? 'Failed to resend OTP',
      );
    }
  }
}