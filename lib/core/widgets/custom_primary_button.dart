import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? buttonTextColor;
  final Color? borderColor;
  final IconData? trailingIcon;
  final double borderRadius;
  final double letterSpacing;

  const CustomPrimaryButton({
    super.key,
    this.label = 'NEXT',
    required this.onPressed,
    this.width = double.infinity,
    this.color,
    this.buttonTextColor,
    this.borderColor,
    this.trailingIcon,
    this.borderRadius = 4,
    this.letterSpacing = 3.5,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return SizedBox(
      width: width,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? colors.primary,
          foregroundColor: buttonTextColor ?? colors.background,
          elevation: 4,
          shadowColor: Colors.black26,
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 1.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: textTheme.labelLarge?.copyWith(
                color: buttonTextColor ?? colors.background,
                letterSpacing: letterSpacing,
              ),
            ),
            if (trailingIcon != null) ...[
              SizedBox(width: 8.w),
              Icon(
                trailingIcon,
                size: 18.sp,
                color: buttonTextColor ?? colors.background,
              ),
            ],
          ],
        ),
      ),
    );
  }
}