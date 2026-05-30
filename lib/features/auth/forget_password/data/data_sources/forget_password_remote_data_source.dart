import 'package:dio/dio.dart';

class ForgetPasswordRemoteDataSource {
  final Dio dio = Dio();

  Future<String> forgotPassword({required String email}) async {
    try {
      final response = await dio.post(
        "https://accessories-eshop.runasp.net/api/auth/forgot-password",

        data: {"email": email.trim()},

        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        throw Exception("Something went wrong");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final data = e.response?.data;

        if (data['errors']?['email'] != null) {
          final List errors = data['errors']['email'];

          throw Exception(errors.first);
        }

        throw Exception(data['message'] ?? "Something went wrong");
      }

      throw Exception("Check your internet connection");
    }
  }
}