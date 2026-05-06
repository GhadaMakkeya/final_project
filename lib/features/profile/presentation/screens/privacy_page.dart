import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart'; // تأكد من المسار

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Privacy Policy',
          style: textTheme.headlineSmall?.copyWith(fontSize: 20.sp),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header Image ---
            Container(
              height: 220.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: colors.border, width: 0.5),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1557683316-973673baf926'), 
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text('LEGAL INFORMATION', style: textTheme.titleSmall),
                  SizedBox(height: 8.h),
                  Text('Your Privacy Matters', style: textTheme.headlineMedium),
                  SizedBox(height: 8.h),
                  Container(width: 40.w, height: 2.h, color: colors.gold),
                  SizedBox(height: 24.h),

                  // --- Privacy Card 1 (Data Collection) ---
                  _buildSectionCard(
                    context,
                    icon: Icons.security_outlined,
                    title: 'Data Collection',
                    body: 'We collect information to provide better services to all our users. This includes personal identifiers and browsing behavior within the application.',
                  ),
                  SizedBox(height: 16.h),

                  // --- Privacy Card 2 (User Rights) ---
                  _buildSectionCard(
                    context,
                    icon: Icons.fingerprint_outlined,
                    title: 'User Rights',
                    body: 'You have the right to access, update, or delete your personal information at any time through your profile settings or by contacting support.',
                  ),
                  SizedBox(height: 24.h),

                  // --- Cookies Policy Section ---
                  Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: colors.authCardColor,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: colors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.cookie_outlined, color: colors.gold, size: 24.sp),
                            SizedBox(width: 12.w),
                            Text('Cookies Policy', style: textTheme.headlineSmall),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'We use cookies to enhance your experience, analyze site traffic, and serve personalized content. By continuing to use Veloura, you consent to our use of cookies.',
                          style: textTheme.bodyMedium?.copyWith(height: 1.6),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: colors.background,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: colors.border),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('COOKIE PREFERENCES', style: textTheme.titleSmall),
                              SizedBox(height: 8.h),
                              Text(
                                'You can choose to disable cookies through your browser settings, though some features may not function properly.',
                                style: textTheme.bodySmall?.copyWith(color: colors.textSecondary),
                              ),
                              SizedBox(height: 12.h),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Manage Settings',
                                  style: textTheme.labelMedium?.copyWith(
                                    color: colors.gold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method inside the same class to keep the code clean but not in a separate file
  Widget _buildSectionCard(BuildContext context, {required IconData icon, required String title, required String body}) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colors.authCardColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: colors.gold.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: colors.gold, size: 24.sp),
          ),
          SizedBox(height: 16.h),
          Text(title, style: textTheme.headlineSmall),
          SizedBox(height: 10.h),
          Text(
            body,
            style: textTheme.bodyMedium?.copyWith(
              color: colors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}