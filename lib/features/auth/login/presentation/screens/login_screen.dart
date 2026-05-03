import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/core/widgets/custom_social_button.dart';
import 'package:veloura/features/auth/login/presentation/widgets/auth_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMeChecked = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                AppStrings.appName,
                style: textTheme.headlineLarge?.copyWith(
                  color: colors.primary,
                  letterSpacing: 6.0,
                ),
              ),
              Text(
                'Curated elegance.',
                style: textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: colors.textTertiary,
                ),
              ),
              const SizedBox(height: 40),

              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: colors.authCardColor,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text('Sign In', style: textTheme.headlineMedium),
                    const SizedBox(height: 30),
                    const AuthField(
                      label: 'EMAIL ADDRESS',
                      hintText: 'your@email.com',
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 20),
                    const AuthField(
                      label: 'PASSWORD',
                      hintText: '••••••••',
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isRememberMeChecked = !isRememberMeChecked;
                            });
                          },
                          borderRadius: BorderRadius.circular(4),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  value: isRememberMeChecked,
                                  activeColor: const Color(0xFF061F3D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isRememberMeChecked = value!;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text('Remember me', style: textTheme.bodySmall),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () => print("Forgot Password Clicked"),
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: Text(
                            'Forgot password?',
                            style: textTheme.bodySmall?.copyWith(
                              color: colors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    CustomPrimaryButton(
                      onPressed: () {},
                      label: 'SIGN IN',
                      letterSpacing: 2.0,
                    ),

                    SizedBox(height: 25),

                    Row(
                      children: [
                        const Expanded(child: Divider(thickness: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Or',
                            style: textTheme.bodySmall?.copyWith(
                              color: colors.textTertiary,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(thickness: 1)),
                      ],
                    ),

                    SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                          child: CustomSocialButton(
                            iconPath: 'assets/images/google.png',
                            onPressed: () {},
                            text: 'Google',
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: CustomSocialButton(
                            iconPath: 'assets/images/facebook.png',
                            onPressed: () {},
                            text: 'Facebook',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),

                  GestureDetector(
                    onTap: () => print("Go to Register Screen"),
                    child: Text(
                      'Register',
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.gold,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
