import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/features/auth/login/presentation/screens/login_screen.dart';
import 'package:veloura/features/auth/otp/presentation/cubits/cubit/otp_cubit.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 60.h,
      textStyle: textTheme.titleMedium?.copyWith(color: colors.primary),
      decoration: BoxDecoration(
        color: colors.cardColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: colors.border.withOpacity(0.5)),
      ),
    );

    return Scaffold(
      body: BlocConsumer<OtpCubit, OtpStates>(
        listener: (context, state) {
          if (state is OtpSuccessState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false,
            );
          } else if (state is OtpFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is ResendOtpSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP sent successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is ResendOtpFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 60.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back, color: colors.primary),
                    ),
                  ),
                  Text(
                    AppStrings.appName,
                    style: textTheme.headlineLarge?.copyWith(
                      color: colors.primary,
                      letterSpacing: 6.0,
                    ),
),
SizedBox(height: 40.h),

Container(
  width: double.infinity,
  padding: EdgeInsets.all(30.w),
  decoration: BoxDecoration(
    color: colors.authCardColor,
    borderRadius: BorderRadius.circular(20.r),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 20.r,
        offset: const Offset(0, 10),
      ),
    ],
  ),
  child: Column(
    children: [
      SizedBox(height: 10.h),

      Pinput(
        length: 4,
        controller: otpController,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: colors.primary, width: 2.w),
          ),
        ),
      ),

      SizedBox(height: 30.h),
    ],
  ),
), main
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                            color: colors.background,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.email_outlined,
                            color: colors.primary,
                            size: 35.sp,
                          ),
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          'Verify your\nemail',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineMedium,
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Enter the code sent to\n${widget.email}',
                          textAlign: TextAlign.center,
                          style: textTheme.bodySmall
                              ?.copyWith(color: colors.textSecondary),
                        ),
                        SizedBox(height: 35.h),
                        Pinput(
                          length: 6,
                          controller: otpController,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              border: Border.all(
                                color: colors.primary,
                                width: 2.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        CustomPrimaryButton(
                          label: state is OtpLoadingState
                              ? 'VERIFYING...'
                              : 'VERIFY',
                          onPressed: state is OtpLoadingState
                              ? null
                              : () {
                                  if (otpController.text.length == 6) {
                                    context.read<OtpCubit>().validateOtp(
                                          email: widget.email,
                                          otp: otpController.text,
                                        );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please enter the 6-digit code'),
                                        backgroundColor: Colors.orange,
                                      ),
                                    );
                                  }
                                },
                        ),
                        SizedBox(height: 25.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Didn't receive a code? ",
                                style: textTheme.bodySmall),
                            GestureDetector(
                              onTap: state is ResendOtpLoadingState
                                  ? null
                                  : () => context
                                      .read<OtpCubit>()
                                      .resendOtp(email: widget.email),
                              child: Text(
                                state is ResendOtpLoadingState
                                    ? 'Sending...'
                                    : 'Resend Code',
                                style: textTheme.bodySmall?.copyWith(
                                  color: colors.gold,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}