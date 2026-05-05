import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textTheme.titleSmall),
       
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,

          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(fontSize: 15.sp, color: Colors.black87),
          
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: textTheme.bodyMedium?.copyWith(
                color: colors.textTertiary,
              ),
              prefixIcon: Icon(
                prefixIcon,
                color: colors.textSecondary,
                size: 20.sp,
                 ),
            suffixIcon: suffix != null
                ? InkWell(
                    onTap: onSuffixTap,
                    child: Icon(
                      suffix,
                      color: colors.textSecondary,
                      size: 20.sp,
                    ),
                  )
                : null,
            filled: true,
            fillColor:  colors.cardColor, 
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
           
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: BaseColors.alert, width: 1.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: BaseColors.alert,
                width: 1.5.w,
              ),
            ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: colors.border, width: 1.w),
              ),
              // ── Focused ────────────────────────────────────────────────────
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: colors.primary, width: 1.5.w),
              ),       
            ),
          ),
        SizedBox(height: 8,)
      ],
    );
  }
}
