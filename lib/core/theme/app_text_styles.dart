import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // ── App Bar ──────────────────────────────────────────
  static TextStyle appName = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 4,
    color: AppColors.primaryColor,
  );

  // ── Section ──────────────────────────────────────────
  static TextStyle sectionHeading = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1B2A4A),
  );

  static TextStyle seeAllLabel = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
    letterSpacing: 1,
    color: Color(0xFF7B6FA0),
  );

  // ── Banner ───────────────────────────────────────────
  static TextStyle bannerTitle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle bannerSubtitle = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    height: 1.5,
  );

  // ── Chips / Tabs ─────────────────────────────────────
  static TextStyle chipLabelSelected = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  );

  static TextStyle chipLabelUnselected = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.brown,
    letterSpacing: 1,
  );

  // ── Card ─────────────────────────────────────────────
  static TextStyle cardTitle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1A1A1A),
    height: 1.3,
  );

  static TextStyle cardPrice = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF4E4639),
  );

  static TextStyle cardOriginalPrice = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFFAAAAAA),
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle cardRating = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFFAAAAAA),
  );

  static TextStyle productBadgeLabel = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    color: Colors.white,
  );

  static TextStyle limitedStockLabel = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: Color(0xFFB94040),
  );

  // ── Caption ──────────────────────────────────────────
  static TextStyle captionText = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: Color(0xFF9E8E7E),
  );

  // ── Label Uppercase ──────────────────────────────────
  static TextStyle labelUppercase = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
    color: AppColors.profileSectionLabel,
  );

  // ── Product Detail ───────────────────────────────────
  static TextStyle productDetailName = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xFF1B2A4A),
    height: 1.3,
  );

  static TextStyle productDetailPrice = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1A1A1A),
  );

  static TextStyle productDescription = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1A1A1A),
    height: 1.6,
  );

  static TextStyle productSpecItem = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1A1A1A),
  );

  static TextStyle reviewsCount = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF6B6B6B),
  );

  // ── Reviews ──────────────────────────────────────────
  static TextStyle reviewerName = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xFF1B2A4A),
  );

  static TextStyle reviewBody = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1A1A1A),
    height: 1.6,
  );

  // ── Buttons ──────────────────────────────────────────
  static TextStyle readAllReviewsButton = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.2,
    color: Color(0xFF1B2A4A),
  );

  static TextStyle addToCartButton = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
    color: Colors.white,
  );

  // ── Add Product ──────────────────────────────────────
  static TextStyle addNewProductTitle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    color: Color(0xFF4E4639),
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle uploadLabel = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.8,
    color: Colors.black87,
  );

  static TextStyle uploadHint = TextStyle(
    fontSize: 11.sp,
    color: Color.fromARGB(255, 176, 170, 170),
    height: 1.5,
  );

  static TextStyle formSectionTitle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xFF4E4639),
  );

  static TextStyle formFieldLabel = TextStyle(
    fontFamily: "Sans Serif",
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xFF4E4639),
  );

  // ── Profile ──────────────────────────────────────────
  static TextStyle profileUserName = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 26.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1A1A1A),
  );

  static TextStyle profileUserEmail = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF9E8E7E),
  );

  static TextStyle settingsTileText = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.settingsTileText,
  );

  static TextStyle themeToggleActive = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.themeToggleActiveText,
  );

  static TextStyle themeToggleInactive = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle logoutButtonText = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );

  // ── Cart ─────────────────────────────────────────────
  static TextStyle cartSummaryTitle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontWeight: FontWeight.w400,
    fontSize: 32.sp,
    color: Color(0xFF4E4639),
  );

  static TextStyle secureCheckoutLabel = TextStyle(
    fontSize: 12.sp,
    color: Color(0xFF4E4639),
    fontWeight: FontWeight.w600,
  );
}