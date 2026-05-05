import 'package:bloc/bloc.dart';
import 'package:veloura/features/auth/otp/data/data_sources/otp_remote_data_source.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpStates> {
  final OtpRemoteDataSource otpRemoteDataSource;

  OtpCubit(this.otpRemoteDataSource) : super(OtpInitialState());

  Future<void> validateOtp({
    required String email,
    required String otp,
  }) async {
    emit(OtpLoadingState());
    try {
      await otpRemoteDataSource.validateOtp(email: email, otp: otp);
      emit(OtpSuccessState());
    } catch (e) {
      emit(OtpFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> resendOtp({required String email}) async {
    emit(ResendOtpLoadingState());
    try {
      await otpRemoteDataSource.resendOtp(email: email);
      emit(ResendOtpSuccessState());
    } catch (e) {
      emit(ResendOtpFailureState(errorMessage: e.toString()));
    }
  }
}