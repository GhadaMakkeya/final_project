import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/features/auth/reset_password/presentation/cubits/reset_password_states.dart';

import '../../data/data_source/reset_pass_remote_data_source.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  final ResetPassRemoteDataSource resetPassRemoteDataSource;

  ResetPasswordCubit(this.resetPassRemoteDataSource) : super(ResetPasswordInitialState());

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

      emit(ResetPasswordSuccessState(
        'Password reset successfully',
      ));
    } catch (e) {
      String message = e.toString();
      if (message.startsWith('Exception: ')) {
        message = message.replaceFirst('Exception: ', '');
      }
      emit(ResetPasswordErrorState(message));
    }
  }
}

