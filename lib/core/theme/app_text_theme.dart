import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme textTheme(MyColors colors) => TextTheme(

    // ─── Headlines (NotoSerif) ────────────────────────
    // "Your Bag" / "Jewelry"
    headlineLarge: TextStyle(
      fontFamily: AppFontFamilies.georgia,
      fontSize: 36.sp,
      fontWeight: FontWeight.w400,
      height: 1.2,
      color: colors.textPrimary,
    ),
    // "Midnight Bloom Silk Scarf"
    headlineMedium: TextStyle(
      fontFamily: AppFontFamilies.georgia,
      fontSize: 28.sp,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: colors.textPrimary,
    ),
    // "Summary" / عناوين sections
    headlineSmall: TextStyle(
      fontFamily: AppFontFamilies.georgia,
      fontSize: 22.sp,
      fontWeight: FontWeight.w400,
      color: colors.textPrimary,
    ),

    // ─── Titles ───────────────────────────────────────
    // "Aurelia Pendant" / "Solstice Ring" اسم المنتج
    titleLarge: TextStyle(
      fontFamily: AppFontFamilies.georgia,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: colors.textPrimary,
    ),
    // "$1,250.00" السعر
    titleMedium: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: colors.textPrimary,
    ),
    // "HERITAGE COLLECTION" / "COLLECTION" تاج صغير
    titleSmall: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 3.5,
      color: colors.textSecondary,
    ),

    // ─── Body ─────────────────────────────────────────
    // وصف المنتج الطويل
    bodyLarge: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: colors.textSecondary,
    ),
    // "18k Solid Gold" / "Midnight Navy" subtitle
    bodyMedium: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      color: colors.textSecondary,
    ),
    // "3 items ready for checkout" / نصوص صغيرة
    bodySmall: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: colors.textTertiary,
    ),

    // ─── Labels ───────────────────────────────────────
    // نص الأزرار "ADD TO CART" / "REMOVE"
    labelLarge: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      color: colors.textPrimary,
    ),
    // "SEE ALL" / "FILTER" / "SORT"
    labelMedium: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      color: colors.textSecondary,
    ),
    // "24 items" / تفاصيل صغيرة جداً
    labelSmall: TextStyle(
      fontFamily: AppFontFamilies.inter,
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: colors.textTertiary,
    ),
  );
}