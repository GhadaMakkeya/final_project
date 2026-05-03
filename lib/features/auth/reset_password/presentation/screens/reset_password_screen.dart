import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/features/auth/reset_password/presentation/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
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
                            mainAxisSize: MainAxisSize.min,
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
                              const CustomTextField(
                                fieldName: "NEW PASSWORD",
                                hintName: "••••••••",
                                isPassword: true,
                              ),
                              const CustomTextField(
                                fieldName: "CONFIRM NEW PASSWORD",
                                hintName: "••••••••",
                                isPassword: true,
                              ),

                              SizedBox(height: 26.h),
                              CustomPrimaryButton(
                                onPressed: () {},
                                label: "Reset Password",
                                letterSpacing: 0,
                                borderRadius: 16,
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
            );
          },
        ),
      ),
    );
  }
}
