import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../constants/app_font_families.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  final Widget? bottomLink;

  const AuthLayout({super.key, required this.child, this.bottomLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 40.0,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 80,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Text(
                      'Veloura',
                      style: TextStyle(
                        fontFamily: AppFontFamilies.georgia,
                        fontWeight: FontWeight.w700,
                        fontSize: 55.sp,
                        color: AppColors.primaryColor,
                        letterSpacing: -2,
                      ),
                    ),
                    SizedBox(height: 40.h),

                    // Main Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.0.w,
                        vertical: 48.0.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 253, 250, 250),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 20.r,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.grey.shade100,
                          width: 1.w,
                        ),
                      ),
                      child: child,
                    ),

                    // Optional bottom link
                    if (bottomLink != null) ...[
                      SizedBox(height: 40.h),
                      bottomLink!,
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
