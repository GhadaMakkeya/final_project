import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_font_families.dart';
import '../../../../../core/widgets/auth_layout.dart';
import '../../../../../core/widgets/custom_primary_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      bottomLink: TextButton.icon(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, size: 16.sp, color: Color(0xFF8D715B)),
        label: TextButton(
          onPressed: () {},
          child: Text(
            ' Return to Login',
            style: TextStyle(
              color: Color(0xFF8D715B),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Forgot\nPassword',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppFontFamilies.georgia,
              fontSize: 36.sp,
              height: 1.2.h,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B1B1B),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Enter your email to receive a\npassword reset link.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              height: 1.4.h,
              color: Color(0xFF5A5A5A),
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
            borderRadius: 30.r,
            letterSpacing: 0.5.h,
            height: 56.h,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
