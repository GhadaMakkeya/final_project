import 'dart:developer';
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
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      expiresAtUtc: json['expiresAtUtc'],
    );
  }
}

class LoginRemoteDataSource {
  final Dio dio = Dio();

  LoginRemoteDataSource();

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/login',
        data: {"email": email, "password": password},
      );

      log("LOGIN RESPONSE => ${response.data}");
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      final data = e.response?.data;
      String message = "Login failed";
      
      if (data != null && data is Map) {
        message = data['message'] ?? data['title'] ?? "Invalid credentials";
      }
      throw Exception(message);
    }
  }
}