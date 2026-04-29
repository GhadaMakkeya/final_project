import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/core/theme/app_text_styles.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const colorDeepNavy = Color(0xFF061F3D);
    const colorGreyBlue = Color(0xFF6B7280);
    const colorLightGrey = Color(0xFFCEC5BB);
    const colorOffWhite = Color(0xFFF5E6D3);
    const colorWhite = Color(0xFFFFFFFF);

    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 60.h,
      textStyle: TextStyle(
        fontSize: 22.sp,
        color: colorDeepNavy,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: colorLightGrey.withOpacity(0.5)),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: colorDeepNavy),
                ),
              ),

              Text(
                AppStrings.appName,
                style: AppTextStyles.appName.copyWith(
                  fontSize: 40.sp,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 40.h),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(30.w),
                decoration: BoxDecoration(
                  color: AppColors.authCardColor,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20.r,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15.w),
                      decoration: const BoxDecoration(
                        color: AppColors.backgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.email_outlined,
                        color: AppColors.primaryColor,
                        size: 35.sp,
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      'Verify your\nemail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: colorDeepNavy,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Enter the code sent to your\nemail to continue.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF6B7280),
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: 35.h),

                    Pinput(
                      length: 4,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: colorDeepNavy, width: 2.w),
                        ),
                      ),
                    ),

                    SizedBox(height: 40.h),

                    CustomPrimaryButton(label: 'Verify', onPressed: () {}),

                    SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Didn't receive a code? "),
                        Text(
                          'Resend Code',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
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
  }
}
