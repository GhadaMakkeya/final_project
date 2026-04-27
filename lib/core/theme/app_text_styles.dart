import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/theme/app_colors.dart';

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
  static TextStyle appNameTextStyle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 4,
    color: AppColors.primaryColor,
  );
  static TextStyle addNewProductTextStyle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    color: Color(0xFF4E4639),
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle featuredOffersTitle = TextStyle(
    fontSize: 26,
    fontFamily: AppFontFamilies.georgia,
    color: Color(0xFF1A1A1A),
    fontWeight: FontWeight.w500,
  );

  static const TextStyle seeAllButton = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );
  // --- Add product Section ---

  static const TextStyle uploadLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.8,
    color: Colors.black87,
  );

  static const TextStyle uploadHint = TextStyle(
    fontSize: 11,
    color: Color.fromARGB(255, 176, 170, 170),
    height: 1.5,
  );
  static const TextStyle sectionTitle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Color(0xFF4E4639),
  );

  static const TextStyle fieldLabel = TextStyle(
    fontFamily: "Sans Serif",
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color(0xFF4E4639),
  );
}
