import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../data/data_sources/forget_password_remote_data_source.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRemoteDataSource forgetPasswordRemoteDataSource;

  ForgetPasswordCubit(this.forgetPasswordRemoteDataSource)
      : super(ForgetPasswordInitial());

  Future<void> forgotPassword({required String email}) async {
    // ✅ Guard every emit with isClosed. If the user navigates away while
    // the HTTP call is in-flight, the cubit gets closed. Without this guard,
    // calling emit() on a closed cubit throws:
    // "Bad state: Cannot emit new states after calling close"
    if (isClosed) return;
    emit(ForgetPasswordLoading());

    try {
      final message = await forgetPasswordRemoteDataSource.forgotPassword(
        email: email,
      );

      log('Forgot Password Success: $message');
      if (!isClosed) emit(ForgetPasswordSuccess(message: message));
    } catch (e) {
      log('Forgot Password Error: $e');

      String error = e.toString();
      if (error.startsWith('Exception: ')) {
        error = error.replaceFirst('Exception: ', '');
      }

      if (!isClosed) emit(ForgetPasswordFailure(message: error));
    }
  }
}