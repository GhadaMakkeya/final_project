import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/routing/app_routes.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/utils/validators.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/core/widgets/custom_social_button.dart';
import 'package:veloura/core/widgets/custom_text_field.dart';
import 'package:veloura/core/widgets/custom_pass_text_field.dart';
import 'package:veloura/features/auth/signup/presentation/cubits/sign_up_cubit.dart';
import 'package:veloura/features/auth/signup/presentation/cubits/sign_up_states.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> myKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (myKey.currentState!.validate()) {
      context.read<SignUpCubit>().signUp(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Form(
              key: myKey,
              child: Column(
                children: [
                  Text(
                    AppStrings.appName,
                    style: textTheme.headlineLarge?.copyWith(
                      color: colors.primary,
                      letterSpacing: 6.0,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    padding: EdgeInsets.all(22.w),
                    decoration: BoxDecoration(
                      color: colors.authCardColor,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create an Account",
                          style: textTheme.headlineMedium,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Join Veloura for an exclusive experience.',
                          style: textTheme.bodySmall,
                        ),
                        SizedBox(height: 30.h),
                        CustomTextField(
                          label: "FIRST NAME",
                          hintText: "Jane Doe",
                          prefixIcon: Icons.person,
                          controller: firstNameController,
                          validator: (value) =>
                              Validator.validateUserName(value ?? ''),
                        ),
                        SizedBox(height: 14.h),
                        CustomTextField(
                          label: "LAST NAME",
                          hintText: "Jane Doe",
                          prefixIcon: Icons.person,
                          controller: lastNameController,
                          validator: (value) =>
                              Validator.validateUserName(value ?? ''),
                        ),
                        SizedBox(height: 14.h),
                        CustomTextField(
                          label: "EMAIL ADDRESS",
                          hintText: "jane@example.com",
                          prefixIcon: Icons.email,
                          controller: emailController,
                        ),
                        SizedBox(height: 14.h),
                        CustomPassTextField(
                          label: "PASSWORD",
                          hintText: "••••••••",
                          isPassword: true,
                          controller: passwordController,
                          validator: (value) =>
                              Validator.validatePassword(value ?? ''),
                          prefixIcon: Icons.lock_outline,
                        ),
                        SizedBox(height: 14.h),
                        CustomPassTextField(
                          label: "CONFIRM NEW PASSWORD",
                          hintText: "••••••••",
                          isPassword: true,
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return AppStrings.fieldRequired;
                            if (value != passwordController.text)
                              return AppStrings.passwordNotTheSame;
                            return null;
                          },
                          prefixIcon: Icons.lock_outline,
                        ),
                        SizedBox(height: 20.h),
                        BlocConsumer<SignUpCubit, SignUpStates>(
                          listener: (context, state) {
                            if (state is SignUpSuccessState) {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.otp,
                                arguments: {
                                  'email': emailController.text.trim(),
                                  'isPasswordReset': false,
                                },
                              );
                            } else if (state is SignUpFailureState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.errorMessage),
                                  backgroundColor: BaseColors.alert,
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return CustomPrimaryButton(
                              label: state is SignUpLoadingState
                                  ? "LOADING..."
                                  : "CREATE ACCOUNT",
                              onPressed: state is SignUpLoadingState
                                  ? null
                                  : _onSubmit,
                              borderRadius: 16,
                            );
                          },
                        ),
                        SizedBox(height: 30.h),
                        Center(
                          child: Text(
                            'OR REGISTER WITH',
                            style: textTheme.titleSmall,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomSocialButton(
                                text: " Google",
                                iconPath: "assets/images/google.png",
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: CustomSocialButton(
                                text: " Facebook",
                                iconPath: "assets/images/facebook.png",
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: textTheme.bodySmall,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.login);
                              },
                              child: Text(
                                " Log in",
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
          ),
        ),
      ),
    );
  }
}
