import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/routing/app_routes.dart';
import 'package:veloura/core/theme/app_colors.dart';
import '../../../../../core/widgets/auth_layout.dart';
import '../../../../../core/widgets/custom_primary_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../controller/forget_password_cubit.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final colors = context.colors;

    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pushNamed(
            context,
            AppRoutes.otp,
            arguments: {
              'email': emailController.text.trim(),
              'isPasswordReset': true, //
            },
          );
        }

        if (state is ForgetPasswordFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      builder: (context, state) {
        return AuthLayout(
          bottomLink: TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },

            icon: Icon(Icons.arrow_back, size: 16.sp, color: colors.gold),

            label: Text(
              'Return to Login',

              style: textTheme.bodySmall?.copyWith(
                color: colors.gold,

                fontWeight: FontWeight.w600,
              ),
            ),
          ),

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

                label: 'Email Address',

                hintText: 'name@example.com',

                prefixIcon: Icons.mail_outline,

                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: 32.h),
              CustomPrimaryButton(
                label: state is ForgetPasswordLoading
                    ? "Loading..."
                    : 'Send Reset Link',

                trailingIcon: Icons.arrow_forward,

                borderRadius: 16.r,

                letterSpacing: 0.5.w,

                onPressed: state is ForgetPasswordLoading
                    ? null
                    : () {
                        context.read<ForgetPasswordCubit>().forgotPassword(
                          email: emailController.text,
                        );
                      },
              ),
            ],
          ),
        );
      },
    );
  }
}
