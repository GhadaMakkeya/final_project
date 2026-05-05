import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/utils/validators.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/features/auth/reset_password/presentation/cubits/reset_password_cubit.dart';
import 'package:veloura/features/auth/reset_password/presentation/cubits/reset_password_states.dart';
import 'package:veloura/features/auth/reset_password/presentation/widgets/custom_pass_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/features/home/presentation/screens/home_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({super.key, required this.email, required this.otp});

  final String email;
  final String otp;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  final GlobalKey<FormState> myKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: myKey,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 24.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.appName,
                            style: textTheme.headlineLarge?.copyWith(
                              color: colors.primary,
                              letterSpacing: 6.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          SizedBox(height: 18.h),

                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10.r,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              color: colors.authCardColor,
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 33.w,
                                vertical: 33.h,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Reset Password",
                                    style: textTheme.headlineMedium,
                                  ),

                                  SizedBox(height: 10.h),

                                  Text(
                                    "Please enter your new password \n below.",
                                    textAlign: TextAlign.center,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colors.textSecondary,
                                    ),
                                  ),

                                  SizedBox(height: 32.h),

                                  CustomPassTextField(
                                    fieldName: "NEW PASSWORD",
                                    hintName: "••••••••",
                                    isPassword: true,
                                    controller: passController,
                                    validator: (value) {
                                      return Validator.validatePassword(
                                        value ?? '',
                                      );
                                    },
                                  ),

                                  CustomPassTextField(
                                    fieldName: "CONFIRM NEW PASSWORD",
                                    hintName: "••••••••",
                                    isPassword: true,
                                    controller: confirmPassController,
                                    validator: (value) {
                                      return Validator.validatePassword(
                                        value ?? '',
                                      );
                                    },
                                  ),

                                  SizedBox(height: 26.h),

                                  BlocListener<
                                    ResetPasswordCubit,
                                    ResetPasswordStates
                                  >(
                                    listener: (context, state) {
                                      if (state is ResetPasswordLoadingState) {
                                        log("loading...");
                                      }

                                      if (state is ResetPasswordSuccessState) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "Password reset successfully 🎉",
                                            ),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return HomeScreen();
                                            },
                                          ),
                                        );
                                      }

                                      if (state is ResetPasswordErrorState) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(state.message),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                                    child: CustomPrimaryButton(
                                      onPressed: () {
                                        if (passController.text !=
                                            confirmPassController.text) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Passwords don't match",
                                              ),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return;
                                        }

                                        context
                                            .read<ResetPasswordCubit>()
                                            .resetPassword(
                                              email: widget.email,
                                              otp: widget.otp,
                                              newPassword: passController.text,
                                            );
                                      },
                                      label: "Reset Password",
                                      letterSpacing: 0,
                                      borderRadius: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 32.h),

                          TextButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: colors.gold,
                              size: 18.sp,
                            ),
                            label: Text(
                              "Back to Login",
                              style: textTheme.bodySmall?.copyWith(
                                color: colors.gold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
