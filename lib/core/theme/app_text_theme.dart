import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
/// Veloura typography system
///
/// Georgia  → all editorial / luxury display text
///            (brand name, collection titles, product names, section headers)
///
/// Inter    → all UI / functional text
///            (prices, labels, buttons, captions, body copy, form fields)
class AppTextTheme {
  AppTextTheme._();
 
  static TextTheme textTheme(MyColors colors) => TextTheme(
 
    // ── Headlines (Georgia) ───────────────────────────────────────────────
    // "Your Bag" / "Jewelry" full-page titles
    headlineLarge: TextStyle(
      fontFamily: AppFontFamilies.georgia,
      fontSize: 36.sp,
      fontWeight: FontWeight.w400,   // Georgia renders best at regular weight
      height: 1.2,
      color: colors.textPrimary,
    ),
 
    // "Midnight Bloom Silk Scarf" product hero title
    headlineMedium: TextStyle(
      fontFamily: AppFontFamilies.georgia,
      fontSize: 28.sp,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: colors.textPrimary,
    ),
 
    // "Summary" / "Reviews" section headings
    headlineSmall: TextStyle(
      fontFamily: AppFontFamilies.georgia,
      fontSize: 22.sp,
      fontWeight: FontWeight.w400,
      color: colors.textPrimary,
    ),
 
    // ── Titles ────────────────────────────────────────────────────────────
    // "Aurelia Pendant" / "Solstice Ring" — product card name
    titleLarge: TextStyle(
      fontFamily: AppFontFamilies.georgia,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: colors.textPrimary,
    ),
 
    // "$1,250.00" price / "Jane Doe" profile name
    titleMedium: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: colors.textPrimary,
    ),
 
    // "HERITAGE COLLECTION" / "COLLECTION" eyebrow tags — spaced-caps
    titleSmall: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 3.5,
      color: colors.textSecondary,
    ),
 
    // ── Body ──────────────────────────────────────────────────────────────
    // Long product descriptions
    bodyLarge: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: 1.65,
      color: colors.textSecondary,
    ),
 
    // "18k Solid Gold" / "Midnight Navy" — product subtitle
    bodyMedium: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      color: colors.textSecondary,
    ),
 
    // "3 items ready for checkout" / short helper text
    bodySmall: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: colors.textTertiary,
    ),
 
    // ── Labels ────────────────────────────────────────────────────────────
    // "ADD TO CART" / "SIGN IN" / "RESET PASSWORD" button text
    labelLarge: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
      color: colors.textPrimary,
    ),
 
    // "SEE ALL" / "FILTER" / "SORT" / "REMOVE"
    labelMedium: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.2,
      color: colors.textSecondary,
    ),
 
    // "24 items" / "Verified Buyer" micro-captions
    labelSmall: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: colors.textTertiary,
    ),
  );
}