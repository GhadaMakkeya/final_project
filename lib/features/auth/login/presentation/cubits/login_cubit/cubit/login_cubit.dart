import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/features/auth/login/data/data_sources/login_remote_data_source.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRemoteDataSource remoteDataSource;
  final SecureStorageServices secureStorage;

  LoginCubit(this.remoteDataSource, this.secureStorage) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final response = await remoteDataSource.login(
        email: email,
        password: password,
      );

      log("Login Response: ${response.accessToken}");

      await secureStorage.saveAuthData(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        expiresAt: DateTime.parse(response.expiresAtUtc),
      );

      final token = await secureStorage.getAccessToken();
      log("Token Saved: $token");

      if (token == null || token.isEmpty) {
        throw Exception("Token not saved properly");
      }

      emit(LoginSuccess());
    } catch (e) {
      log("Login Error: $e");
      
      String message = e.toString();

      if (message.startsWith("Exception: ")) {
        message = message.replaceFirst("Exception: ", "");
      }

      emit(LoginFailure(message));
    }
  }
}