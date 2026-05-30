import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/routing/app_routes.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/features/auth/otp/presentation/cubits/cubit/otp_cubit.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  final bool isPasswordReset;

  const OtpScreen({
    super.key,
    required this.email,
    this.isPasswordReset = false,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  String _submittedOtp = '';

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void _submit() {
    final otp = otpController.text.trim();

    if (otp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP is required'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP must be 6 digits'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    _submittedOtp = otp;

    debugPrint(
      'OtpScreen — submitting | email: "${widget.email.trim()}" | otp: "$otp" | isPasswordReset: ${widget.isPasswordReset}',
    );

    context.read<OtpCubit>().validateOtp(
      email: widget.email.trim(),
      otp: otp,
      isPasswordReset: widget.isPasswordReset,
    );
  }

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
        border: Border.all(color: colors.border.withValues(alpha: 0.5)),
      ),
    );

    return Scaffold(
      body: BlocConsumer<OtpCubit, OtpStates>(
        listener: (context, state) {
          /// SUCCESS
          if (state is OtpSuccessState) {
            final otp = _submittedOtp;
            final email = widget.email.trim();
    
            debugPrint(
              'OtpScreen — success | email: "$email" | otp: "$otp" | isPasswordReset: ${widget.isPasswordReset}',
            );
    
            if (widget.isPasswordReset) {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.resetPassword,
                arguments: {'email': email, 'otp': otp},
              );
            } else {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            }
          }
          /// OTP ERROR
          else if (state is OtpFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
          /// RESEND SUCCESS
          else if (state is ResendOtpSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP sent successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          }
          /// RESEND ERROR
          else if (state is ResendOtpFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
    
                    /// BACK
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back, color: colors.primary),
                      ),
                    ),
    
                    SizedBox(height: 10.h),
    
                    /// LOGO
                    Text(
                      AppStrings.appName,
                      style: textTheme.headlineLarge?.copyWith(
                        color: colors.primary,
                        letterSpacing: 6,
                      ),
                    ),
    
                    SizedBox(height: 40.h),
    
                    /// CARD
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30.w),
                      decoration: BoxDecoration(
                        color: colors.authCardColor,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 20.r,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          /// ICON
                          Icon(
                            Icons.email_outlined,
                            color: colors.primary,
                            size: 40.sp,
                          ),
    
                          SizedBox(height: 20.h),
    
                          /// TITLE
                          Text(
                            'Verify your email',
                            style: textTheme.headlineMedium,
                          ),
    
                          SizedBox(height: 10.h),
    
                          /// SUBTITLE
                          Text(
                            'Enter the code sent to\n${widget.email}',
                            textAlign: TextAlign.center,
                            style: textTheme.bodySmall?.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
    
                          SizedBox(height: 30.h),
    
                          /// OTP INPUT
                          Pinput(
                            length: 6,
                            controller: otpController,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!
                                  .copyWith(
                                    border: Border.all(
                                      color: colors.primary,
                                      width: 2.w,
                                    ),
                                  ),
                            ),
                          ),
    
                          SizedBox(height: 30.h),
    
                          /// VERIFY BUTTON
                          CustomPrimaryButton(
                            label: 'VERIFY',
                            isLoading: state is OtpLoadingState,
                            borderRadius: 16,
                            onPressed: state is OtpLoadingState
                                ? null
                                : _submit,
                          ),
    
                          SizedBox(height: 20.h),
    
                          /// RESEND
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Didn't receive a code? ",
                                style: textTheme.bodySmall,
                              ),
                              GestureDetector(
                                onTap: state is ResendOtpLoadingState
                                    ? null
                                    : () {
                                        context.read<OtpCubit>().resendOtp(
                                          email: widget.email.trim(),
                                        );
                                      },
                                child: Text(
                                  state is ResendOtpLoadingState
                                      ? 'Sending...'
                                      : 'Resend Code',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colors.primary,
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
            ),
          );
        },
      ),
    );
  }
}
