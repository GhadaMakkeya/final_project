import 'package:bloc/bloc.dart';

import '../../../data/data_sources/otp_remote_data_source.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpStates> {
  final OtpRemoteDataSource otpRemoteDataSource;

  OtpCubit(this.otpRemoteDataSource) : super(OtpInitialState());

  /// [isPasswordReset] must be true when called from the Forgot Password flow
  /// so that verify-email is skipped and the OTP remains valid for reset-password.
  Future<void> validateOtp({
    required String email,
    required String otp,
    bool isPasswordReset = false,
  }) async {
    emit(OtpLoadingState());
    try {
      await otpRemoteDataSource.validateOtp(
        email: email.trim(),
        otp: otp.trim(),
        isPasswordReset: isPasswordReset,
      );
      emit(OtpSuccessState());
    } catch (e) {
      String message = e.toString();
      if (message.startsWith('Exception: ')) {
        message = message.replaceFirst('Exception: ', '');
      }
      emit(OtpFailureState(errorMessage: message));
    }
  }

  Future<void> resendOtp({required String email}) async {
    emit(ResendOtpLoadingState());
    try {
      await otpRemoteDataSource.resendOtp(email: email.trim());
      emit(ResendOtpSuccessState());
    } catch (e) {
      String message = e.toString();
      if (message.startsWith('Exception: ')) {
        message = message.replaceFirst('Exception: ', '');
      }
      emit(ResendOtpFailureState(errorMessage: message));
    }
  }
}