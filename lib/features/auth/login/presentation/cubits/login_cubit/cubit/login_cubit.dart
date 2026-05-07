import 'dart:developer';
import 'package:bloc/bloc.dart';

import '../../../../../../../core/services/secure_storage_services.dart';
import '../../../../data/data_sources/login_remote_data_source.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRemoteDataSource remoteDataSource;
  final SecureStorageServices secureStorage;

  LoginCubit(
    this.remoteDataSource,
    this.secureStorage,
  ) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoading());

      final response = await remoteDataSource.login(
        email: email,
        password: password,
      );

      log('Login Success Response Received');

      await secureStorage.saveAuthData(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        expiresAt: DateTime.parse(response.expiresAtUtc),
      );

      final token = await secureStorage.getAccessToken();

      log('Saved Token: $token');

      if (token == null || token.isEmpty) {
        emit(LoginFailure('Token was not saved properly'));
        return;
      }

      emit(LoginSuccess());
    } catch (e, stackTrace) {
      log(
        'Login Error',
        error: e,
        stackTrace: stackTrace,
      );

      String message = e.toString();

      if (message.startsWith('Exception: ')) {
        message = message.replaceFirst('Exception: ', '');
      }

      emit(LoginFailure(message));
    }
  }
}