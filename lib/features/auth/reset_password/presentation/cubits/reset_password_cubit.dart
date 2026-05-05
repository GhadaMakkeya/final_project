import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/features/auth/reset_password/data/data_source/reset_pass_remote_data_source.dart';
import 'package:veloura/features/auth/reset_password/presentation/cubits/reset_password_states.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitialState());

  final ResetPassRemoteDataSource resetPassRemoteDataSource =
      ResetPassRemoteDataSource();

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoadingState());
    try {
      await resetPassRemoteDataSource.resetPassword(
        email: email,
        otp: otp,
        newPassword: newPassword,
      );

      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordErrorState(e.toString()));
    }
  }
}
