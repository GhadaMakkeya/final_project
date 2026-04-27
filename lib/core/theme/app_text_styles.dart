import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle font32NotoSerifRegular = GoogleFonts.notoSerif(
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 41.6 / 32,
  );

  static TextStyle font18InterRegular = GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF4E4639),
    height: 28.8 / 18,
  );

  static TextStyle font16InterRegular = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF4E4639),
    height: 26.0 / 16,
  );
}