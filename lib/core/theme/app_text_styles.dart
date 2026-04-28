import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  // ── App Bar ──────────────────────────────────────────
  static TextStyle appNameTextStyle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 4,
    color: AppColors.primaryColor,
  );
  // -- Home Screen --

  // ── Section Header ───────────────────────────────────
  static TextStyle homeSectionTitle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 26.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xFF1A1A1A),
  );

  static TextStyle seeAll = TextStyle(
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

  // ── Category Chip ────────────────────────────────────
  static TextStyle categoryChipSelected = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  );

  static TextStyle categoryChipUnselected = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.brown,
    letterSpacing: 1,
  );

  // ── Product Card ─────────────────────────────────────
  static TextStyle productName = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xFF1A1A1A),
  );

  static TextStyle productPrice = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF4E4639),
  );
  //--------------------------------------------

  static TextStyle addNewProductTextStyle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    color: Color(0xFF4E4639),
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle seeAllButton = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
  );

  // --- Add product Section ---

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

  static TextStyle sectionTitle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xFF4E4639),
  );

  static TextStyle fieldLabel = TextStyle(
    fontFamily: "Sans Serif",
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xFF4E4639),
  );

  // ── Products Discover / Category Tabs ─────────────────────────
  static TextStyle discoverTabSelected = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.5,
    color: Colors.white,
  );

  static TextStyle discoverTabUnselected = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: Color(0xFF1A1A1A),
  );

  // ── Product Card Badge ───────────────────────────────
  static TextStyle productBadgeLabel = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    color: Colors.white,
  );

  // ── Product Card Info ────────────────────────────────
  static TextStyle discoverProductName = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1A1A1A),
    height: 1.3.h,
  );

  static TextStyle discoverProductRating = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFFAAAAAA),
  );

  static TextStyle discoverProductPrice = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xFF1A1A1A),
  );

  static TextStyle discoverProductOriginalPrice = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFFAAAAAA),
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle productColorVariant = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: Color(0xFF9E8E7E),
  );

  static TextStyle limitedStockLabel = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: Color(0xFFB94040),
  );

  // ── Product Detail ───────────────────────────────────
  static TextStyle productCollectionLabel = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: Color(0xFF9E8E7E),
  );

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

  static TextStyle reviewsCount = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF6B6B6B),
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

  // ── Reviews Section ──────────────────────────────────
  static TextStyle reviewsSectionTitle = TextStyle(
    fontFamily: AppFontFamilies.georgia,
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1B2A4A),
  );

  static TextStyle reviewerName = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xFF1B2A4A),
  );

  static TextStyle reviewerMeta = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF9E8E7E),
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

  // ── Settings ─────────────────────────────────────────
  static TextStyle settingsSectionLabel = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
    color: AppColors.profileSectionLabel,
  );

  static TextStyle settingsTileText = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.settingsTileText,
  );

  // ── Theme Toggle ─────────────────────────────────────
  static TextStyle themeToggleActive = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.themeToggleActiveText,
  );

  static TextStyle themeToggleInactive = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.themeToggleInactiveText,
  );
  static TextStyle logoutButtonText = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );
}
