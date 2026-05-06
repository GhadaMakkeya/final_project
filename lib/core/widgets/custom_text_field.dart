import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final IconData? suffix;
  final VoidCallback? onSuffixTap;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.suffix,
    this.onSuffixTap,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: textTheme.titleSmall),

        SizedBox(height: 10.h),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText ? isObscure : false,
          keyboardType: widget.keyboardType,

          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          //style: TextStyle(fontSize: 15.sp, color: Colors.black87),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: textTheme.bodyMedium?.copyWith(
              color: colors.textTertiary,
            ),
            prefixIcon: Icon(
              widget.prefixIcon,
              color: colors.textTertiary,
              size: 20.sp,
            ),
            suffixIcon: widget.suffix != null
                ? InkWell(
                    onTap: widget.onSuffixTap,
                    child: Icon(
                      widget.suffix,
                      color: colors.textSecondary,
                      size: 20.sp,
                    ),
                  )
                : null,
            filled: true,
            fillColor: colors.secondary,

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: BaseColors.alert, width: 1.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: BaseColors.alert, width: 1.5.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide.none,
            ),
            // ── Focused ────────────────────────────────────────────────────
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: colors.primary, width: 1.5.w),
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
