import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/constants/app_font_families.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  
  final TextEditingController? controller;
  final IconData? suffix;
  final VoidCallback? onSuffixTap;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    
    this.controller,
    this.suffix,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: AppFontFamilies.georgia,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey.shade300, width: 1.w),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            
            style: TextStyle(fontSize: 15.sp, color: Colors.black87),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: AppFontFamilies.georgia,
                color: Colors.grey.shade400,
                fontSize: 15.sp,
              ),
              prefixIcon: Icon(
                prefixIcon,
                color: Colors.grey.shade500,
                size: 20.sp,
              ),

              suffixIcon: suffix != null
                  ? IconButton(
                      icon: Icon(
                        suffix,
                        color: Colors.grey.shade500,
                        size: 20.sp,
                      ),
                      onPressed: onSuffixTap,
                    )
                  : null,

              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
