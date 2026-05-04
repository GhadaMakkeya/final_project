import 'package:dio/dio.dart';
import 'package:veloura/features/auth/signup/data/models/sign_up_requist_model.dart';

class SignUpRemoteDataSource {
  final Dio dio = Dio();

  Future<void> signUp(SignUpRequistModel model) async {
    try {
      await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/register ',
        data: model.toJson(),
      );
    } on DioException catch (e) {
      String errMessage = e.response?.data['message'] ?? 'Failure';
      throw Exception(errMessage);
    } on Exception catch (e) {
      throw Exception('Error: $e');
    }
  }
}
