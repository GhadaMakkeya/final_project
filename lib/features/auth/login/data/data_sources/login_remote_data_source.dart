import 'package:dio/dio.dart';

class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final String expiresAtUtc;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAtUtc,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      expiresAtUtc: json['expiresAtUtc'] ?? '',
    );
  }
}

class LoginRemoteDataSource {
  final Dio dio;

  LoginRemoteDataSource(this.dio);

  // =========================
  // LOGIN
  // =========================
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/login',
        data: {
          "email": email,
          "password": password,
        },
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  // =========================
  // GET ACCESS TOKEN
  // =========================
  Future<String> getAccessToken({
    required String refreshToken,
  }) async {
    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/refresh-token',
        data: {
          "refreshToken": refreshToken,
        },
      );

      return response.data['accessToken'];
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  // =========================
  // REFRESH LOGIN RESPONSE
  // =========================
  Future<LoginResponse> refreshToken({
    required String refreshToken,
  }) async {
    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/refresh-token',
        data: {
          "refreshToken": refreshToken,
        },
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  // =========================
  // ERROR HANDLER
  // =========================
  String _handleError(DioException e) {
    final data = e.response?.data;
    String message = "Something went wrong";

    if (data != null) {
      if (data is Map) {
        if (data['errors'] != null) {
          final errors = data['errors'];

          if (errors is Map && errors.isNotEmpty) {
            final first = errors.values.first;
            message =
                first is List ? first.first.toString() : first.toString();
          }
        } else if (data['message'] != null) {
          message = data['message'].toString();
        } else if (data['title'] != null) {
          message = data['title'].toString();
        }
      } else {
        message = data.toString();
      }
    }

    return message;
  }
}