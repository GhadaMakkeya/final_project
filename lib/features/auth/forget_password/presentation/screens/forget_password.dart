import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';
import '../../../../../core/widgets/auth_layout.dart';
import '../../../../../core/widgets/custom_primary_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
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
            label: 'Email Address',
            hintText: 'name@example.com',
            prefixIcon: Icons.mail_outline,
             keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 32.h),
          CustomPrimaryButton(
            label: 'Send Reset Link',
            trailingIcon: Icons.arrow_forward,
            borderRadius: 16.r,
            letterSpacing: 0.5.w,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
