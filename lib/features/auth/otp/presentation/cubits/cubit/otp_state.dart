part of 'otp_cubit.dart';

sealed class OtpStates {}

class OtpInitialState extends OtpStates {}

class OtpLoadingState extends OtpStates {}

class OtpSuccessState extends OtpStates {}

class OtpFailureState extends OtpStates {
  final String errorMessage;
  OtpFailureState({required this.errorMessage});
}

class ResendOtpLoadingState extends OtpStates {}

class ResendOtpSuccessState extends OtpStates {}

class ResendOtpFailureState extends OtpStates {
  final String errorMessage;
  ResendOtpFailureState({required this.errorMessage});
}