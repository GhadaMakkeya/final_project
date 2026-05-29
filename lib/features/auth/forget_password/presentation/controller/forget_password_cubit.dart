import 'dart:developer';
import 'package:bloc/bloc.dart';
import '../../data/data_sources/forget_password_remote_data_source.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  final ForgetPasswordRemoteDataSource forgetPasswordRemoteDataSource =
      ForgetPasswordRemoteDataSource();

  Future<void> forgotPassword({required String email}) async {
    emit(ForgetPasswordLoading());

    try {
      final message = await forgetPasswordRemoteDataSource.forgotPassword(
        email: email,
      );

      log("Forgot Password Success: $message");

      emit(ForgetPasswordSuccess(message: message));
    } catch (e) {
      log("Forgot Password Error: $e");

      String error = e.toString();

      if (error.startsWith("Exception: ")) {
        error = error.replaceFirst("Exception: ", "");
      }

      emit(ForgetPasswordFailure(message: error));
    }
  }
}