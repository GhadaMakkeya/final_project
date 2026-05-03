import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/core/widgets/custom_social_button.dart';
import 'package:veloura/core/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  padding: EdgeInsets.all(20),
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
                      ),
                      SizedBox(height: 14.h),
                      CustomTextField(
                        label: "EMAIL ADDRESS",
                        hintText: "jane@example.com",
                        prefixIcon: Icons.email,
                      ),
                      SizedBox(height: 14.h),
                      CustomTextField(
                        label: "PASSWORD",
                        hintText: "••••••••",
                        prefixIcon: Icons.lock,
                        obscureText: true,
                        suffix: Icons.visibility_off_outlined,
                        onSuffixTap: () {},
                      ),
                      SizedBox(height: 14.h),
                      CustomTextField(
                        label: "CONFIRM PASSWORD",
                        hintText: "••••••••",
                        prefixIcon: Icons.lock,
                        obscureText: true,
                        suffix: Icons.visibility_off_outlined,
                        onSuffixTap: () {},
                      ),
                      SizedBox(height: 14.h),
                      CustomPrimaryButton(
                        label: "CREATE ACCOUNT",
                        letterSpacing: 0,
                        onPressed: () {},
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
                            onPressed: () {},
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
    );
  }
}
