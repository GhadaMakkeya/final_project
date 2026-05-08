import 'dart:developer';
import 'package:dio/dio.dart';

class OtpRemoteDataSource {
  final Dio dio;

  OtpRemoteDataSource(this.dio);

  /// [isPasswordReset] must be true when coming from the Forgot Password flow.
  /// In that case we ONLY call validate-otp and skip verify-email entirely,
  /// because verify-email consumes/invalidates the OTP and is only meant for
  /// the registration flow. Calling it before reset-password causes the
  /// "Invalid OTP" 400 error.
  Future<void> validateOtp({
    required String email,
    required String otp,
    bool isPasswordReset = false,
  }) async {
    final trimmedEmail = email.trim();
    final trimmedOtp = otp.trim();

    log('OTP validateOtp — email: "$trimmedEmail" | otp: "$trimmedOtp" | isPasswordReset: $isPasswordReset');

    try {
      // Step 1: Always validate the OTP first.
      await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/validate-otp',
        data: {"email": trimmedEmail, "otp": trimmedOtp},
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      log('OTP validated successfully');

      // Step 2: Only call verify-email in the REGISTRATION flow.
      // In the forgot-password flow, this endpoint consumes the OTP,
      // making the subsequent reset-password call fail with "Invalid OTP".
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