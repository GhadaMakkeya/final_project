import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class ResetPassRemoteDataSource {
  final Dio dio;

  ResetPassRemoteDataSource(this.dio);

  Future<String> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    final trimmedEmail = email.trim();
    final trimmedOtp = otp.trim();
    final trimmedPassword = newPassword.trim();

    final body = {
      "email": trimmedEmail,
      "otp": trimmedOtp,
      "newPassword": trimmedPassword,
    };

    log('ResetPassword — request body: $body');

    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/reset-password',
        data: body,
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      log('ResetPassword — raw response.data: ${response.data}');

      // ✅ FIX: response.data may be a plain String (server omits
      // Content-Type: application/json), which makes Dio skip JSON
      // decoding. Indexing a String with a String key crashes:
      //   "type 'String' is not a subtype of type 'int' of 'index'"
      // That crash was caught below and emitted as an error state —
      // even though the reset had already succeeded on the backend.
      // Solution: normalise to a Map before any field access.
      final data = _toMap(response.data);

      final message = data?['message']?.toString() ??
          (response.data is String ? response.data as String : null) ??
          'Password reset successfully';

      log('ResetPassword — success: $message');
      return message;

    } on DioException catch (e) {
      log('ResetPassword — error: ${e.response?.data}');

      final data = _toMap(e.response?.data);

      if (data != null && data['errors'] != null) {
        final errors = data['errors'] as Map<String, dynamic>;
        final firstKey = errors.keys.first;
        final firstValue = errors[firstKey];
        final firstError = firstValue is List
            ? firstValue[0].toString()
            : firstValue.toString();
        throw Exception(firstError);
      }

      final message = data?['message']?.toString() ??
          (e.response?.data is String ? e.response?.data as String : null) ??
          'Password reset failed';
      throw Exception(message);
    }
  }

  /// Safely converts [raw] to a Map regardless of whether Dio decoded it.
  /// Returns null if the value is neither a Map nor valid JSON String.
  Map<String, dynamic>? _toMap(dynamic raw) {
    if (raw is Map) return Map<String, dynamic>.from(raw);
    if (raw is String && raw.isNotEmpty) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is Map) return Map<String, dynamic>.from(decoded);
      } catch (_) {}
    }
    return null;
  }
}