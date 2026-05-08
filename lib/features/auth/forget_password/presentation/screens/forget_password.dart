import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/utils/validators.dart';
import 'package:veloura/features/auth/forget_password/data/data_sources/forget_password_remote_data_source.dart';
import 'package:veloura/features/auth/forget_password/presentation/controller/forget_password_cubit.dart';
import 'package:veloura/features/auth/otp/presentation/screens/otp_screen.dart';

import '../../../../../core/widgets/auth_layout.dart';
import '../../../../../core/widgets/custom_primary_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final ForgetPasswordCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ForgetPasswordCubit(
      ForgetPasswordRemoteDataSource(
        Dio(
          BaseOptions(
            headers: {'Content-Type': 'application/json'},
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    _cubit.close();
    super.dispose();
  }

  void _submit(BuildContext blocContext) {
    if (!_formKey.currentState!.validate()) return;
    final email = emailController.text.trim();
    log('ForgetPassword — submitting email: "$email"');

    _cubit.forgotPassword(email: email);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OtpScreen(
                  email: emailController.text.trim(),
                  isPasswordReset: true,
                ),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP sent! Check your email.'),
                backgroundColor: BaseColors.success,
              ),
            );
          } else if (state is ForgetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: BaseColors.alert,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is ForgetPasswordLoading;
          return AuthLayout(
            bottomLink: TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                size: 16.sp,
                color: colors.gold,
              ),
              label: Text(
                'Return to Login',
                style: textTheme.bodySmall?.copyWith(
                  color: colors.gold,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Forgot\nPassword',
                    textAlign: TextAlign.center,
                    style: textTheme.headlineLarge,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Enter your email to receive a\npassword reset link.',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    controller: emailController,
                    label: 'EMAIL ADDRESS',
                    hintText: 'name@example.com',
                    prefixIcon: Icons.mail_outline,
                    keyboardType: TextInputType.emailAddress,
             //       validator: (value) => Validator.validateEmail(value ?? ''),
                  ),
                  SizedBox(height: 32.h),
                  CustomPrimaryButton(
                    label: isLoading ? 'SENDING...' : 'SEND RESET LINK',
                    borderRadius: 16.r,
                    letterSpacing: 1.5,
                    isLoading: isLoading,
                    onPressed: isLoading ? null : () => _submit(context),
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