import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/utils/validators.dart';
import 'package:veloura/core/widgets/bottom_nav_bar.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/core/widgets/custom_social_button.dart';
import 'package:veloura/core/widgets/custom_text_field.dart';
import 'package:veloura/features/auth/forget_password/presentation/screens/forget_password.dart';
import 'package:veloura/features/auth/login/presentation/cubits/login_cubit/cubit/login_cubit.dart';
import 'package:veloura/core/widgets/custom_pass_text_field.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/features/auth/forget_password/presentation/screens/forget_password.dart';
import 'package:veloura/features/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:veloura/features/auth/login/presentation/cubits/login_cubit/cubit/login_cubit.dart';
import 'package:veloura/features/auth/signup/presentation/screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isRememberMeChecked = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return BlocProvider(
      create: (context) =>
          LoginCubit(LoginRemoteDataSource(Dio()), SecureStorageServices()),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MainNavigation()),
                (route) => false,
              );
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errMessage),
                  backgroundColor: BaseColors.alert,
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
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
                      SizedBox(height: 40.h),
                      Container(
                        padding: EdgeInsets.all(30.w),
                        decoration: BoxDecoration(
                          color: colors.authCardColor,
                          borderRadius: BorderRadius.circular(35.r),
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
                            SizedBox(height: 30.h),
                            CustomTextField(
                              label: 'EMAIL ADDRESS',
                              hintText: 'your@email.com',
                              prefixIcon: Icons.email_outlined,
                              controller: _emailController,
                              //  validator: (value) =>
                              //       Validator.validateEmail(value ?? ''),
                              //   )
                            ),
                            SizedBox(height: 20.h),
                            CustomPassTextField(
                              label: 'PASSWORD',
                              hintText: '••••••••',
                              isPassword: true,
                              prefixIcon: Icons.lock_outline,
                              controller: _passwordController,
                              validator: (value) =>
                                  Validator.validatePassword(value ?? ''),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () => setState(
                                    () => isRememberMeChecked =
                                        !isRememberMeChecked,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 24.h,
                                        width: 24.w,
                                        child: Checkbox(
                                          value: isRememberMeChecked,
                                          activeColor: const Color(0xFF061F3D),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          side: const BorderSide(
                                            color: Colors.grey,
                                            width: 1.5,
                                          ),
                                          onChanged: (value) => setState(
                                            () => isRememberMeChecked = value!,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        'Remember me',
                                        style: textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const ForgetPassword(),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
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
                            SizedBox(height: 25.h),
                            state is LoginLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CustomPrimaryButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<LoginCubit>().login(
                                          email: _emailController.text.trim(),
                                          password: _passwordController.text,
                                        );
                                      }
                                    },
                                    label: 'SIGN IN',
                                    letterSpacing: 2.0,
                                    borderRadius: 16,
                                  ),
                            SizedBox(height: 25.h),
                            Row(
                              children: [
                                const Expanded(child: Divider(thickness: 1)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),
                                  child: Text(
                                    'Or',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colors.textTertiary,
                                    ),
                                  ),
                                ),
                                const Expanded(child: Divider(thickness: 1)),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomSocialButton(
                                    iconPath: 'assets/images/google.png',
                                    onPressed: () {},
                                    text: 'Google',
                                  ),
                                ),
                                SizedBox(width: 5.w),
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
                      SizedBox(height: 30.h),
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
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignUpScreen();
                                  },
                                ),
                              );
                            },
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
          },
        ),
      ),
    );
  }
}
