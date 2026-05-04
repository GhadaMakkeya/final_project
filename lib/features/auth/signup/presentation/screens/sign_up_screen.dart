import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/utils/validators.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/core/widgets/custom_social_button.dart';
import 'package:veloura/core/widgets/custom_text_field.dart';
import 'package:veloura/features/auth/login/presentation/screens/login_screen.dart';
import 'package:veloura/features/auth/otp/presentation/screens/otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> myKey = GlobalKey<FormState>();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: colors.authCardColor,
                      borderRadius: BorderRadius.circular(12.r),
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
                          label: "FULL NAME",
                          hintText: "Jane Doe",
                          prefixIcon: Icons.person,
                          controller: fullNameController,

                          validator: (value) {
                            return Validator.validateUserName(value ?? '');
                          },
                        ),
                        SizedBox(height: 14.h),

                        CustomTextField(
                          label: "EMAIL ADDRESS",
                          hintText: "jane@example.com",
                          prefixIcon: Icons.email,
                          controller: emailController,
                          validator: (value) {
                            return Validator.validateEmail(value ?? '');
                          },
                        ),
                        SizedBox(height: 14.h),

                        CustomTextField(
                          label: "PASSWORD",
                          hintText: "••••••••",
                          prefixIcon: Icons.lock,
                          controller: passwordController,
                          obscureText: isPasswordHidden,
                          suffix: isPasswordHidden
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          onSuffixTap: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                          validator: (value) {
                            return Validator.validatePassword(value ?? '');
                          },
                        ),
                        SizedBox(height: 14.h),

                        CustomTextField(
                          label: "CONFIRM PASSWORD",
                          hintText: "••••••••",
                          prefixIcon: Icons.lock,
                          controller: confirmPasswordController,
                          obscureText: isConfirmPasswordHidden,
                          suffix: isConfirmPasswordHidden
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          onSuffixTap: () {
                            setState(() {
                              isConfirmPasswordHidden =
                                  !isConfirmPasswordHidden;
                            });
                          },

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.fieldRequired;
                            }
                            if (value != passwordController.text) {
                              return AppStrings.passwordNotTheSame;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),

                        CustomPrimaryButton(
                          label: "CREATE ACCOUNT",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const OtpScreen(),
                              ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginScreen(),
                                  ),
                                );
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
