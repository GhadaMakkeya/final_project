import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/routing/app_routes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_pass_text_field.dart';
import '../../../../../core/widgets/custom_primary_button.dart';
import '../cubits/reset_password_cubit.dart';
import '../cubits/reset_password_states.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String otp;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.otp,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final ResetPasswordCubit _cubit;

  // ── Single-flight guard ──────────────────────────────────────────────────
  // Set to true the moment a valid submission is dispatched.
  // Never reset to false on success — that prevents any retry after the
  // cubit has already consumed the OTP.
  // Reset to false ONLY on error, so the user can correct and retry.
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();

    final dio = Dio(
      BaseOptions(
        headers: {'Content-Type': 'application/json'},
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    _cubit = ResetPasswordCubit();

    log(
      'ResetPasswordScreen.initState — '
      'email: "${widget.email}" | otp: "${widget.otp}"',
    );
  }

  @override
  void dispose() {
    passController.dispose();
    confirmPassController.dispose();
    _cubit.close();
    super.dispose();
  }

  // ── Submit ───────────────────────────────────────────────────────────────
  void _submit() {
    // Hard guard: if a request is already in flight, do nothing.
    if (_isSubmitting) return;

    // Validate the form first — no state mutation until form is valid.
    if (!(formKey.currentState?.validate() ?? false)) return;

    // Lock the button before dispatching to guarantee exactly one request.
    if (!mounted) return;
    setState(() => _isSubmitting = true);

    final email = widget.email.trim();
    final otp = widget.otp.trim();
    final password = passController.text.trim();

    log(
      'ResetPasswordScreen — dispatching reset | '
      'email: "$email" | otp: "$otp"',
    );

    _cubit.resetPassword(email: email, otp: otp, newPassword: password);
  }

  // ── Navigation helper — always use root navigator after full removal ─────
  void _goToLogin() {
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
            bloc: _cubit, 
          // ── listenWhen: only react to terminal states ────────────────
          // Without this guard, any intermediate state emission (e.g.
          // LoadingState) causes the listener to run again against the
          // previous cached state if the widget is ever rebuilt, which
          // is the mechanism behind the phantom duplicate request.
          listenWhen: (previous, current) =>
              current is ResetPasswordSuccessState ||
              current is ResetPasswordErrorState,
    
          listener: (context, state) {
            if (state is ResetPasswordSuccessState) {
              // ── SUCCESS ─────────────────────────────────────────────
              // Navigate FIRST, then show the snackbar on the new route's
              // ScaffoldMessenger so we are never calling into a widget
              // tree that is being unmounted.
              _goToLogin();
    
              // Post-frame callback ensures the new route is fully pushed
              // before we attempt to show a snackbar, avoiding the
              // "called after dispose" error and the stale-context rebuild
              // that previously re-triggered the listener.
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Password reset successfully! Please sign in.',
                    ),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 3),
                  ),
                );
              });
            }
    
            if (state is ResetPasswordErrorState) {
              // ── ERROR ────────────────────────────────────────────────
              // Only unlock the button on error so the user can retry.
              // On success the button stays locked — the screen is gone.
              if (mounted) {
                setState(() => _isSubmitting = false);
              }
    
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
    
          // ── buildWhen: skip re-renders for non-UI states ─────────────
          buildWhen: (previous, current) =>
              current is ResetPasswordLoadingState ||
              current is ResetPasswordSuccessState ||
              current is ResetPasswordErrorState ||
              current is ResetPasswordInitialState,
    
          builder: (context, state) {
            // Disable the button while a request is in flight OR while
            // we are processing the loading state from the cubit.
            // Both checks are needed: _isSubmitting covers the window
            // between the tap and the first cubit emission.
            final isLoading =
                _isSubmitting || state is ResetPasswordLoadingState;
    
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 24.h,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// LOGO
                            Text(
                              AppStrings.appName,
                              style: textTheme.headlineLarge?.copyWith(
                                color: colors.primary,
                                letterSpacing: 6,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
    
                            SizedBox(height: 18.h),
    
                            /// CARD
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 28.w,
                                vertical: 32.h,
                              ),
                              decoration: BoxDecoration(
                                color: colors.authCardColor,
                                borderRadius: BorderRadius.circular(24.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(
                                      alpha: 0.05,
                                    ),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  /// TITLE
                                  Text(
                                    'Reset Password',
                                    style: textTheme.headlineMedium,
                                  ),
    
                                  SizedBox(height: 10.h),
    
                                  /// SUBTITLE
                                  Text(
                                    'Please enter your new password below.',
                                    textAlign: TextAlign.center,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colors.textSecondary,
                                    ),
                                  ),
    
                                  SizedBox(height: 32.h),
    
                                  /// NEW PASSWORD
                                  CustomPassTextField(
                                    label: 'NEW PASSWORD',
                                    hintText: '••••••••',
                                    isPassword: true,
                                    controller: passController,
                                    prefixIcon: Icons.lock_outline,
                                    validator: (value) =>
                                        Validator.validatePassword(
                                          value ?? '',
                                        ),
                                  ),
    
                                  SizedBox(height: 18.h),
    
                                  /// CONFIRM PASSWORD
                                  CustomPassTextField(
                                    label: 'CONFIRM PASSWORD',
                                    hintText: '••••••••',
                                    isPassword: true,
                                    controller: confirmPassController,
                                    prefixIcon: Icons.lock_outline,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please confirm your password';
                                      }
                                      if (value.trim() !=
                                          passController.text.trim()) {
                                        return 'Passwords do not match';
                                      }
                                      return null;
                                    },
                                  ),
    
                                  SizedBox(height: 28.h),
    
                                  /// BUTTON
                                  CustomPrimaryButton(
                                    label: 'RESET PASSWORD',
                                    isLoading: isLoading,
                                    borderRadius: 16.r,
                                    letterSpacing: 1.5,
                                    onPressed: isLoading ? null : _submit,
                                  ),
                                ],
                              ),
                            ),
    
                            SizedBox(height: 32.h),
    
                            /// BACK TO LOGIN
                            TextButton.icon(
                              onPressed: _goToLogin,
                              icon: Icon(
                                Icons.arrow_back,
                                color: colors.gold,
                                size: 18.sp,
                              ),
                              label: Text(
                                'Back to Login',
                                style: textTheme.bodySmall?.copyWith(
                                  color: colors.gold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
